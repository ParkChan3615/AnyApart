<%--
* [[개정이력(Modification Information)]]
* 수정일         수정자      수정내용
* ----------  ---------  -----------------
* 2021. 3. 1.  이경륜      수납에서 분리함
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<br>
<div id="top"> 
	<h2><strong>미납 조회</strong></h2>
</div>
<div class="container">
	<div class="col-md-12" style="border-style: outset; border-radius: 8px;">
		<div class="row g-0">
			<div class="col-md-2" style="margin-top: 20px;">
				<img src="${pageContext.request.contextPath}/images/searchIcon.png"
					alt="searchIcon"
					style="width: 30px; height: 30px; margin-left: 10px; margin-top: 10px;">&nbsp;&nbsp;<strong>검색 조건</strong>
			</div>
		</div>
		<div class="card-body">
			<form class="form-inline"></form>
			<div class="row">
				<div class="col-md-2">
					동/호 선택
				</div>
				<div class="col-md-5">
					<input type="text" class="form-control col-md-4" style="display: inline-block;" name="dongStart" maxlength="4" onkeypress="return onlyNumber(event)"/>
		      		<label>&nbsp;동&nbsp;</label>
					<input type="text" class="form-control col-md-4" style="display: inline-block;" name="hoStart" maxlength="4" onkeypress="return onlyNumber(event)"/>
			 		<label>&nbsp;호 ~&nbsp;</label>
			 	</div>
			 	<div class="col-md-5">
					<input type="text" class="form-control col-md-4" style="display: inline-block;" name="dongEnd" maxlength="4" onkeypress="return onlyNumber(event)"/>
		      		<label>&nbsp;동&nbsp;</label>
					<input type="text" class="form-control col-md-4" style="display: inline-block;" name="hoEnd" maxlength="4" onkeypress="return onlyNumber(event)"/>
			 		<label>&nbsp;호</label>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-2">
					부과년월
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control col-md-5" placeholder="부과년" style="display: inline-block;" name="costYear" maxlength="4" onkeypress="return onlyNumber(event)"/>
					<input type="text" class="form-control col-md-5" placeholder="부과월" style="display: inline-block;" name="costMonth" maxlength="2" onkeypress="return onlyNumber(event)"/>
				</div>
				<div class="col-md-4">
					<button class="btn btn-dark" id="searchBtn" onclick="goSearch()">조회</button>
					<button class="btn btn-secondary" id="resetBtn">초기화</button>
				</div>
			</div>
		</div>
	</div>
</div>
<br>
<br>
<span class="reddot">*&nbsp;</span><span>연체료는 일할 계산된 연체요율에 근거하여 부과됩니다.</span>
<br>
<span class="reddot">*&nbsp;</span><span>연체요율 : 미납관리비 * ${frMap['R_OVERDUE'] } * (연체일수 / 365)</span>
<br>
<br>
<table class="table table-bordered table-hover">
	<thead class="thead-light text-center">
		<tr class="text-center">
			<th scope="col" rowspan="2" class="align-middle">부과년월</th>
			<th scope="col" rowspan="2" class="align-middle">동</th>
			<th scope="col" rowspan="2" class="align-middle">호</th>
			<th scope="col" rowspan="2" class="align-middle">세대주명</th>
			<th scope="col" rowspan="2" class="align-middle">부과액</th>
			<th scope="col" rowspan="2" class="align-middle">연체료</th>
			<th scope="col" rowspan="2" class="align-middle">총 수납금액합</th>
			<th scope="col" colspan="5" class="align-middle">연체일수</th>
		</tr>
		<tr class="text-center">
<!-- 			<th scope="col">부과액</th> -->
<!-- 			<th scope="col">연체료</th> -->
<!-- 			<th scope="col">부과액</th> -->
<!-- 			<th scope="col">미납연체료</th> -->
<!-- 			<th scope="col">후연체료</th> -->
<!-- 			<th scope="col">납기내</th> -->
<!-- 			<th scope="col">납기후</th> -->
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>

<!-- 렌더러 페이징으로 변경해야 -->
<ul class="pagination justify-content-center">
	<li class="page-item"><a class="page-link alert alert-secondary" href="#">Previous</a></li>
	<li class="page-item"><a class="page-link alert alert-secondary" href="#">1</a></li>
	<li class="page-item"><a class="page-link alert alert-secondary" href="#">2</a></li>
	<li class="page-item"><a class="page-link alert alert-secondary" href="#">3</a></li>
	<li class="page-item"><a class="page-link alert alert-secondary" href="#">Next</a></li>
</ul>