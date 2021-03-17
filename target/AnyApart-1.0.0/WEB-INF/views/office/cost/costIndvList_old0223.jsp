<%--
* [[개정이력(Modification Information)]]
* 수정일          수정자      수정내용
* ----------  ---------  -----------------
* 2021. 1. 27.  이경륜      최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<security:authentication property="principal" var="principal"/>
<c:set var="authMember" value="${principal.realMember }"/>
<c:set var="pagingVO" value="${paginationInfo.pagingVO }"/>
<br>
<div id="top"> 
	<h2><strong>세대별 조회</strong></h2>
<!-- 	<button type="button" class="btn btn-success" style='margin:5pt;'>당월 관리비 부과</button> -->
</div>
<br>
<div class="container">
	<div class="col-md-12" style="border-style: outset; border-radius: 8px;">
		<div class="row g-0">
			<div class="col-md-2" style="margin-top: 20px;">
				<img src="${pageContext.request.contextPath}/images/searchIcon.png"
					alt="searchIcon" style="width: 30px; height: 30px; margin-left: 10px; margin-top: 10px;">
				&nbsp;&nbsp;<strong>검색조건</strong>
			</div>
		</div>
		<div class="card-body">
			<form:form commandName="pagingVO" id="searchForm" cssClass="form-inline" method="get">
				<%--컨트롤러에서 aptCode, currentPage셋팅 --%>
<%-- 				<input type="hidden" name="searchVO.searchAptCode" value="${authMember.aptCode }"/> --%>
				<form:hidden path="currentPage"/>
					<div class="row">
					<div class="col-md-2">
						동/호 선택
					</div>
					<div class="col-md-10">
<!-- 						<input type="text" class="form-control col-md-4" placeholder="동 시작" name=""> -->
<!-- 						<label>&nbsp;동&nbsp;</label> -->
<!-- 						<input type="text" class="form-control col-md-4" placeholder="호 시작" name=""> -->
<!-- 						<label>&nbsp;호&nbsp;</label> -->
						<form:select path="searchDetail.dongList" name="searchDetail.dongStart" cssClass="custom-select searchSelect" multiple="">
			      			<form:option value="0000">전체</form:option>
							<form:options items="${pagingVO.searchDetail.dongList}" itemValue="dong" itemLabel="dong"/>
<%-- 						    <c:forEach items="${dongList}" var="dong" varStatus="status"> --%>
<%-- 						        <c:choose> --%>
<%-- 						            <c:when test="${dong.dong eq param.dongStart}"> --%>
<%-- 						                <option value="${dong.dong}" selected="true">${dong.dong}</option> --%>
<%-- 						            </c:when> --%>
<%-- 						            <c:otherwise> --%>
<%-- 						                <option value="${dong.dong}">${dong.dong}</option> --%>
<%-- 						            </c:otherwise> --%>
<%-- 						        </c:choose>  --%>
<%-- 						    </c:forEach> --%>
							
						</form:select>
			      		<label>&nbsp;동&nbsp;</label>
			      		<form:select path="searchDetail.hoList" name="searchDetail.hoStart" cssClass="custom-select searchSelect" multiple="">
			      			<form:option value="0000">전체</form:option>
<%-- 							<form:options items="${hoList}" itemValue="ho" itemLabel="ho" /> --%>
						</form:select>
				 		<label>&nbsp;호 ~&nbsp;</label>
			 		
<!-- 					</div> -->
<!-- 					<div class="col-md-5"> -->

<!-- 						<input type="text" class="form-control col-md-4" placeholder="동 끝" name=""> -->
<!-- 						<label>&nbsp;동&nbsp;</label> -->
<!-- 						<input type="text" class="form-control col-md-4" placeholder="호 끝" name=""> -->
<!-- 						<label>&nbsp;호&nbsp;</label> -->
						<form:select path="searchDetail.dongList" name="searchDetail.dongEnd" cssClass="custom-select searchSelect" multiple="">
			      			<form:option value="9999">전체</form:option>
<%-- 							<form:options items="${dongList}" itemValue="dong" itemLabel="dong" /> --%>
						</form:select>
			      		<label>&nbsp;동&nbsp;</label>
			      		<form:select path="searchDetail.hoList" name="searchDetail.hoEnd" cssClass="custom-select searchSelect" multiple="">
			      			<form:option value="9999">전체</form:option>
<%-- 							<form:options items="${hoList}" itemValue="ho" itemLabel="ho" /> --%>
						</form:select>
			      		<label>&nbsp;호&nbsp;</label>
					</div>
				</div>
				
				<br>
				<div class="row">
					<div class="col-md-2">
						부과년월
					</div>
					<div class="col-md-6">
						<form:input path="searchDetail.costYear" placeholder="부과년" cssClass="form-control col-md-4"/>
						<form:input path="searchDetail.costMonth" placeholder="부과월" cssClass="form-control col-md-4"/>
					</div>
					<div class="col-md-4">
						<button class="btn btn-secondary" id="resetBtn">초기화</button>
						<button class="btn btn-dark" id="searchBtn" onclick="fn_egov_selectList()">조회</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>

