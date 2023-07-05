<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<link rel="stylesheet" href="../css/blogInsert.css" />
<title>Update</title>
<script>
		function check(){
			form.submit();
		}
	</script>
</head>
  <body>
    <div class="wrap">
      <%@ include file="header.jsp" %>

      <div class="section">
        <div class="container">
          <h3>수정</h3>
          <div class="content">
          <%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String num = request.getParameter("num");
				String sql="select name,title,memo,to_char(time,'yyyy-MM-dd'), hit, filename,category from b_table where num=?";
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
						System.out.println("filename100 :"+filename);
						String category=rs.getString("category");
				
			%>
            <form name="form" method="post"  enctype="multipart/form-data" action="blogUpdateProcess.jsp?num=<%=num%>">
              <table>
              	<tr style="display: none;">
                  <td><input type="text" name="name" value="<%=checkName%>"></td>
                </tr>
                <tr id="tr1">
                  <td id="td1">
                    <input id="in1" type="radio" name="category" value="카테고리1" <%=category.equals("카테고리1")? "checked" : ""%>/>&nbsp;카테고리1&nbsp;&nbsp;
                    <input id="in1" type="radio" name="category" value="카테고리2" <%=category.equals("카테고리2")? "checked" : ""%>/>&nbsp;카테고리2
                  </td>
                </tr>
                <tr>
                  <td id="td2"><input id="in2" type="text" name="title" value="<%=title %>" placeholder="제목을 입력하세요." /></td>
                </tr>
                <tr>
                  <td id="td3"><textarea name="memo" id="" cols="140" rows="50" placeholder="내용을 입력하세요."><%=memo %></textarea></td>
                </tr>
                <tr>
                  <td id="td4">
                    <%
					if(filename!=null){%>
						<%=filename %> 
					<%}%>
                    <span id="fileName"><label class="btn_file" for="btn_file">파일선택</label></span>&nbsp;
                    <input type="file" name="filename" value="<%=filename %>" accept="image/gif, image/jpeg, image/png" id="btn_file" onchange="loadFile(this)"/>
                  </td>
                </tr>
                <%
						}
					}catch(Exception e){
						e.printStackTrace();
					}	
				 %>
              </table>
	          <div class="btn">
	            <button type="button" id="btn2" onclick="check()">수정</button>
	            <button type="reset" id="btn2" onclick="location.href='javascript:history.back();'">취소</button>
	          </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>

	<script>
	  	function loadFile(input){
	  		var file = input.files[0];
	  		
	  		var name = document.getElementById('fileName');
	  	    name.textContent = file.name;
	  	};
	  	

	  </script>

</html>