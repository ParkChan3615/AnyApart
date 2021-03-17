<%--
* [[개정이력(Modification Information)]]
* 수정일         수정자      수정내용
* ----------  ---------  -----------------
* 2021. 2. 1.  이경륜      최초작성
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
	<h2><strong>수납/미납 현황</strong></h2>
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
					기간
				</div>
				<div class="col-md-5">
					<select class="custom-select col-md-4">
						<option>2021</option>
						<option>2020</option>
						<option>2019</option>
					</select>
					년
					<select class="custom-select col-md-4">
						<option>12</option>
						<option>11</option>
						<option>10</option>
					</select>
					월~
				</div>
				<div class="col-md-5">
					<select class="custom-select col-md-4">
						<option>2021</option>
						<option>2020</option>
						<option>2019</option>
					</select>
					년
					<select class="custom-select col-md-4">
						<option>12</option>
						<option>11</option>
						<option>10</option>
					</select>
					월
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-2">
					동/호 선택
				</div>
				<div class="col-md-5">
					<select class="custom-select col-md-4" name="dong_start">
		      			<option>1401</option>
		      			<option>1402</option>
		      			<option>1403</option>
		      			<option>1404</option>
		      		</select>
		      		<label>&nbsp;동&nbsp;</label>
  			      		<select class="custom-select col-md-4" name="ho_start">
			 			<option>101</option>
			 			<option>102</option>
			 			<option>103</option>
			 			<option>104</option>
			 		</select>
			 		<label>&nbsp;호 ~&nbsp;</label>
			 	</div>
			 	<div class="col-md-5">
			 		<select class="custom-select col-md-4" name="dong_end">
		      			<option>1401</option>
		      			<option>1402</option>
		      			<option>1403</option>
		      			<option>1404</option>
		      		</select>
		      		<label>&nbsp;동&nbsp;</label>
		      		<select class="custom-select col-md-4" name="ho_end">
		      			<option>101</option>
		      			<option>102</option>
		      			<option>103</option>
		      			<option>104</option>
		      		</select>
		      		<label>&nbsp;호&nbsp;</label>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-4">
					<button class="btn btn-dark" style='margin: 5pt;'>조회</button>
				</div>
			</div>
		</div>
	</div>
</div>
<br>
<table class="table table-bordered table-sm table-hover">
	<thead class="thead-light text-center">
		<tr class="text-center">
			<th scope="col" rowspan="2" class="align-middle">수납일자</th>
			<th scope="col" rowspan="2" class="align-middle">고지년월</th>
			<th scope="col" rowspan="2" class="align-middle">동</th>
			<th scope="col" rowspan="2" class="align-middle">호</th>
			<th scope="col" rowspan="2" class="align-middle">세대주명</th>
			<th scope="col" rowspan="2" class="align-middle">부과액</th>
			<th scope="col" colspan="2" class="align-middle">수납</th>
			<th scope="col" rowspan="2" class="align-middle">수납금액합</th>
			<th scope="col" colspan="5" class="align-middle">미납</th>
		</tr>
		<tr class="text-center">
			<th scope="col">부과액</th>
			<th scope="col">연체료</th>
			<th scope="col">부과액</th>
			<th scope="col">미납연체료</th>
			<th scope="col">후연체료</th>
			<th scope="col">납기내</th>
			<th scope="col">납기후</th>
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