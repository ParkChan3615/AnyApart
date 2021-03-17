<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
table{
	width: 100%;
}
th{
	width: 80px;
	text-align: center;
	background-color: #EBF4F1;
}
td{
	width: 120px;
}
p{
	font-size: 1.5em;
}
</style>
<p>등록된 차량수 : 1대</p><br>
<table class="table">
	<tbody>
  		<tr>
  			<th>세대정보</th>
  			<td>대덕아트힐 405동 1062호</td>
  			<th>세대주</th>
  			<td>이경륜</td>
  		</tr>
  		<tr>
  			<th>차종</th>
  			<td>벤츠</td>
  			<th>차량번호</th>
  			<td>가 154-4250</td>
  		</tr>
  		<tr>
  			<th>등록일</th>
  			<td colspan="3">2018-02-16</td>
  		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td><input type="button" id="insertBtn" value="등록" class="btn btn-secondary"></td>
		</tr>
	</tfoot>
</table>

<script type="text/javascript">
	$("#insertBtn").on("click", function(){
		location.href="${pageContext.request.contextPath}/resident/car/registRCar.do";
	});
</script>