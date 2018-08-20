--切历史行为信息表的wifi
DROP TABLE IF EXISTS source_behavior_wifis_split_1;
CREATE TABLE IF NOT EXISTS source_behavior_wifis_split_1
AS
SELECT row_id, user_id, mall_id, time_stamp, longitude
	, latitude, SPLIT(wifi_infos, '\\;')[0] AS wifi_1
	, CASE 
		WHEN size(SPLIT(wifi_infos, '\\;')) > 2 THEN SPLIT(wifi_infos, '\\;')[1]
		ELSE 'null|null|null'
	END AS wifi_2
	, CASE 
		WHEN size(SPLIT(wifi_infos, '\\;')) > 3 THEN SPLIT(wifi_infos, '\\;')[2]
		ELSE 'null|null|null'
	END AS wifi_3
	, CASE 
		WHEN size(SPLIT(wifi_infos, '\\;')) > 4 THEN SPLIT(wifi_infos, '\\;')[3]
		ELSE 'null|null|null'
	END AS wifi_4
	, CASE 
		WHEN size(SPLIT(wifi_infos, '\\;')) > 5 THEN SPLIT(wifi_infos, '\\;')[4]
		ELSE 'null|null|null'
	END AS wifi_5
	, CASE 
		WHEN size(SPLIT(wifi_infos, '\\;')) > 6 THEN SPLIT(wifi_infos, '\\;')[5]
		ELSE 'null|null|null'
	END AS wifi_6
	, CASE 
		WHEN size(SPLIT(wifi_infos, '\\;')) > 7 THEN SPLIT(wifi_infos, '\\;')[6]
		ELSE 'null|null|null'
	END AS wifi_7
	, CASE 
		WHEN size(SPLIT(wifi_infos, '\\;')) > 8 THEN SPLIT(wifi_infos, '\\;')[7]
		ELSE 'null|null|null'
	END AS wifi_8
	, CASE 
		WHEN size(SPLIT(wifi_infos, '\\;')) > 9 THEN SPLIT(wifi_infos, '\\;')[8]
		ELSE 'null|null|null'
	END AS wifi_9
	, CASE 
		WHEN size(SPLIT(wifi_infos, '\\;')) > 10 THEN SPLIT(wifi_infos, '\\;')[9]
		ELSE 'null|null|null'
	END AS wifi_10, shop_id
FROM user_shop_behavior_row_id;

-- 1.1.1 记录对应的wifi_1
DROP TABLE IF EXISTS source_behavior_wifis_split_1_1;
CREATE TABLE IF NOT EXISTS source_behavior_wifis_split_1_1
AS
SELECT row_id, user_id, mall_id, time_stamp, longitude
	, latitude, SPLIT(wifi_1, '\\|')[0] AS bssid, SPLIT(wifi_1, '\\|')[1] AS signal, SPLIT(wifi_1, '\\|')[2] AS flag, shop_id
FROM source_behavior_wifis_split_1;

-- 1.1.2 记录对应的wifi_2
DROP TABLE IF EXISTS source_behavior_wifis_split_1_2;
CREATE TABLE IF NOT EXISTS source_behavior_wifis_split_1_2
AS
SELECT row_id, user_id, mall_id, time_stamp, longitude
	, latitude, SPLIT(wifi_2, '\\|')[0] AS bssid, SPLIT(wifi_2, '\\|')[1] AS signal, SPLIT(wifi_2, '\\|')[2] AS flag, shop_id
FROM source_behavior_wifis_split_1;

-- 1.1.3 记录对应的wifi_3
DROP TABLE IF EXISTS source_behavior_wifis_split_1_3;
CREATE TABLE IF NOT EXISTS source_behavior_wifis_split_1_3
AS
SELECT row_id, user_id, mall_id, time_stamp, longitude
	, latitude, SPLIT(wifi_3, '\\|')[0] AS bssid, SPLIT(wifi_3, '\\|')[1] AS signal, SPLIT(wifi_3, '\\|')[2] AS flag, shop_id
FROM source_behavior_wifis_split_1;

-- 1.1.4 记录对应的wifi_4
DROP TABLE IF EXISTS source_behavior_wifis_split_1_4;
CREATE TABLE IF NOT EXISTS source_behavior_wifis_split_1_4
AS
SELECT row_id, user_id, mall_id, time_stamp, longitude
	, latitude, SPLIT(wifi_4, '\\|')[0] AS bssid, SPLIT(wifi_4, '\\|')[1] AS signal, SPLIT(wifi_4, '\\|')[2] AS flag, shop_id
FROM source_behavior_wifis_split_1;

-- 1.1.5 记录对应的wifi_5
DROP TABLE IF EXISTS source_behavior_wifis_split_1_5;
CREATE TABLE IF NOT EXISTS source_behavior_wifis_split_1_5
AS
SELECT row_id, user_id, mall_id, time_stamp, longitude
	, latitude, SPLIT(wifi_5, '\\|')[0] AS bssid, SPLIT(wifi_5, '\\|')[1] AS signal, SPLIT(wifi_5, '\\|')[2] AS flag, shop_id
