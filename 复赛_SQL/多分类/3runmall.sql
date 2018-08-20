drop table if exists m_1021_label;
drop offlinemodel if exists gbdt_m_1021;

PAI -name ps_smart
-project algo_public
-DfeatureColNames="feat"
-DlabelColName="shop_rank"
-DenableSparse="true"
-DinputTableName="train_m_1021"
-DmodelName="gbdt_m_1021"
-Dlifecycle="30"
-DclassNum="78"
-Dobjective="multi:softprob"
-Dmetric="merror"
-DtreeCount="30"
-DmaxDepth="7"
-DfeatureImportanceType="gain"
-Dl2="1.0"
-Dl1="0"
-Dshrinkage="0.1";
-- Ô¤²â
PAI -name prediction
-project algo_public
-DinputTableName="test_m_1021"
-DmodelName="gbdt_m_1021"
-DoutputTableName="m_1021_label"
-DfeatureColNames="feat"
-DappendColNames="row_id"
-DenableSparse="true"
-DkvDelimiter=":"
-DitemDelimiter=" "
-Dlifecycle="30"
-DresultColName="shop_rank";
-- label×ªshop_id
drop table if exists m_1021;
create table if not exists m_1021
as
select a.row_id,b.shop_id
from m_1021_label a
left outer join
(select shop_rank,shop_id from train_m_1021 group by shop_rank,shop_id) b
on a.shop_rank = b.shop_rank;



drop table if exists m_1085_label;
drop offlinemodel if exists gbdt_m_1085;

PAI -name ps_smart
-project algo_public
-DfeatureColNames="feat"
-DlabelColName="shop_rank"
-DenableSparse="true"
-DinputTableName="train_m_1085"
-DmodelName="gbdt_m_1085"
-Dlifecycle="30"
-DclassNum="57"
-Dobjective="multi:softprob"
-Dmetric="merror"
-DtreeCount="30"
-DmaxDepth="7"
-DfeatureImportanceType="gain"
-Dl2="1.0"
-Dl1="0"
-Dshrinkage="0.1";

PAI -name prediction
-project algo_public
-DinputTableName="test_m_1085"
-DmodelName="gbdt_m_1085"
-DoutputTableName="m_1085_label"
-DfeatureColNames="feat"
-DappendColNames="row_id"
-DenableSparse="true"
-DkvDelimiter=":"
-DitemDelimiter=" "
-Dlifecycle="30"
-DresultColName="shop_rank";
-- label×ªshop_id
drop table if exists m_1085;
create table if not exists m_1085
as
select a.row_id,b.shop_id
from m_1085_label a
left outer join
(select shop_rank,shop_id from train_m_1085 group by shop_rank,shop_id) b
on a.shop_rank = b.shop_rank;



drop table if exists m_1128_label;
drop offlinemodel if exists gbdt_m_1128;

PAI -name ps_smart
-project algo_public
-DfeatureColNames="feat"
-DlabelColName="shop_rank"
-DenableSparse="true"
-DinputTableName="train_m_1128"
-DmodelName="gbdt_m_1128"
-Dlifecycle="30"
-DclassNum="52"
-Dobjective="multi:softprob"
-Dmetric="merror"
-DtreeCount="30"
-DmaxDepth="7"
-DfeatureImportanceType="gain"
-Dl2="1.0"
-Dl1="0"
-Dshrinkage="0.1";

PAI -name prediction
-project algo_public
-DinputTableName="test_m_1128"
-DmodelName="gbdt_m_1128"
-DoutputTableName="m_1128_label"
-DfeatureColNames="feat"
-DappendColNames="row_id"
-DenableSparse="true"
-DkvDelimiter=":"
-DitemDelimiter=" "
-Dlifecycle="30"
-DresultColName="shop_rank";
-- label×ªshop_id
drop table if exists m_1128;
create table if not exists m_1128
as
select a.row_id,b.shop_id
from m_1128_label a
left outer join
(select shop_rank,shop_id from train_m_1128 group by shop_rank,shop_id) b
on a.shop_rank = b.shop_rank;



