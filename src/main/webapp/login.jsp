<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>后台登录</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style3.css" tppabs="css/style.css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
</style>
<script src="js/jquery.js"></script>
<script src="js/verificationNumbers.js" tppabs="js/verificationNumbers.js"></script>
<script src="js/Particleground.js" tppabs="js/Particleground.js"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  //验证码
  createCode();
  //测试提交，对接程序删除即可
  $(".submit_btn").click(function(){
	  location.href="javascrpt:;"/*tpa=http://***index.html*/;
	  });
});
</script>
</head>
<body>
<dl class="admin_login" style="width:400px; border:1px solid #19a97b;">
 <dt>
  <strong>制造装备物联及生产管理系统</strong>
  <em>Management System</em>
 </dt>
 <form action="loginController/login.do" method="post">
 <dd class="user_icon" style="margin-top:20px;">
  <input type="text" placeholder="用户名" class="login_txtbx" name="username"/>
 </dd>
 <dd class="pwd_icon" style="margin-top:20px;">
  <input type="password" placeholder="密码" class="login_txtbx" name="password"/>
 </dd>
 <dd style="margin-top:20px;">
  <input type="submit" value="立即登陆" class="submit_btn"/>
 </dd>
  </form>
 <dd style="margin-top:20px;">
  <p>© DoremiTiny 版权所有</p>
 </dd>
</dl>
</body>
</html>