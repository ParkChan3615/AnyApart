<%--
* [[개정이력(Modification Information)]]
* 수정일          수정자      수정내용
* ----------  ---------  -----------------
* 2021. 2. 22.  이경륜      최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style>
.top {
	display: inline;
}
.lawP{
	color: blue;
}

#payLawTitleSpan{
	font-size: 20px;
}

#payLawTitleDiv{
	margin-left:13em;
}

/* .popoverclz{ */
/*     max-width:600px; */
/* } */
</style>
<br>
<div id="top"> 
	<h2><strong>부과 처리</strong></h2>
</div>
<br>
<div class="container">
	<div class="row">
		<div class="col-sm-12" style="border-style: outset; border-radius: 8px;">
			<div class="row g-0">
				<div class="col-md-12" style="margin-top: 20px;">
					<i class="fas fa-user-friends fa-2x" style="margin-left: 10px; margin-top: 10px;"></i>
					<span>&nbsp;&nbsp;<strong>입주 세대 정보</strong></span>
				</div>
			</div>
			<div class="card-body">
				<div class="row g-0">
					<div class="col-md-12" style="text-align:center">
						<span>2021년 2월 23일 기준 / 1월 관리비</span> 
						<br>
						<span>입주 세대수 : 30 / 총세대수 : 400</span> 
						<br>
						<span>입주 면적 : 30*98 = 2940 / 총 주거면적 : 39,200</span> 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="d-flex justify-content-between mb-3">
	<input type="button" value="부과기준표"  class="btn btn-info" onclick="viewCostStandard();"/>
	<div><span id="noticeSpan" >* 각 행을 더블클릭하면 상세 정보를 조회할 수 있습니다.</span></div>
	<div class="d-flex justify-content-end"><button class="btn btn-primary" onclick="">부과처리</button></div>
</div>

<div class="d-flex justify-content-between mb-3">
	<div class="card text-center col-md-4 float-left">
		<div class="card-header">
			<ul class="nav nav-tabs card-header-tabs">
				<li class="nav-item">
					<a class="nav-link text-dark active" href="#"><strong>공용관리비</strong></a>
				</li>
			</ul>
		</div>
		<div class="card-body row">
			<div class="col-sm-12">
				<table class="table table-bordered table-sm table-hover">
					<thead class="thead-dark">
						<tr>
							<th scope="col">항목</th>
							<th scope="col">발생 금액</th>
							<th scope="col">면적별 부과 금액</th>
						</tr>
					</thead>
					<tbody id="commListBody" class="thead-light">
						<tr>
							<th>일반관리비</th>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>청소비</th>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>경비비</th>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>소독비</th>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>승강기유지비</th>
							<td></td>
							<td></td>
						</tr>
	<%-- 			  <c:set var="employeeList" value="${pagingVO.dataList }" /> --%>
	<%-- 			  	<c:if test="${not empty employeeList }"> --%>
	<%-- 			  		<c:forEach items = "${employeeList }" var="employee"> --%>
	<%-- 			  			<tr data-mem-id='${employee.member.memId }'> --%>
	<%-- 				     		  <td>${employee.member.memId }</td> --%>
	<%-- 				     		  <td>${employee.empName }</td> --%>
	<%-- 				     		  <td>${employee.position.positionName}</td> --%>
	<%-- 				     		  <td>${employee.empBirth }</td> --%>
	<%-- 				     		  <td>${employee.empHp }</td> --%>
	<%-- 				     		  <td>${employee.empStart }</td> --%>
	<!-- 						<tr> -->
	<%-- 					</c:forEach> --%>
	<%-- 				</c:if>			 --%>
	<%-- 				<c:if test="${empty employeeList }"> --%>
	<!-- 					<tr> -->
	<!-- 						<td colspan="6">검색 조건에 맞는 직원이 없습니다.</td> -->
	<!-- 					</tr> -->
	<%-- 				</c:if>			 --%>
					</tbody>
				</table>
			</div>	
		</div>
	</div>
	
	<div class="card text-center col-md-8 float-left">
		<div class="card-header">
			<ul class="nav nav-tabs card-header-tabs">
				<li class="nav-item">
					<a class="nav-link text-dark active" href="#"><strong>공동검침량</strong></a>
				</li>
			</ul>
		</div>
		<div class="card-body row">
			<div class="col-sm-12">
				<table class="table table-bordered table-sm table-hover">
					<thead class="thead-dark">
						<tr>
							<th scope="col">항목</th>
							<th scope="col">검침량</th>
							<th scope="col">발생 금액</th>
							<th scope="col">면적별 부과 금액</th>
						</tr>
					</thead>
					<tbody id="commMeterListBody" class="thead-light">
						<tr>
							<th>난방</th>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>급탕</th>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>수도</th>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>전기</th>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>	
		</div>
	</div>