FROM source_behavior_wifis_split_1;

-- 1.1.6 记录对应的wifi_6
DROP TABLE IF EXISTS source_behavior_wifis_split_1_6;
CREATE TABLE IF NOT EXISTS source_behavior_wifis_split_1_6
AS
SELECT row_id, user_id, mall_id, time_stamp, longitude
	, latitude, SPLIT(wifi_6, '\\|')[0] AS bssid, SPLIT(wifi_6, '\\|')[1] AS signal, SPLIT(wifi_6, '\\|')[2] AS flag, shop_id
FROM source_behavior_wifis_split_1;

-- 1.1.7 记录对应的wifi_7
DROP TABLE IF EXISTS source_behavior_wifis_split_1_7;
CREATE TABLE IF NOT EXISTS source_behavior_wifis_split_1_7
AS
SELECT row_id, user_id, mall_id, time_stamp, longitude
	, latitude, SPLIT(wifi_7, '\\|')[0] AS bssid, SPLIT(wifi_7, '\\|')[1] AS signal, SPLIT(wifi_7, '\\|')[2] AS flag, shop_id
FROM source_behavior_wifis_split_1;

-- 1.1.8 记录对应的wifi_8
DROP TABLE IF EXISTS source_behavior_wifis_split_1_8;
CREATE TABLE IF NOT EXISTS source_behavior_wifis_split_1_8
AS
SELECT row_id, user_id, mall_id, time_stamp, longitude
	, latitude, SPLIT(wifi_8, '\\|')[0] AS bssid, SPLIT(wifi_8, '\\|')[1] AS signal, SPLIT(wifi_8, '\\|')[2] AS flag, shop_id
FROM source_behavior_wifis_split_1;

-- 1.1.9 记录对应的wifi_9
DROP TABLE IF EXISTS source_behavior_wifis_split_1_9;
CREATE TABLE IF NOT EXISTS source_behavior_wifis_split_1_9
AS
SELECT row_id, user_id, mall_id, time_stamp, longitude
	, latitude, SPLIT(wifi_9, '\\|')[0] AS bssid, SPLIT(wifi_9, '\\|')[1] AS signal, SPLIT(wifi_9, '\\|')[2] AS flag, shop_id
FROM source_behavior_wifis_split_1;

-- 1.1.10 记录对应的wifi_10
DROP TABLE IF EXISTS source_behavior_wifis_split_1_10;
CREATE TABLE IF NOT EXISTS source_behavior_wifis_split_1_10
AS
SELECT row_id, user_id, mall_id, time_stamp, longitude
	, latitude, SPLIT(wifi_10, '\\|')[0] AS bssid, SPLIT(wifi_10, '\\|')[1] AS signal, SPLIT(wifi_10, '\\|')[2] AS flag, shop_id
FROM source_behavior_wifis_split_1;

-- 1.2 将10列wifi数据合在一起
DROP TABLE IF EXISTS source_behavior_wifis_split_2;
CREATE TABLE IF NOT EXISTS source_behavior_wifis_split_2
AS
SELECT *
FROM source_behavior_wifis_split_1_1
UNION ALL
SELECT *
FROM source_behavior_wifis_split_1_2
UNION ALL
SELECT *
FROM source_behavior_wifis_split_1_3
UNION ALL
SELECT *
FROM source_behavior_wifis_split_1_4
UNION ALL
SELECT *
FROM source_behavior_wifis_split_1_5
UNION ALL
SELECT *
FROM source_behavior_wifis_split_1_6
UNION ALL
SELECT *
FROM source_behavior_wifis_split_1_7
UNION ALL
SELECT *
FROM source_behavior_wifis_split_1_8
UNION ALL
SELECT *
FROM source_behavior_wifis_split_1_9
UNION ALL
SELECT *
FROM source_behavior_wifis_split_1_10;

--去除其中bssid为null
DROP TABLE IF EXISTS user_behavior_wifis_split;
CREATE TABLE IF NOT EXISTS user_behavior_wifis_split
AS
SELECT *
FROM source_behavior_wifis_split_2
WHERE source_behavior_wifis_split_2.bssid != 'null';

--删除中间数据
DROP TABLE source_behavior_wifis_split_1_1;
DROP TABLE source_behavior_wifis_split_1_2;
DROP TABLE source_behavior_wifis_split_1_3;
DROP TABLE source_behavior_wifis_split_1_4;
DROP TABLE source_behavior_wifis_split_1_5;
DROP TABLE source_behavior_wifis_split_1_6;
DROP TABLE source_behavior_wifis_split_1_7;
DROP TABLE source_behavior_wifis_split_1_8;
DROP TABLE source_behavior_wifis_split_1_9;
DROP TABLE source_behavior_wifis_split_1_10;

drop table ueser_behavior_wifis_split
