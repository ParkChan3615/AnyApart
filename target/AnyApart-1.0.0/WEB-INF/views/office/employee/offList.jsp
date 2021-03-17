<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 2. 2.      이미정      최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal" var="principal" />
<c:set var="authMember" value="${principal.realMember }" />
<c:set var="pagingVO" value="${paginationInfo.pagingVO }" />

<style>
	#viewBtn, #deleteBtn{
		font-size:14px;
		width: 50px;
		height: 30px; 
		margin: 2px;
		line-height: 10px;
	}
	
	#searchDiv{ 
		margin-left:10px; 
	} 
</style>

<div class="container">
	<br>
	<h4><strong>휴가일수 계산</strong></h4>
	<br>
	
	<form id="searchForm">
		<input type="hidden" name="searchVO.searchAptCode" value="${authMember.aptCode}">
		<input type="hidden" name="page" />
		<input type="hidden" name="offCode" value="${pagingVO.searchDetail.offCode }"/>
		<input type="hidden" name="searchOffS" value="${pagingVO.searchDetail.searchOffS }"/>
		<input type="hidden" name="searchOffE" value="${pagingVO.searchDetail.searchOffE }"/>
	</form>
	<div class="col-md-12 " style="border-style:outset;border-radius: 8px;">
		  <div class="row g-0" id="searchDiv">
			    <div class="col-md-2" style="margin-top:20px;">
			      <img src="${pageContext.request.contextPath}/images/searchIcon.png" alt="searchIcon"
			        style="width:30px;height:30px;margin-left:10px;margin-top:10px;">&nbsp;&nbsp;<strong>검색 조건</strong>
			    </div>
			    <div id="inputUI" class="col-md-12 mb-2">
			    <form class="form-inline">
				      <div class="card-body ">
				        	&nbsp;&nbsp;휴가분류&nbsp;&nbsp;
				        	<select class="custom-select col-md-2 searchSelect" id="offCode" name="offCode">
				        		<option value="">전체</option>
			        			<c:forEach items="${offSelectList }" var="off" varStatus="vs">
									<c:if test="${not empty off.codeId }">
										<option value="${off.codeId }" ${pagingVO.searchDetail.offCode eq off.codeId ? 'selected':''}>"${off.codeName }"</option>
									</c:if>
								</c:forEach>
				        	</select> 
					       	&nbsp;&nbsp; 휴가시작일&nbsp;&nbsp;
					       	<input type="date" id="searchOffS" name="searchOffS" class="form-control col-md-3" value="${pagingVO.searchDetail.searchOffS }"> 
					       	&nbsp;&nbsp; 휴가종료일&nbsp;&nbsp;
					       	<input type="date" id="searchOffE" name="searchOffE" class="form-control col-md-3" value="${pagingVO.searchDetail.searchOffE }"> 
							 <button class="btn btn-dark" style='margin:5pt;'>검색</button>
							 <button class="btn btn-secondary" id="resetBtn">초기화</button>
					  </div>
			      </form>
			    </div>
		  </div>
	</div>
	<br>
	<div class="d-flex justify-content-end">
   		 <div class="d-flex justify-content-end"><button class="btn btn-dark" style='margin:5pt;' data-toggle="modal" data-target="#offInsertModal">휴가신청</button></div>
	</div>
	  <div class="text-center col-sm-12">
		  <table class="table table-bordered table-hover">
			  <thead class="thead-light">
			    <tr>
			      <th>No</th>
			      <th>휴가분류</th>
			      <th>사용자코드</th>
			      <th>직책</th>
			      <th>이름</th>
			      <th>시작일</th>
			      <th>종료일</th>
			      <th>내용</th>
			      <th></th>
			    </tr>
			  </thead>
			  <tbody>
			     <c:set var="OffList" value="${pagingVO.dataList }" />
			  	<c:if test="${not empty OffList }">
			  		<c:forEach items = "${OffList }" var="off">
			  			<tr>
