<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="pagingVO" value="${paginationInfo.pagingVO }" />

<style>
	 #empIdSel, #basePaySel{
	 	display:none;
	 }
	 
	#viewBtn, #deleteBtn{
		font-size:14px;
		width: 70px;
		height: 25px; 
		margin: 2px;
		line-height: 10px;
	}
	
	#searchBorderDiv{
		height: 5.5em;
	}
	.sumTr{
		font-size: 20px;
		color: blue;
	}
	
	.leftDiv{
		float: left;
	}
	
	.inputPayDiv{
		height: 350px;
		width: 43.8em;
		
	}
	
	.inputInsertPayTb{
		margin-top: 20px;
	}
	.inputInsertPayTb tr{
		height:60px;
		
	}

	.payLawDiv, .mainTbDiv, .searchDiv, #inputUI{
		float: left;
	}
	
	#payLawDiv{
		font-size: 14px;
	}
	
	.lawP{
		color: blue;
	}
	
	#payLawTitleSpan{
		font-size: 18px;
	}
	
	#payLawTitleDiv{
		margin-left:10em;
	}
	
	#searchImg{
		width:30px;
		height:30px;
		float:left;
		margin:15px;
	}
	
</style>


<form id="searchForm">
	<input type="hidden" name="searchVO.searchAptCode" value="${authMember.aptCode}">
	<input type="hidden" name="page" />
	<input type="hidden" name="payYear" value="${pagingVO.searchDetail.payYear }"/>
	<input type="hidden" name="payMonth" value="${pagingVO.searchDetail.payMonth }"/>
	<input type="hidden" name="positionCode" value="${pagingVO.searchDetail.employee.positionCode }"/>
	<input type="hidden" name="empName" value="${pagingVO.searchDetail.employee.empName }"/>
	<input type="hidden" name="flag" value="${flag }">
</form>
<br>
<h4><strong>급여계산</strong></h4>
<br>
	<div class="container">

	</div>
<br>
	


<div class="p-4 mr-4">
	<div class="col-sm-4 card-header payLawDiv p-2" id="payLawDiv">
		<div class="card p-5">
		
		<div id="payLawTitleDiv">
			<span id="payLawTitleSpan" class="badge badge-info  mb-4">급여 지급 기준</span>
		</div>
		
		<p class="lawP">* 국민연금</p>
		<table class="table table-sm table-bordered text-center align-self-center  ">
			<thead>
				<tr>
					<th>구분</th>
					<th>연금보험료(전체)</th>
					<th>근로자</th>
					<th>사업주</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>기준<br>소득월액</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<p class="lawP">* 건강보험</p>
		<table class="table table-sm table-bordered text-center align-self-center">
			<thead>
				<tr>
					<th>구분</th>
					<th>기준액</th>
					<th>보험료율</th>
					<th>근로자</th>
					<th>사업주</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>건강보험료</td>
					<td>보수월액</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>장기요양보험료</td>
					<td>건강보험료</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<p class="lawP">* 고용보험</p>
		<table class="table table-sm table-bordered text-center align-self-center">
			<thead>
				<tr>
					<th colspan="2">구분</th>
					<th>근로자</th>
					<th>사업자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2">실업급여</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td rowspan="4" class="align-middle">고용안정,<br>직업능력<br>개발사업</td>
					<td>150인 미만기업</td>
					<td>-</td>
					<td></td>
				</tr>
				<tr>
					<td>150인 이상<br>(우선지원대상)</td>
					<td>-</td>
					<td></td>
				</tr>
				<tr>
					<td>150인 이상<br>1,000인 미만</td>
					<td>-</td>
					<td></td>
				</tr>
				<tr>
					<td>1000인 이상</td>
					<td>-</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<p class="lawP">* 소득세/지방소득세</p>
		<table class="table table-sm table-bordered text-center align-self-center ">
			<thead>
				<tr>
					<th>구분</th>
					<th>기준액</th>
					<th>근로자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>소득세</td>
					<td rowspan="2" class="align-middle">보수월액</td>
					<td></td>
				</tr>
				<tr>
					<td>지방소득세</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>
