# -*- coding: utf-8 -*-
"""
Created on Wed Nov  1 10:51:23 2017

@author: yuwei
"""

import pandas as pd
from operator import itemgetter
import numpy as np
import xgboost as xgb


def loadData():
   "下载原始数据集"
   #店铺和商场信息表
   shopinfo = pd.read_csv(r'训练数据-ccf_first_round_shop_info.csv')
   #用户在店铺内交易表
   USbehavior = pd.read_csv(r'训练数据-ccf_first_round_user_shop_behavior.csv')
   testData = pd.read_csv(r'AB榜测试集-evaluation_public.csv')
   #历史行为连接mall_id信息
   USbehavior = pd.merge(USbehavior,shopinfo[['shop_id','mall_id']],on=['shop_id'],how='left')

   return shopinfo,USbehavior,testData

def splitDataSet(USbehavior,testData):
    "划分数据集"
    #训练集：8月第1周  特征区间：8月2,3,4周
    train = USbehavior[USbehavior['time_stamp'].map(lambda x : x[0:10] >= '2017-08-01' and x[0:10] <= '2017-08-07')]
    trainFeature = USbehavior[USbehavior['time_stamp'].map(lambda x : x[0:10] >'2017-08-07')]
    #验证集：8月第2周  特征区间：8月1,3,4周
    validate = USbehavior[USbehavior['time_stamp'].map(lambda x : x[0:10] >= '2017-08-08' and x[0:10] <= '2017-08-14')]
    validateFeature = USbehavior[USbehavior['time_stamp'].map(lambda x : x[0:10] >= '2017-08-15' or x[0:10] <= '2017-08-07')]
    #测试集：9月第1周  特征区间：8月2,3,4周
    test = testData[testData['time_stamp'].map(lambda x : x[0:10] >= '2017-09-01' and x[0:10] <= '2017-09-07')]
    testFeature = USbehavior[USbehavior['time_stamp'].map(lambda x : x[0:10] >'2017-08-07')] 
                             
    return train,trainFeature,validate,validateFeature,test,testFeature 

def medianDistance(USbehavior):
    "处理历史距离信息"
    distance = USbehavior[['shop_id','longitude','latitude']]
    #计算每个商店的经纬度(中位数)
    distance = pd.pivot_table(distance,index = ['shop_id'],values = ['longitude','latitude'],aggfunc = np.median).reset_index()
    
    return distance

                    

def makelabel(dataset,feature):
   "给数据集打标"

   label = dataset
   feat =feature
   
   label = label[label['mall_id']=='m_1021']
   #测试集
   feat = feat[feat['mall_id']=='m_1021']

   #切分wifi
   feat['wifi_infos'] = feat['wifi_infos'].map(lambda x : [y.split('|') for y in x.split(';')])
   #排序
   feat['wifi_infos'] = feat['wifi_infos'].map(lambda x : sorted(x, key = itemgetter(1), reverse = False))
   del feat['mall_id']
   #分离wifi
   for i in range(0,3):
          feat['wifi_'+str(i)] = feat.wifi_infos.map(lambda x : np.nan if len(x)<i+1 else x[i])
   feat = feat.set_index(feat.columns.tolist()[0:5])
   wifis_temp = feat['wifi_infos'];del feat['wifi_infos']       
   feat = feat.stack()
   feat = feat.reset_index()
   wifis_temp = wifis_temp.reset_index()
   feat = pd.merge(feat,wifis_temp,how='left')
   feat = feat.rename(columns={0:'wifi_top3'})
   #拆分top3
   feat['wifi_top3_w'] = feat.wifi_top3.map(lambda x :x[0])
   feat['wifi_top3_s'] = feat.wifi_top3.map(lambda x :x[1])
   feat['wifi_top3_c'] = feat.wifi_top3.map(lambda x :x[2])
   
   #切分wifi
   label['wifi_infos'] = label['wifi_infos'].map(lambda x : [y.split('|') for y in x.split(';')])
   #排序
   label['wifi_infos'] = label['wifi_infos'].map(lambda x : sorted(x, key = itemgetter(1), reverse = False))
   del label['mall_id']
   #分离wifi
   for i in range(0,3):
          label['wifi_'+str(i)] = label.wifi_infos.map(lambda x : np.nan if len(x)<i+1 else x[i])
   label = label.set_index(label.columns.tolist()[0:5])
   wifis_temp = label['wifi_infos'];del label['wifi_infos']       
   label = label.stack()
   label = label.reset_index()
   wifis_temp = wifis_temp.reset_index()
   label = pd.merge(label,wifis_temp,how='left')
   label = label.rename(columns={0:'wifi_top3'})
   #拆分top3
   label['wifi_top3_w'] = label.wifi_top3.map(lambda x :x[0])
   label['wifi_top3_s'] = label.wifi_top3.map(lambda x :x[1])
   label['wifi_top3_c'] = label.wifi_top3.map(lambda x :x[2])
   #打标count的准备
   feat['count'] = feat['wifi_top3_w']
   tmp = pd.pivot_table(feat,index=['shop_id','wifi_top3_w'],values='count',aggfunc='count').reset_index()
   del feat['count']
   feat = pd.merge(feat,tmp,how='left')
   label = pd.merge(label,tmp,on='wifi_top3_w',how='left')
   #打标
   l = list(map(lambda x,y: 1 if x==y else 0,label['shop_id_x'],label['shop_id_y']))
   label['label'] = l
