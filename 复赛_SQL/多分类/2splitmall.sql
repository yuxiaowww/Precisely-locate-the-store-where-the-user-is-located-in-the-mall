--m_1057
pai -name knn -DtrainTableName="train_m_1057" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1057" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1057" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1057;
CREATE TABLE IF NOT EXISTS ansm_1057 AS SELECT a.row_id ,b.shop_id FROM answer_m_1057 a LEFT OUTER JOIN train_m_1057 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1057;
CREATE TABLE IF NOT EXISTS m_1057 AS SELECT distinct * FROM ansm_1057;




--m_1081
drop table if exists answer_m_1081;
pai -name knn -DtrainTableName="train_m_1081" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1081" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1081" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1081;
CREATE TABLE IF NOT EXISTS ansm_1081 AS SELECT a.row_id ,b.shop_id FROM answer_m_1081 a LEFT OUTER JOIN train_m_1081 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1081;
CREATE TABLE IF NOT EXISTS m_1081 AS SELECT distinct * FROM ansm_1081;




--m_1106
pai -name knn -DtrainTableName="train_m_1106" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1106" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1106" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1106;
CREATE TABLE IF NOT EXISTS ansm_1106 AS SELECT a.row_id ,b.shop_id FROM answer_m_1106 a LEFT OUTER JOIN train_m_1106 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1106;
CREATE TABLE IF NOT EXISTS m_1106 AS SELECT distinct * FROM ansm_1106;




--m_1115
pai -name knn -DtrainTableName="train_m_1115" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1115" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1115" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1115;
CREATE TABLE IF NOT EXISTS ansm_1115 AS SELECT a.row_id ,b.shop_id FROM answer_m_1115 a LEFT OUTER JOIN train_m_1115 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1115;
CREATE TABLE IF NOT EXISTS m_1115 AS SELECT distinct * FROM ansm_1115;




--m_1161
pai -name knn -DtrainTableName="train_m_1161" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1161" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1161" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1161;
CREATE TABLE IF NOT EXISTS ansm_1161 AS SELECT a.row_id ,b.shop_id FROM answer_m_1161 a LEFT OUTER JOIN train_m_1161 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1161;
CREATE TABLE IF NOT EXISTS m_1161 AS SELECT distinct * FROM ansm_1161;




--m_1175
pai -name knn -DtrainTableName="train_m_1175" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1175" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1175" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1175;
CREATE TABLE IF NOT EXISTS ansm_1175 AS SELECT a.row_id ,b.shop_id FROM answer_m_1175 a LEFT OUTER JOIN train_m_1175 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1175;
CREATE TABLE IF NOT EXISTS m_1175 AS SELECT distinct * FROM ansm_1175;




--m_1291
pai -name knn -DtrainTableName="train_m_1291" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1291" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1291" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1291;
CREATE TABLE IF NOT EXISTS ansm_1291 AS SELECT a.row_id ,b.shop_id FROM answer_m_1291 a LEFT OUTER JOIN train_m_1291 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1291;
CREATE TABLE IF NOT EXISTS m_1291 AS SELECT distinct * FROM ansm_1291;




--m_1375
pai -name knn -DtrainTableName="train_m_1375" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1375" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1375" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1375;
CREATE TABLE IF NOT EXISTS ansm_1375 AS SELECT a.row_id ,b.shop_id FROM answer_m_1375 a LEFT OUTER JOIN train_m_1375 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1375;
CREATE TABLE IF NOT EXISTS m_1375 AS SELECT distinct * FROM ansm_1375;




--m_1435
pai -name knn -DtrainTableName="train_m_1435" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1435" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1435" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1435;
CREATE TABLE IF NOT EXISTS ansm_1435 AS SELECT a.row_id ,b.shop_id FROM answer_m_1435 a LEFT OUTER JOIN train_m_1435 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1435;
CREATE TABLE IF NOT EXISTS m_1435 AS SELECT distinct * FROM ansm_1435;




--m_1442
pai -name knn -DtrainTableName="train_m_1442" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1442" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1442" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1442;
CREATE TABLE IF NOT EXISTS ansm_1442 AS SELECT a.row_id ,b.shop_id FROM answer_m_1442 a LEFT OUTER JOIN train_m_1442 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1442;
CREATE TABLE IF NOT EXISTS m_1442 AS SELECT distinct * FROM ansm_1442;




--m_1585
pai -name knn -DtrainTableName="train_m_1585" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1585" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1585" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1585;
CREATE TABLE IF NOT EXISTS ansm_1585 AS SELECT a.row_id ,b.shop_id FROM answer_m_1585 a LEFT OUTER JOIN train_m_1585 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1585;
CREATE TABLE IF NOT EXISTS m_1585 AS SELECT distinct * FROM ansm_1585;




--m_1789
pai -name knn -DtrainTableName="train_m_1789" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1789" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1789" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1789;
CREATE TABLE IF NOT EXISTS ansm_1789 AS SELECT a.row_id ,b.shop_id FROM answer_m_1789 a LEFT OUTER JOIN train_m_1789 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1789;
CREATE TABLE IF NOT EXISTS m_1789 AS SELECT distinct * FROM ansm_1789;




