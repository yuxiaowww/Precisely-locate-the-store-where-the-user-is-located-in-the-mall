--1����ȡshop��Ϣ��
--����shop��Ϣ��
drop table if exists ant_tianchi_ccf_sl_shop_info; 
CREATE TABLE IF NOT EXISTS ant_tianchi_ccf_sl_shop_info
AS
SELECT *
FROM odps_tc_257100_f673506e024.ant_tianchi_ccf_sl_shop_info;
--��ѯshop��Ϣ��
SELECT *
FROM ant_tianchi_ccf_sl_shop_info;

--2����ȡ��ʷ������Ϣ��
--������ʷ������Ϣ��
drop table if exists ant_tianchi_ccf_sl_user_shop_behavior; 
CREATE TABLE IF NOT EXISTS ant_tianchi_ccf_sl_user_shop_behavior
AS
SELECT *
FROM odps_tc_257100_f673506e024.ant_tianchi_ccf_sl_user_shop_behavior;
--��ѯ��ʷ������Ϣ��
SELECT *
FROM ant_tianchi_ccf_sl_user_shop_behavior;
--��ѯ��ʷ������Ϣ����ܳ���
SELECT count(*)
FROM ant_tianchi_ccf_sl_user_shop_behavior;

--3����ȡ���Լ�����Ϣ��
--�������Լ���Ϣ��
drop table if exists ant_tianchi_ccf_sl_test; 
CREATE TABLE IF NOT EXISTS ant_tianchi_ccf_sl_test
AS
SELECT *
FROM odps_tc_257100_f673506e024.ant_tianchi_ccf_sl_test;
--��ѯ���Լ���Ϣ��
SELECT *
FROM ant_tianchi_ccf_sl_test;

--4��Ϊ��ʷ��Ϊ��Ϣ������mall_id
--��ȡshop_id��mall_id
drop table if exists shop_mall_info;
create table if not exists shop_mall_info as select shop_id,mall_id from ant_tianchi_ccf_sl_shop_info;
--����ʷ��Ϊ���������mall_id
drop table if exists user_shop_behavior;
create table if not exists user_shop_behavior as
select a.*,b.mall_id
from ant_tianchi_ccf_sl_user_shop_behavior a  left join shop_mall_info b on a.shop_id=b.shop_id;
--ɾ����shop_mall_info��Ϣ��
drop table if exists shop_mall_info;

--5��Ϊ��ʷ��Ϊ��Ϣ���row_id��
--PAI�������row_id��
drop table if exists user_shop_behavior_row_id;
PAI -name AppendId -project algo_public -DIDColName="row_id" -DoutputTableName="user_shop_behavior_row_id" -DinputTableName="user_shop_behavior" -DselectedColNames="user_id,shop_id,mall_id,time_stamp,longitude,latitude,wifi_infos";
select * from user_shop_behavior_row_id;
select count(*) from user_shop_behavior_row_id;
drop table user_shop_behavior;















