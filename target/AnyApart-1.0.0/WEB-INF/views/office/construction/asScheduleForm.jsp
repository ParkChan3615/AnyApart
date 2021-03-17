<%--
* [[개정이력(Modification Infomation)]]     
* 수정일              수정자                  수정내용             
* =========  ========  =================  
* 2021. 2. 10.    박정민         최초작성                      
* Copyright (c) 2021 by DDIT All right reserved 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<style>
#insertDiv{
	width: 70%;
	margin: 10%;
}
th{
	background-color: #E9ECEF;
	text-align: center;
}
#insertBtn{
	margin-left: 38%; 
}
</style>

<c:set var="asVO" value="${asVO }"/>
<div id="insertDiv">
<form method="post" id="insertForm">
<input type="hidden" name="aptCode" value="${authMember.aptCode }">
<input type="hidden" name="applyNo" value="${asVO.asNo}">

<h4>수리 일정 등록</h4>
<br>
<table class="table table-bordered">
	<tbody class="table table-bordered">
		<tr>
			<th>제목</th>
			<c:if test="${asVO.asCode eq 'ASRES'}">
				<td colspan="3"><input type="text" name="schdTitle" value="${asVO.dong }동 ${asVO.ho }호 세대수선" class="form-control" readonly></td>
			</c:if>
			<c:if test="${asVO.asCode eq 'ASAPT'}">
				<td><input type="text" name="schdTitle" class="form-control" required></td>
			</c:if>
		</tr>
		<tr>
			<th>시설분류</th>
			<c:if test="${asVO.asCode eq 'ASRES'}">
				<td>세대 수선</td>
				<input type="hidden" name="schdType" value="S003">
			</c:if>
			<c:if test="${asVO.asCode eq 'ASAPT'}">
				<td>아파트 수선</td>
				<input type="hidden" name="schdType" value="S002">
			</c:if>
		</tr>
		<tr>
			<th>시작일</th>
			<td><input type="date" name="schdStart" class="form-control" required></td>
		</tr>
		<tr>
			<th>종료일</th>
			<td><input type="date" name="schdEnd" class="form-control" required></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3">
				<textarea row="5px" col="500px" name="schdContent" class="form-control"></textarea>
			</td>
		</tr>
	</tbody>
</table>   
<br>
<input type="submit" class="btn btn-primary" id="insertBtn" value="등록"> 
<input type="reset" class="btn btn-secondary" value="초기화"> 
<input type="button" class="btn btn-dark" id="goList" value="목록으로"> 
</form>  
</div>

<form id="searchForm">
	<input type="hidden" name="currentPage" value="${pagingVO.currentPage}">
	<input type="hidden" name="searchVO.searchType" value="${pagingVO.searchVO.searchType }">
	<input type="hidden" name="searchVO.searchWord" value="${pagingVO.searchVO.searchWord }">
</form>

<script>
$("#insertForm").validate({
	rules: 
    {
		schdTitle: 
    	{
	        required: true,
	        maxlength: 50
        }
        ,schdContent:{maxlength: 200}
    }
});

let searchForm = $("#searchForm");

$("#goList").on("click", function(){
	searchForm.attr("action","${cPath}/office/construction/afterServiceList.do");
	searchForm.submit();
});
</script>