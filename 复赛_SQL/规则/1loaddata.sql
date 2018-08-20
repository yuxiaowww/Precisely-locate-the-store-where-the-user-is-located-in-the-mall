--1、读取shop信息表
--建立shop信息表
drop table if exists ant_tianchi_ccf_sl_shop_info; 
CREATE TABLE IF NOT EXISTS ant_tianchi_ccf_sl_shop_info
AS
SELECT *
FROM odps_tc_257100_f673506e024.ant_tianchi_ccf_sl_shop_info;
--查询shop信息表
SELECT *
FROM ant_tianchi_ccf_sl_shop_info;

--2、读取历史交易信息表
--建立历史交易信息表
drop table if exists ant_tianchi_ccf_sl_user_shop_behavior; 
CREATE TABLE IF NOT EXISTS ant_tianchi_ccf_sl_user_shop_behavior
AS
SELECT *
FROM odps_tc_257100_f673506e024.ant_tianchi_ccf_sl_user_shop_behavior;
--查询历史交易信息表
SELECT *
FROM ant_tianchi_ccf_sl_user_shop_behavior;
--查询历史交易信息表的总长度
SELECT count(*)
FROM ant_tianchi_ccf_sl_user_shop_behavior;

--3、读取测试集的信息表
--建立测试集信息表
drop table if exists ant_tianchi_ccf_sl_test; 
CREATE TABLE IF NOT EXISTS ant_tianchi_ccf_sl_test
AS
SELECT *
FROM odps_tc_257100_f673506e024.ant_tianchi_ccf_sl_test;
--查询测试集信息表
SELECT *
FROM ant_tianchi_ccf_sl_test;

--4、为历史行为信息表增加mall_id
--截取shop_id和mall_id
drop table if exists shop_mall_info;
create table if not exists shop_mall_info as select shop_id,mall_id from ant_tianchi_ccf_sl_shop_info;
--将历史行为表进行连接mall_id
drop table if exists user_shop_behavior;
create table if not exists user_shop_behavior as
select a.*,b.mall_id
from ant_tianchi_ccf_sl_user_shop_behavior a  left join shop_mall_info b on a.shop_id=b.shop_id;
--删除表shop_mall_info信息表
drop table if exists shop_mall_info;

--5、为历史行为信息表加row_id列
--PAI命令添加row_id列
drop table if exists user_shop_behavior_row_id;
PAI -name AppendId -project algo_public -DIDColName="row_id" -DoutputTableName="user_shop_behavior_row_id" -DinputTableName="user_shop_behavior" -DselectedColNames="user_id,shop_id,mall_id,time_stamp,longitude,latitude,wifi_infos";
select * from user_shop_behavior_row_id;
select count(*) from user_shop_behavior_row_id;
drop table user_shop_behavior;