</div>
<div class="col-sm-7 mainTbDiv ml-4" id="mainTbDiv">

	<div class="col-md-12 p-3" id="searchBorderDiv" style="border-style:outset;border-radius: 8px;">
	    <div class="col-sm-12 row g-0 searchDiv d-flex justify-content-start mt" >
	        <div class="row g-0 searchDiv justify-content-center col-sm-12 mb-2 ">
			    <div id="inputUI " >
			     <img id="searchImg" src="${pageContext.request.contextPath}/images/searchIcon.png" alt="searchIcon">
			     <form class="form-inline ">
				      <div>
			    			<input type="hidden" name="flag" id="flag" value="${flag }">
				        	지급연도&nbsp;&nbsp;
				        	<select class="custom-select col-sm-3 searchSelect" name="payYear">
				        		<option value="">전체</option>
								<c:forEach begin="2020" end="2050" var="year">
									<option value="${year }" ${pagingVO.searchDetail.payYear eq year ? 'selected':''}>${year }</option>
								</c:forEach>
							</select>
							&nbsp;&nbsp;지급월&nbsp;&nbsp;
				        	<select class="custom-select col-sm-3 searchSelect" name="payMonth">
				        		<option value="">전체</option>
								<c:forEach begin="1" end="12" var="month">
									<option value="${month }" ${pagingVO.searchDetail.payMonth eq month ? 'selected':''}>${month }</option>
								</c:forEach>
							</select>
				        	&nbsp;&nbsp;직책&nbsp;&nbsp;
				        	<select id="positionCode" name="positionCode" class="custom-select col-sm-2">
				        	   <option value="">전체</option>
								<c:forEach items="${positions }" var="position" varStatus="vs">
									<c:if test="${not empty position.positionCode }">
										<option value="${position.positionCode }" ${pagingVO.searchDetail.employee.positionCode eq position.positionCode ? 'selected':''}>"${position.positionName }"</option>
									</c:if>
								</c:forEach>
							</select>
				        	&nbsp;&nbsp;성명&nbsp;&nbsp;
					       	<input type="text" name="empName" class="form-control col-sm-2" value="${pagingVO.searchDetail.employee.empName }"> 
							<button class="btn btn-dark" style='margin:5pt;' id="searchBtn">검색</button>
							<button class="btn btn-secondary" id="resetBtn">초기화</button>
			  		  </div>
			      </form>
			    </div>
		  </div>
	    </div>
	</div>
<div class="col-sm-2" style="float:left;">
	<input type="button" id="showLawDivBtn" class="btn btn-info mb-1 mr-1 mt-5" value="◀ 자세히">
    <input type="button" id="hideLawDivBtn" class="btn btn-info mb-1 mr-1 mt-5" value="▶ 간단히">
</div>	
<div class="col-sm-10 d-flex justify-content-end" style="float:left;">
  <input type="button" class="btn btn-dark mb-1 mr-1 mt-5" role="alert" value="등록" data-toggle="modal" data-target="#insertModal">
  <input type="button" class="btn btn-dark mb-1 mr-1 mt-5" role="alert" value="인쇄">