--m_1807
pai -name knn -DtrainTableName="train_m_1807" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1807" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1807" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1807;
CREATE TABLE IF NOT EXISTS ansm_1807 AS SELECT a.row_id ,b.shop_id FROM answer_m_1807 a LEFT OUTER JOIN train_m_1807 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1807;
CREATE TABLE IF NOT EXISTS m_1807 AS SELECT distinct * FROM ansm_1807;




--m_1893
pai -name knn -DtrainTableName="train_m_1893" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1893" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1893" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1893;
CREATE TABLE IF NOT EXISTS ansm_1893 AS SELECT a.row_id ,b.shop_id FROM answer_m_1893 a LEFT OUTER JOIN train_m_1893 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1893;
CREATE TABLE IF NOT EXISTS m_1893 AS SELECT distinct * FROM ansm_1893;




--m_1906
pai -name knn -DtrainTableName="train_m_1906" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1906" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1906" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1906;
CREATE TABLE IF NOT EXISTS ansm_1906 AS SELECT a.row_id ,b.shop_id FROM answer_m_1906 a LEFT OUTER JOIN train_m_1906 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1906;
CREATE TABLE IF NOT EXISTS m_1906 AS SELECT distinct * FROM ansm_1906;




--m_1919
pai -name knn -DtrainTableName="train_m_1919" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1919" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1919" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1919;
CREATE TABLE IF NOT EXISTS ansm_1919 AS SELECT a.row_id ,b.shop_id FROM answer_m_1919 a LEFT OUTER JOIN train_m_1919 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1919;
CREATE TABLE IF NOT EXISTS m_1919 AS SELECT distinct * FROM ansm_1919;




--m_1920
pai -name knn -DtrainTableName="train_m_1920" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1920" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1920" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1920;
CREATE TABLE IF NOT EXISTS ansm_1920 AS SELECT a.row_id ,b.shop_id FROM answer_m_1920 a LEFT OUTER JOIN train_m_1920 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1920;
CREATE TABLE IF NOT EXISTS m_1920 AS SELECT distinct * FROM ansm_1920;




--m_1928
pai -name knn -DtrainTableName="train_m_1928" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1928" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1928" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1928;
CREATE TABLE IF NOT EXISTS ansm_1928 AS SELECT a.row_id ,b.shop_id FROM answer_m_1928 a LEFT OUTER JOIN train_m_1928 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1928;
CREATE TABLE IF NOT EXISTS m_1928 AS SELECT distinct * FROM ansm_1928;




--m_1960
pai -name knn -DtrainTableName="train_m_1960" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1960" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1960" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1960;
CREATE TABLE IF NOT EXISTS ansm_1960 AS SELECT a.row_id ,b.shop_id FROM answer_m_1960 a LEFT OUTER JOIN train_m_1960 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1960;
CREATE TABLE IF NOT EXISTS m_1960 AS SELECT distinct * FROM ansm_1960;




--m_1990
pai -name knn -DtrainTableName="train_m_1990" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_1990" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_1990" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_1990;
CREATE TABLE IF NOT EXISTS ansm_1990 AS SELECT a.row_id ,b.shop_id FROM answer_m_1990 a LEFT OUTER JOIN train_m_1990 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_1990;
CREATE TABLE IF NOT EXISTS m_1990 AS SELECT distinct * FROM ansm_1990;




--m_2009
pai -name knn -DtrainTableName="train_m_2009" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_2009" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_2009" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_2009;
CREATE TABLE IF NOT EXISTS ansm_2009 AS SELECT a.row_id ,b.shop_id FROM answer_m_2009 a LEFT OUTER JOIN train_m_2009 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_2009;
CREATE TABLE IF NOT EXISTS m_2009 AS SELECT distinct * FROM ansm_2009;




--m_2021
pai -name knn -DtrainTableName="train_m_2021" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_2021" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_2021" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_2021;
CREATE TABLE IF NOT EXISTS ansm_2021 AS SELECT a.row_id ,b.shop_id FROM answer_m_2021 a LEFT OUTER JOIN train_m_2021 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_2021;
CREATE TABLE IF NOT EXISTS m_2021 AS SELECT distinct * FROM ansm_2021;




--m_2030
pai -name knn -DtrainTableName="train_m_2030" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_2030" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_2030" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_2030;
CREATE TABLE IF NOT EXISTS ansm_2030 AS SELECT a.row_id ,b.shop_id FROM answer_m_2030 a LEFT OUTER JOIN train_m_2030 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_2030;
CREATE TABLE IF NOT EXISTS m_2030 AS SELECT distinct * FROM ansm_2030;




--m_2093
pai -name knn -DtrainTableName="train_m_2093" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_2093" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_2093" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_2093;
CREATE TABLE IF NOT EXISTS ansm_2093 AS SELECT a.row_id ,b.shop_id FROM answer_m_2093 a LEFT OUTER JOIN train_m_2093 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_2093;
CREATE TABLE IF NOT EXISTS m_2093 AS SELECT distinct * FROM ansm_2093;




