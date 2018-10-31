<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<form id="frm" name="frm">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="title" name="title" class="wdp_90"></input></td>
				</tr>
				<tr>
					<th scope="row">아이디</th>
					<td><input type="text" id="crea_id" name="crea_id" class="wdp_90"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="contents" name="contents"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>	
	
		<a href="#this" class="btn" id="write">작성하기</a>
		<a href="/board/boardList.do" class="btn" id="list">목록으로</a>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	
		$(document).ready(function(){
		
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_insertBoard();
			});
		});
	
		function fn_insertBoard(){ //입력
			
			var frm = $("#frm").serialize();
		
			  if($("#title").val()==""){
					alert("제목을 입력해주세요");
					return false;
				}
				if($("#crea_id").val()==""){
					alert("아이디를 입력해주세요");
					return false;
				}
				if($("#contents").val()==""){
					alert("내용을 입력해주세요");
					return false;
				} 
				
				
				 $.ajax({
						url : "/board/insertBoard.do",
						type : "POST",
						data : frm,
						success : function(data){
							alert("입력되었습니다.");
							location.href="/board/boardList.do";
						}
					});
		}
	
	</script>
</body>
</html>