</div>		
<table id = "mainTb" class="table text-center align-self-center table-hover">
  <thead class="thead-light ">
    <tr>
      <th class="align-middle" rowspan="2">
    	  
      </th>
      <th class="align-middle" rowspan="2">직원번호</th>
      <th class="align-middle " rowspan="2">성명</th>
      <th class="align-middle " rowspan="2">지급연도</th>
      <th class="align-middle" rowspan="2">지급월</th>
      <th class="align-middle hideEle" rowspan="2">기본급</th>
      <th class="align-middle hideEle" rowspan="2">직책 수당</th>
      <th class="align-middle hideEle" rowspan="2">식대</th>
      <th class="align-middle hideEle" colspan="3">공제항목</th>
      <th class="align-middle hideEle" rowspan="2">소득세</th>
      <th class="align-middle hideEle" rowspan="2">지방소득세</th>
      <th class="align-middle " rowspan="2">수령액</th>
      <th class="align-middle " rowspan="2"></th>
    </tr>
    <tr>
      <th class="align-middle hideEle">건강보험</th>
      <th class="align-middle hideEle">국민연금</th>
      <th class="align-middle hideEle">고용보험</th>
    </tr>
  </thead>
  <tbody id="listBody" >
  <c:set var="payList" value="${pagingVO.dataList }"/>
  	<c:if test="${not empty payList }">
  		<c:forEach items="${payList }" var="pay">
  			<tr>
 			  <td class="align-middle">
 			  </td>
 			  <td class="align-middle">
 			  ${pay.employee.memId }
 			  </td>
		      <td class="align-middle ">${pay.employee.empName }</td>
		      <td class="align-middle ">${pay.payYear }</td>
		      <td class="align-middle ">${pay.payMonth }</td>
		      <td class="align-middle text-right hideEle">
		      <fmt:formatNumber value="${pay.payBase }" pattern="#,###"/>
		      </td>
		      <td class="align-middle text-right hideEle">
		      <fmt:formatNumber value="${pay.payPlus }" pattern="#,###"/>
		      </td>
		      <td class="align-middle text-right hideEle">
		      <fmt:formatNumber value="${pay.payMeal }" pattern="#,###"/>
		      </td>
		      <td class="align-middle text-right hideEle">
		      <fmt:formatNumber value="${pay.payHealth }" pattern="#,###"/>
		      </td>
		      <td class="align-middle text-right hideEle">
		      <fmt:formatNumber value="${pay.payPension }" pattern="#,###"/>
		      </td>
		      <td class="align-middle text-right hideEle">
		      <fmt:formatNumber value="${pay.payEmployee}" pattern="#,###"/>
		      </td>
		      <td class="align-middle text-right hideEle">
		      <fmt:formatNumber value="${pay.payIncometax }" pattern="#,###"/>
		      </td>
		      <td class="align-middle text-right hideEle">
		      <fmt:formatNumber value="${pay.payLocalIncometax }" pattern="#,###"/>
		      </td>
		      <td class="align-middle text-right">
		      <fmt:formatNumber value="${pay.payLocalIncometax }" pattern="#,###"/>
		      </td>
		      <td class="align-middle text-right form-inline justify-content-center">
		      	<input type="hidden" class="form-control" name="payNo" value="${pay.payNo }"/>
	     		<input type="button" id="viewBtn" name="viewBtn" class="btn btn-primary" value="수정" >
			   <form id="deleteForm" action="${cPath }/office/payment/payForMonthDelete.do" method="GET">
					<input type="hidden" class="form-control " name="payNo" value="${pay.payNo }"/>
		     		<input type="button" id="deleteBtn" name="deleteBtn" class="btn btn-primary" value="삭제">
		       </form>
		      </td>
  			</tr>
  		</c:forEach> 
  	</c:if>
  	<c:if test="${empty payList }">
  		<tr>
  			<td colspan="13">검색된 급여자료가 없습니다.</td>
  		</tr>
  	</c:if>
  	
  </tbody>
</table>
<div id="pagingArea">
	<ui:pagination paginationInfo="${paginationInfo }" jsFunction="pageLinkMove" type="bsOffice"/>
</div>
</div>

