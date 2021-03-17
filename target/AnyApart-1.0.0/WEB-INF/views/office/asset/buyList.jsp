<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	width:1300px;
	margin-left: 100px;
	margin-top: 80px;
}

#insertDiv td {
	text-align: center;
}
</style>

<br>
<h4>
	<strong>물품사용/구매이력관리</strong>
</h4>
<br>
<div class="container">
	<div class="col-md-12 " style="border-style: outset; border-radius: 8px;">
		 <form id="searchForm" class="form-inline">
	    	<input type="hidden" name="page" />
			<input type="hidden" name="prodCode"/>
			<input type="hidden" name="prodIo"/>
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
					<div class="card-body ">&nbsp;&nbsp;분류선택&nbsp;&nbsp;
					 	<select id="prodCode" name="prodCode" class="custom-select col-md-3">
							<option value>전체</option>
						</select>
						&nbsp;&nbsp;구매/사용구분&nbsp;&nbsp;
					 	<select id="prodIo" name="prodIo" class="custom-select col-md-3">
							<option value>구분</option>
							<option value="PURCHASE" ${pagingVO.searchDetail.prodIo eq 'PURCHASE' ? "selected":""}>구매</option>
							<option value="USE" ${pagingVO.searchDetail.prodIo eq 'USE' ? "selected":""}>사용</option>
						</select>
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

<div id="pagingArea">${pagingVO.pagingHTML }</div>

<div align="right" class="mb-2 mr-5">
	<span style="color: green"><strong> * 더블클릭시 변경폼으로 변경되고 다시 더블클릭시 값이 변경됩니다. (날짜/수량/내역선택)</strong></span>
	<select id="screenSize" name="screenSize" class="custom-select col-md-1">
		<option value="10" ${pagingVO.screenSize eq 10 ? "selected":""}>10</option>
		<option value="25" ${pagingVO.screenSize eq 25 ? "selected":""}>25</option>
		<option value="50" ${pagingVO.screenSize eq 50 ? "selected":""}>50</option>
	</select>
	<span>개 씩 보기</span>
	<input type="button" class="btn btn-dark" role="alert" value="인쇄" style="margin-right: 100px;">
</div>
<div class="text-center col-sm-12" id="listDiv">
	<table class="table table-bordered">
		<colgroup>
<!-- 			<col width="100px"> -->
			<col width="100px">
			<col width="120px">
			<col width="80px">
			<col width="40px">
			<col width="40px">
			<col width="10px">
		</colgroup>
		<thead class="thead-dark">
			<tr>
<!-- 				<th scope="col">#</th> -->
				<th scope="col">물품등록번호</th>
				<th scope="col">물품명</th>
				<th scope="col">일자</th>
				<th scope="col">수량</th>
				<th scope="col">구분</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody id="listBody">
			<c:set var="detailList" value="${pagingVO.dataList }" />
			<c:if test="${not empty detailList }">
				<c:forEach var="detail" items="${detailList }" varStatus="idx">
						<tr>
<!-- 							<td scope="row">1</td> -->
							<td>
								${detail.prodId }
								<input type="hidden" name="ioNo" value="${detail.ioNo }" required >
							</td>
							<td>${detail.prodName }</td>
							<td class="updateTd">
								<span>${detail.prodIoDate }</span>
								<input type="date" name="prodIoDate" value="${detail.prodIoDate }" required >
							</td>
							<td class="updateTd"><!-- 물품 갯수를 세온것을 max로 한정하는걸 해보면 좋을텐데 아쉽다. -->
								<span>${detail.prodIoQty }</span>
								<input type="number" name="prodIoQty" max="99999" min="1" value="${detail.prodIoQty }" required>
							</td>
							<td class="updateTd">
								<c:if test="${'구매' eq detail.prodIo }">
									<span style="color: red">${detail.prodIo }</span>
								</c:if>
								<c:if test="${'사용' eq detail.prodIo }">
									<span style="color: blue">${detail.prodIo }</span>
								</c:if>
								<select name="prodIo" class="custom-select col-md-9" required>
									<option value>전체</option>
									<option value="PURCHASE" ${'구매' eq detail.prodIo ?"selected":""} >구매</option>
									<option value="USE" ${'사용' eq detail.prodIo ?"selected":""}>사용</option>
								</select>
							</td>
							<td>
								<input type="button" class="btn btn-danger" value="삭제" onclick="removeDetail('${detail.ioNo }')"/>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty detailList}">
					<tr>
						<td colspan="5">검색 결과 없음.</td>
					</tr>
				</c:if>
			
		</tbody>
	</table>
	<form id="updateFm" method="post" action="">
		<input type="hidden" name="ioNo" required />
		<input type="hidden" name="prodIoDate" required />
		<input type="hidden" name="prodIoQty" max="99999" min="1" required/>
		<input type="hidden" name="prodIo" required/>
	</form>
</div>
<div class="container">
	<div class="row">
		<div id="toggleBtn" class="col-md-11">
			<strong class="btn btn-dark">사용/구매이력등록</strong>
		</div>
	</div>
