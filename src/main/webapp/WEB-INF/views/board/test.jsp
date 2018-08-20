<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">    
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
		//댓글 페이징
		function printpaging(start_page,end_page,max_page,current_page){
			let str = "";
			if(max_page < end_page){
				//max_page 까지 for문 돌려서 보여줌 그리고 화살표는 max_page일때 disable로 1일때 disable
				for(let i = start_page; i<=max_page; i++){
					let strClass = current_page == i? 'class=active':'';
					str += "<li"+strClass+"><a href='"+i+"'>"+i+"</a></li>";
				}
				
			}else{
				//end_page까지 for문돌려서 보여준다.화살표는 able로 disable
				for(let i = start_page; i<=end_page; i++){
					let strClass = current_page == i? 'class=active':'';
					str += "<li"+strClass+"><a href='"+i+"'>"+i+"</a></li>";
				}
			}
			$('.pagenation').html(str);
		}
		//페이징된 번호 클릭시
		$('.pagenation').on('click',"li a",function(){
			event.preventDefault();
			let page=$(this).attr("href")
			getpageList(page);
		})
		
		//모든 댓글 조회
		function getpageList(page){
			$.getJSON("/replies/"+bno+"/"+page,function(data){
				var str="";
				$(data.list).each(
					function(){
					str += "<li data-rno='"+this.rno+"' class='replyLi'>"
						+ this.rno+ ":" + this.replytext
						+"<button>MOD</button>"
						+"</li>";
					
				})
				$("#replies").html(str);
				printpaging(data.start_page,data.end_page,data.max_page,data.page);
			})
		}
		//댓글 버튼 활성화
		$("#replies").on('click',".replyLi button",function(){
			var reply = $(this).parent();
			var rno = reply.attr("data-rno");
			var replytext = reply.text();
			$(".modal-title").html(rno);
			$("#replytext").val(replytext);
			$("#modDiv").show("slow");
		
		
		})
		//등록
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
						getpageList(1);
					};
				}
				
			})
		})
		//삭제
		$("#reply_delete").on('click',function(){
			let rno = $(".modal-title").html(); 
			$.ajax({
				type:'delete',
				url:'/replies/'+rno,
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType:'text',
				success: function(result){
					if(result == "SUCCESS"){
						alert("삭제 되었습니다.")
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
				
			});
		});
		//수정작업
		$("#reply_modify").on('click',function(){
			let rno = $(".modal-title").html();
			let replytext = $("#replytext").val();
			
			$.ajax({
				type:'patch',
				url:'/replies/'+rno,
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"PATCH"},				
				data:JSON.stringify({replytext:replytext}),
				dataType:'text',
				success:function(result){
					if(result=='SUCCESS'){
						alert("수정 되었습니다.");
						$('#modDiv').hide("slow");
						
					}
				}
			})
			
		})
		
	})
</script>
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

<!-- 페이지 표시 -->
<div class="pagenation">
</div>

<div class="modal" tabindex="-1" role="dialog" id="modDiv" style="display: none;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<input type='text' id='replytext'/>
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-primary" id="reply_modify">modify</button>
		<button type="button" class="btn btn-success" id="reply_delete">delete</button>
		<button type="button" class="btn btn-cancel"  id="modal_close">close</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>