<%-- 			  				<c:url value="/office/employeeInfoView.do?memId=${employee.memId }" var="viewURL" /> --%>
				     		  <td>${off.offNo }</td>
				     		  <td>${off.codeVO.codeName}</td>
				     		  <td>${off.memId }</td>
				     		  <td>${off.position.positionName }</td>
				     		  <td>${off.employee.empName }</td>
				     		  <td>${off.offStart }</td>
				     		  <td>${off.offEnd }</td>
				     		  <td>${off.offContent }</td>
				     		  <td>
				     		  	  <input type="hidden" class="form-control" name="offNo" value="${off.offNo }"/>
					     		  <input type="button" name="viewBtn" id="viewBtn" class="btn btn-primary" value="수정">
					     		  <form id="deleteForm" action="${cPath}/office/employee/offDelete.do" method="GET">
					     			  <input type="button" class="btn btn-primary" id="deleteBtn" name="deleteBtn" value="삭제">
					     			  <input type="hidden" name="offNo" value="${off.offNo}">
					     		  </form>
				     		  </td>
						<tr>
					</c:forEach>
				</c:if>			
				<c:if test="${empty OffList }">
					<tr>
						<td colspan="8">검색 조건에 맞는 직원이 없습니다.</td>
					</tr>
				</c:if>			
			  </tbody>
		</table>
	</div>
	<div id="pagingArea">
		<ui:pagination paginationInfo="${paginationInfo }" jsFunction="pageLinkMove" type="bsOffice"/>
	</div>
</div>

<!-- 휴가 신청 모달 -->
<div class="modal" id="offInsertModal">
  <div class="modal-dialog modal-md">
    <div class="modal-content">

	      <div class="modal-header">
	        <p class="modal-title">- 휴가 신청</p>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <div class="modal-body" >
				<div>
					<form id="insertForm" action="${cPath }/office/employee/offInsert.do" method="POST">
					 <table class="table table-bordered text-center">
					    <tbody>
					      <tr>
					        <td class="align-middle">직원이름
					        </td>
					        <td>
						        <select id="empSel" name="memId" class="custom-select ">
						      	    <c:forEach items="${empSelectList }" var="empSel">
										<option value="${empSel.member.memId}">${empSel.empName }(${empSel.position.positionName })</option>
									</c:forEach>
								</select>
<!-- 						     	<select id="memId" name="memId"> -->
<%-- 						      	    <c:forEach items="${empSelectList }" var="empSel"> --%>
<%-- 										<option>${empSel.member.memId }</option> --%>
<%-- 									</c:forEach> --%>
<!-- 								</select> -->
							</td>
					      </tr>
					      <tr>
					        <td class="align-middle">휴가종류
						     </td>
					        <td>
						        <select id="offSel" name="offCode" class="custom-select ">
						      	    <c:forEach items="${offSelectList }" var="offSel">
										<option value="${offSel.codeId }">${offSel.codeName }</option>
									</c:forEach>
								</select>
<!-- 								<select id="offCode" name="offCode"> -->
<%-- 						      	    <c:forEach items="${offSelectList }" var="offSel"> --%>
<%-- 										<option>${offSel.codeId }</option> --%>
<%-- 									</c:forEach> --%>
<!-- 								</select> -->
							</td>
					      </tr>
					      <tr>
					      	<td>
					      	 시작일 
					      	 </td>
					        <td>
					      	 <input type="date" id="offStart" class="form-control" name="offStart" value="" required/>
		   					 <form:errors path="offStart" element="span" cssClass="error"/>
					      	</td>
					      </tr>	
					      <tr>
					      	<td>
					      	 종료일
					      	 </td>
					        <td>
					      	  <input type="date" id="offEnd" class="form-control" name="offEnd" value="" required/>
		   					 <form:errors path="offEnd" element="span" cssClass="error"/>
					      	</td>
					      	</tr>	
					      <tr>
					      	<td>
					      	 사유 
					      	 </td>
					        <td>
					      	 <input type="text" required id="offContent" class="form-control" name="offContent" value="" required/>
		   					 <form:errors path="offContent" element="span" cssClass="error"/>
					      	</td>
					      </tr>
					    </tbody>
					  </table>
					  </form>
				</div>
	      </div>
	      
	      <div class="modal-footer">
	        <input type="button" class="btn btn-dark" value="등록" id="insertBtn">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	      </div>
      	</div>
    </div>
 </div>
<!-- 모달 끝 -->


<!-- 휴가 수정 모달 -->
<div class="modal" id="offUpdateModal">
  <div class="modal-dialog modal-md">
    <div class="modal-content">

	      <div class="modal-header">
	        <p class="modal-title">- 휴가신청내역 수정</p>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
		<form id="updateForm" action="${cPath }/office/employee/offUpdate.do" method="POST">
	      <div class="modal-body" >
				<div>
					 <table class="table table-bordered text-center">
					    <tbody>
					      <tr>
					        <td class="align-middle">직원이름
					        </td>
					        <td>
						        <select id="updateEmpSel" name="memId" class="custom-select " disabled>
						      	    <c:forEach items="${empSelectList }" var="empSel">
										<option value="${empSel.member.memId }" >${empSel.empName }(${empSel.position.positionName })</option >
									</c:forEach>
								</select>