</div>
<div id="insertDiv">
	<div id="toggleDiv" class="card text-center col-auto">
		<form id="insertForm">
		<div class="card-body row">
			<div class="col-sm-12">
				<table class="table table-bordered">
					<tbody class="tbody-dark">
						<thead class="thead-dark">
							<tr>
								<th scope="col">물품선택</th>
								<th scope="col">사용/구매일자</th>
								<th scope="col">사용/구매수량</th>
								<th scope="col">사용/구매구분</th>
								<th scope="col">추가</th>
							</tr>
						</thead>
						<tbody id="insertArea" class="tbody-dark">
							<tr>
								<td>
									<select id="prodId" name="detailList[0].prodId" class="custom-select col-md-12" required>
										<option value>선택하세요</option>
									</select>
								</td>
								<td>
									<input type="date" name="detailList[0].prodIoDate" required >
								</td>
								<td>
									<input type="number" name="detailList[0].prodIoQty" max="99999" min="1" required >
								</td>
								<td>
									<select name="detailList[0].prodIo" class="custom-select col-md-9" required>
										<option value>전체</option>
										<option value="PURCHASE" >구매</option>
										<option value="USE" >사용</option>
									</select>
								</td>
								<td class="last now"><span class="btn btn-primary plusBtn">+</span><span class='btn btn-danger minusBtn'>-</span></td>
							</tr>
						</tbody>
				</table>
			</div>
		</div>
		</form>
		<div class="col-md-1">
			<input id="submitBtn" type="button" class="btn btn-dark" role="alert" value="저장" style="width: 100px;">
		</div>
	</div>
</div>
<script>

// n개씩 보기
let screenSize = $("#screenSize").on("change",function(){
	let sizeNum = $(this).val();
	let hidden = searchForm.find("[name='screenSize']");
	hidden.val(sizeNum);
	searchForm.submit();
});

removeDetail = function(ioNo){
	$.ajax({
		url : "${cPath}/office/asset/buy/buyRemove.do"
		, data : { ioNo : ioNo }
		, method : "post"
		, success : function(){
			searchForm.submit();
		}
		, errors : function(xhr){ console.log(xhr); }
	});
}

//--------------------------------------------------------------------------//

let data;

let updateFm = $("#updateFm");
let updateTr = $("#listBody").find(".updateTd");
updateTr.find(":input").toggle();

updateTr.on("dblclick", function(){
	let childSpan = $(this).find("span");
	let childInput = $(this).find(":input[name]");
// 	let childInput = $(this).find(":input");
	let inputSet = $(this).parent().find(":input[name]");
	childSpan.toggle();
	childInput.toggle();
// 	console.log("none"==childSpan.css("display"));	// 처음 inline, 그다음 none
	if("none"!=childSpan.css("display")){
		$(inputSet).each(function(index, input){
			console.log($(this));
			let name = $(this).attr("name");
			let value = $(this).val();
			let hidden = updateFm.find("[name='"+name+"']");
			hidden.val(value);
		});
		data = updateFm.serialize();
		$.ajax({
			url : "${cPath}/office/asset/buy/buyUpdate.do"
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



//-----------------------------------------------------------------------------//

let prodIdTag = $("#prodId");
$.ajax({
	url : "${cPath }/prod/getProdId.do ",
	method : "get",
	dataType : "json",
	success : function(resp) {
		let opts = [];
		// 옵션을 동적으로 구성
		$(resp.prodId).each(function(idx, opt){
			opts.push(
				// type을 그대로 유지하기 위해서 prop 를 사용
				$("<option>").text(opt.prodName)
							 .attr("value", opt.prodId)
// 							 .prop("selected", "${pagingVO.searchDetail.prodCode}"==opt.prodId)
							 // EL은 javaBean 규약을 기반으로 움직인다.
			);
		});
		prodIdTag.append(opts);
	},
	error : function(xhr) {
		console.log(xhr);
	}
});

//----------------------------------------------------------------------//

let insertFm;

$("#submitBtn").on("click",function(){
	insertFm = $("#insertForm");
	data = insertFm.serialize();
	$.ajax({
		url : "${cPath }/office/asset/buy/buyInsert.do"
		, data : data
		, method : "post"
		, success : function(data){
			if(data.check == "OK"){
				searchForm.submit();
			}
// 			toggleDiv.toggle();
// 			let firstTr = $("#insertArea").children().first();
// 			firstTr.siblings("tr").detach();
// 			firstTr.find(":input").val("");
		}
		, errors : function(xhr){
			console.log(xhr);
		}
	});
});

/*-------------------------------------------------------------------------------------------
등록하기 UI 만들어 주는 부분
*/

String.prototype.replaceAt=function(index, character) {
return this.substr(0, index) + character + this.substr(index+parseInt(character.length));
}

$(".minusBtn").hide();

$("#insertArea").on("click", ".plusBtn", function(){
	let clickTr = $(this).parent().parent();
	let newTr = clickTr.clone();
	let childInput = newTr.find(":input");
	let name;
	$(childInput).each(function(idx,element){
		// 각 input 값을 찾아서 name을 변경
		name = parseInt(element.name.substring(11,12));
		name = String(name + 1);
		str = element.name.replaceAt(11, name);
		element.setAttribute("name",str);
	});
	let minus = newTr.find(".minusBtn");
	$(minus).show();
	let inputTag = newTr.find(":input");
	inputTag.val("");
	clickTr.after(newTr);
	$(this).hide();
	
	newTr.find("input[type=hidden]").val("${pagingVO.searchVO.searchAptCode }");
});

$("#insertArea").on("click", ".minusBtn", function(){
	let deleteTr = $(this).parent().parent();
	deleteTr.prev().find(".plusBtn").show();
	deleteTr.detach();
	
});

let toggleDiv = $("#toggleDiv").toggle();
$("#toggleBtn").on("click", function(){
	toggleDiv.toggle();
});


//---------------------------------------------------

let initBtn = $("#initBtn");
initBtn.on("click", function(){
	event.preventDefault();
	$("#inputUI").find(":input").val("");
	$("[name=startDay]").val("");
	$("[name=endDay]").val("");
	return false;
});

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

// let optTag = $("[name='prodCode']");
let optTag = $("#prodCode");
$.ajax({
	url : "${cPath }/prod/getOption.do ",
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
							 .prop("selected", "${pagingVO.searchDetail.prodCode}"==opt.codeId)
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