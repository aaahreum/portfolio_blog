<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String realFolder="C:\\portfolio\\portfolio_2\\src\\main\\webapp\\upload";
	String encType="utf-8";
	int maxSize=5*1024*1024;
	
	MultipartRequest multi=new MultipartRequest(request,realFolder,maxSize,encType,
			new DefaultFileRenamePolicy());
	
	String num = multi.getParameter("num");
	String title=multi.getParameter("title");
	String name=multi.getParameter("name");
	String memo=multi.getParameter("memo");
	String filename=multi.getFilesystemName("filename");
	System.out.println("filename :"+filename);
	String category=multi.getParameter("category");
	String sql="update b_table set name=?,title=?,memo=?, filename=?, category=? where num=?";
	try{
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(6, num);
		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, memo);
		pstmt.setString(4, filename);
		pstmt.setString(5, category);
		pstmt.executeUpdate();
		%>
		<script>
			alert("수정 완료");
			location.href="blogList.jsp";
		</script>
		<%
	}catch(Exception e){
		System.out.println("수정 실패");
		e.printStackTrace();
	}
%>
</body>
</html>