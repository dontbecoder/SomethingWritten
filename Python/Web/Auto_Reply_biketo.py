#-*-coding:cp936 -*-

import urllib
import urllib.request
import http.cookiejar

import time
import re


context=[
	'����Ѹ�ٵĳ���',
	'������ƣ�������',
	'��������������Ľ���',
	'����������п���',
	'������лл����',
	'�ߴ��ϣ�ע�ⰲȫ',
	'һ��˵�߾��ߵ�����',
	'��Ų������'
	'�÷�þ�������',
	'�÷羰��������'
		]
#FID =72

#thread_list=[
#	1706286,
#	1785837,
#	1782870,	
#		]



def Reply_func(FID, TID , Context):        # �۵����
	url_post2='http://bbs.biketo.com/forum.php?mod=post&action=reply&fid='+str(FID) +'&tid=' + str(TID) +'&extra=page%3D1&replysubmit=yes&infloat=yes&handlekey=fastpost&inajax=1'

	headers={
		'User-agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', # Get from firebug network status

		'Refer':'http://bbs.biketo.com/thread-' + str(TID) + '-1-1.html', # reply to

		'Cookie':'XFJp_2132_saltkey=OnC8oUUA; XFJp_2132_lastvisit=1474188938; XFJp_2132_sid=edEA0l; XFJp_2132_lastact=1474192835%09forum.php%09ajax; XFJp_2132_st_t=410094%7C1474192561%7C93bf3b5bd179e204ca0c0b14bd74c5a6; XFJp_2132_atarget=1; XFJp_2132_forum_lastvisit=D_92_1474192561; Hm_lvt_d5fe67a93dc45edea7b69a91b382daa1=1473739293,1473846987,1474162908,1474191724; Hm_lpvt_d5fe67a93dc45edea7b69a91b382daa1=1474192387; CNZZDATA547230=cnzz_eid%3D242393440-1474191822-%26ntime%3D1474191822; __utma=114141336.812458895.1474192375.1474192375.1474192375.1; __utmb=114141336.3.10.1474192375; __utmc=114141336; __utmz=114141336.1474192375.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utmt=1; XFJp_2132_ulastactivity=1c06V3DLDMvxL7Z%2FWDZRjE%2FNpDK%2BThwjM5sl18B3z59RRAFNCtZM; XFJp_2132_auth=d3d9wvHsju2BinXRTd%2FMdHWzF6cR6bp75KuulNC1GSc2xEjiE%2FTRBN66cq128ny3h0Ud9Q4yefkdK0NHzN8T0aemNg8; XFJp_2132_lastcheckfeed=410094%7C1474192550; XFJp_2132_lip=183.16.197.157%2C1474191897; XFJp_2132_security_cookiereport=e00fMDldcrm4RdxkzfKi441N1l9nPjkdb85%2FzgTn9Pfje3pqc%2Fi6; pgv_pvi=5274193296; pgv_info=ssi=s4806583446; tjpctrl=1474194178363; XFJp_2132_nofocus_forum=1'

		} # bbs.biketo.com

	dict2={
	'message':Context,	#'����Ѹ�ٵĳ���'.encode('gbk'),
	'posttime':str(int(time.time())),
	'formhash':'25523c55',

	'usesig':'1',
	'subject':''
	}  # biketo


	cookie = http.cookiejar.CookieJar()
	cjhdr = urllib.request.HTTPCookieProcessor(cookie)
	opener = urllib.request.build_opener(cjhdr)

	postdata=urllib.parse.urlencode(dict2)

	postdata=postdata.encode('utf8') # utf8  ascii



	req = urllib.request.Request(url_post2, postdata, headers)	#  
	with urllib.request.urlopen(req) as response:
		if(response.status!=200):
			print('login Failed! ' + response.status +' ' + TID)
			#exit()
		else:
			print('login OK!')



forum_list=[
#		72, 	# �μ�
		255,	# ɽ��
#		39, 	# ����
		258,	# ����
		256, 	# ��·
#		92, 	# �۵�
		]
fid =255

TID_list=[]

#for i in forum_list:
thread_list_f=open('TID_'+ str(fid) +'.txt','r')
done=0
while not done:
	aLine=thread_list_f.readline()
	if (aLine!=''):
		#print(int(aLine))
		TID_list.append(int(aLine))
	else:
		done =1
thread_list_f.close()		

j=0;
for i in TID_list:	
	Reply_func(255,i,str(context[j%9]).encode('gbk'))
	TID_list.remove(i)
	j=j+1
	if j==12:
		break
	else:
		#time.sleep(60)
		pass

the_rest_f=open('TheRestTID_'+ fid +'.txt','a')	
for j in TID_list:
	the_rest_f.write(str(j)+'\n')
the_rest_f.close()
