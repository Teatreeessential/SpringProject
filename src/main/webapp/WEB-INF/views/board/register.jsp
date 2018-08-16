<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../include/header.jsp" %>
<form role="form" method="post">
  <div class="form-group">
    <label for="exampleFormControlInput1">title</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목" name="title">
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">content</label>
    <textarea class="form-control" rows="3" placeholder="내용" name="content"></textarea>
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect2">writer</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="글쓴이" name="writer">
  </div>
  <div class="box-footer">
  	<button type="submit" class="btn btn-primary">submit</button>
  </div>
</form>
</body>
</html>