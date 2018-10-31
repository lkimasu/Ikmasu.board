<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<form id="frm">
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
					<td>
						${board.idx }
						<input type="hidden" id="idx" name="idx" value="${board.idx }">
					</td>
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
					<td colspan="3">
						<input type="text" id="title" name="title" class="wdp_90" value="${board.title }"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="contents" name="contents">${board.contents }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">저장하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
		});
		
		function fn_openBoardList(){ //목록으로
			
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/boardList.do' />");
			comSubmit.submit();
		}
		
		function fn_updateBoard(){ //수정
			
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/updateBoard.do' />");
			comSubmit.submit();
		}
		
		function fn_deleteBoard(){ //삭제
			
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/deleteBoard.do' />");
			comSubmit.addParam("idx", $("#idx").val());
			comSubmit.submit();
			
		}
	</script>
</body>
</html>