<!-- 						     	<select id="memId" name="memId"> -->
<%-- 						      	    <c:forEach items="${empSelectList }" var="empSel"> --%>
<%-- 										<option>${empSel.member.memId }</option> --%>
<%-- 									</c:forEach> --%>
<!-- 								</select> -->
							</td>
					      </tr>
					      <tr>
					        <td class="align-middle">휴가종류
						     </td>
					        <td>
						        <select id="updateOffSel" class="custom-select" name="offCode">
						      	    <c:forEach items="${offSelectList }" var="offSel">
										<option value="${offSel.codeId }">${offSel.codeName }</option>
									</c:forEach>
								</select>
<!-- 								<select id="updateOffCode" name="offCode"> -->
<%-- 						      	    <c:forEach items="${offSelectList }" var="offSel"> --%>
<%-- 										<option>${offSel.codeId }</option> --%>
<%-- 									</c:forEach> --%>
<!-- 								</select> -->
							</td>
					      </tr>
					      <tr>
					      	<td>
					      	 시작일 
					      	 </td>
					        <td>
					      	 <input type="date" id="updateOffStart" name="offStart" class="form-control" value="" required/>
		   					 <form:errors path="updateOffStart" element="span" cssClass="error"/>
					      	</td>
					      </tr>	
					      <tr>
					      	<td>
					      	 종료일
					      	 </td>
					        <td>
					      	  <input type="date" id="updateOffEnd" name="offEnd" class="form-control" value="" required/>
		   					 <form:errors path="updateOffEnd" element="span" cssClass="error"/>
					      	</td>
					      	</tr>	
					      <tr>
					      	<td>
					      	 사유 
					      	 </td>
					        <td>
					      	 <input type="text" class="form-control" id="updateOffContent" required name="offContent" value="" maxlength="800" required/>
		   					 <form:errors path="updateOffContent" element="span" cssClass="error"/>
					      	</td>
					      </tr>
					    </tbody>
					  </table>
				</div>
	      </div>
	      <div class="modal-footer">
	        <input type="hidden" class="form-control" id="updateOffNo" name="offNo" value=""/>
	        <input type="button" class="btn btn-dark" value="수정" id="updateBtn">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	      </div>
		</form>
      	</div>
    </div>
 </div>
<!-- 모달 끝 -->

<script>
$("#insertBtn").on("click", function(){
	$("#insertForm").submit();
});

$(":button[name=viewBtn]").on("click", function(){
	$.ajax({
		url:"${cPath }/office/employee/offView.do"
		,data : { "offNo":$(this).parent().children().val()}
		,success : function(resp){
			$("#updateOffNo").val(resp.offView.offNo);
			$("#updateEmpSel").val(resp.offView.employee.memId);
			$("#updateOffSel").val(resp.offView.offCode);
			$("#updateOffStart").val(resp.offView.offStart);
			$("#updateOffEnd").val(resp.offView.offEnd);
			$("#updateOffContent").val(resp.offView.offContent);
			$("#offUpdateModal").modal();
		},error:function(xhr){
			console.log(xhr.status);
		}
	});
});

$("#updateBtn").on("click", function(){
	let updateForm = $("#updateForm");
	
	$.ajax({
		url:"${cPath }/office/employee/offUpdate.do"
		,data : updateForm.serialize()
		,method : "post"
		,success : function(resp){
			if(resp.message){
				getNoty(resp);
				
				return;
			}
			$('#updateModal').modal("hide");
			location.reload();
		},error:function(xhr){
			console.log(xhr.status);
		}
	});
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

const validateOptions = {
        onsubmit:true
        ,onfocusout:function(element, event){
           return this.element(element);
        }
        ,errorPlacement: function(error, element) {
//            error.appendTo( $(element).parents("div:first") );
			element.tooltip({
				title: error.text()
				, placement: "right"
				, trigger: "manual"
				, delay: { show: 500, hid: 100 }
			}).on("shown.bs.tooltip", function() {
				let tag = $(this);
				setTimeout(() => {
					tag.tooltip("hide");
				}, 3000)
			}).tooltip('show');
          }
        
  }
  
$("#insertForm").validate(validateOptions);
  
$("#updateForm").validate(validateOptions);

$("#deleteBtn").on("click", function(){
	let comfirmChk = confirm("삭제하시겠습니까?");
	
	if(comfirmChk){
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

</script>