<!-- 급여자료 등록 모달 -->
<div class="modal" id="insertModal">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">

	      <!-- Modal Header -->
	      <div class="modal-header">
	        <p class="modal-title" style="font-size:15pt;">- 월별 급여자료 등록</p>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" >
				<div>
					<form id="insertForm" method="POST">
					<div class="col-sm-12">
					 <table class="table table-bordered text-center ">
					    <tbody>
					      <tr>
					        <td class="align-middle">지급연도</td>
					        <td class="align-middle">
								<select name="payYear" class="custom-select">
									<c:forEach begin="2020" end="2050" var="year">
									<option>${year }</option>
									</c:forEach>
								</select>
							</td>
					        <td class="align-middle">지급월</td>
					         <td class="align-middle">
					        <select name="payMonth" class="custom-select">
					      	    <c:forEach begin="1" end="12" var="month">
									<option>${month }</option>
								</c:forEach>
							</select>
							</td>
					        <td class="align-middle">직원이름</td>
					        <td class="align-middle">
								<input type="text" id="insertModalempName" class="form-control" value="" readonly> 
								<input type="hidden" id="insertModalmemId" name="memId" class="form-control" value=""> 
							</td>
							<td>
								<input type="button" value="급여 계산" class="btn btn-primary" id="insertModalPayBtn">
							</td>
					      </tr>
					    </tbody>
					  </table>
				  		 <select id="empIdSel" name="memId">
				      	    <c:forEach items="${empSelectList }" var="empSel">
								<option value="${empSel.member.memId }">${empSel.member.memId }</option>
							</c:forEach>
						</select>
						<select id="basePaySel">
				      	    <c:forEach items="${empSelectList }" var="empSel">
								<option value="${empSel.position.positionPay }">${empSel.position.positionPay }</option>
							</c:forEach>
						</select>
					  </div>
					  </form>
					  <form>
					 <div class="leftDiv col-sm-4" id="insertDiv">
					  <div class="form-inline mb-2">					  
					  	<input type="text" id="insertEmpSearch" name="insertEmpSearch" class="form-control" value="${pagingVO.searchDetail.employee.empName }" placeholder="이름으로 검색"> 
					  	<input type="button" value="검색" class="btn btn-primary ml-2" id="searchEmpBtn" >
					  	<input type="button" value="초기화" class="btn btn-primary ml-2" id="insertPayEmpResetBtn">
					  </div>
						<select id="insertModalEmpSearch" name="insertModalEmpSearch" class="form-control leftDiv insertModalEmpSearch" size="15">
							<c:forEach items="${empSelectList }" var="empSel">
								<option value="${empSel.member.memId}">${empSel.member.memId} / ${empSel.empName }(${empSel.position.positionName })</option>
							</c:forEach>
						</select> 
					</div>
					 <div class="leftDiv ml-4 card card-header inputPayDiv">
					  <table class="inputInsertPayTb">
						 <tr>
		   					 <th style="width: 25%">기본급</th>
						  	<th style="width: 25%"><input type="text" required id="payBase" name="payBase" class="form-control" value="${payment.payBase }"/>
		   					 <form:errors path="payBase" element="span" cssClass="error"/></th>
		   					 <th style="width: 25%" class="ml-2">&nbsp;&nbsp;&nbsp;건강보험</th>
						  	<th style="width: 25%"><input type="text" required id="payHealth" name="payHealth" class="form-control" value="${payment.payHealth }"/>
		   					 <form:errors path="payHealth" element="span" cssClass="error"/></th>
						  </tr>
						  <tr>
						  	<td>직책수당</td>
						  	<td><input type="text" required id="payPlus" name="payPlus" class="form-control" value="${payment.payPlus }"/>
		   					 <form:errors path="payPlus" element="span" cssClass="error"/></td>
		   					 <td>&nbsp;&nbsp;&nbsp;국민연금</td>
						  	<td><input type="text" required id="payPension" name="payPension" class="form-control" value="${payment.payPension }"/>
		   					 <form:errors path="payPension" element="span" cssClass="error"/></td>
						  </tr>
						  <tr>
						  	<td>식대</td>
						  	<td><input type="text" required id="payMeal" name="payMeal" class="form-control" value="${payment.payMeal }"/>
		   					 <form:errors path="payMeal" element="span" cssClass="error"/></td>
		   					 <td>&nbsp;&nbsp;&nbsp;고용보험</td>
						  	<td><input type="text" required id="payEmployee" name="payEmployee" class="form-control" value="${payment.payEmployee }"/>
		   					 <form:errors path="payEmployee" element="span" cssClass="error"/></td>
						  </tr>
						  <tr>
						    <td>소득세</td>
						  	<td><input type="text" required id="payIncometax" name="payIncometax" class="form-control" value="${payment.payIncometax }"/>
		   					 <form:errors path="payIncometax" element="span" cssClass="error"/></td>
						  	<td>&nbsp;&nbsp;&nbsp;지방소득세</td>
					  		<td><input type="text" required id="payLocalIncometax" name="payLocalIncometax" class="form-control" value="${payment.payLocalIncometax }"/>
	   					    <form:errors path="payLocalIncometax" element="span" cssClass="error"/></td>
						  </tr>
						  <tr class="sumTr">
						  	<td></td>
						  	<td></td>
						    <td>&nbsp;&nbsp;&nbsp;합계</td>
					  		<td><input type="text" required id="paySum" name="paySum" class="form-control" value="${payment.paySum }"/>
						  </tr>
					 </table>
					</div>
					  </form>
				</div>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-dark" id="payInsertBtn">등록</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
      	</div>
    </div>
 </div>
