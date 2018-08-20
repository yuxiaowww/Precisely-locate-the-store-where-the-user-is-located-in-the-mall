--1、填充wifi的signal为“null”的值为-999
-- 函数使用：
--(1)、case when then 相当于if，当满足什么条件时，赋值
--(2)、cast (expression AS data_type)，把任何有效的SQServer表达式转化为目标系统所提供的数据类型，包括bigint和sql_variant
--填充历史行为信息表
DROP TABLE IF EXISTS user_behavior_wifis_split_fillnull;
CREATE TABLE IF NOT EXISTS user_behavior_wifis_split_fillnull
AS SELECT row_id,user_id,mall_id,time_stamp,longitude,latitude,bssid,
CASE WHEN signal != 'null' THEN CAST(signal AS INT)ELSE CAST(-999 AS INT)
END AS signal, flag, shop_id
FROM user_behavior_wifis_split;
--填充预测集信息表
DROP TABLE IF EXISTS user_test_wifis_split_fillnull;
CREATE TABLE IF NOT EXISTS user_test_wifis_split_fillnull
AS SELECT row_id, user_id, mall_id, time_stamp, longitude,latitude, bssid, 
CASE WHEN signal != 'null' THEN CAST(signal AS INT)ELSE CAST(-999 AS INT)
END AS signal,flag
FROM user_test_wifis_split;

--2、历史行为behavior表的shop对应的最强wifi及其次数
-- 函数使用：
--(1)、row_number() over(partition by col1[, col2…]order by col1 [asc|desc][, col2[asc|desc]…]) 计算行号，返回bigint值
--选取每个row_id下面wifi信号最强的wifi
DROP TABLE IF EXISTS user_behavior_first_signal_wifi;
CREATE TABLE IF NOT EXISTS user_behavior_first_signal_wifi
AS SELECT shop_id,bssid
FROM (SELECT shop_id, bssid, ROW_NUMBER() OVER (PARTITION BY row_id ORDER BY signal DESC) AS rank
	FROM user_behavior_wifis_split_fillnull) a
WHERE a.rank = 1;
--按shop_id和bassid计算shop对应的最强wifi出现的次数
DROP TABLE IF EXISTS user_behavior_max_wifi_count;
CREATE TABLE IF NOT EXISTS user_behavior_max_wifi_count
AS SELECT shop_id, bssid, COUNT(shop_id) AS count
FROM user_behavior_first_signal_wifi
GROUP BY shop_id,bssid;
select * from user_behavior_max_wifi_count;

--3、从历史行为表中得到每个shop的平均值和中位数经纬度
-- 函数使用：使用avg和median函数计算均值和中位数
DROP TABLE IF EXISTS shop_avg_med_locate;
CREATE TABLE IF NOT EXISTS shop_avg_med_locate
AS SELECT shop_id, mall_id, 
avg(longitude) AS longitude_avg,avg(latitude) AS latitude_avg, 
median(longitude) AS longitude_med,median(latitude) AS latitude_med
FROM user_behavior_wifis_split_fillnull
GROUP BY shop_id,mall_id;
select * from shop_avg_med_locate;

--4、寻找预测集中最强信号的wifi对应的row_id
DROP TABLE IF EXISTS user_test_first_signal_wifi;
CREATE TABLE IF NOT EXISTS user_test_first_signal_wifi
AS SELECT row_id, bssid
FROM (SELECT row_id, bssid, ROW_NUMBER() OVER (PARTITION BY row_id ORDER BY signal DESC) AS rank
	FROM user_test_wifis_split_fillnull) a
WHERE a.rank = 1;
select * from user_test_first_signal_wifi;

--5、距离加最强wifi
--(1)、计算预测集中的经纬度与历史行为表中每个mall下面的shop的距离，相当于候选到当前mall下面的所有的预测shop
DROP TABLE IF EXISTS predict_by_distance;
CREATE TABLE IF NOT EXISTS predict_by_distance
AS SELECT a.row_id, b.shop_id,
-(pow(a.longitude - b.longitude_avg, 2) + pow(a.latitude - b.latitude_avg, 2)) AS distance_avg,
-(pow(a.longitude - b.longitude_med, 2) + pow(a.latitude - b.latitude_med, 2)) AS distance_med
FROM ant_tianchi_ccf_sl_test  a
LEFT OUTER JOIN shop_avg_med_locate b
ON a.mall_id = b.mall_id;
select * from predict_by_distance;

