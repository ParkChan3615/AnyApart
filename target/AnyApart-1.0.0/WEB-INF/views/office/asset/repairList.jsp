<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<style>
#listDiv{
	width: 90%;
	margin-left: 50px;
}
#insertDiv input {
	border: 0.5px solid #DEE2E6;
	width: 200px;
}

#insertDiv {
	width: 1300px;
	margin-left: 100px;
	margin-top: 80px;
}

#insertDiv td {
	text-align: left;
}
</style>

<br>
<div id="top">
	<h2>
		<strong>수리이력관리</strong>
	</h2>
</div>
<br>
<div class="container">
	<div class="col-md-12 " style="border-style: outset; border-radius: 8px;">
		<form id="searchForm" class="form-inline">
	    	<input type="hidden" name="page" />
			<input type="hidden" name="prodCode"/>
			<input type="hidden" name="prodId"/>
			<input type="hidden" name="startDay"/>
			<input type="hidden" name="endDay"/>
			<input type="hidden" name="searchType" value="${pagingVO.searchVO.searchType }"/>
			<input type="hidden" name="searchWord" value="${pagingVO.searchVO.searchWord }"/>
			<input type="hidden" name="screenSize" value="${pagingVO.screenSize }"/>
	    </form>
		<div class="row g-0">
			<div class="col-md-3" style="margin-top: 20px;">
				<img src="${pageContext.request.contextPath}/images/searchIcon.png" alt="searchIcon"
					style="width: 30px; height: 30px; margin-left: 10px; margin-top: 10px;">&nbsp;&nbsp;<strong>검색조건</strong>
			</div>
			<div id="inputUI" class="col-md-9">
				<form class="form-inline">
					<div class="card-body ">
						&nbsp;&nbsp;분류선택&nbsp;&nbsp;
					 	<select name="prodCode" class="custom-select col-md-3 prodCode prodSearch">
							<option value>전체</option>
						</select>
						&nbsp;&nbsp;물품선택&nbsp;&nbsp;
<!-- 					 	<select id="prodId" name="prodId" class="custom-select col-md-3"> -->
					 	<select name="prodId" class="custom-select col-md-3 prodId prodSearch">
							<option value>전체</option>
						</select>
						&nbsp;&nbsp;수리내용&nbsp;&nbsp;
						<input name="searchWord" type="text" class="form-control col-md-2"> 
						<button id="searchBtn" class="btn btn-dark" style='margin: 5pt;'>검색</button>
						<button id="initBtn" class="btn btn-dark" style='margin: 5pt;'>초기화</button>
					</div>
					<div class="card-body ">
						<input type="date" name="startDay" value="${pagingVO.searchDetail.startDay }"/>
						<input type="date" name="endDay" value="${pagingVO.searchDetail.endDay }"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<br>

<div id="pagingArea"></div>

<div align="right" class="mb-2 mr-5">
	<span style="color: green"><strong> * 더블클릭시 변경폼으로 변경되고 엔터입력시 값이 변경됩니다. </strong></span>
	<select id="screenSize" name="screenSize" class="custom-select col-md-1">
		<option value="10" ${pagingVO.screenSize eq 10 ? "selected":""}>10</option>
		<option value="25" ${pagingVO.screenSize eq 25 ? "selected":""}>25</option>
		<option value="50" ${pagingVO.screenSize eq 50 ? "selected":""}>50</option>
	</select>
	<span>개 씩 보기</span>
	<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#repairInsertModal">수리이력등록</button>
	<input type="button" class="btn btn-dark" role="alert" value="인쇄" style="margin-right: 100px;">
</div>
<div class="table-responsive" id="listDiv">
	<table class="table table-hover">
		<colgroup>
			<col width="10px">
			<col width="140px">
			<col width="80px">
			<col width="50%">
			<col width="80px">
			<col width="10px">
		</colgroup>
		<thead class="thead-light">
			<tr class="text-center">
				<th scope="col">#</th>
				<th scope="col">물품명</th>
				<th scope="col">수리일자</th>
				<th scope="col">수리내용</th>
				<th scope="col">수리비</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody id="listBody">

		</tbody>
	</table>
	<form id="updateFm" method="post" action="">
		<input type="hidden" name="repairNo" required />
		<input type="hidden" name="repairDate" required />
		<input type="hidden" name="repairPrice" max="9999999" min="0" required/>
		<input type="hidden" name="repairContent" required/>
	</form>
</div>



<!-- 입주 등록 모달 -->
<div class="modal fade" id="repairInsertModal" tabindex="-1" aria-labelledby="moveinInsertModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="moveinInsertModalLabel">수리이력등록</h3>
			</div>
			<form:form modelAttribute="repair" id="repairInsertForm" method="post">
				<div class="modal-body">
					<table class="table">
						<tr>
							<td><span class="reddot">* </span>물품분류</td>
							<td>
								<form:select path="prodCode" cssClass="prodCode" >
