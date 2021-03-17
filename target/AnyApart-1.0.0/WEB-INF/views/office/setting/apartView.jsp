<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 1. 26.      박지수      최초작성
* 2021. 2. 06.      박지수      컨트롤러 연결
* Copyright (c) 2021 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container col-sm-5 mt-3">
	<br>
	<%-- <h4><strong>${apart. }아파트정보</strong></h4> --%>
	<h4>
		<strong>아파트정보</strong>
	</h4>
	<br>
</div>
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th scope="row">아파트코드</th>
			<td>${apart.aptCode }</td>
		</tr>
		<tr>
			<th scope="row">아파트명</th>
			 <td>${apart.aptName }</td>
		</tr>
		<tr>
			<th scope="row">우편번호</th>
			<td>${apart.aptZip }</td>
		</tr>
		<tr>
			<th scope="row">기본주소</th>
			<td>${apart.aptAdd1 }</td>
		</tr>
		<tr>
			<th scope="row">상세주소</th>
			<td>${apart.aptAdd2 }</td>
		</tr>
		<tr>
			<th scope="row">세대수</th>
			<td>${apart.aptCnt }</td>
		</tr>
		<tr>
			<th scope="row">아파트이미지</th>
			<td>
				<img class="inimg" src="<c:url value='/images/apartImages/${apart.aptImg }' />">
			</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<th scope="row">활성화여부</th> -->
<!-- 			<td></td> -->
<!-- 		</tr> -->
		<tr>
			<th scope="row">난방정책</th>
			<td>${apart.aptHeat }</td>
		</tr>
		<tr>
			<th scope="row">관리사무소 전화번호</th>
			<td>${apart.aptTel }</td>
		</tr>
		<tr>
			<th scope="row">관리소장명</th>
			<td>${apart.aptHead }</td>
		</tr>
		<tr>
			<th scope="row">계약시작일</th>
			<td>${apart.aptStart }</td>
		</tr>
		<tr>
			<th scope="row">계약만료일</th>
			<td>${apart.aptEnd }</td>
		</tr>
		<tr>
			<th scope="row">총 주거면적</th>
			<td>${apart.aptArea }</td>
				</tr>
</thead>
	<tbody>
		<div class="d-flex justify-content-end">
			<button id="homeBtn" class="btn btn-warning" style='margin: 5pt;'
				onclick="">홈으로 가기</button>
			<button id="updateBtn" class="btn btn-dark" style='margin: 5pt;'
				onclick="">아파트 단지 정보 수정하기</button>
		</div>
	</tbody>
</table>
<form id="viewFm"></form>
<script>
	/*
		버튼이 눌렸을때 form에 전송하는 기능 넣기
		action으로 apartForm.do로 보내버리자
		
		뒤로 가기는 어디로 보내지는지 좀 알아야할 것 같다.
	 */
	let fm = $("#viewFm");

	let home = $("#homeBtn").on("click", function() {
		fm.attr("action", "${cPath }/office");
		fm.attr("method", "get");
		fm.submit();
	});
	let update = $("#updateBtn").on("click", function() {
// 		location.href = "${cPath }/office/setting/ApartUpdate.do";
		fm.attr("action", "${cPath }/office/setting/ApartUpdate.do");
		fm.submit();
	});

</script>