<!-- 모달 끝 -->




<!-- 급여자료 수정 모달 -->
<div class="modal" id="updateModal">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">

	      <!-- Modal Header -->
	      <div class="modal-header">
	        <p class="modal-title" style="font-size:15pt;">- 월별 급여자료 수정</p>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" >
				<div>
					<form id="updateForm">
					 <table class="table table-bordered text-center">
					    <tbody>
					      <tr>
					        <td class="align-middle">지급년도</td>
					        <td class="align-middle">
								<select id="updateYear" name="payYear">
									<c:forEach begin="2020" end="2050" var="year">
									<option>${year }</option>
									</c:forEach>
								</select>
							</td>
					        <td class="align-middle">지급월</td>
					         <td class="align-middle">
					        <select id="updateMonth" name="payMonth">
					      	    <c:forEach begin="1" end="12" var="month">
									<option>${month }</option>
								</c:forEach>
							</select>
							</td>
<!-- 					        <td class="align-middle">직원이름</td> -->
<!-- 					        <td class="align-middle"> -->
<!-- 					        <select id="empNameSel" name="empNameSel"> -->
<%-- 					      	    <c:forEach items="${payView }" var="pay"> --%>
<%-- 									<option>${empSel.empName }(${empSel.position.positionName })</option> --%>
<%-- 								</c:forEach> --%>
<!-- 							</select> -->
<!-- 							</td> -->
<!-- 							<td> -->
<!-- 								<input type="button" value="급여 계산" id="sumPay"> -->
<!-- 							</td> -->
					      </tr>
					    </tbody>
					  </table>
					  