<%-- 									<form:option value>물품 목록</form:option> --%>
									<option value>분류 목록</option>
								</form:select>
								<form:errors path="prodCode" element="span" cssClass="error"/>
							</td>
						</tr>
						<tr>
							<td><span class="reddot">* </span>물품명</td>
							<td>
								<form:select path="prodId" cssClass="prodId" >
<%-- 									<form:option value>물품 목록</form:option> --%>
									<option value>물품 목록</option>
								</form:select>
								<form:errors path="prodId" element="span" cssClass="error"/>
							</td>
						</tr>
						<tr>
							<td><span class="reddot">* </span>수리일자</td>
							<td>
								<input type="date" name="repairDate" value="${repair.repairDate }" />
								<form:errors path="repairDate" element="span" cssClass="error"/>
							</td>
						</tr>
						<tr>
							<td><span class="reddot">* </span>수리비</td>
							<td>
								<form:input path="repairPrice" required="required" maxlength="10" onkeypress="return onlyNumber(event)"/>
<!-- 								<input type="text" name="ho" required maxlength="4" onkeypress="return onlyNumber(event)"> -->
								원
								<form:errors path="repairPrice" element="span" cssClass="error"/>
							</td>
						</tr>
						<tr>
							<td><span class="reddot">* </span>수리내용</td>
							<td>
								<form:textarea path="repairContent" required="required" maxlength="50"/>
<!-- 								<input type="text" name="resName" required> -->
								<form:errors path="repairContent" element="span" cssClass="error"/>
							</td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
<!-- 					<button type="submit" class="btn btn-primary">저장</button> -->
					<button id="submitBtn" class="btn btn-primary">저장</button>
					<button type="reset" class="btn btn-warning" data-bs-dismiss="modal">초기화</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</form:form>
		</div>
	</div>
</div>


<script>

removeRepair = function(repairNo){
	$.ajax({
		url : "${cPath}/office/asset/repair/repairRemove.do"
		, data : { repairNo : repairNo }
		, method : "post"
		, success : function(){
			searchForm.submit();
		}
		, errors : function(xhr){ console.log(xhr); }
	});
}

let data;

//-----------------------------------------------------------------------------//

let listBody = $("#listBody");

let pagingArea = $("#pagingArea").on("click", "a" ,function(event){
	event.preventDefault();
	let page = $(this).data("page");
	searchForm.find("[name='page']").val(page);
	searchForm.submit();
	searchForm.find("[name='page']").val("");
	return false;
});

let searchForm = $("#searchForm").ajaxForm({
	dataType:"json",
	success:function(resp){
		let rownum = searchForm.find("[name='screenSize']").val();
		let repairList = resp.pagingVO.dataList;
		let pagingHTML = resp.pagingVO.pagingHTML;
// 		aptCode = prodList[0].aptCode;
		let trTags = [];
		if(repairList.length>0){
			$(repairList).each(function(idx,repair){
				trTags.push(
					$("<tr>").append(
// 						$("<td>").text((idx+1) + rownum*(resp.pagingVO.currentPage-1))
						$("<td>").text(resp.pagingVO.totalRecord - rownum*(resp.pagingVO.currentPage-1) - idx)
						, $("<td>").text(repair.prodName).append($("<input>").attr({type:"hidden", name:"repairNo", value: repair.repairNo, required:"required"}).addClass("updateTd"))
						, $("<td>").append($("<span>").text(repair.repairDate)).append($("<input>").attr({type:"date", name:"repairDate", value:repair.repairDate , required:"required"}).addClass("updateTd"))
						, $("<td>").append($("<span>").text(repair.repairContent)).append($("<input>").attr({type:"text", name:"repairContent", value:repair.repairContent , required:"required", maxLength:"50"}).addClass("updateTd"))
						, $("<td>").append($("<span>").text(repair.repairPrice)).append($("<input>").attr({type:"number", name:"repairPrice", value:repair.repairPrice , required:"required" ,min:"0" , max:"100000"}).addClass("updateTd"))
						, $("<td>").append($("<input>").attr({type:"button", value:"삭제", onclick:"removeRepair("+repair.repairNo+")" }).addClass("btn btn-danger"))
					).data("repair", repair)		
				);
			});
		}else{
			// 검색 결과가 없으면
			trTags.push(
				$("<tr>").html(
					$("<td colspan='6'>").text("검색 결과 없음.")
				)
			);
		}
		let remainRowCnt = resp.pagingVO.screenSize - trTags.length;
  		for(let i=0; i<remainRowCnt; i++){
  			trTags.push($("<tr>").html($("<td colspan='7'>").html("&nbsp;")));
  		}
		listBody.html(trTags);
		pagingArea.html(pagingHTML);
// 		searchForm.find(":input[name='page']").val("");
		updateTr = $("#listBody").find(".updateTd").toggle();
	}
}).submit();

//-----------------------------------------------------------------------------//

let insertFm;

