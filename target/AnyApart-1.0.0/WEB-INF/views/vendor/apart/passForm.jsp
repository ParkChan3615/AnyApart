<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	
	input[type=password] {font-family:'Malgun gothic', dotum, sans-serif;}

</style>
<div class="container col-sm-5 mt-3">
<br>
<h2><strong>관리자 확인</strong></h2>
<br>
</div>
 <form method="post">
	<div class="container col-sm-5 card-header card-footer" style='margin-bottom: 5pt;'>
		  <div class="row mb-4 ml-4 ">
			    <label for="department" class="col-sm-3 col-form-label text-center">비밀번호 확인</label>
			    <div class="col-sm-6">
			      <input type="password" class="form-control" name="memPass" id="memPass" required maxlength="12" pattern="^(?=.*[0-9]+)(?=.*[a-z]+)(?=.*[A-Z]+).{5,12}$">
			    </div>
			   <button class="btn btn-dark">확인</button>
		  </div>
<!-- 		  <div class="d-flex justify-content-end"> -->
<!-- 		  </div> -->
 	</div>
</form>