--(2)、根据预测集的最强wifi连接上历史行为表上的count值和shop
DROP TABLE IF EXISTS user_test_first_signal_wifi_shop;
CREATE TABLE IF NOT EXISTS user_test_first_signal_wifi_shop
AS SELECT a.row_id, b.shop_id, b.count
FROM user_test_first_signal_wifi a
LEFT OUTER JOIN user_behavior_max_wifi_count b
ON a.bssid = b.bssid;
select * from user_test_first_signal_wifi_shop;

--(3)、结合距离和最强wifi
DROP TABLE IF EXISTS test_distance_and_maxwifi;
CREATE TABLE test_distance_and_maxwifi
AS SELECT a.row_id, a.shop_id, a.distance_avg,a.distance_med,b.count
FROM predict_by_distance a
LEFT OUTER JOIN user_test_first_signal_wifi_shop b
ON a.row_id = b.row_id AND a.shop_id = b.shop_id;
select * from test_distance_and_maxwifi where count is not null;

--(4)、将最大wifi统计的次数没覆盖的的空值填count值0
DROP TABLE IF EXISTS test_distance_and_maxwifi_fillnull;
CREATE TABLE test_distance_and_maxwifi_fillnull
AS SELECT row_id, shop_id, distance_avg,distance_med,
CASE WHEN count IS NULL THEN -1 ELSE CAST(count AS INT) END AS count
FROM test_distance_and_maxwifi;
select * from test_distance_and_maxwifi_fillnull;

/* --(5)、按三条规则进行排名选择预测shop
DROP TABLE IF EXISTS ant_tianchi_ccf_sl_predict;
CREATE TABLE IF NOT EXISTS ant_tianchi_ccf_sl_predict
AS SELECT row_id,shop_id
FROM (SELECT row_id,shop_id, ROW_NUMBER() OVER (PARTITION BY row_id ORDER BY count DESC,distance_med DESC,distance_avg DESC) AS rank
	FROM test_distance_and_maxwifi_fillnull) a
WHERE a.rank = 1;
select count(*) from ant_tianchi_ccf_sl_predict; */


--规则4 字符串匹配相似度
--(4)、连接历史行为信息表和预测集表
--选取wifi_infos最大的历史信息，每个mall下面的shop只保留一个
drop table if exists user_wifi_infos;
CREATE TABLE IF NOT EXISTS user_wifi_infos
AS SELECT shop_id,mall_id,MAX(wifi_infos) as wifi_infos_history
FROM user_shop_behavior_row_id 
GROUP BY shop_id,mall_id;
select * from user_wifi_infos;
select count(*) from user_wifi_infos;
--连接上预测集中
DROP TABLE IF EXISTS both_wifi_infos;
CREATE TABLE IF NOT EXISTS both_wifi_infos
AS SELECT a.row_id, b.shop_id,a.wifi_infos,b.wifi_infos_history
FROM ant_tianchi_ccf_sl_test  a
LEFT OUTER JOIN user_wifi_infos b
ON a.mall_id = b.mall_id;
select * from both_wifi_infos;
select count(*) from both_wifi_infos;
--此处进去PAI处理，计算出来每个shop中wifi的相似度
--将row_id转为BIGINT
DROP TABLE IF EXISTS wifi_infos_similar;
CREATE TABLE IF NOT EXISTS wifi_infos_similar
AS SELECT CAST(row_id AS int) as row_id,shop_id,wifi_similiar
FROM pai_temp_85707_1076668_1;
select * from wifi_infos_similar;
select count(*) from wifi_infos_similar;

--连接上前3条规则结果，所有规则的连接
DROP TABLE IF EXISTS test_distance_and_maxwifi_fillnull_similar;
CREATE TABLE test_distance_and_maxwifi_fillnull_similar
AS SELECT a.row_id, a.shop_id, a.distance_avg,a.distance_med,b.count
FROM test_distance_and_maxwifi_fillnull a
LEFT OUTER JOIN wifi_infos_similar b
ON a.row_id = b.row_id AND a.shop_id = b.shop_id;
select * from test_distance_and_maxwifi_fillnull_similar;

DROP TABLE IF EXISTS rule;
CREATE TABLE IF NOT EXISTS rule
AS SELECT row_id,shop_id
FROM (SELECT row_id,shop_id, ROW_NUMBER() OVER (PARTITION BY row_id ORDER BY count DESC,distance_med DESC) AS rank
	FROM test_distance_and_maxwifi_fillnull_similar) a
WHERE a.rank = 1;
select count(*) from rule;
select * from rule;

select count(*) from ant_tianchi_ccf_sl_predict;


