drop table if exists m_1129_label;
drop offlinemodel if exists gbdt_m_1129;

PAI -name ps_smart
-project algo_public
-DfeatureColNames="feat"
-DlabelColName="shop_rank"
-DenableSparse="true"
-DinputTableName="train_m_1129"
-DmodelName="gbdt_m_1129"
-Dlifecycle="30"
-DclassNum="50"
-Dobjective="multi:softprob"
-Dmetric="merror"
-DtreeCount="30"
-DmaxDepth="7"
-DfeatureImportanceType="gain"
-Dl2="1.0"
-Dl1="0"
-Dshrinkage="0.1";

PAI -name prediction
-project algo_public
-DinputTableName="test_m_1129"
-DmodelName="gbdt_m_1129"
-DoutputTableName="m_1129_label"
-DfeatureColNames="feat"
-DappendColNames="row_id"
-DenableSparse="true"
-DkvDelimiter=":"
-DitemDelimiter=" "
-Dlifecycle="30"
-DresultColName="shop_rank";
-- label×ªshop_id
drop table if exists m_1129;
create table if not exists m_1129
as
select a.row_id,b.shop_id
from m_1129_label a
left outer join
(select shop_rank,shop_id from train_m_1129 group by shop_rank,shop_id) b
on a.shop_rank = b.shop_rank;



drop table if exists m_1161_label;
drop offlinemodel if exists gbdt_m_1161;

PAI -name ps_smart
-project algo_public
-DfeatureColNames="feat"
-DlabelColName="shop_rank"
-DenableSparse="true"
-DinputTableName="train_m_1161"
-DmodelName="gbdt_m_1161"
-Dlifecycle="30"
-DclassNum="43"
-Dobjective="multi:softprob"
-Dmetric="merror"
-DtreeCount="30"
-DmaxDepth="7"
-DfeatureImportanceType="gain"
-Dl2="1.0"
-Dl1="0"
-Dshrinkage="0.1";

PAI -name prediction
-project algo_public
-DinputTableName="test_m_1161"
-DmodelName="gbdt_m_1161"
-DoutputTableName="m_1161_label"
-DfeatureColNames="feat"
-DappendColNames="row_id"
-DenableSparse="true"
-DkvDelimiter=":"
-DitemDelimiter=" "
-Dlifecycle="30"
-DresultColName="shop_rank";
-- label×ªshop_id
drop table if exists m_1161;
create table if not exists m_1161
as
select a.row_id,b.shop_id
from m_1161_label a
left outer join
(select shop_rank,shop_id from train_m_1161 group by shop_rank,shop_id) b
on a.shop_rank = b.shop_rank;



drop table if exists m_1320_label;
drop offlinemodel if exists gbdt_m_1320;

PAI -name ps_smart
-project algo_public
-DfeatureColNames="feat"
-DlabelColName="shop_rank"
-DenableSparse="true"
-DinputTableName="train_m_1320"
-DmodelName="gbdt_m_1320"
-Dlifecycle="30"
-DclassNum="51"
-Dobjective="multi:softprob"
-Dmetric="merror"
-DtreeCount="30"
-DmaxDepth="7"
-DfeatureImportanceType="gain"
-Dl2="1.0"
-Dl1="0"
-Dshrinkage="0.1";

PAI -name prediction
-project algo_public
-DinputTableName="test_m_1320"
-DmodelName="gbdt_m_1320"
-DoutputTableName="m_1320_label"
-DfeatureColNames="feat"
-DappendColNames="row_id"
-DenableSparse="true"
-DkvDelimiter=":"
-DitemDelimiter=" "
-Dlifecycle="30"
-DresultColName="shop_rank";
-- label×ªshop_id
drop table if exists m_1320;
create table if not exists m_1320
as
select a.row_id,b.shop_id
from m_1320_label a
left outer join
(select shop_rank,shop_id from train_m_1320 group by shop_rank,shop_id) b
on a.shop_rank = b.shop_rank;