<!-- 					  		 <select id="empIdSel" name="memId"> -->
<%-- 					      	    <c:forEach items="${empSelectList }" var="empSel"> --%>
<%-- 									<option value="${empSel.member.memId }">${empSel.member.memId }</option> --%>
<%-- 								</c:forEach> --%>
<!-- 							</select> -->
<!-- 							<select id="basePaySel"> -->
<%-- 					      	    <c:forEach items="${empSelectList }" var="empSel"> --%>
<%-- 									<option value="${empSel.position.positionPay }">${empSel.position.positionPay }</option> --%>
<%-- 								</c:forEach> --%>
<!-- 							</select> -->
					  
						  <table>
						 <tr>
		   					 <td>기본급</td>
						  	<td><input type="text" required id="updateBase" name="payBase" value=""/>
		   					 <form:errors path="payBase" element="span" cssClass="error"/></td>
		   					 <td>건강보험</td>
						  	<td><input type="text" required id="updateHealth" name="payHealth" value=""/>
		   					 <form:errors path="payHealth" element="span" cssClass="error"/></td>
						  </tr>
						  <tr>
						  	<td>직책수당</td>
						  	<td><input type="text" required id="updatePlus" name="payPlus"/>
		   					 <form:errors path="payPlus" element="span" cssClass="error"/></td>
		   					 <td>국민연금</td>
						  	<td><input type="text" required id="updatePension" name="payPension" value=""/>
		   					 <form:errors path="payPension" element="span" cssClass="error"/></td>
						  </tr>
						  <tr>
						  	<td>식대</td>
						  	<td><input type="text" required id="updateMeal" name="payMeal" value=""/>
		   					 <form:errors path="payMeal" element="span" cssClass="error"/></td>
		   					 <td>고용보험</td>
						  	<td><input type="text" required id="updateEmployee" name="payEmployee" value=""/>
		   					 <form:errors path="payEmployee" element="span" cssClass="error"/></td>
						  </tr>
						  <tr>
						    <td>소득세</td>
						  	<td><input type="text" required id="updateIncometax" name="payIncometax" value=""/>
		   					 <form:errors path="payIncometax" element="span" cssClass="error"/></td>
						  	<td>지방소득세</td>
					  		<td><input type="text" required id="updateLocalIncometax" name="payLocalIncometax" value=""/>
	   					    <form:errors path="payLocalIncometax" element="span" cssClass="error"/>
	   					    
	   					    <input type="text" required id="updatePayNo" name="payNo" value=""/>
	   					    </td>
						  </tr>
					  	  <tr>
						  <tr>
						  	<td><input type="button" id="updateSumBtn" value="계산하기"></td>
						    <td>합계</td>
					  		<td><input type="text" required id="updateSum" name="paySum" value=""/>
	   					    <form:errors path="paySum" element="span" cssClass="error"/></td>
						  </tr>
					  	  <tr>
					  	  </tr>
						  </table>
					  </form>
				</div>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-dark" id="payUpdateBtn">수정</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	      </div>
      	</div>
    </div>
 </div>
<!-- 모달 끝 -->

<script>
//let listBody = $("#listBody");
//listBody.on("click", "tr", function() {
//	let payNo = this.dataset.payNo;
//	let viewForm = $("#viewForm");
//	viewForm.find("[name='payNo']").val(payNo);
//	console.log('${param.searchType}');
//	console.log('${param.searchWord}');
//	viewForm.submit();
//});

let searchForm = $("#searchForm");

function pageLinkMove(event){
	event.preventDefault();
	let page = $(event.target).data("page");
	searchForm.find("[name='page']").val(page);
	searchForm.submit();
	return false;
}

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

$(":button[name=viewBtn]").on("click", function(){
	$.ajax({
		url:"${cPath }/office/payment/payForMonthView.do"
		,data : { "payNo":$(this).parent().children().find(":input[name=payNo]").val()}
		,success : function(resp){
			console.log(resp);
			$("#updatePayNo").val(resp.payView.payNo);
			$("#updateYear").val(resp.payView.payYear);
			$("#updateMonth").val(resp.payView.payMonth);
			$("#updateBase").val(resp.payView.payBase);
			$("#updatePlus").val(resp.payView.payPlus);
			$("#updateMeal").val(resp.payView.payMeal);
			$("#updateHealth").val(resp.payView.payHealth);
			$("#updatePension").val(resp.payView.payPension);
			$("#updateEmployee").val(resp.payView.payEmployee);
			$("#updateIncometax").val(resp.payView.payIncometax);
			$("#updateLocalIncometax").val(resp.payView.payLocalIncometax);
			$("#updateModal").modal();
		},error:function(xhr){
			console.log(xhr.status);
		}
	});
});

$("#updateSumBtn").on("click", function(){
	$("#updateSum").val(
				 parseInt($("#updateBase").val())
				+parseInt($("#updatePlus").val())
				+parseInt($("#updateMeal").val())
				-parseInt($("#updateHealth").val())
				-parseInt($("#updatePension").val())
				-parseInt($("#updateEmployee").val())
				-parseInt($("#updateIncometax").val())
				-parseInt($("#updateLocalIncometax").val())
	);
});

// $("#payInsertBtn").on("click", function(){
// 	let insertForm = $("#insertForm");
// 	let payVal = parseInt($("#basePaySel option:selected").val());
// 	let baseVal = parseInt(payVal);
// 	let plusVal = parseInt(payVal/100*4);
// 	let mealVal = parseInt(payVal/100*3);
// 	let healthVal =parseInt(payVal/100*3.43);
// 	let pensionVal =parseInt(payVal/100*4.5);
// 	let empVal = parseInt(payVal/100*0.8);
// 	let incomeVal = parseInt(payVal/100*2);
// 	let localIncomeVal = parseInt((payVal/10*2)/10);
	
