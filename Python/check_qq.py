import time,datetime
import urllib
def chk_qq(qqnum):
    chkurl = 'http://wpa.qq.com/pa?p=1:'+'qqnum'+':1'
    a = urllib.urlopen(chkurl)
    length=a.headers.get("content-length")
    a.close()
    print (datetime.datetime.now())
    if length=='2329':
        return 'Online'
    elif length=='2262':
        return 'Offline'
    else:
        return 'Unknown Status!'
 
qq = 290908182
stat = chk_qq(qq)
print ('qq' + ' is ' + stat)

