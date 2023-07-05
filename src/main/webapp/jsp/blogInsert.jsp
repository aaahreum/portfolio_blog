<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<link rel="stylesheet" href="../css/blogInsert.css" />
<title>Write</title>
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
          <h3>작성</h3>
          <div class="content">
            <form name="form" method="post" enctype="multipart/form-data" action="blogInsertProcess.jsp">
              <table>
              <%
				checkName="";
				checkName=(String)session.getAttribute("s_Name");%>
              	<tr style="display: none;">
                  <td><input type="text" name="name" value="<%=checkName%>"></td>
                </tr>
                <tr id="tr1">
                  <td id="td1">
                    <input id="in1" type="radio" name="category" value="카테고리1" />&nbsp;여행&nbsp;&nbsp;
                    <input id="in1" type="radio" name="category" value="카테고리2" />&nbsp;음식
                  </td>
                </tr>
                <tr>
                  <td id="td2"><input id="in2" type="text" name="title" placeholder="제목을 입력하세요." /></td>
                </tr>
                <tr>
                  <td id="td3"><textarea name="memo" id="" cols="140" rows="50" placeholder="내용을 입력하세요."></textarea></td>
                </tr>
                <tr>
                  <td id="td4">
                    <span id="fileName"><label class="btn_file" for="btn_file">파일선택</label></span>&nbsp;
                    <input type="file" name="filename" accept="image/gif, image/jpeg, image/png" id="btn_file" onchange="loadFile(this)" />
                  </td>
                </tr>
              </table>
            </form>
          </div>
          <div class="btn">
            <button type="button" id="btn2" onclick="check()">등록</button>
            <button type="reset" id="btn2" onclick="location.href='javascript:history.back();'">취소</button>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script>
    function loadFile(input) {
      var file = input.files[0];

      var name = document.getElementById("fileName");
      name.textContent = file.name;
    }
  </script>
</html>