// 	 $("#payBase").val(baseVal);
// 	 $("#payPlus").val(plusVal);
// 	 $("#payMeal").val(mealVal);
// 	 $("#payHealth").val(healthVal);
// 	 $("#payPension").val(pensionVal);
// 	 $("#payEmployee").val(empVal);
// 	 $("#payIncometax").val(incomeVal);
// 	 $("#payLocalIncometax").val(localIncomeVal);
// 	insertForm.submit();
// });
 
 $("#insertModalPayBtn").on("click", function(){
	 let insertForm = $("#insertForm");
	 $.ajax({
			url:"${cPath }/office/payment/paySum.do"
			,data : insertForm.serialize()
			,method : "post"
			,success : function(resp){
				if(resp.message){
					getNoty(resp);
					
					return;
				}
				
			},error:function(xhr){
				console.log(xhr.status);
			}
		});
// 	 let payVal = parseInt($("#basePaySel option:selected").val());
// 	 let baseVal = parseInt(payVal);
// 	 let plusVal = parseInt(payVal/100*4);
// 	 let mealVal = parseInt(payVal/100*3);
// 	 let healthVal =parseInt(payVal/100*3.43);
// 	 let pensionVal =parseInt(payVal/100*4.5);
// 	 let empVal = parseInt(payVal/100*0.8);
// 	 let incomeVal = parseInt(payVal/100*2);
// 	 let localIncomeVal = parseInt((payVal/10*2)/10);
	 
// 	 $("#payBase").val(comma(baseVal));
// 	 $("#payPlus").val(comma(plusVal));
// 	 $("#payMeal").val(comma(mealVal));
// 	 $("#payHealth").val(comma(healthVal));
// 	 $("#payPension").val(comma(pensionVal));
// 	 $("#payEmployee").val(comma(empVal));
// 	 $("#payIncometax").val(comma(incomeVal));
// 	 $("#payLocalIncometax").val(comma(localIncomeVal));
	
// 	 let sumVal = $("#paySum").val(comma(baseVal+plusVal+mealVal-healthVal-pensionVal-empVal-incomeVal-localIncomeVal));
 });
 
$("select[name=empNameSel]").change(function(){
	  var idx = $("#empNameSel option").index( $("#empNameSel option:selected") );
	  $("#empIdSel option").eq(idx).prop("selected", true);
	  $("#basePaySel option").eq(idx).prop("selected", true);
});
 
 function comma(number){
	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 }
 
 
//모달 닫으면 값 초기화 
$('.modal').on('hidden.bs.modal', function (e) {
	  $(this).find('form')[0].reset()
});

$("#payUpdateBtn").on("click", function(){
	let updateForm = $("#updateForm");
	$.ajax({
		url:"${cPath }/office/payment/payForMonthUpdate.do"
		,data : updateForm.serialize()
		,method : "post"
		,success : function(resp){
			$('#updateModal').modal("hide");
			location.reload();
		},error:function(xhr){
			console.log(xhr.status);
		}
	});
});

$("#deleteBtn").on("click", function(){
	
	let confirmChk = confirm("급여자료를 삭제하시겠습니까?");
	
	if(confirmChk){
		$("#deleteForm").submit();
	}else{
		return;
	}
});

$("#resetBtn").on("click", function() {
	// input 박스 비우도록
	let inputs = $(this).parents("div#inputUI").find(":input[name]");
	$(inputs).each(function(index, input){
		let name = $(this).attr("name");
		let value = $(this).val(null);
	});

	// select 박스 첫번째 옵션이 선택되도록
	let selects = $("div#inputUI .searchSelect"); 
	$(selects).each(function(index, select) {
		$(select).children(":eq(0)").prop("selected", true);
	});

	syncFormWithUI(inputs);
});

