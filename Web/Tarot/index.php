<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>��ӭ������������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="mm_lodging1.css" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {font-family: Vrinda}
.STYLE4 {font-size: larger}
.STYLE6 {
	color: #990000;
	font-size: large;
}
.STYLE7 {
	font-size: 14px;
	color: #990000;
}
-->
</style>
</head>
<body bgcolor="#999966">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td width="15" nowrap="nowrap"><img src="/image/mm_spacer.gif" alt="" width="15" height="1" border="0" /></td>
	<td height="60" colspan="3" nowrap="nowrap" class="logo STYLE1">��������</td>
	<td width="40">&nbsp;</td>
	<td width="100%">&nbsp;</td>
	</tr>

	<tr bgcolor="#ffffff">
	<td colspan="6"><img src="/image/mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
	</tr>

	<tr bgcolor="#a4c2c2">
	<td width="15" nowrap="nowrap">&nbsp;</td>
	<td height="36" colspan="3" id="navigation" class="navText"><span class="sidebarText STYLE4"><a href="about.php">��������</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="aoyi.php">���ް���</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="yiwen.php">��������</a>&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp; <a href="liuyan.php">��Ҫ����</a>&nbsp;&nbsp;&nbsp;&nbsp;<strong> </strong><a href="bbs.php">��̳</a>&nbsp;&nbsp;&nbsp;&nbsp;<strong> </strong><a href="yuce.php">��ҪԤ�� </a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.php">������ҳ</a> </a></span>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $showtime=date("Y-m-d H:i",time()+3600*8);?></td>
	<td width="40">&nbsp;</td>
	<td width="100%">&nbsp;</td>
	</tr>

	<tr bgcolor="#ffffff">
	<td colspan="6"><img src="/image/mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
	</tr>

	<tr bgcolor="#ffffff">
	<td width="230" colspan="2" valign="top" bgcolor="#a4c2c2">&nbsp;<img src="/image/shalou.JPG.jpg" alt="Home Page Image" width="227" height="196" border="0" />
	<table border="0" cellspacing="0" cellpadding="0" width="230">
		<tr>
		<td width="15">&nbsp;</td>
		<td width="200" class="sidebarText" id="padding"><p>ʱ����ɳ�������Ƕ�ס���˵��ʺ�<br />
		  &nbsp;</p>
		  <p>&nbsp;</p>
		  <p>&nbsp;</p>
		  <?php                             //��ÿͻ��˵��������IP������ϵͳ��Ϣ
           class clientGetObj
          {
           function getBrowse()
          {
            global $_SERVER;
            $Agent = $_SERVER['HTTP_USER_AGENT'];
            $browser = '';
            $browserver = '';
            $Browser = array('Lynx', 'MOSAIC', 'AOL', 'Opera', 'JAVA', 'MacWeb', 'WebExplorer', 'OmniWeb');
             for($i = 0; $i <= 7; $i ++)
			 {
              if(strpos($Agent, $Browsers[$i]))
			   {
               $browser = $Browsers[$i];
               $browserver = '';
               }
              }
            if(ereg('Mozilla', $Agent) && !ereg('MSIE', $Agent))
			 {
             $temp = explode('(', $Agent);
             $Part = $temp[0];
             $temp = explode('/', $Part);
             $browserver = $temp[1];
             $temp = explode(' ', $browserver);
             $browserver = $temp[0];
             $browserver = preg_replace('/([d.]+)/', '1', $browserver);
             $browserver = $browserver;
             $browser = 'Netscape Navigator';
             }
			 if(ereg('Mozilla', $Agent) && ereg('Opera', $Agent)) 
			 {
			 $temp = explode('(', $Agent);
			 $Part = $temp[1];
			 $temp = explode(')', $Part);
			 $browserver = $temp[1];
			 $temp = explode(' ', $browserver);
			 $browserver = $temp[2];
  			 $browserver = preg_replace('/([d.]+)/', '1', $browserver);
			 $browserver = $browserver;
			 $browser = 'Opera';
             }
			 if(ereg('Mozilla', $Agent) && ereg('MSIE', $Agent))
			{
			$temp = explode('(', $Agent);
			$Part = $temp[1];
			$temp = explode(';', $Part);
			$Part = $temp[1];
			$temp = explode(' ', $Part);
			$browserver = $temp[2];
			$browserver = preg_replace('/([d.]+)/','1',$browserver);
			$browserver = $browserver;
			$browser = 'Internet Explorer';
			}
			if($browser != '')
		   {
			$browseinfo = $browser.' '.$browserver;
            } else 
		   {
			$browseinfo = false;
           }
			return $browseinfo;
         }
 
			function getIP ()
 		{
             global $_SERVER;
			 if (getenv('HTTP_CLIENT_IP')) 
			 {
			  $ip = getenv('HTTP_CLIENT_IP');
             } 
			 else if (getenv('HTTP_X_FORWARDED_FOR')) 
			 {
			  $ip = getenv('HTTP_X_FORWARDED_FOR');
			 } else if (getenv('REMOTE_ADDR')) 
			 {
			  $ip = getenv('REMOTE_ADDR');
			 } else 
			 {
             $ip = $_SERVER['REMOTE_ADDR'];
			 }
			return $ip;
         }
 
			function getOS ()
		{
			global $_SERVER;
			$agent = $_SERVER['HTTP_USER_AGENT'];
			$os = false;
			 if (eregi('win', $agent) && strpos($agent, '95'))
			 {
			  $os = 'Windows 95';
             }else if (eregi('win 9x', $agent) && strpos($agent, '4.90'))
			 {
			  $os = 'Windows ME';
		     }else if (eregi('win', $agent) && ereg('98', $agent))
			 {
              $os = 'Windows 98';
              }else if (eregi('win', $agent) && eregi('nt 5.1', $agent))
			 {
              $os = 'Windows XP';
             }else if (eregi('win', $agent) && eregi('nt 5', $agent))
			 {
			 $os = 'Windows 2000';
			 }else if (eregi('win', $agent) && eregi('nt', $agent))
			 {
             $os = 'Windows NT';
			 }else if (eregi('win', $agent) && ereg('32', $agent))
			 {
			 $os = 'Windows 32';
			 }else if (eregi('linux', $agent))
			 {
			 $os = 'Linux';
			  }else if (eregi('unix', $agent))
			 {
             $os = 'Unix';
             }else if (eregi('sun', $agent) && eregi('os', $agent))
			 {
			 $os = 'SunOS';
			 }else if (eregi('ibm', $agent) && eregi('os', $agent))
			 {
             $os = 'IBM OS/2';
             }else if (eregi('Mac', $agent) && eregi('PC', $agent))
			 {
			 $os = 'Macintosh';
			 }else if (eregi('PowerPC', $agent))
			 {
             $os = 'PowerPC';
              }else if (eregi('AIX', $agent))
			 {
              $os = 'AIX';
              }
              else if (eregi('HPUX', $agent)){
              $os = 'HPUX';
              }
              else if (eregi('NetBSD', $agent)){
              $os = 'NetBSD';
              }
              else if (eregi('BSD', $agent))
			  {
              $os = 'BSD';
              }
              else if (ereg('OSF1', $agent))
			  {
              $os = 'OSF1';
              }
              else if (ereg('IRIX', $agent))
			  {
              $os = 'IRIX';
              }
              else if (eregi('FreeBSD', $agent))
			  {
              $os = 'FreeBSD';
              }
              else if (eregi('teleport', $agent))
			  {
              $os = 'teleport';
              }
              else if (eregi('flashget', $agent))
			  {
              $os = 'flashget';
              }
              else if (eregi('webzip', $agent))
			  {
              $os = 'webzip';
              }
              else if (eregi('offline', $agent))
			  {
              $os = 'offline';
              }
              else {
              $os = 'Unknown';
              }
return $os;
}
 
}?>

		  <?php $countfile="counter.txt";//�򵥵���վ������
            if(($fp=fopen($countfile,"r+"))==false)
            {
             printf("Open file %s failed!",$countfile);
             exit;
             }
             else
            {
            $count=fread($fp,2);
            $count+=1;
            fclose($fp);
            $fp=fopen($countfile,"w+");
            fwrite($fp,$count);
            fclose($fp);
            }
            ?>
		  <p><span class="STYLE7">���ǵ� <?php echo $count?> λ����</span></p>
		  <p><?php
           $code = new clientGetObj;
           $str1 = $code->getBrowse();//�������
           $str2 = $code->getIP();//IP��ַ��
           $str3 = $code->getOS();//����ϵͳ��
            echo "�����������:<br>".$str1."<br>����ϵͳ:<br>".$str3."<br>IP��ַ:<br>".$str2;
			$come_from_file="source.txt";//ͳ�Ʒÿ���Դ
            if(($fp=fopen($come_from_file,"r+"))==false)
            {
             printf("Open file %s failed!",$come_from_file);
             exit;
             }
             else
            {
            $fp=fopen($come_from_file,"a+");
            fwrite($fp,$str2);
            fclose($fp);
            }
           ?>&nbsp;</p>
		  <p><br />		
	      </p></td>
		<td width="15">&nbsp;</td>
		</tr>
	</table>	</td>
	<td width="50" valign="top"><img src="/image/mm_spacer.gif" alt="" width="50" height="1" border="0" /></td>
	<td width="440" valign="top"><br />
	<br />
	<table border="0" cellspacing="0" cellpadding="0" width="440">
		<tr>
		<td class="pageName"><p><img src="/image/god.jpg" width="130" height="150" />��ӭ������������</p></td>
		</tr>

		<tr>
		<td class="bodyText">
		<p>������һ�ֹ��ϵ�֪ʶϵͳ��������ѧУ�д��ڳ��Ｘ�����͡�����������ͼ���ı��֣����ų����˰��ء�ÿһ���ƶ�����������ʹ�����ṩ������</p>

		<p>������һ��·�꣬�����������������ľ��ѡ���������������ָ�ϣ���ʾ�����ص�ѶϢ����չ�����Ұ�����ǿ��԰����޵���һ�ֵ�ͼ���÷��Ż�ɣ�ָʾ���ĵ�·�ϵĸ��ֱ�־����ȷʹ�����ޣ����ǽ����κ�δ֪״�������ڰ��ض����µ���ʶ�����������ص������������������ѧ�ߴӲ�ͬ�Ƕ���������Ρ������ձ���Ϊ������������ÿ���������������������������������Ǹ���������ʶ�Լ�����ʶ���ˣ���ʶ���ˡ�ʵ���ϣ�����������ʲô�������󣬶����Դ������еõ�������ʾ���޲��İ���ÿ���ˣ������������޵��������ڡ�</p>
		<p>��׼�����������ھ� <span class="STYLE6"><a href="about.php">������￪ʼ���ߵ����аɣ�</a></span></p>
		<br />		</td>
		</tr>
	</table>	</td>
	<td width="40">&nbsp;</td>
	<td width="100%">&nbsp;</td>
	</tr>

	<tr bgcolor="#ffffff">
	<td colspan="6"><img src="/image/mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
	</tr>

	<tr>
	<td width="15">&nbsp;</td>
	<td width="215">&nbsp;</td>
	<td width="50">&nbsp;</td>
	<td width="440">&nbsp;</td>
	<td width="40">&nbsp;</td>
	<td width="100%">&nbsp;</td>
	</tr>
</table>
</body>
</html>
