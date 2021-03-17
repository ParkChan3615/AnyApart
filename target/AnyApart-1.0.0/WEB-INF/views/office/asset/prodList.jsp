<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<br>
	<h4><strong>물품관리</strong></h4>
	<br>
	<div class="container">
	<div class="col-md-12 " style="border-style:outset;border-radius: 8px;">
	    <form id="searchForm" class="form-inline">
	    	<input type="hidden" name="page" />
			<input type="hidden" name="prodCode"/>
			<input type="hidden" name="searchType" value="${pagingVO.searchVO.searchType }"/>
			<input type="hidden" name="searchWord" value="${pagingVO.searchVO.searchWord }"/>
	    </form>
		  <div class="row g-0">
			    <div class="col-md-3" style="margin-top:20px;">
			      <img src="${pageContext.request.contextPath}/images/searchIcon.png" alt="searchIcon"
			        style="width:30px;height:30px;margin-left:10px;margin-top:10px;">&nbsp;&nbsp;<strong>검색 조건</strong>
			    </div>
			    <div id="inputUI" class="col-md-9">
				    <div class="card-body ">
				        	&nbsp;&nbsp;분류선택&nbsp;&nbsp;
				        	<select id="prodCode" name="prodCode" class="custom-select col-md-3 prodCode">
				        		<option value>전체</option>
				        	</select> 
<!-- 				        <div class="col-auto"> -->
<!-- 							<select name="searchType" class="form-control"> -->
<!-- 								<option value>전체</option> -->
<%-- 								<option value="aptName" ${'aptCode' eq param.searchType?"selected":"" }>아파트 이름</option> --%>
<%-- 								<option value="aptHead" ${'aptName' eq param.searchType?"selected":"" }>아파트 관리소장</option> --%>
<%-- 								<option value="aptAdd1" ${'aptAdd1' eq param.searchType?"selected":"" }>주소</option> --%>
<!-- 							</select> -->
<!-- 						</div>	 -->
				    	<input type="text" name="searchWord" class="form-control col-md-6">
<!-- 						<input type="button" class="btn btn-dark" id="searchBtn" style="margin:5pt;" value="검색" /> -->
						<button id="searchBtn" class="btn btn-dark" style='margin:5pt;'>검색</button>
					</div>
			    </div>
		  </div>
	</div>
	</div>
	<br>
	
	
 <div id="pagingArea"></div>

<div align="right" class="mb-2 mr-5">
	<input type="button" class="btn btn-dark" role="alert" value="인쇄">
</div>

 <div class="card text-center col-auto">
	  <div class="card-body row">
		  <div class="col-sm-12">
			<table class="table">
			  <thead class="thead-dark">
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">물품등록번호</th>
			      <th scope="col">물품분류</th>
			      <th scope="col">물품명</th>
			      <th scope="col">가격</th>
			      <th scope="col">제조사</th>
			      <th scope="col">수량</th>
			    </tr>
			  </thead>
			  <tbody id="listBody">

				</tbody>
			</table>
<!-- 			<ul class="pagination justify-content-center"> -->
<!-- 			    <li class="page-item" ><a class="page-link alert alert-secondary" href="#">Previous</a></li> -->
<!-- 			    <li class="page-item"><a class="page-link alert alert-secondary" href="#">1</a></li> -->
<!-- 			    <li class="page-item"><a class="page-link alert alert-secondary" href="#">2</a></li> -->
<!-- 			    <li class="page-item"><a class="page-link alert alert-secondary" href="#">3</a></li> -->
<!-- 			    <li class="page-item"><a class="page-link alert alert-secondary" href="#">Next</a></li> -->
<!-- 			</ul> -->
		</div>	
	</div>
</div>

<div id="insertDiv">
	<div class="container">
		<div class="row">