#   del label['shop_id_x'];label = label.rename(columns={'shop_id_y':'shop_id'})

   return label,feat
   
def makeTrain(dataset,feature):
   "给数据集打标"

   label = dataset
   feat =feature

   #切分wifi
   feat['wifi_infos'] = feat['wifi_infos'].map(lambda x : [y.split('|') for y in x.split(';')])
   #排序
   feat['wifi_infos'] = feat['wifi_infos'].map(lambda x : sorted(x, key = itemgetter(1), reverse = False))
   del feat['mall_id']
   #分离wifi
   for i in range(0,3):
          feat['wifi_'+str(i)] = feat.wifi_infos.map(lambda x : np.nan if len(x)<i+1 else x[i])
   feat = feat.set_index(feat.columns.tolist()[0:5])
   wifis_temp = feat['wifi_infos'];del feat['wifi_infos']       
   feat = feat.stack()
   feat = feat.reset_index()
   wifis_temp = wifis_temp.reset_index()
   feat = pd.merge(feat,wifis_temp,how='left')
   feat = feat.rename(columns={0:'wifi_top3'})
   #拆分top3
   feat['wifi_top3_w'] = feat.wifi_top3.map(lambda x :x[0])
   feat['wifi_top3_s'] = feat.wifi_top3.map(lambda x :x[1])
   feat['wifi_top3_c'] = feat.wifi_top3.map(lambda x :x[2])
   
   #切分wifi
   label['wifi_infos'] = label['wifi_infos'].map(lambda x : [y.split('|') for y in x.split(';')])
   #排序
   label['wifi_infos'] = label['wifi_infos'].map(lambda x : sorted(x, key = itemgetter(1), reverse = False))
   del label['mall_id']
   #分离wifi
   for i in range(0,3):
          label['wifi_'+str(i)] = label.wifi_infos.map(lambda x : np.nan if len(x)<i+1 else x[i])
   label = label.set_index(label.columns.tolist()[0:5])
   wifis_temp = label['wifi_infos'];del label['wifi_infos']       
   label = label.stack()
   label = label.reset_index()
   wifis_temp = wifis_temp.reset_index()
   label = pd.merge(label,wifis_temp,how='left')
   label = label.rename(columns={0:'wifi_top3'})
   #拆分top3
   label['wifi_top3_w'] = label.wifi_top3.map(lambda x :x[0])
   label['wifi_top3_s'] = label.wifi_top3.map(lambda x :x[1])
   label['wifi_top3_c'] = label.wifi_top3.map(lambda x :x[2])
   #打标count的准备
   feat['count'] = feat['wifi_top3_w']
   tmp = pd.pivot_table(feat,index=['shop_id','wifi_top3_w'],values='count',aggfunc='count').reset_index()
   del feat['count']
   feat = pd.merge(feat,tmp,how='left')
   label = pd.merge(label,tmp,on='wifi_top3_w',how='left')
   

   return label,feat
   
   
   
def runValidate(train,train_feature,validate,validate_feature):
    
    predicted = []
    predicted = pd.DataFrame(predicted)
    malls = set(train_feature['mall_id'])
    malls = list(malls)   
    for item in malls:
        
        label_train,feat_train = makelabel(train[train['mall_id']==item],train_feature[train_feature['mall_id']==item])
        label_validate,feat_validate = makelabel(validate[validate['mall_id']==item],validate_feature[validate_feature['mall_id']==item])
        label_train['level'] = label_train.level_5.map(lambda x:x[-1])
        label_validate['level'] = label_validate.level_5.map(lambda x:x[-1])
        predict = model_xgb_validate(label_train,label_validate)
        predicted = predicted.append(predict)
    return predicted
    