<button type="button" class="btn btn-success" style='margin:5pt;'>엑셀 다운로드</button>

<table class="table table-bordered">
	<thead class="thead-light text-center">
    	<tr>
	        <th scope="col" style="width:5%">더보기</th>
	        <th scope="col" style="width:5%">부과년</th>
	        <th scope="col" style="width:5%">부과월</th>
	        <th scope="col">동</th>
	        <th scope="col">호</th>
	        <th scope="col">세대면적</th>
	        <th scope="col">세대주명</th>
	        <th scope="col">공용관리비</th>
	        <th scope="col">개별관리비</th>
	        <th scope="col">총합</th>
    	</tr>
    </thead>
    <tbody>
    	<c:set var="costList" value="${pagingVO.dataList }" />
    	<c:if test="${not empty costList }">
    		<c:forEach items="${costList }" var="cost" varStatus="vs">
	    		<tr class="text-center">
<%-- 		        	<td><input type="button" value="+" data-toggle="collapse" data-target="#accordion${cost.memId }" class="clickable"></td> --%>
		        	<td><button class="btn btn-light expandBtn" data-toggle="collapse" data-target="#accordion${cost.memId }${vs.index}" ><i class="fa fa-plus-square fa-lg"></i></button></td>
		            <td>${cost.costYear }</td>
		            <td>${cost.costMonth }</td>
		            <td>${cost.dong }</td>
		            <td>${cost.ho }</td>
		            <td>${cost.houseArea }㎡</td>
		            <td>${cost.resName }</td>
		            <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costCommTotal }" /> 원</td>
		            <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costIndvTotal }" /> 원</td>
		            <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costTotal }" /> 원</td>
		        </tr>
		        <tr class="text-center" style="display:none;">
<!-- 		        <tr class="text-center"> -->
		        	<td></td>
		            <td colspan="9">
		                <div id="accordion${cost.memId }${vs.index}" class="collapse">
							<table>
								<tr>
									<th class="table-dark">공용관리비</th>
									<td>
										<table class="table table-bordered">
											<tr class="thead-light">
												<th>일반관리비</th>
												<th>청소비</th>
												<th>경비비</th>
												<th>소독비</th>
												<th>승강기유지비</th>
												<th>총합</th>
											</tr>
											<tr>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costCommon }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costCleaning }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costSecurity }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costDisinfect }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costElevator }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costCommTotal }" /> 원</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<th class="table-dark">개별사용료</th>
									<td>
										<table class="table table-bordered">
											<tr class="thead-light">
												<th>난방공용</th>
												<th>난방전용</th>
												<th>급탕공용</th>
												<th>급탕전용</th>
												<th>전기공용</th>
												<th>전기전용</th>
												<th>수도공용</th>
												<th>수도전용</th>
												<th>수선유지비</th>
												<th>장기수선충당금</th>
												<th>입주자대표회의운영비</th>
												<th>총합</th>
											</tr>
											<tr>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costCommHeat }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costIndvHeat }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costCommHotwater }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costIndvHotwater }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costCommElec }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costIndvElec }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costCommWater }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costIndvWater }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costAs }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costLas }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costCouncil }" /> 원</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cost.costIndvTotal }" /> 원</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
		            </td>
		        </tr>
			</c:forEach>
    	</c:if>
    	<c:if test="${empty costList }">
    		<tr class="text-center">
    			<td colspan="10">조회결과가 없습니다.</td>
    		</tr>
    	</c:if>
        
    </tbody>
    <tfoot>
		<tr>
			<td colspan="10" style="text-align:center">
				<div id="pagingArea" style="display: inline-block;">
					<ui:pagination paginationInfo="${paginationInfo }" jsFunction="pageLinkMove" type="bsOffice"/>
				</div>
			</td>
		</tr>
    </tfoot>
</table>
<script>
	
	let searchForm = $("#searchForm");
	
	function pageLinkMove(event){
		event.preventDefault();
		let page = $(event.target).data("page");
		searchForm.find("[name='currentPage']").val(page);
		searchForm.submit();
		return false;
	}

	function fn_egov_selectList() {
    	
    	searchForm.attr("action", "<c:url value='/office/cost/costIndvList.do'/>");
    	searchForm.submit();
    }
	

	$(".expandBtn").on("click", function() {
		var targetId = $(this).data('target'); // 펼쳐질 아코디언의 id
		var target = $(targetId);

		var expanded = this.getAttribute("aria-expanded") == null || this.getAttribute("aria-expanded") === 'false' ? true : false;
		
		if(expanded) {
			$(this).children().removeClass("fa-plus-square");
			$(this).children().addClass("fa-minus-square");
			target.parents("tr").css('display','');
		}else {
			$(this).children().removeClass("fa-minus-square");
			$(this).children().addClass("fa-plus-square");
			target.parents("tr").css('display','none');
		}
	});
</script>
