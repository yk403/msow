<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id='oMD5' scope='request' class='cn.mschn.bean.MD5'/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username = request.getParameter("username");
String password = request.getParameter("password");
String note = "";

if (request.getMethod().equals("POST") && username!=null && password!=null) {
	if (username!=null && password!=null) {
		if ("21232F297A57A5A743894A0E4A801FC3".equals(oMD5.getMD5ofStr(username)) && "202CB962AC59075B964B07152D234B70".equals(oMD5.getMD5ofStr(password))) {
			session.setAttribute("logined", "yes");
			session.setMaxInactiveInterval(1000);
      		response.sendRedirect("main.jsp");
		} else {
			note = "* 账号或密码有误！";
		}
	} else {
		note = "* 请填写账号和密码！";
	}
} 

%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <base href="<%=basePath%>">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="./static/img/index/favicon.ico">

    <title>民盛后台</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="./static/css/back/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./static/css/back/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./static/js/back/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <form class="form-signin" method="post">
        <h2 class="form-signin-heading">请输入账号和密码</h2>
        <label for="inputEmail" class="sr-only">账号</label>
        <input type="text" id="inputEmail" class="form-control" placeholder="账号" name="username" required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" id="inputPassword" class="form-control" name="password" placeholder="密码" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住我
          </label>
        </div>
        <p class="text-danger"><%= note %></p>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
      </form>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./static/js/back/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>