<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
<%
	String checkName="";
	checkName=(String)session.getAttribute("s_Name");
	if(checkName==null){%>
	<div class="header">
        <div class="container">
          <div class="logo">Travelog</div>
          <ul class="gnb">
            <li>
              <a href="index.jsp">HOME</a>
            </li>
            <li>
              <a href="blogList.jsp">BLOG</a>
            </li>
            <li>
              <a href="login.jsp">LOGIN</a>
            </li>
          </ul>
        </div>
      </div>
      
           <%}else{
		session.setMaxInactiveInterval(1000);//세션 유지시간
		%>
	
		<div class="header">
	        <div class="container">
	          <div class="logo">Travelog</div>
	          <ul class="gnb">
	            <li>
	              <a href="index.jsp">HOME</a>
	            </li>
	            <li>
	              <a href="blogList.jsp">BLOG</a>
	            </li>
	            <li>
	              <a href="blogInsert.jsp">WRITE</a>
	            </li>
	            <li>
	              <a href="myPost.jsp">MY POST</a>
	            </li>
	            <li>
	              <a href="logout.jsp">LOGOUT</a>
	            </li>
	          </ul>
	        </div>
	      </div>	
			<%}
%>
</body>
</html>