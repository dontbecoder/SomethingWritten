#-*-coding:cp936 -*-

import urllib
import urllib.request
import http.cookiejar

import time
import re


forum_list=[
		72, 	# �μ�
		255,	# ɽ��
		39, 	# ����
		258,	# ����
		256, 	# ��·
		92, 	# �۵�
		]


def Get_TID(FID):
	
	info_f=open('thread_list_'+ str(FID) +'.txt','r')
	
	html=info_f.read()
	
	#pt=re.compile('thread-\w*....\\.html') #  full name
	pt=re.compile('thread-(\w*)') #  TID only
	
	result = re.findall(pt,html)
	
	
	l2=list(set(result))
	l2.sort(key=result.index)  # Sort list
	
	info_f.close()
	
	
	result_f=open('TID_'+ str(FID) +'.txt','a')
	
	for i in l2:	
		result_f.write(str(i)+'\n')
	
	result_f.close()



	
for i in forum_list:
	Get_TID(i)
