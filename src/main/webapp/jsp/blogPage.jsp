<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<link rel="stylesheet" href="../css/blogPage.css" />
<title>Page</title>
<style>
    	pre{
    		line-height:1.5;
    		font-family: "Noto Sans KR",  sans-serif;
    		white-space:pre-wrap;
    		word-break: break-all;
    		overflow:auto;
    		font-size:20px;
    	}
    	#pre{
    		min-height:574px;
			height:auto;
    		width:100%;
    	}
    	
    </style>
</head>
<body>
    <div class="wrap">
      <%@ include file="header.jsp" %>

      <div class="section">
        <div class="container">
          <div class="content">
          <%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String num = request.getParameter("num");
				String sql="select name,title,memo,to_char(time,'yyyy-MM-dd  HH24:MI:SS'), hit, filename, category from b_table where num=?";
				try{
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, num);
					rs=pstmt.executeQuery();
					if(rs.next()){					
						String name=rs.getString("name");
						String title=rs.getString("title");
						String memo=rs.getString("memo");
						String time=rs.getString(4);
						int hit=rs.getInt("hit");
						hit++;
						String filename=rs.getString("filename");
						String category=rs.getString("category");
				
			%>
            <a href="javascript:history.back();"><i class="xi-arrow-left" id="arrow"></i></a>
            <h2><%=category %></h2>
            <h1><span><%=title %></span></h1>
            <h3><%=time %>&nbsp;&nbsp;&nbsp;&nbsp;<%=name %>&nbsp;&nbsp;&nbsp;&nbsp;<i class="xi-eye-o"></i><%=hit %></h3>
            <div class="post_image">
              <img src="<%=request.getContextPath() %>/upload/<%=rs.getString("filename") %>" alt="" />
            </div>
            <div id="pre">
            	<pre><%=memo %></pre>
			</div>
			
			 <%
			 checkName="";
			 checkName=(String)session.getAttribute("s_Name");
			
				if(checkName==null || !checkName.equals(name)){%>
				<div class="btn2">
              	
            </div>  
            <%}else{ %>
                <div class="btn">
					<a href="blogUpdate.jsp?num=<%=num%>">수정</a>
             		<a href="blogDeleteProcess.jsp?num=<%=num%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a>
                </div>
            <%}%>
            <%	sql="update b_table set hit=hit+1 where num=?";

				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.executeUpdate();
				
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}	
			 %>
            	
          </div>
        </div>
      </div>
    </div>
  </body>
</html>