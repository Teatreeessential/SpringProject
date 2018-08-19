<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css">    
<script src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		var bno = 3;
		
		function getAllList(){
			$.("#replies").on('click',".replyLi button",function(){
				var reply = $(this).parent();
				var rno = reply.attr("data-rno");
				var replytext = reply.text();
				
				alert()
			
			})
			
			$.getJSON("/replies/all/"+bno,function(data){
				var str="";
				$(data).each(
					function(){
					str += "<li data-rno='"+this.rno+"' class='replyLi'>"
						+ this.rno+ ":" + this.replytext
						+"<button>MOD</button>"
						+"</li>";
					
				})
				$("#replies").html(str);
			})
		}
		
		$("#replyAddBtn").on('click',function(){
			let replyer = $("#newReplyWriter").val();
			let replytext =$("#newReplyText").val();
			
			$.ajax({
				type:'post',
				url:'/replies',
				headers :{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType: 'text',
				data: JSON.stringify({
					bno : bno,
					replyer : replyer,
					replytext : replytext
				}),
				success : function(result){
					if(result=='SUCCESS'){
						alert('등록되었습니다.');
						getAllList();
					};
				}
				
			})
		})
		
		
	})
</script>
<style type="text/css">
 	#modDiv
</style>
<body>
<%@include file="../include/header.jsp" %>
<h1>댓글 테스트</h1>
<div>
	<div>
		replyer <input type="text" name="replyer" id="newReplyWriter">
	</div>
	<div>
		replytext <input type="text" name="replytext" id="newReplyText">
	</div>	
	<button id="replyAddBtn">ADD REPLY</button>
</div>
<ul id="replies">
<!-- 댓글 달리는 곳  -->
</ul>
<div id="modDiv" style="display: none;">
	<div class='modal-title'></div>
	<div>
		<input type='text' id='replytext'/>
	</div>
	<div>
		<button type="button" id="reply_modify">modify</button>
		<button type="button" id="reply_delete">delete</button>
		<button type="button" id="modal_close">close</button>
		
	</div>
</div>
</body>
</html>