<!-- 			<div align="right" class="mb-2 mr-5"> -->
<!-- 				<input id="divOnBtn" type="button" class="btn btn-dark" role="alert" value="등록하기"> -->
<!-- 			</div> -->
			<div id="toggleBtn" class="col-md-11">
				<strong>물품등록</strong>
			</div>
		</div>
	</div>
	<div id="toggleDiv" class="card text-center col-auto">
		<form id="insertForm">
		<div class="card-body row">
			<div class="col-sm-12">
				<table class="table table-boardered">
					<colgroup>
						<col style="width: 120px">
						<col style="width: 60px">
						<col style="width: 30px">
						<col style="width: 60px">
						<col style="width: 30px">
						<col style="width: 60px">
					</colgroup>
					<thead class="thead-dark">
						<tr>
							<th scope="col">물품분류코드</th>
							<th scope="col">물품명</th>
							<th scope="col">가격</th>
							<th scope="col">제조사</th>
							<th scope="col">수량</th>
							<th scope="col">추가</th>
						</tr>
					</thead>
					
						<tbody id="insertArea" class="tbody-dark">
<!-- 							<tr> -->
<%-- 								<input type="hidden" name="aptCode" text="${pagingVO.searchVO.searchAptCode }"/> --%>
<!-- 								<td> -->
<!-- 									<select name="prodCode" class="custom-select md-6"> -->
<!-- 					        			<option value>전체</option> -->
<!-- 					        		</select> -->
<!-- 								</td> -->
<!-- 								<td><input name="prodName" size="12" type="text"></td> -->
<!-- 								<td><input name="prodPrice" size="12" type="number" min="0" max="9999999999"></td> -->
<!-- 								<td><input name="prodCompany" size="12" type="text"></td> -->
<!-- 								<td><input name="prodQty" size="12" type="number" min="0" max="9999999999"></td> -->
<!-- 								<td class="last now"><span class="btn btn-primary plusBtn">+</span><span class='btn btn-danger minusBtn'>-</span></td> -->
<!-- 							</tr> -->
							<tr>
								<td>
									<input type="hidden" name="prodList[0].aptCode" value="${pagingVO.searchVO.searchAptCode }"/>
									<select name="prodList[0].prodCode" class="custom-select md-6 prodCode">
					        			<option value>전체</option>
					        		</select>
								</td>
								<td><input name="prodList[0].prodName" size="12" type="text"></td>
								<td><input name="prodList[0].prodPrice" size="12" type="number" min="0" max="9999999999"></td>
								<td><input name="prodList[0].prodCompany" size="12" type="text"></td>
								<td><input name="prodList[0].prodQty" size="12" type="number" min="0" max="9999999999"></td>
								<td class="last now"><span class="btn btn-primary plusBtn">+</span><span class='btn btn-danger minusBtn'>-</span></td>
							</tr>
						</tbody>
				</table>
			</div>
		</div>
		</form>
		<div class="col-md-1">
			<input id="submitBtn" type="button" class="btn btn-dark" role="alert" value="저장"
				style="width: 100px;">
		</div>
	</div>
</div>

<!-- <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#repairInsertModal">수리이력등록</button> -->
<!-- 물품 상세 보기 모달 -->
<div class="modal fade" id="prodViewModal" tabindex="-1" aria-labelledby="prodViewModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-dialog-scrollable modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="prodViewModalLabel">물품 상세 정보</h3>
			</div>
			<div class="modal-body">
				<table id="viewBody" class="table">
					<tr>
						<th><span class="reddot">* </span>물품코드</th>
						<td id="viewId">
							
						</td>
						<td><span class="reddot">* </span>물품분류</td>
						<td id="viewCode">
							
						</td>
					</tr>
					<tr>
						<th><span class="reddot">* </span>물품명</th>
						<td id="viewName">
							
						</td>
						<td><span class="reddot">* </span>제조사/구매처</td>
						<td id="viewCompany">
							
						</td>
					</tr>
					<tr>
						<th><span class="reddot">* </span>가격</th>
						<td id="viewPrice">
							
						</td>
						<td><span class="reddot">* </span>수량</td>
						<td id="viewQty">
							
						</td>
					</tr>
				</table>
				<div>
					<strong style="color: green">구매/사용 내역</strong>
					<table id="detailBody" class="table">
						
					</table>
					<hr>
					<strong class="repairBody" style="color: green">수리 이력</strong>
					<table id="repairBody" class="table repairBody">
						
					</table>
				</div>
			</div>
			<div class="modal-footer">
