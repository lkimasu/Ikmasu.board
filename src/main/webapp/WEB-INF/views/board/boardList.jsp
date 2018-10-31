<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<h2>게시판 목록</h2>
	<table class="board_list">
	<colgroup>
			<col width="15%"/>
			<col width="25%"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="15%"/>
		</colgroup>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody id="test">
		</tbody>
</table>
<br/>
<center><div class="page" id="page" ></div></center>
	<a href="#this" class="btn" id="write">글쓰기</a>
	
<form name="searchForm"  id="searchForm">
<center>
제목 : <input type="text" id="searchWord" name="searchWord"/>
<input type="button" id="searchButton" value="검색"/></center>
</form>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		list(1); //맨 처음 검색 할 경우
		
		$(document).ready(function(){
	
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault(); //이벤트가 취소될 경우 전파되지 않고 취소..
				fn_openBoardWrite();
			});
			$("#searchButton").on("click",function(e){ //검색 버튼
				e.preventDefault();
				go_Page();
			});
		});
		
		function fn_openBoardWrite(){ //글쓰기
			location.href="/board/boardwrite.do";
		}
		
		 function fn_openBoardDetail(obj){
			location.href = "/board/boardDetail.do?IDX="+obj;
		}  
		 
		function list(page){
			$("#page").val(page); //val(page)에 있는 값을 #page에 넣음
			go_Page();
		}

		function go_Page(){
			
		 $.ajax({
			type : "POST",
			url : "../board/boardList2.do",
			dataType: "json",
			data :{
				 
				curPage : $("#page").val(), //page안에 있는 값을 가져옴
				searchWord : $("#searchWord").val() //입력한 검색어
			},
			success:function(data){
				 var val=$("#test");
				 var val2 =$("#page");
				 var str ="";
				 var preStr="";
				 var poStr="";
				 
				 val.empty();
				 val2.empty();
				 
				$.each(data.list, function(index, value) {
					val += "<tr><td>" + value.IDX + "</td>" + "<td class='title'><a href='#none' onclick='fn_openBoardDetail("+value.IDX+")'>" +   value.TITLE  + "</a></td>" + "<td>" + value.CREA_ID 
					+ "</td>"+ "<td>" + value.HIT_CNT + "</td>" + "<td>" + value.CREA_DTM + "</td></tr>";
				});
				
				if(data.boardPager.blockEnd > 5 ){
					preStr += "<a href='#' onclick='list(1)'>[처음]</a>"
					+"<a href='#' onclick='list("+data.boardPager.prevPage+")'>[이전]</a>"
				}
				else if(data.boardPager.blockEnd >= 1){
					preStr += "<a href='#' onclick='list(1)'>[처음]</a>";
				}
				
				 for(var i=data.boardPager.blockBegin; i<=data.boardPager.blockEnd; i++){
					 
					if(i != data.boardPager.curPage){
						str += "<a href='#' onclick='list("+i+")'>["+i+"]</a>";
					}
					 else{
						str +="<b><a href='#' onclick='list("+i+")'>["+i+"]</a></b>";
					} 
				 }
				 
				 if(data.boardPager.blockEnd >5){
					 poStr += "<a href='#' onclick='list("+data.boardPager.nextPage+")'>[다음]</a>";
				 }
				
				$("#test").append(val);
		        $("#page").append(preStr + str +poStr);
			},
		});
		}
		</script>
</body>
</html>