$("#submitBtn").on("click",function(){
	event.preventDefault();
	insertFm = $("#repairInsertForm");
	data = insertFm.serialize();
	$.ajax({
		url : "${cPath }/office/asset/repair/repairInsert.do"
		, data : data
		, method : "post"
		, success : function(data){
			if(data.check == "OK"){
				$('#repairInsertModal').find(":input").val("");
				$('#repairInsertModal').modal("hide");
				searchForm.submit();
			}
		}
		, errors : function(xhr){
			console.log(xhr);
		}
	});
	return false;
});

//-----------------------------------------------------------------------------//

let initBtn = $("#initBtn");
initBtn.on("click", function(){
	event.preventDefault();
	$("#inputUI").find(":input").val("");
	$("[name=startDay]").val("");
	$("[name=endDay]").val("");
	return false;
});

//-----------------------------------------------------------------------------//

// let searchForm = $("#searchForm");

$("#searchBtn").on("click", function(event){
	event.preventDefault();
	let inputs = $(this).parents("div#inputUI").find(":input[name]");
	$(inputs).each(function(index, input){
		let name = $(this).attr("name");
		let value = $(this).val();
		let hidden = searchForm.find("[name='"+name+"']");
		hidden.val(value);
	});
	searchForm.submit();
	return false;
});

//-----------------------------------------------------------------------------//


//n개씩 보기
let screenSize = $("#screenSize").on("change",function(){
	let sizeNum = $(this).val();
	let hidden = searchForm.find("[name='screenSize']");
	hidden.val(sizeNum);
	searchForm.submit();
});


//-----------------------------------------------------------------------------//

// let prodIdTag = $("#prodId");
// let prodCodeTag = $("#prodCode");
let prodIdTag = $(".prodId");
let prodCodeTag = $(".prodCode")
let prodCode 
let prodId 

let selectFn1 = function(){
	prodCode = this.value;
	prodId = $(this).parent().find("[name=prodId]");
	prodId.find("option:gt(0)").hide();
	prodId.find("option."+prodCode).show();
	prodId.val("");
	
// 	prodIdTag.find("option:gt(0)").hide();
// 	prodIdTag.find("option."+prodCode).show();
// 	prodIdTag.val(""); 
}
$("#inputUI").find("[name=prodCode]").on("change",selectFn1);
let selectFn2 = function(){
	prodCode = this.value;
	prodId = $(this).parent().parent().parent().find("[name=prodId]");
	prodId.find("option:gt(0)").hide();
	prodId.find("option."+prodCode).show();
	prodId.val("");
}
 
$("#repairInsertForm").find("[name=prodCode]").on("change",selectFn2);

$.ajax({
	url : "${cPath }/prod/getRepairOption.do ",
	method : "get",
	dataType : "json",
	success : function(resp) {
		let codeOpts = [];
		let IdOpts = [];
		// 옵션을 동적으로 구성
		$(resp.prodCodeList).each(function(idx, prodCode){
			codeOpts.push(
				// type을 그대로 유지하기 위해서 prop 를 사용
				$("<option>").text(prodCode.codeName)
							 .attr("value", prodCode.codeId)
							 .prop("selected", "${pagingVO.searchDetail.prodCode}"==prodCode.codeId)
							 // EL은 javaBean 규약을 기반으로 움직인다.
			);
		});
		prodCodeTag.append(codeOpts);
		
		$(resp.prodIdList).each(function(idx, prodId){
			IdOpts.push(
					$("<option>").text(prodId.prodName)
					.attr("value", prodId.prodId)
					.addClass(prodId.prodCode)
					.prop("selected", "${pagingVO.searchDetail.prodId}"==prodId.prodId)
			);
		});
		prodIdTag.append(IdOpts);
		
	},
	error : function(xhr) {
		console.log(xhr);
	}
});

//-----------------------------------------------------------------------------//

let updateFm = $("#updateFm");
let updateTr; 
// = $("#listBody").find(".updateTd");
// updateTr.find(":input").toggle();

$("#listBody").on("dblclick", updateTr , function(e){
	let targetTr = $(event.target);
	let childSpan = targetTr.find("span");
	let childInput = targetTr.find(":input[name]");
	
	childSpan.toggle();
	childInput.toggle();
// 	console.log("none"==childSpan.css("display"));	// 처음 inline, 그다음 none
	
}).on("keypress", updateTr, function(e){
	let targetTr = $(event.target);
	let childSpan = targetTr.find("span");
	let childInput = targetTr.find(":input[name]");
	let inputSet = targetTr.parent().parent().find(":input[name]");
	
	if("none"!=childSpan.css("display") && e.keyCode == 13){
		console.log("하이")
		$(inputSet).each(function(index, input){
			let name = $(this).attr("name");
			let value = $(this).val();
			let hidden = updateFm.find("[name='"+name+"']");
			hidden.val(value);
		});
		data = updateFm.serialize();
		$.ajax({
			url : "${cPath}/office/asset/repair/repairUpdate.do"
			, data : data
			, method : "post"
			, success : function(data){
				searchForm.submit();
			}
			, errors : function(xhr){
				console.log(xhr);
			}
		});	
	}
});
</script>