var insertPayDelIdx = new Array();
//=== 급여내역 등록/수정을 위한 모달창에서 직원 검색
$("#searchEmpBtn").on("click", function(){
	
	let selSize = insertPayDelIdx.length;
	for(var i=0; i<selSize; i++){
		$("#insertModalEmpSearch option:eq('"+insertPayDelIdx[i]+"'"+")").show();
	}
		insertPayDelIdx  = new Array();
	
	//검색 입력값 
	let searchVal = $("#insertEmpSearch").val();

	//검색 대상 selectBox의 전체 option 수
	let wholeSelSize = $("#insertModalEmpSearch option").length;
	
// 	console.log(selSize);
	for(var i=0; i<wholeSelSize ; i++){
	 	if($("#insertModalEmpSearch option:eq('"+i+"'"+")").text().indexOf(searchVal) == -1) {
	 		console.log($("#insertModalEmpSearch option:eq('"+i+"'"+")").val());
	 		console.log($("#insertModalEmpSearch option:eq('"+i+"'"+")").text());
	 		insertPayDelIdx.push($("#insertModalEmpSearch option").index($("#insertModalEmpSearch option:eq('"+i+"'"+")")));
	 		$("#insertModalEmpSearch option:eq('"+i+"'"+")").hide();
	 	}
	}
	
	console.log(insertPayDelIdx);
});


$("#insertPayEmpResetBtn").on("click", function(){
	let selSize = insertPayDelIdx.length;
	for(var i=0; i<selSize; i++){
		$("#insertModalEmpSearch option:eq('"+insertPayDelIdx[i]+"'"+")").show();
	}
		insertPayDelIdx  = new Array();
		
		$("#insertEmpSearch").val("");
});

$("#insertModalEmpSearch").on("click", function(){
	let selectedMemId = $("#insertModalEmpSearch option:selected").val();
	console.log(selectedMemId);
	let seletedVal = $("#insertModalEmpSearch option:selected").text();
	console.log(seletedVal);
	
	 $("#insertModalempName").val(seletedVal);
	 $("#insertModalmemId").val(selectedMemId);
});


$(function(){

var flag = "<c:out value='${flag}'/>"; 
console.log(flag);
if(flag == 'N'){
	$( '#payLawDiv' ).show();
	$('#mainTb thead, #mainTb tbody').find(".hideEle").hide();
	$( '#mainTbDiv' ).removeClass( 'col-sm-12' );
	$( '#mainTbDiv' ).addClass( 'col-sm-7' );
	$( '#flag' ).val('N');
	$( '#showLawDivBtn' ).show();
	$( '#hideLawDivBtn' ).hide();
}else{
	$( '#payLawDiv' ).hide();
	$('#mainTb thead, #mainTb tbody').find(".hideEle").show();
	$( '#mainTbDiv' ).removeClass( 'col-sm-7' );
	$( '#mainTbDiv' ).addClass( 'col-sm-12' );
	$( '#flag' ).val('Y');
	$( '#hideLawDivBtn' ).show();
	$( '#showLawDivBtn' ).hide();
}	
});

$("#showLawDivBtn").on("click", function(){
	$( '#payLawDiv' ).hide();
	$('#mainTb thead, #mainTb tbody').find(".hideEle").show();
	$( '#mainTbDiv' ).removeClass( 'col-sm-7' );
	$( '#mainTbDiv' ).addClass( 'col-sm-12' );
	$( '#flag' ).val('Y');
	$( '#hideLawDivBtn' ).show();
	$(this).hide();
	
});

$("#hideLawDivBtn").on("click", function(){
	$( '#payLawDiv' ).show();
	$('#mainTb thead, #mainTb tbody').find(".hideEle").hide();
	$( '#mainTbDiv' ).removeClass( 'col-sm-12' );
	$( '#mainTbDiv' ).addClass( 'col-sm-7' );
	$( '#flag' ).val('N');
	$( '#showLawDivBtn' ).show();
	$(this).hide();
});


</script>
