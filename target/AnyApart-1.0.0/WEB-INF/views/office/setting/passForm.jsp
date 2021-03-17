<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container col-sm-5 mt-3">
<br>
<h4><strong>본인확인</strong></h4>
<br>
</div>
<div class="container col-sm-5 card-header card-footer">
	 <form method="post">
		  <div class="row mb-4 ml-4">
			    <label for="department" class="col-sm-3 col-form-label ">비밀번호 확인</label>
			    <div class="col-sm-6">
			      <input type="password" class="form-control" id="department" required maxlength="12" pattern="^(?=.*[0-9]+)(?=.*[a-z]+)(?=.*[A-Z]+).{5,12}$">
			    </div>
		  </div>
		  <div class="d-flex justify-content-end">
			   <button class="btn btn-dark" style='margin:5pt;'>확인</button>
		  </div>
	</form>
 </div>
