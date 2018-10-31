<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${board.idx }</td>
				<th scope="row">조회수</th>
				<td>${board.hit_cnt }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${board.crea_id }</td>
				<th scope="row">작성시간</th>
				<td>${board.crea_dtm }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${board.title }</td>
			</tr>
			<tr>
				<td colspan="4">${board.contents }</td>
			</tr>
		</tbody>
	</table>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openBoardUpdate();
			});
		});
	
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/boardList.do' />");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){ 
			var idx = "${board.idx}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/boardUpdate.do' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
	</script>
</body>
</html>