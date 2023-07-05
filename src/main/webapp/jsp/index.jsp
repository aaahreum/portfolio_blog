<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<link rel="stylesheet" href="../css/index.css?after" />
<title>Home</title>
</head>
<body>
    <div class="wrap">
      <%@ include file="header.jsp" %>

      <div class="intro">
        <div class="container">
          <h1>BLOG</h1>
          <p>여행, 음식, 그리고 기록들.</p>
        </div>
      </div>

      <div class="main">
        <div class="container">
        <%@ include file="dbconn.jsp"%>
        <%
        	PreparedStatement pstmt=null;
          	ResultSet rs=null;

		    	
		    
				String sql="select num,title,name,to_char(time,'yyyy/MM/dd'),hit, memo, filename from (select num,title,name,time,hit, memo, filename from b_table order by hit desc) where rownum <= 1 ";
		      	try{
		      		
		      		pstmt=conn.prepareStatement(sql);
		      		rs=pstmt.executeQuery();
		      		while(rs.next()){
		      			
		      			int num=rs.getInt(1);
		      			String title=rs.getString(2);
		      			String name=rs.getString(3);
		      			String time=rs.getString(4);
		      			String hit=rs.getString(5);
		      			String memo=rs.getString(6);
		      			String filename=rs.getString(7);
		      			
		      			String sub_memo=memo.substring(0,300);
		      			
		      			%>
		      			<a href="blogPage.jsp?num=<%=num %>">
          <div class="hot">
            <div class="main_image">
              <img src="<%=request.getContextPath() %>/upload/<%=rs.getString("filename") %>" alt="" />
            </div>
            <h2><%=title %></h2>
            <h3><%=time %> &nbsp;&nbsp; <%=name %> &nbsp;&nbsp; <i class="xi-eye"></i>&nbsp;<%=hit %>&nbsp;&nbsp; <i class="xi-thumbs-up"></i></h3>
            <p>
              <%=sub_memo %>...
            </p>
          </div>
          <%
		      		}
				}catch(Exception e){
				     e.printStackTrace();
				}
		      %> 
		     </a>
        </div>
      </div>

      <div class="content">
        <div class="container">
          <div class="title_box">
            <div class="title">
              <h1>New Post</h1>
            </div>
            <div class="all"><a href="blogList.jsp">전체보기</a></div>
          </div>
          
          <ul class="list">
          <%
         	 pstmt=null;
          	 rs=null;

		    	
          		sql=" select num,title,name,to_char(time,'yyyy/MM/dd'),hit, memo, filename from b_table  where rownum <=3 order by num desc";

		      	try{
		      		
		      		pstmt=conn.prepareStatement(sql);
		      		rs=pstmt.executeQuery();
		      		while(rs.next()){
		      			
		      			int num=rs.getInt("num");
		      			String title=rs.getString("title");
		      			String name=rs.getString("name");
		      			String time=rs.getString(4);
		      			String memo=rs.getString("memo");
		      			String filename=rs.getString("filename");
		      			
		      			String sub_memo=memo.substring(0,200);
		  	%>
	            <li class="new">
            		<a href="blogPage.jsp?num=<%=num %>">
		              <img src="<%=request.getContextPath() %>/upload/<%=rs.getString("filename") %>" alt="" />
		              <div class="list_text">
		                <h2><%=title %></h2>
		                <h3><%=time %> &nbsp;&nbsp; <%=name %></h3>
		                <p>
		                 <%=sub_memo %>...
		                </p>
		              </div>
              		</a>
	            </li>
          <%
		      		}
				}catch(Exception e){
				     e.printStackTrace();
				}
		      %> 
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>