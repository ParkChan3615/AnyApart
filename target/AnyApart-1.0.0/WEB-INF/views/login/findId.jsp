<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 2. 1.      박지수      최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/asyncForm.js"></script>

<div>
	본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.
</div>
<form id="fm">
	이름<input type="text" name="memName" required/>
	<br>
	이메일<input type="email" name="memEmail" required/>
	<input type="button" value="인증번호 받기" id="numBtn"/>
	<br>
	인증번호 입력 <input type="text" id="certNum" name="certNum" />
	<input type="button" value="다음" id="numChkBtn" />
</form>
<div id="showId">
	
</div>

<script>
	let fm = $("#fm");
	let data;
	let numChkBtn = $("#numChkBtn"); 
	let certNum = $("#certNum");
	let showId = $("#showId");
	
	numChkBtn.attr("disabled", true);
	certNum.attr("disabled", true);
	
	
	$("#numBtn").on("click", function(){
		data = fm.serialize();
		$.ajax({
			url : "${pageContext.request.contextPath}/login/findId/checkMember"
			, data : data
			, method : "post"
			, success : function(data){
				alert(data.message);
			}
			, errors : function(xhr){
				alert(xhr.message);
// 				console.log(xhr);
			}
		});
		numChkBtn.removeAttr("disabled");
		certNum.removeAttr("disabled");
	});
	
	numChkBtn.on("click", function(){
// 		fm.method="post"
// 		fm.action="${pageContext.request.contextPath}/login/findId/checkCert"
// 		fm.serialize();
// 		fm.submit();
		
		data = fm.serialize();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/login/findId/checkCert"
			, data : data
			, method : "post"
			, success : function(data){
				let memId = data.member.memId;
				showId.html(memId);
			}
			, errors : function(xhr){
				console.log(xhr);
				alert("인증번호가 틀렸습니다.");
			}
		});
	});
	
</script>