--m_2230
pai -name knn -DtrainTableName="train_m_2230" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_2230" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_2230" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_2230;
CREATE TABLE IF NOT EXISTS ansm_2230 AS SELECT a.row_id ,b.shop_id FROM answer_m_2230 a LEFT OUTER JOIN train_m_2230 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_2230;
CREATE TABLE IF NOT EXISTS m_2230 AS SELECT distinct * FROM ansm_2230;




--m_2324
pai -name knn -DtrainTableName="train_m_2324" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_2324" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_2324" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_2324;
CREATE TABLE IF NOT EXISTS ansm_2324 AS SELECT a.row_id ,b.shop_id FROM answer_m_2324 a LEFT OUTER JOIN train_m_2324 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_2324;
CREATE TABLE IF NOT EXISTS m_2324 AS SELECT distinct * FROM ansm_2324;




--m_2333
pai -name knn -DtrainTableName="train_m_2333" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_2333" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_2333" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_2333;
CREATE TABLE IF NOT EXISTS ansm_2333 AS SELECT a.row_id ,b.shop_id FROM answer_m_2333 a LEFT OUTER JOIN train_m_2333 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_2333;
CREATE TABLE IF NOT EXISTS m_2333 AS SELECT distinct * FROM ansm_2333;




--m_2450
pai -name knn -DtrainTableName="train_m_2450" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_2450" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_2450" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_2450;
CREATE TABLE IF NOT EXISTS ansm_2450 AS SELECT a.row_id ,b.shop_id FROM answer_m_2450 a LEFT OUTER JOIN train_m_2450 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_2450;
CREATE TABLE IF NOT EXISTS m_2450 AS SELECT distinct * FROM ansm_2450;




--m_2514
pai -name knn -DtrainTableName="train_m_2514" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_2514" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_2514" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_2514;
CREATE TABLE IF NOT EXISTS ansm_2514 AS SELECT a.row_id ,b.shop_id FROM answer_m_2514 a LEFT OUTER JOIN train_m_2514 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_2514;
CREATE TABLE IF NOT EXISTS m_2514 AS SELECT distinct * FROM ansm_2514;




--m_3112
pai -name knn -DtrainTableName="train_m_3112" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_3112" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_3112" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_3112;
CREATE TABLE IF NOT EXISTS ansm_3112 AS SELECT a.row_id ,b.shop_id FROM answer_m_3112 a LEFT OUTER JOIN train_m_3112 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_3112;
CREATE TABLE IF NOT EXISTS m_3112 AS SELECT distinct * FROM ansm_3112;




--m_3268
pai -name knn -DtrainTableName="train_m_3268" -DtrainFeatureColNames="feat" -DtrainLabelColName="shop_rank" -DpredictTableName="test_m_3268" -DpredictFeatureColNames="feat" -DoutputTableName="answer_m_3268" -DappendColNames="row_id"  -Dk="100" -DenableSparse="true" -DkvDelimiter=":" -DitemDelimiter" ";
DROP TABLE IF EXISTS ansm_3268;
CREATE TABLE IF NOT EXISTS ansm_3268 AS SELECT a.row_id ,b.shop_id FROM answer_m_3268 a LEFT OUTER JOIN train_m_3268 b ON a.prediction_result =b.shop_rank;
DROP TABLE IF EXISTS m_3268;
CREATE TABLE IF NOT EXISTS m_3268 AS SELECT distinct * FROM ansm_3268;


DROP TABLE IF EXISTS u1;
CREATE TABLE IF NOT EXISTS u1 AS 
SELECT * FROM m_1057 UNION ALL
SELECT * FROM m_1081 UNION ALL
SELECT * FROM m_1106 UNION ALL
SELECT * FROM m_1115 UNION ALL
SELECT * FROM m_1161 UNION ALL
SELECT * FROM m_1175 UNION ALL
SELECT * FROM m_1291 UNION ALL
SELECT * FROM m_1375 UNION ALL
SELECT * FROM m_1435 UNION ALL
SELECT * FROM m_1442 UNION ALL
SELECT * FROM m_1585 UNION ALL
SELECT * FROM m_1789 UNION ALL
SELECT * FROM m_1807 UNION ALL
SELECT * FROM m_1893 UNION ALL
SELECT * FROM m_1906 UNION ALL
SELECT * FROM m_1919 UNION ALL
SELECT * FROM m_1920 UNION ALL
SELECT * FROM m_1928 UNION ALL
SELECT * FROM m_1960 UNION ALL
SELECT * FROM m_1990 UNION ALL
SELECT * FROM m_2009 UNION ALL
SELECT * FROM m_2021 UNION ALL
SELECT * FROM m_2030 UNION ALL
SELECT * FROM m_2093 UNION ALL
SELECT * FROM m_2230 UNION ALL
SELECT * FROM m_2324 UNION ALL
SELECT * FROM m_2333 UNION ALL
SELECT * FROM m_2450 UNION ALL
SELECT * FROM m_2514 UNION ALL
SELECT * FROM m_3112 UNION ALL
SELECT * FROM m_3268;





