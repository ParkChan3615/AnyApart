<%--
* [[개정이력(Modification Infomation)]]     
* 수정일              수정자                  수정내용             
* =========  ========  =================  
* 2021. 1. 29.    박정민         최초작성                      
* Copyright (c) 2021 by DDIT All right reserved 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<link href="${cPath }/css/resident/remodelingList.css" rel="stylesheet">
<!-- 로그인 되면 로그인 아이디랑 똑같은 글은 삭제버튼 나오게 -->
<security:authentication property="principal" var="principal"/>
<c:set var="authMember" value="${principal.realMember }"/>
<h3 id="insertH3"><strong>리모델링 신청</strong></h3>
<div id="inputDiv">
	<form id="remodllingForm">
		<input type="hidden" name="memId" value="${authMember.memId }">
		<table class="table-borderless">
			<colgroup>
				<col width="80px;">
				<col width="220px;">
				<col width="120px;">
			</colgroup>
			<tbody>
				<tr>
					<th>시작일</th>
					<td>
						<input type="date" name="rmdlStart" id="rmdlStart" required>
						<span class="errors">${errors.rmdlStart }</span>
					</td>
					<th>종료예정일</th>
					<td>
						<input type="date" name="rmdlEnd" id="rmdlEnd" required>
						<span class="errors">${errors.rmdlEnd }</span>
					</td>
					<td>
						<input type="submit" id="insertBtn" value="등록" class="btn btn-default btn-sm mb20" >
					</td>
				</tr>
				<tr>
					<th colspan="5">
						내용
					</th>
				</tr>
				<tr>
					<td colspan="5">
						<textarea rows="2px;" cols="80px;" id="rmdlTitle" name="rmdlTitle" required></textarea>
						<span class="errors">${errors.rmdlTitle }</span>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<c:set var="paginationInfo" value="${paginationInfo }"/>
<div id="listDiv">
<h3>신청목록</h3><br>
	<table class="table">
		<colgroup>
			<col width="20%;">
			<col width="50%;">
			<col width="20%;">
		</colgroup>
		<tbody id="listTbody"></tbody>
		<tfoot>
			<tr>
				<td colspan="3">
					<form id="searchForm">
						<input type="hidden" name="currentPage" value="1" /> 
						<input type="hidden" name="searchVO.searchType" /> 
						<input type="hidden" name="searchVO.searchWord" value="${paginationInfo.pagingVO.searchVO.searchWord}"/> 
					</form>
					<div id="inputUI">
						<select name="searchVO.searchType">
							<option value>전체</option>
							<option value="title">제목</option>
							<option value="memId">작성자</option>
						</select>
						<input type="text" name="searchVO.searchWord" value="${paginationInfo.pagingVO.searchVO.searchWord}">
						<input type="button" class="btn btn-primary" id="searchBtn" value="검색">
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
	<form id="deleteForm">
		<input type="hidden" name="rmdlNo" id="formRmdlNo">
	</form>
	<div id="pagingDiv">
		<ui:pagination paginationInfo="${paginationInfo }" jsFunction="pageLinkMove" type="bsResident"/>
	</div>
</div>

<script type="text/javascript">
	
	$("#remodllingForm").validate({
		onsubmit:true,
		onfocusout:function(element, event){
			return this.element(element);
		},
		errorPlacement: function(error, element) {
			error.appendTo( $(element).parents("td:first") );
	  	},
		rules: {
			rmdlStart: 
	    	{
		        required: true
	        }
			,rmdlEnd: 
			{
		        required: true
		    }
	        ,rmdlTitle:{maxlength: 200}
	    }
	});
<%--========================== 리모델링 list 받아와서 뿌려주는 함수=============================--%>
	function retreiveList(){
		$.ajax({
			dataType : "json",
			success : function(resp) {
				let pagingVO = resp.paginationInfo.pagingVO;
				let rmdlList = pagingVO.dataList;
				let trTags = [];
				if(rmdlList){
					$(rmdlList).each(function(idx, rmdl){
						let tr1 = $("<tr>");
						let tr2 = $("<tr>");
						let tr3 = $("<tr>");
						let rmdlYnText = null;
						let deleteBtnText = "";
<%---------------------------- 접수상태 뱃지 --------------------------------------------%>
						if('Y'==rmdl.rmdlYn){
							rmdlYnText = $("<td>").append(
								$("<span>").text("접수완료").addClass("badge badge-default")
							).css("backgroundColor","#F5F9FE")
						}else{
							rmdlYnText = $("<td>").append(
								$("<span>").text("접수중").addClass("badge badge-primary")
							).css("backgroundColor","#F5F9FE")
						}
<%---------------------------- 로그인한 아이디와 같은 글은 삭제버튼 나오게 -------------------------%>
						if('${authMember.memId }'==rmdl.memId){
							deleteBtnText = $("<input type='submit' class='btn btn-default btn-xs mb20 deleteBtn' data-rmdlno='"+rmdl.rmdlNo+"' value='신청취소'>");
						}
						tr1.append(
							$("<th>").text("No. "+rmdl.rmdlNo).addClass("listInfoTH").css("backgroundColor","#F5F9FE"),
							$("<td>").text("작성자:").append(
								$("<span>").text(rmdl.memId).addClass("listInfoTH").addClass("tdSpan").addClass("writerSpan")		
							).addClass("listInfoTH").css("backgroundColor","#F5F9FE"),
							$("<td>").text("작성일:").append(
								$("<span>").text(rmdl.rmdlDate).addClass("listInfoTH").addClass("tdSpan")		
							).addClass("listInfoTH").css("backgroundColor","#F5F9FE"),
							rmdlYnText
						)
						tr2.append(
							$("<td colspan='4'>").text(rmdl.rmdlTitle)
						);
						tr3.append(
							$("<td colspan='4'>").append(
								deleteBtnText
							)	
						);
						trTags.push(tr1);
						trTags.push(tr2);
						trTags.push(tr3);
					});
				}
				$("#listTbody").html(trTags);
			},
			error : function(xhr) {
				console.log(xhr);
			}
		});
	}
	
	<%--처음 화면 로딩할때 리스트 조회.--%>
	$(document).ready(function(){
		retreiveList();
	})

	<%-- insert후에 리스트만드는함수 호출하는데 insert를 비동기로 하고 리다이렉트안했기 때문에 
		기존 검색어 포함된 url이 그대로 남아있어서 insert후에도 검색어가 유지됨.--%>
	$("#insertBtn").on("click", function(event){
		event.preventDefault();
		$.ajax({
			url: "${cPath}/resident/support/insertRemodeling.do"
			, data: $("#remodllingForm").serialize()
			, method : "post" 
			, dataType : "json"
			, success : function(resp) {
				alert(resp.message.text);
				$("#remodllingForm")[0].reset();
				retreiveList();
			}
			, error : function(xhr){
				console.log(xhr.status);
			}
		});
		return false;
	});
	
	$("#listTbody").on("click", ".deleteBtn", function(event){
		event.preventDefault();
		if(confirm("신청을 취소하시겠습니까?")){
			let what = $(this).data("rmdlno");
			$("#formRmdlNo").val(what);
			$.ajax({
				url: "${cPath}/resident/support/deleteRemodeling.do"
				, data: $("#deleteForm").serialize()
				, method : "post" 
				, dataType : "json"
				, success : function(resp) {
					alert(resp.message.text);
					retreiveList();
				}
			});
		}
		return false;
	});
	
	function pageLinkMove(event){
		event.preventDefault();
		let page = $(event.target).data("page");
		searchForm.find("[name='currentPage']").val(page);
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