<!-- 					<button type="submit" class="btn btn-primary">저장</button> -->
				<button id="submitBtn" class="btn btn-primary">저장</button>
				<button type="reset" class="btn btn-warning" data-bs-dismiss="modal">초기화</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


<script>

let viewBody = $("#viewBody");

let prodViewModal = $("#prodViewModal");

let insertFm;
let data;

$("#submitBtn").on("click",function(){
	insertFm = $("#insertForm");
	data = insertFm.serialize();
	$.ajax({
		url : "${cPath }/office/asset/prod/prodInsert.do"
		, data : data
		, method : "post"
		, success : function(data){
			searchForm.submit();
			toggleDiv.toggle();
			let firstTr = $("#insertArea").children().first();
			firstTr.siblings("tr").detach();
			firstTr.find(":input").val("");
			
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
// 	let clickDiv = $(this).parents("div.input-group");
// 	let newDiv = clickDiv.clone();
// 	let fileTag = newDiv.find("input[type='file']");
// 	fileTag.val("");
// 	clickDiv.after(newDiv);
	
	let clickTr = $(this).parent().parent();
	let newTr = clickTr.clone();
	let childInput = newTr.find(":input");
	let name;
	$(childInput).each(function(idx,element){
		// 각 input 값을 찾아서 name을 변경
		name = parseInt(element.name.substring(9,10));
		name = String(name + 1);
		str = element.name.replaceAt(9, name);
		element.setAttribute("name",str);
	});
	let minus = newTr.find(".minusBtn");
// 	console.log(newTr.find(".minusBtn"));
	$(minus).show();
// 	let lastTr = newTr.children(".last");
// 	console.log(newTr);
// 	console.log($.contains(clickTr, ".minusBtn"));
// 	console.log(lastTr.next()==null);
// 	lastTr.append(
// 			"<span class='btn btn-danger minusBtn'>-</span>"
// 				);
// 	newTr.append(minusTd);
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


//---------------------------------------------------

// let optTag = $("[name='prodCode']");
let optTag = $(".prodCode");
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
							 // EL은 javaBean 규약을 기반으로 움직인다.
			);
		});
		optTag.append(opts);
	},
	error : function(xhr) {
		console.log(xhr);
	}
});

let listBody = $("#listBody");
let viewTr;


let aptCode;


let searchForm = $("#searchForm").ajaxForm({
	// 응답데이터 받아 올수 었어야하기 때문에 resp가 있어야한다.
	// 정작빠진것은 응답데이터를 어떻게 받아오겠다라는 것이 없으니 알아야한다.
	dataType:"json",
	success:function(resp){
		// resp에 pagingVO가 포함
		let prodList = resp.pagingVO.dataList;
		let pagingHTML = resp.pagingVO.pagingHTML;
		aptCode = prodList[0].aptCode;
		let trTags = [];
		if(prodList.length>0){
			// 검색 결과가 있으면
			$(prodList).each(function(idx,prod){
				trTags.push(
					$("<tr>").append(
						$("<td>").text((idx+1) + 5*(resp.pagingVO.currentPage-1))
						, $("<td>").text(prod.prodId)
						, $("<td>").text(prod.prodCode)
						, $("<td>").text(prod.prodName)
						, $("<td>").text(prod.prodPrice)
						, $("<td>").text(prod.prodCompany)
						, $("<td>").text(prod.prodQty)
					).data("prod", prod)		
				);
			});
		}else{
			// 검색 결과가 없으면
			trTags.push(
				$("<tr>").html(
					$("<td colspan='7'>").text("검색 결과 없음.")
				)
			);
		}
		let remainRowCnt = resp.pagingVO.screenSize - trTags.length;
  		for(let i=0; i<remainRowCnt; i++){
  			trTags.push($("<tr>").html($("<td colspan='7'>").html("&nbsp;")));
  		}
		listBody.html(trTags);
		viewTr = $("#listBody").find("tr");
		pagingArea.html(pagingHTML);
// 		searchForm.find(":input[name='page']").val("");
	}
}).submit();


let detailBody = $("#detailBody");
let repairBody = $("#repairBody");
let repairTable = $(".repairBody");

