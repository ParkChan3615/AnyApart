<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<br>
	<h4><strong>Q&A</strong></h4>
	<br>
	<table class="table">
	  <thead class="thead-light">
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
	  		<c:forEach var="board" items="${boardList }" varStatus="idx">
	  			<tr>
	  				<td>${pagingVO.totalRecord - 5*(pagingVO.currentPage-1) - idx.count + 1}</td>
	  				<td>
	  					<a href="${cPath }/office/qna/qnaView.do?boNo=${board.boNo }">
							<c:if test="${not empty board.boParent }">
								└ re : 
							</c:if>
							[${board.boType }]${board.boTitle }
						</a>
	  				</td>
	  				<td>${board.boWriter }</td>
	  				<td>${board.boDate }</td>
	  				<td>${board.boHit }</td>
	  			</tr>
	  		</c:forEach>
	  	</c:if>
	  	<c:if test="${empty boardList}">
			<tr>
				<td colspan="5">검색 결과 없음.</td>
			<tr>
		</c:if>
	  </tbody>
	 <tfoot>
		<tr>
			<td colspan="5">
				<form id="searchForm">
					<input type="hidden" name="page" />
					<input type="hidden" name="boType" />
					<input type="hidden" name="searchType" value="${pagingVO.searchVO.searchType }"/>
					<input type="hidden" name="searchWord" value="${pagingVO.searchVO.searchWord }"/>
				</form>
					<div id="inputUI" class="row justify-content-center mb-3">
						<div class="col-auto">
							<select name="boType" class="form-control">
								<option value>문의 분류</option>
							</select>
						</div>
						<div class="col-auto">
							<select name="searchType" class="form-control">
								<option value>전체</option>
								<option value="boTitle" ${'boTitle' eq param.searchType?"selected":"" }>제목</option>
								<option value="boWriter" ${'boWriter' eq param.searchType?"selected":"" }>작성자</option>
								<option value="boContent" ${'boContent' eq param.searchType?"selected":"" }>내용</option>
							</select>
						</div>						
						<div class="col-auto">
							<input type="text" name="searchWord"  class="form-control mr-3"  value="${pagingVO.searchVO.searchWord }"/>
						</div>
						<div class="col-auto">
							<input type="btn btn-dark" value="검색" id="searchBtn" class="btn btn-primary"/>
							<input type="btn btn-dark" value="새글쓰기"  id="insertBtn" class="btn btn-primary"/>
						</div>
					</div>
				<div id="pagingArea">${pagingVO.pagingHTML }</div>
			</td>
		</tr>
	</tfoot>
	</table>
</div>    

<script>
let pagingArea = $("#pagingArea");
pagingArea.on("click", "a" ,function(event){
	event.preventDefault();
	let page = $(this).data("page");
// 	console.log($('input[name=searchType]').val())
	searchForm.find("[name='page']").val(page);
	searchForm.submit();
	searchForm.find("[name='page']").val("");
	return false;
});

//	searchForm.find("[name='searchType']").val(${pagingVO['searchVO']['searchType'] });
let searchForm = $("#searchForm");

$("#searchBtn").on("click", function(event){
	let inputs = $(this).parents("div#inputUI").find(":input[name]");
	$(inputs).each(function(index, input){
		let name = $(this).attr("name");
		let value = $(this).val();
		let hidden = searchForm.find("[name='"+name+"']");
		hidden.val(value);
	});
	searchForm.submit();
});

$("#insertBtn").on("click", function(){
	location.href="<c:url value='/office/qna/qnaBoardInsert.do'/>";
});

//---------------------------------------------------

let optTag = $("[name='boType']");
$.ajax({
	url : "${cPath }/board/getOption.do ",
	method : "get",
	dataType : "json",
	success : function(resp) {
		let opts = [];
		// 옵션을 동적으로 구성
		$(resp.option).each(function(idx, opt){
			opts.push(
				// type을 그대로 유지하기 위해서 prop 를 사용
				$("<option>").text(opt.codeName)
							 .attr("value", opt.codeId)
							 .prop("selected", "${pagingVO.searchDetail.boType}"==opt.codeId)
							 // EL은 javaBean 규약을 기반으로 움직인다.
			);
		});
		optTag.append(opts);
	},
	error : function(xhr) {
		console.log(xhr);
	}
});
</script>