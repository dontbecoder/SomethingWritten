
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<!-- TemplateBeginEditable name="doctitle" -->
<title>��ӭ������������</title>
<!-- TemplateEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="mm_lodging1.css" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {font-family: Vrinda}
.STYLE4 {font-size: larger}
.STYLE8 {font-size: 16px}
-->
</style>
<!-- TemplateBeginEditable name="head" --><!-- TemplateEndEditable -->
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
      &nbsp;&nbsp;&nbsp; <a href="liuyan.php">��Ҫ����</a>&nbsp;&nbsp;&nbsp;&nbsp;<strong> </strong><a href="bbs.php">��̳</a>&nbsp;&nbsp;&nbsp;&nbsp;<strong> </strong><a href="yuce.php">��ҪԤ�� </a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.php">������ҳ</a> </a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $showtime=date("Y-m-d H:i",time()+3600*8);?></td>
	<td width="40">&nbsp;</td>
	<td width="100%">&nbsp;</td>
	</tr>

	<tr bgcolor="#ffffff">
	<td colspan="6"><img src="/image/mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
	</tr>

	<tr bgcolor="#ffffff">
	<td width="230" colspan="2" valign="top" bgcolor="#a4c2c2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/image/bobo.jpg" alt="Home Page Image" width="139" height="137" border="0" />
	  <table border="0" cellspacing="0" cellpadding="0" width="230">
		<tr>
		<td width="15">&nbsp;</td>
		<td width="205" class="sidebarText" id="padding">���Ľ��������Ƕ����ǵ�����֧��<br />
		&nbsp;<br />		</td>
		<td width="10">&nbsp;</td>
		</tr>
	</table>	</td>
	<td width="50" valign="top"><img src="/image/mm_spacer.gif" alt="" width="50" height="1" border="0" /></td>
	<td width="440" valign="top"><br />
	<br />
	<table border="0" cellspacing="0" cellpadding="0" width="440">
		<tr>
		  <td class="pageName STYLE8"><p><a href="showliuyan.php">�鿴��������</a></p>
	      <p>&nbsp;</p>
		  <?php

$db=new mysqli("localhost","user2","user2","liuyan");
if(mysqli_connect_errno())
	{
		echo"�������ݿ�ʧ��!<br>";
		echo mysqli_connect_error();
		exit;
	}
	//else echo "�������ݿ�ɹ�!<br>";
	
	$sql="select * from gsbook order by ctime desc limit 20";
	$rs=$db->query($sql);
	if(!$rs)
	{
	$db->close();
	echo"query ʧ�ܣ�<br>";
	exit;	
	}
    if(!$rs->num_rows)
	echo"Ŀǰû�����ԡ�";
	while($row= $rs->fetch_assoc())
	{
		echo "<table><tr><td>�ǳ�:<font color='red'>".$row['name']."</font></td></tr>";
		echo "<tr><td>ʱ�䣺".$row['ctime']."</tr></td>";
		echo "<tr><td>����:".$row['note']."</td></tr></table>";
		echo "------------------------------------------------";
	}
	
	$db->close();
?>
	      <p>&nbsp;</p>
	      </td>
		</tr>

		<tr>
		<td class="bodyText"><form action="liuyan.php",method="post">
	<p><span class="STYLE8">�����������ǳ�</span>��
	  <input name="nickname" type="text" size="20" maxlength="20">
	  </p>
	<p><br>
	  <span class="STYLE8">������: </span>
	  <textarea name="note" cols="50" rows="10"></textarea>
	  <br>
	    <input type="submit"value="ȷ��"> 
	    <label>
	    <input type="reset" name="Submit" value="����" />
	    </label>
	</p>
		</form></td>
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
