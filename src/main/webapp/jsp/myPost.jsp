<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>List</title>
    <script src="../js/jquery-1.12.4.js?v=1" type ="text/javascript"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
    <link rel="stylesheet" href="../css/blogList.css" />
	<script>
	function onsub(){
		form.submit();
	}	
	</script>

  </head>

<body>
    <div class="wrap">
      <%@ include file="header.jsp" %>

      <div class="section">
        <div class="container">
          <h1 style="margin-bottom:150px;">My Post</h1>
          <%@ include file="dbconn.jsp" %>
          
          <div class="content">
         	<table>
            <ul class="list">
            <%
            String  session_Name=(String)session.getAttribute("s_Name");
            %>
		    <%
		    	PreparedStatement pstmt=null;
		    	ResultSet rs=null;
		    	
		    	String sql=" select num, title, memo, name, to_char(time,'yyyy-MM-dd'), hit, filename, replace(replace(category,'카테고리1','여행'),'카테고리2','음식') from b_table where name=? order by num desc ";	
		
		      	try{    		
		      		pstmt=conn.prepareStatement(sql);
		      		pstmt.setString(1, session_Name);
		      		rs=pstmt.executeQuery();
		      		while(rs.next()){
		      			
		      			int num=rs.getInt(1);
						String title=rs.getString(2);
						String memo=rs.getString(3);
						String name=rs.getString(4);
						String time=rs.getString(5);
						int hit =rs.getInt(6);
						String filename=rs.getString(7);
						String category=rs.getString(8);
						
						
						String sub_memo=memo.substring(0,100);
						
		  	%>

	              <li style="display:none;" >
	                <a href="blogPage.jsp?num=<%=num %>">
	                  <img src="<%=request.getContextPath() %>/upload/<%=rs.getString("filename") %>" alt="" />
	                  <div class="list_text">
	                    <div class="category_day">
	                      <h2><%=category %></h2>
	                      <h2><i class="xi-eye"></i>&nbsp;<%=hit %>&nbsp;&nbsp;<%=name%>&nbsp;&nbsp;<%=time %></h2>
	                    </div>
	                    <h3><%=title %></h3>
	                    <p><%=sub_memo %>...</p>
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
            </table>
            <div class="btn_more">
              <button id="btn">더보기</button>
            </div>
          </div>
        </div>
      </div>
    </div>
	<script>
		$(".list").find("li").slice(0, 4).show();
	    $("#btn").click(function () {
	      $(".list").find("li:hidden").slice(0, 4).show();
	      if ($(".list").find("li:hidden").length <= 0) {
	        $("#btn").hide();
	      }
	    });
	
    </script>
  </body>
</html>