</div>

<div class="card text-center col-md-12 float-left" style="height:800px;">
	<div class="card-header">
		<ul class="nav nav-tabs card-header-tabs">
			<li class="nav-item">
				<a class="nav-link text-dark active" href="#"><strong>세대별 요금</strong></a>
			</li>
		</ul>
	</div>
	<div class="card-body row">
		<div class="col-sm-12">
			<table class="table table-bordered table-sm table-hover">
				<thead class="thead-light align-middle">
					<tr>
						<th scope="col" rowspan="2" class="align-middle">동</th>
						<th scope="col" rowspan="2" class="align-middle">호</th>
						<th scope="col" rowspan="2" class="align-middle">면적</th>
						<th scope="col" colspan="2" class="align-middle">난방</th>
						<th scope="col" colspan="2" class="align-middle">급탕</th>
						<th scope="col" colspan="2" class="align-middle">수도</th>
						<th scope="col" colspan="2" class="align-middle">전기</th>
						<th scope="col" colspan="2" class="align-middle">주차비</th>
						<th scope="col" rowspan="2" class="align-middle">수선<br>유지비</th>
						<th scope="col" rowspan="2" class="align-middle">장기수선<br>충당금</th>
						<th scope="col" rowspan="2" class="align-middle">입주자회의<br>운영비</th>
<!-- 						<th scope="col" rowspan="2" class="align-middle">공용관리비<br>총액</th> -->
<!-- 						<th scope="col" rowspan="2" class="align-middle">개별공용<br>총액</th> -->
<!-- 						<th scope="col" rowspan="2" class="align-middle">세대요금<br>총액</th> -->
<!-- 						<th scope="col" rowspan="2" class="align-middle">관리비<br>총액</th> -->
					</tr>
					<tr>
						<th scope="col">검침량</th>
						<th scope="col">요금</th>
						<th scope="col">검침량</th>
						<th scope="col">요금</th>
						<th scope="col">검침량</th>
						<th scope="col">요금</th>
						<th scope="col">검침량</th>
						<th scope="col">요금</th>
						<th scope="col">등록대수</th>
						<th scope="col">요금</th>
					</tr>
				</thead>
				<tbody id="indvListBody">
					<tr>
						<td>1401</td>
						<td>101</td>
						<td>98m2</td>
						<td>123</td>
						<td>20,000</td>
						<td>456</td>
						<td>37,000</td>
						<td>33</td>
						<td>3,000</td>
						<td>1500</td>
						<td>40,000</td>
						<td>0</td>
						<td>0</td>
						<td>50</td>
						<td>2,800</td>
						<td>300</td>
<!-- 						<td>50,000</td> -->
<!-- 						<td>70,000</td> -->
<!-- 						<td>200,000</td> -->
<!-- 						<td>320,000</td> -->
					</tr>
				</tbody>
			</table>
		</div>	
	</div>
</div>



<!-- 부과기준표 상세보기 모달 -->
<div class="modal fade" id="costStandardViewModal" tabindex="-1" aria-labelledby="costStandardViewModalLabel" aria-hidden="true" style=”z-index:1060;”>
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="costStandardViewModalLabel"><strong>부과기준표</strong></h3>
			</div>
			<div class="modal-body" id="costStandardViewModalBody">
				<!-- costStandardViewModal.jsp에서 읽어올 모달 바디 -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>



<script>

//==================부과기준표 모달===================
let costStandardViewModalBody = $("#costStandardViewModalBody");
let costStandardViewModal = $("#costStandardViewModal");

function viewCostStandard(event) {
	let modalURL = $.getContextPath() + "/office/cost/costStandardView.do";
	costStandardViewModal.find(costStandardViewModalBody).load(modalURL, function(){
		costStandardViewModal.modal("show");
	});
}
	
</script>