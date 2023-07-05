<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<link rel="stylesheet" href="../css/login.css" />
<title>Login</title>
</head>
 <body>
    <div class="wrap">
      <%@ include file="header.jsp" %>

      <div class="section">
        <form name="form" method="post" action="loginProcess.jsp">
        <div class="container">
        <div class="dimm"></div>
          <div class="content">
          <a href="javascript:history.back();"><i class="xi-close"></i></a>
            <h2>로그인</h2>
            <input type="text" name="id" placeholder="아이디를 입력하세요." id="login_id" autofocus />
            <input type="password" name="password" placeholder="비밀번호를 입력하세요." id="login_pass" />
            <button id="login_btn">로그인</button>
            <p>
              아직 회원이 아니세요? <span><a href="join.jsp">회원가입</a></span>
            </p>
          </div>
        </div>
      </form>
      </div>
    </div>
  </body>
</html>