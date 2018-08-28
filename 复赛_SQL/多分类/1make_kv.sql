--make_all_mall
drop table if exists train_m_1057;
create table if not exists train_m_1057 as select * from user_behavior_wifis_split;
drop table if exists train_m_1057_max; create table if not exists train_m_1057_max as select row_id,bssid,max(signal) as signal from train_m_1057 group by row_id,bssid; 
drop table if exists train_m_1057_or;
create table if not exists train_m_1057_or as select a.row_id,b.user_id,b.mall_id,b.time_stamp,b.longitude,latitude,a.bssid,a.signal,b.flag,b.shop_id from train_m_1057_max a  LEFT OUTER JOIN train_m_1057 b on a.row_id = b.row_id and a.bssid = b.bssid and a.signal = b.signal; 
drop table if exists train_m_1057_dis;
create table if not exists train_m_1057_dis as select distinct * from train_m_1057_or;
drop table if exists test_m_1057;
create table if not exists test_m_1057 as select * from user_test_wifis_split;
drop table if exists test_m_1057_max;
create table if not exists test_m_1057_max as select row_id,bssid,max(signal) as signal from test_m_1057 group by row_id,bssid; 
drop table if exists test_m_1057_or;
create table if not exists test_m_1057_or as select a.row_id,b.user_id,b.mall_id,b.time_stamp,b.longitude,latitude,a.bssid,a.signal,b.flag from test_m_1057_max a  LEFT OUTER JOIN test_m_1057 b on a.row_id = b.row_id and a.bssid = b.bssid and a.signal = b.signal; 
drop table if exists test_m_1057_dis;
create table if not exists test_m_1057_dis as select distinct * from test_m_1057_or;
drop table if exists train_m_1057_is;
create table if not exists train_m_1057_is as select *,1 as trainortest from train_m_1057_dis;
drop table if exists train_m_1057_is_shop_rank;
create table if not exists train_m_1057_is_shop_rank as select *,(dense_rank() over(partition by mall_id order by shop_id desc)) as shop_rank from train_m_1057_is;
drop table if exists test_m_1057_is_shop_rank;
create table if not exists test_m_1057_is_shop_rank as select cast(row_id as int),user_id,mall_id,time_stamp,longitude,latitude,bssid,signal,flag,'-1' as shop_id,0 as trainortest,-1 as shop_rank from test_m_1057_dis;
drop table if exists dataSet_m_1057;
create table if not exists dataSet_m_1057 as select * from train_m_1057_is_shop_rank union all select * from test_m_1057_is_shop_rank;
drop table if exists dataSet_bssid_rankm_1057;
create table if not exists dataSet_bssid_rankm_1057 as select row_id,user_id,mall_id,time_stamp,longitude,latitude,bssid,
CASE WHEN signal != 'null' THEN CAST(signal AS INT) ELSE CAST(-999 AS INT) END AS signal,flag,shop_id,trainortest,shop_rank,(dense_rank() over(partition by mall_id order by bssid desc)) as bssid_rank 
from dataSet_m_1057;
drop table if exists dataSet_bssid_rank_filterm_1057;
create table if not exists dataSet_bssid_rank_filterm_1057
as select row_id,user_id,mall_id,time_stamp,longitude,latitude,bssid,(signal+1000) AS signal,flag,shop_id,trainortest,shop_rank,bssid_rank 
from dataSet_bssid_rankm_1057
where signal<=0;
drop table if exists dataSet_bssid_rank_kvm_1057;
create table if not exists dataSet_bssid_rank_kvm_1057 as select *,concat(bssid_rank,':',signal) as bssid_rank_siganl_kv from dataSet_bssid_rank_filterm_1057;
drop table if exists dataSet_trainm_1057;
create table if not exists dataSet_trainm_1057 as select * from dataSet_bssid_rank_kvm_1057 where trainortest = 1;
drop table if exists train_m_all;
create table if not exists train_m_all
as select row_id,user_id,mall_id,time_stamp,longitude,latitude,shop_id,trainortest,shop_rank,wm_concat(' ',bssid_rank_siganl_kv) as feat from dataSet_trainm_1057 group by row_id,user_id,mall_id,time_stamp,longitude,latitude,shop_id,trainortest,shop_rank;
drop table if exists dataSet_testm_1057;
create table if not exists dataSet_testm_1057 as select * from dataSet_bssid_rank_kvm_1057 where trainortest = 0;
drop table if exists test_m_all;
create table if not exists test_m_all
as select row_id,user_id,mall_id,time_stamp,longitude,latitude,shop_id,trainortest,shop_rank,wm_concat(' ',bssid_rank_siganl_kv) as feat from dataSet_testm_1057 group by row_id,user_id,mall_id,time_stamp,longitude,latitude,shop_id,trainortest,shop_rank;

select min(shop_rank) from train_m_all;
select * from train_m_all;
select count(*) from test_m_all;
select * from test_m_all;

drop table if exists train_tmp;
create table if not exists train_tmp
as select row_id,user_id,mall_id,time_stamp,longitude,latitude,shop_id,trainortest,(shop_rank - 1) as shop_rank,feat
from train_m_all;
select count(*) from train_tmp;

drop table if exists train_m_all;
create table if not exists train_m_all
as select *
from train_tmp;
select count(*) from train_m_all;
select * from train_m_all;


select * from user_behavior_wifis_split;
select * from user_test_wifis_split;








