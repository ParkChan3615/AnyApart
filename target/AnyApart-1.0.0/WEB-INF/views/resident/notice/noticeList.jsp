<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 1. 26.      이미정       최초작성
* 2021. 2. 15.      이미정       기존 코드 보완
* Copyright (c) 2021 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<c:set var="pagingVO" value="${paginationInfo.pagingVO }" />
<div class="container">
<br>
<h4><strong>공지사항</strong></h4>
<form id="viewForm" method="get" action="${cPath }/resident/officeNoticeView.do">
	<input type="hidden" name="boNo"  />
	<input type="hidden" name="page" value="${param.page }"/>
	<input type="hidden" name="searchType" value="${param.searchType }" />
	<input type="hidden" name="searchWord" value="${param.searchWord }"/>
</form>
<table class="table">
	<thead class="table-light">
		<tr>
	      <th>No</th>
	      <th>제목</th>
	      <th>작성자</th>
	      <th>작성일</th>
	      <th>조회수</th>
	    </tr>
	  </thead>
	  <tbody id="listBody">
	  <c:set var="boardList" value="${pagingVO.dataList }"/>
	  	<c:if test="${not empty boardList }">
	  		<c:forEach items="${boardList }" var="board">
	  			<tr data-bo-no='${board.boNo }'>
	  				<td>${board.boNo }</td>
	  				<td>${board.boTitle }</td>
	  				<td>${board.boWriter }</td>
	  				<td>${board.boDate }</td>
	  				<td>${board.boHit }</td>
			    <tr>
	  		</c:forEach>
		</c:if>
		<c:if test="${empty boardList }">
			<tr>
				<td colspan="5">게시글이 없습니다.</td>
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
						<div class="col col-lg-2">
							<select class="form-control" name="searchType">
								<option>전체</option>
								<option value="title" ${'title' eq param.searchType?"selected":"" }>제목</option>
								<option value="content" ${'content' eq param.searchType?"selected":"" }>내용</option>
							</select>
						</div>
						<div class="col-md-auto">
							<input type="text" class="form-control col-md-6" name="searchWord" value="${pagingVO.searchVO.searchWord }"/>
						</div>
						<div class="col col-lg-2">
							<input type="button" value="검색" id="searchBtn" class="btn btn-primary"/>
						</div>
					</div>
				</div>
				<div id="pagingArea">
					<ui:pagination paginationInfo="${paginationInfo }" jsFunction="pageLinkMove" type="bsResident"/>
				</div>
			</td>
		</tr>
	</tfoot>
</table>
</div>

<script>
	let listBody = $("#listBody");
	listBody.on("dblclick", "tr", function() {
		let boNo = this.dataset.boNo;
		let viewForm = $("#viewForm");
		viewForm.find("[name='boNo']").val(boNo);
		console.log('${param.searchType}');
		console.log('${param.searchWord}');
		viewForm.submit();
	});	
 
	function pageLinkMove(event){
		event.preventDefault();
		let page = $(event.target).data("page");
		searchForm.find("[name='page']").val(page);
		searchForm.submit();
		return false;
	}
	
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