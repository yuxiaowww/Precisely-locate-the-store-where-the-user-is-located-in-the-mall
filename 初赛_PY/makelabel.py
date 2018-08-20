# -*- coding: utf-8 -*-
"""
Created on Tue Oct 31 20:25:51 2017

@author: yuwei
"""

import pandas as pd
from operator import itemgetter
import numpy as np

if __name__ == '__main__':

   #店铺和商场信息表
   shopinfo = pd.read_csv(r'训练数据-ccf_first_round_shop_info.csv')
   #用户在店铺内交易表
   USbehavior = pd.read_csv(r'训练数据-ccf_first_round_user_shop_behavior.csv')
   testData = pd.read_csv(r'AB榜测试集-evaluation_public.csv')
   #A榜数据，仅为9月第一周
   test = testData[testData['time_stamp'].map(lambda x : x[0:10] >= '2017-09-01' and x[0:10] <= '2017-09-07')]
   temp = test.copy()
   #截取商店和商场信息
   shopinfo_mall = shopinfo[['shop_id','mall_id']]
   us = pd.merge(USbehavior,shopinfo_mall,on=['shop_id'],how='left')
   us.sort_values(by = ['mall_id'],ascending = True,inplace = True)
   
   #取所有的商场
   malls = set(us['mall_id'])
   malls = list(malls)
   #取一个m_1021作为例子
   us1 = us[us['mall_id']=='m_1021']
   #标签（正样本）
   us1_label = us1[us1['time_stamp'].map(lambda x : x[0:10] >= '2017-08-01' and x[0:10] <= '2017-08-07')]
   #构造（候选负样本）
   us1_construction = us1[us1['time_stamp'].map(lambda x : x[0:10] > '2017-08-07')]
   #切分wifi
   us1_construction['wifi_infos'] = us1_construction['wifi_infos'].map(lambda x : [y.split('|') for y in x.split(';')])
   #排序
   us1_construction['wifi_infos'] = us1_construction['wifi_infos'].map(lambda x : sorted(x, key = itemgetter(1), reverse = False))
   del us1_construction['mall_id']
   #分离wifi
   for i in range(0,3):
          us1_construction['wifi_'+str(i)] = us1_construction.wifi_infos.map(lambda x : np.nan if len(x)<i+1 else x[i])
   us1_construction = us1_construction.set_index(us1_construction.columns.tolist()[0:5])
   wifis_temp = us1_construction['wifi_infos'];del us1_construction['wifi_infos']       
   us1_construction = us1_construction.stack()
   us1_construction = us1_construction.reset_index()
   wifis_temp = wifis_temp.reset_index()
   us1_construction = pd.merge(us1_construction,wifis_temp,how='left')
   us1_construction = us1_construction.rename(columns={0:'wifi_top5'})
   us1_construction['wifi_top5_w'] = us1_construction.wifi_top5.map(lambda x :x[0])
   us1_construction['wifi_top5_s'] = us1_construction.wifi_top5.map(lambda x :x[1])
   us1_construction['wifi_top5_c'] = us1_construction.wifi_top5.map(lambda x :x[2])
   
   #切分wifi
   us1_label['wifi_infos'] = us1_label['wifi_infos'].map(lambda x : [y.split('|') for y in x.split(';')])
   #排序
   us1_label['wifi_infos'] = us1_label['wifi_infos'].map(lambda x : sorted(x, key = itemgetter(1), reverse = False))
   del us1_label['mall_id']
   #分离wifi
   for i in range(0,3):
          us1_label['wifi_'+str(i)] = us1_label.wifi_infos.map(lambda x : np.nan if len(x)<i+1 else x[i])
   us1_label = us1_label.set_index(us1_label.columns.tolist()[0:5])
   wifis_temp = us1_label['wifi_infos'];del us1_label['wifi_infos']       
   us1_label = us1_label.stack()
   us1_label = us1_label.reset_index()
   wifis_temp = wifis_temp.reset_index()
   us1_label = pd.merge(us1_label,wifis_temp,how='left')
   us1_label = us1_label.rename(columns={0:'wifi_top5'})
   us1_label['wifi_top5_w'] = us1_label.wifi_top5.map(lambda x :x[0])
   us1_label['wifi_top5_s'] = us1_label.wifi_top5.map(lambda x :x[1])
   us1_label['wifi_top5_c'] = us1_label.wifi_top5.map(lambda x :x[2])
   
   




