def runTest(train,train_feature,test,test_feature):
    
    predicted = []
    predicted = pd.DataFrame(predicted)
    malls = set(train_feature['mall_id'])
    malls = list(malls)
    length = len(malls)
    j = 0
    for item in malls:
        j = j + 1
        print('已经完成'+str(j/length)+'的训练')
        label_train,feat_train = makelabel(train[train['mall_id']==item],train_feature[train_feature['mall_id']==item])
        label_test,feat_test = makeTrain(test[test['mall_id']==item],test_feature[test_feature['mall_id']==item])
        label_train['level'] = label_train.level_5.map(lambda x:x[-1])
        label_test['level'] = label_test.level_5.map(lambda x:x[-1])
        predict = model_xgb_test(label_train,label_test)
        predicted = predicted.append(predict)
    return predicted
        
def model_xgb_validate(train,test):
    train_y = train['label'].values
    train_x = train.drop(['user_id', 'shop_id_x', 'time_stamp', 'wifi_top3_c',
       'level_5', 'wifi_top3', 'wifi_infos', 'wifi_top3_w', 'shop_id_y', 'label'],axis=1).values
    test_x = test.drop(['user_id', 'shop_id_x', 'time_stamp', 'wifi_top3_c',
       'level_5', 'wifi_top3', 'wifi_infos', 'wifi_top3_w', 'shop_id_y','label'],axis=1).values

    dtrain = xgb.DMatrix(train_x, label=train_y)
    dtest = xgb.DMatrix(test_x)
    
    # 模型参数
    params = {'booster': 'gbtree',
              'objective':'binary:logistic',
              'eta': 0.03,
              'max_depth': 6,  # 6
              'colsample_bytree': 0.8,#0.8
              'subsample': 0.8,
              'scale_pos_weight': 1,
              'min_child_weight': 18  # 2
              }
    # 训练
    bst = xgb.train(params, dtrain, num_boost_round=1500)
    # 预测
    predict = bst.predict(dtest)
    test_xy = test[['user_id','shop_id_x','shop_id_y']]
    test_xy['prob'] = predict
    predict = pd.DataFrame(predict)
    predicted = pd.concat([test_xy[['user_id','shop_id_x','shop_id_y']], predict], axis=1)
    predicted = predicted.sort_values(0, ascending=False)
    
    predicted = predicted.drop_duplicates(subset=['user_id','shop_id_x'], keep = 'first')
    l = list(map(lambda x,y: 1 if x==y else 0,predicted['shop_id_x'],predicted['shop_id_y']))
    predicted['label'] = l
    print(len(predicted[predicted['label']==1])/len(predicted))
    return predicted
    
def model_xgb_test(train,test):
    train_y = train['label'].values
    train_x = train.drop(['user_id', 'shop_id_x', 'time_stamp', 'wifi_top3_c',
       'level_5', 'wifi_top3', 'wifi_infos', 'wifi_top3_w', 'shop_id_y', 'label'],axis=1).values
    test_x = test.drop(['user_id', 'shop_id', 'time_stamp', 'wifi_top3_c','row_id',
       'level_5', 'wifi_top3', 'wifi_infos', 'wifi_top3_w'],axis=1).values

    dtrain = xgb.DMatrix(train_x, label=train_y)
    dtest = xgb.DMatrix(test_x)
    
    # 模型参数
    params = {'booster': 'gbtree',
              'objective':'binary:logistic',
              'eta': 0.03,
              'max_depth': 6,  # 6
              'colsample_bytree': 0.8,#0.8
              'subsample': 0.8,
              'scale_pos_weight': 1,
              'min_child_weight': 18  # 2
              }
    # 训练
    bst = xgb.train(params, dtrain, num_boost_round=1500)
    # 预测
    predict = bst.predict(dtest)
    test_xy = test[['row_id','shop_id']]
    test_xy['prob'] = predict
    predict = pd.DataFrame(predict)
    predicted = pd.concat([test_xy[['row_id','shop_id']], predict], axis=1)
    predicted = predicted.sort_values(0, ascending=False)
    
    predicted = predicted.drop_duplicates(subset=['row_id'], keep = 'first')
    
    return predicted    
    
    
    
if __name__ == '__main__':
   #下载原始数据集
   shopinfo,USbehavior,testData = loadData()
   #划分数据集
   train,trainFeature,validate,validateFeature,test,testFeature = splitDataSet(USbehavior,testData)
   #中位数经纬度
#   distance = medianDistance(USbehavior)
   
   
   label,feat = makelabel(train,trainFeature)

#   label,feat = makeTrain(test,testFeature)

#   label_train,feat_train,label_validate,feat_validate = runMakeLabel(train,trainFeature,validate,validateFeature)
#   predict = model_xgb(label_train,label_train)

#   predicted = runValidate(train,trainFeature,validate,validateFeature)
#   predicted = runTest(train,trainFeature,test,testFeature)

















