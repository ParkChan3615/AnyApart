<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 2. 2.      박지수      최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<div class="inner">
	    <div class="board-list">
	    	<form id="houseForm" action="${cPath }/vendor/houseInsert.do" method="post">
	    		<input type="hidden" id="houseCode" name="houseCode" class="form-control"/>
	    		<input type="hidden" id="aptCode" name="aptCode" class="form-control" value="${aptCode }"/>
				<table class="table table-bordered">
					<tr>
						<th><label for="dong">동</label></th>
						<td>
							<input type="text" id="dong" name="dong" maxlength="4" class="form-control" />
	<!-- 						<form:errors path="aptName" element="span" cssClass="error" /> -->
						</td>
						<th><label for="floor">층</label></th>
						<td>
							<input type="text" id="floor" name="floor" maxlength="2" class="form-control" />
						</td>
						<th><label for="ho">호</label></th>
						<td>
							<input type="text" id="ho" name="ho" maxlength="2" class="form-control" />
						</td>
						<th><label for="area">면적</label></th>
						<td>
							<input type="text" id="houseArea" name="houseArea" maxlength="10" class="form-control" />
						</td>
					</tr>
				</table>
			</form>
			<input type="button" id="createBtn" value="생성하기" class="btn btn-dark"/>	
			<input type="button" id="listBtn" value="조회하기" class="btn btn-dark"/>	
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>동</th>
						<th>호</th>
						<th>면적</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="listBody">
<%-- 					<c:if test="${not empty houseList }"> --%>
<%-- 						<c:forEach var="house" items="${houseList }" > --%>
<!-- 							<tr> -->
<%-- 								<td>${house.dong}</td> --%>
<%-- 								<td>${house.ho}</td> --%>
<%-- 								<td>${house.houseArea}</td> --%>
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<%-- 					</c:if> --%>
				</tbody>
			</table>
			<table id="exTable">
			
			</table>
		</div>
	</div>


<script>
	let aptCode = "${aptCode }";
	
	let listBtn = $("#listBtn");

	$("#listBtn").on("click", function(){
		
		// 아래 비동기 보내는 부분 함수나? 이런거로 만들어서 넣어 두기
		$.ajax({
			url: "${cPath}/vendor/houseList.do"
			, data : {
				what : aptCode
			}		
			, dataType:"json"
			,success:ListFn
			,error:function(xhr){
				console.log(xhr);
			}
		});
	});

	let createBtn = $("#createBtn");
	let listBody = $("#listBody");
	let houseForm = $("#houseForm");
	let dong = $("input[name=dong]");
	let floor = $("#floor");
	let ho = $("#ho");
	let houseArea = $("#houseArea");

	let data;
	
	$("#createBtn").on("click", function(){
// 		dong = $("input[name=dong]").val();
// 		floor = $("#floor").val();
// 		ho = $("#ho").val();
// 		houseArea = $("#houseArea").val();
		
// 		let house = {
// 			aptCode : aptCode
// 			, dong : dong
// 			, floor : floor
// 			, ho : ho
// 			, houseArea : houseArea
// 		}
		data = $("#houseForm").serialize();
		console.log(data);
		
		$.ajax({
			url: "${cPath}/vendor/houseInsert.do"
			, method : "post"
			, data : data
			, dataType : "json"
			, success:ListFn
			, error:function(xhr){
				console.log(xhr);
			}	
		});
// 		ajaxForm
		
	});
	
	let ListFn = function(resp){
		let houseTrTags = [];
		$(resp.houseList).each(function(idx, house){
			houseTrTags.push(
				$("<tr>").append(
					$("<td>").text(house.dong)
					, $("<td>").text(house.ho)
					, $("<td>").text(house.houseArea)
					, $("<input>").attr({type : "button", name : "delete", value : "삭제"})
				).data("house", house)
			);
		});
		listBody.html(houseTrTags);	
// 		$('#exTable').DataTable( {
// 		    data: data
// 		} );
	}
	
	
	listBody.on("click", $("input[name=delete]"), function(event){
						let tr = $(event.target).parent();
						deleteFn(tr);
					});
	
	let deleteFn = function(trTag){
 		let houseCode = trTag.data("house").houseCode;
		$("#houseCode").val(houseCode);
		data = $("#houseForm").serialize();
		$.ajax({
			url : "${cPath }/vendor/houseDelete.do"
			, method : "post"
			, data : data
			, dataType : "json"
			, success : function(resp){
				ListFn;
				trTag.remove();	// 삭제 처리
			}
			, error:function(xhr){
				console.log(xhr);
			}	
		});
	}
 	
	
	/*-------------------------------------------------------------------------------*/
	
	
	
	
	
	
	
	
	
	
	
	
</script>