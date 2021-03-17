<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 1. 27.  이경륜      최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<c:set var="pagingVO" value="${paginationInfo.pagingVO }"/>
<div style="float:right">
	<input type="button" value="등록" id="insertBtn" class="btn btn-primary"/>
</div>
<table class="table">
	<colgroup>
		<col style="width: 10%">
		<col style="width: 45%">
		<col style="width: 15%">
		<col style="width: 20%">
		<col style="width: 10%">
	</colgroup>
	<thead class="thead-light">
  		<tr class="text-center">
  			<th class="text-center">No</th>
  			<th class="text-center">제목</th>
  			<th class="text-center">작성자</th>
  			<th class="text-center">작성일</th>
  			<th class="text-center">조회수</th>
  		</tr>
	</thead>
	<tbody id="listBody">
		<c:set var="boardList" value="${pagingVO.dataList }" />
		<c:if test="${not empty boardList }" >
			<c:forEach items="${boardList }" var="board" varStatus="vs">
				<tr>
		  			<td class="text-center">${board.boNo }</td>
		  			<c:url value="/resident/space/boardView.do?boNo=${board.boNo }" var="viewURL" />
		  			<td><a href="${board.boDelete ne 'Y' ? viewURL : '#' }">${board.boTitle } [${board.repCnt}]</a></td>
		  			<td class="text-center">${board.boWriter }</td>
		  			<td class="text-center">${board.boDate }</td>
		  			<td class="text-center">${board.boHit }</td>
		  		</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty boardList }">
			<tr>
				<td colspan="6">게시글이 없습니다.</td>
			</tr>
		</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="6">
				<!-- 서버 -->
				<form id="searchForm">
					<input type="hidden" name="page" />
					<input type="hidden" name="searchType" value="${pagingVO.searchVO.searchType }" />
					<input type="hidden" name="searchWord" value="${pagingVO.searchVO.searchWord }"/>
				</form>
				<!-- 클라이언트 -->
				<div class="container">
					<div id="inputUI" class="row justify-content-md-center">
						<div class="col col-sm-2 float-right">
							<select class="form-control" name="searchType">
								<option value>전체</option>
								<option value="title" ${'title' eq param.searchType?"selected":"" }>제목</option>
								<option value="writer" ${'writer' eq param.searchType?"selected":"" }>작성자명</option>
								<option value="content" ${'content' eq param.searchType?"selected":"" }>내용</option>
							</select>
						</div>
						<div class="col-sm-2 float-right">
							<input type="text" class="form-control col-md-6" name="searchWord" value="${pagingVO.searchVO.searchWord }"/>
						</div>
						<div class="col col-sm-2 float-right">
							<input type="button" value="검색" id="searchBtn" class="btn btn-primary"/>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<div id="pagingArea" style="display: inline-block;">
					<ui:pagination paginationInfo="${paginationInfo }" jsFunction="pageLinkMove" type="bsResident"/>
				</div>
			</td>
		</tr>
	</tfoot>
</table>
<script type="text/javascript">
	$("#insertBtn").on("click", function(){
		location.href="<c:url value='/resident/space/boardInsert.do'/>";
	});
	
	function pageLinkMove(event){
		event.preventDefault();
		let page = $(event.target).data("page");
		searchForm.find("[name='page']").val(page);
		searchForm.submit();
		return false;
	}
	
	// 추후 리스트 비동기로 수정예정
// 	let listBody = $("#listBody");
// 	let pagingArea = $("#pagingArea");
// 	let searchForm = $("#searchForm").ajaxForm({
// 		dataType:"json",
// 		success:function(resp){
// 			console.log("hey");
// 			let boardList = resp.pagingVO.dataList;
			
// 			let trTags = [];
			
// 			if(boardList.length > 0) { // 검색결과가 있으면
// 				$(boardList).each(function(index, board) {
// 					trTags.push(
// 						$("<tr>").append(
// 							$("<td>").text(board.boNo)		
// 							, $("<td>").text(board.boTitle)		
// 							, $("<td>").text(board.boWriter+" ["+board.repCnt+"]")		
// 							, $("<td>").text(board.boDate)		
// 							, $("<td>").text(board.boHit)		
// 						).data("board",board)
// 					);
// 				})
// 			}else {
// 				trTags.push(
// 					$("<tr>").html("<td colspan='5'>")
// 							 .text("검색 결과 없음.")
// 				);
// 			}
// 			listBody.html(trTags);
// 		}
// 	}).submit();
	
	let searchForm = $("#searchForm");
	$("#searchBtn").on("click", function(){
		let inputs = $(this).parents("div#inputUI").find(":input[name]");
		$(inputs).each(function(index, input){
			let name = $(this).attr("name");
			let value = $(this).val();
			let hidden = searchForm.find("[name='"+name+"']");
			hidden.val(value);
		});
		searchForm.submit();
	});
	
	
	
	
	
</script>