listBody.on("dblclick", viewTr, function(e){
	console.log($(e.target).parent().children().eq(1));
	let prodId = $(e.target).parent().children().eq(1).text();
	searchForm.find("[name=prodId]").val();
	console.log(prodId);
// 	let prod = $(e.target).parent().data("prod");
// 	let prodDate = $.param(prod);
	
// 	location.href = "${cPath }/office/asset/prod/prodView.do?prodId="+prodId;
	
	$.ajax({
		url : "${cPath }/office/asset/prod/prodView.do"
		, data : { prodId : prodId }
// 		, data : prodDate
		, method : "get"
		, dataType : "json"
		, success : function(data){
			
			/*
				여기에 동적으로 만들어 주는 부분 들어가야한다.
			*/
			let viewProd = data.prod;
			let detailList = viewProd.detailList;
			let repairList = viewProd.repairList;
			
			if(viewProd != null){
				$("#viewId").text(viewProd.prodId);
				$("#viewCode").text(viewProd.prodCode);
				$("#viewName").text(viewProd.prodName);
				$("#viewCompany").text(viewProd.prodCompany);
				$("#viewPrice").text(viewProd.prodPrice);
				$("#viewQty").text(viewProd.prodQty);
				
			}
			
			let detailTrTags = [];
			if(detailList.length>0){
				detailTrTags.push(
					$("<tr>").append(
						$("<th>").text("#")
						, $("<th>").text("일자")
						, $("<th>").text("수량")
						, $("<th>").text("구분")
					)
				);
				$(detailList).each(function(idx, detail){
					detailTrTags.push(
						$("<tr>").append(
							$("<td>").text(detail.ioNo)
							, $("<td>").text(detail.prodIoDate)
							, $("<td>").text(detail.prodIoQty)
							, $("<td>").text(detail.prodIo).css("color", detail.prodIo=="구매"?"red":"blue")
						).data("detail", detail)
					);
				});
			}else{
				detailTrTags.push(
					$("<tr>").html(
						$("<td colspan='4'>").text("검색 결과 없음.")
					)		
				);
			}
			
			let repairTrTags = []; 
			if(repairList.length>0 && repairList[0].repairNo != null){
				repairTrTags.push(
					$("<tr>").append(
						$("<th>").text("#")
						, $("<th>").text("일자")
						, $("<th>").text("수리내용")
						, $("<th>").text("수리비")
					)
				);
				$(repairList).each(function(idx, repair){
					repairTrTags.push(
						$("<tr>").append(
							$("<td>").text(repair.repairNo)
							, $("<td>").text(repair.repairDate)
							, $("<td>").text(repair.repairContent)
							, $("<td>").text(repair.repairPrice)
						).data("repair", repair)
					);
				});
				repairTable.show();
			}else{
				repairTrTags.push(
					$("<tr>").html(
						$("<td colspan='4'>").text("검색 결과 없음.")
					)		
				);
				repairTable.hide();
			}
			
			
			detailBody.html(detailTrTags);
			repairBody.html(repairTrTags);
			prodViewModal.modal('show');
		}
		, errors : function(xhr){
			console.log(xhr);
		}
	});
});

let searchBtn = $("#searchBtn").on("click", function(){
	let inputs = $(this).parents("div#inputUI").find(":input[name]");
	$(inputs).each(function(index, input){
		let name = $(this).attr("name");
		let value = $(this).val();
		let hidden = searchForm.find("[name='"+name+"']");
		hidden.val(value);
	});
	searchForm.submit();
});

let pagingArea = $("#pagingArea").on("click", "a" ,function(event){
	event.preventDefault();
	let page = $(this).data("page");
	searchForm.find("[name='page']").val(page);
	searchForm.submit();
	searchForm.find("[name='page']").val("");
	return false;
});

let code = $("#prodCode").on("change", function(){
// 	event.preventDefault();
	let inputs = $(this).parents("div#inputUI").find(":input[name]");
	$(inputs).each(function(index, input){
		let name = $(this).attr("name");
		let value = $(this).val();
		let hidden = searchForm.find("[name='"+name+"']");
		hidden.val(value);
		console.log(value);
		console.log(hidden.val());
	});
	searchForm.submit();
// 	return false;
})
</script>