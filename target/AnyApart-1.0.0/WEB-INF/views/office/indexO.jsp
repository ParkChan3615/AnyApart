<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pagingVO" value="${paginationInfo.pagingVO }" />
<security:authentication property="principal" var="principal" />
<c:set var="authMember" value="${principal.realMember }" />

<style>
	.modal{
		height: 500px;
	}
</style>
<h1 class="mt-4">인덱스</h1>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active">Dashboard</li>
</ol>
<div class="row">
    <div class="col-xl-3 col-md-6">
        <div class="card bg-primary text-white mb-4">
            <div class="card-body">Primary Card</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="#">View Details</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-warning text-white mb-4">
            <div class="card-body">Warning Card</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="#">View Details</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-success text-white mb-4">
            <div class="card-body">Success Card</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="#">View Details</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-danger text-white mb-4">
            <div class="card-body">Danger Card</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="#">View Details</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-chart-area mr-1"></i>
                Area Chart Example
            </div>
            <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
        </div>
    </div>
    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-chart-bar mr-1"></i>
                Bar Chart Example
            </div>
            <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
        </div>
    </div>
</div>

<!-- 이미정 : 결재문서 푸시 알림 모달  -->
 <!-- Button to Open the Modal -->
  <div id="receptionDiv">
	  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#receptionModal">
	     수신 결재문서 확인 모달(숨김)
	  </button>
  </div>

  <!-- The Modal -->
  <div class="modal" id="receptionModal">
    <div class="modal-dialog modal-dialog-centered modal-lg" >
    
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <p class="modal-title">[결재 대기 문서]</p>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
           	<p>- 결재 대기중인 문서가 있습니다.<p>
           	<table class="table text-center">
           		<thead class="thead-light">
           			<tr>
	           			<th width="20%">기안일자</th>
	           			<th width="15%">단위업무</th>
	           			<th width="45%">제목</th>
	           			<th width="20%">작성자</th>
           			</tr>
           		</thead>
           		<tbody id="listBody">
						           		
           		</tbody>
           	 </table>
           	 <div class="d-flex justify-content-end">
	           	 <input type="button" class="btn btn-dark mr-2" value="수신함" id="goReceptionBtn">
	          	 <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
           	 </div>
          </div>
        </div>
      </div>
    </div>
<!-- 결재문서 푸시 알림 모달 끝 -->    
<script>


//== 이미정 : 문서 푸시알림 ========================================================================================
	
	let listBody = $("#listBody");
	let trTags = [];
	let memId='<c:out value="${authMember.memId }"/>';		
	$(function(){
		// 모달 div hide처리
		$("#receptionDiv").hide();
		//결재 대기중인 리스트 조회
		$.ajax({
			url:"${cPath }/office/approval/receptionWaitListView.do"
			//현재 결재자 APP_NOWEMP 컬럼에 memId 담아 전송
			,data : {"appNowemp" : memId }
			,method : "post"
			,success : function(resp){
				if(resp.message){ //실패 
					getNoty(resp);
					return;
				}else{ 			  //성공
					
					let draftList = resp.draftList;

					//문서 리스트 테이블 생성
					if(draftList.length>0){
						$(draftList).each(function(idx, draft){
							let tr = $("<tr>");
							tr.append(
								$("<td>").text(draft.draftDate), //기안일자		
								$("<td>").text(draft.taskCode),  //단위업무
								$("<td>").text(draft.draftTitle).addClass("text-left"), //제목
								$("<td>").text(draft.memId)	//작성자
							);
							trTags.push(tr);
						});
					listBody.html(trTags);
					$('#receptionModal').modal('show');
					
					
					//각 문서별 푸시알림 수신여부를 Y로 변경
					$.ajax({
						url:"${cPath }/office/approval/receptionWaitListUpdate.do"
						,data : {"memId" : memId }
						,method : "post"
						,success : function(resp){
 							if(resp.message){
								getNoty(resp);
							}
						},
						error:function(xhr){
							console.log(xhr.status);
						}
					});
					
					}
				}
			},
			error:function(xhr){
				console.log(xhr.status);
			}
		});
	});

	//수신함 버튼 클릭하면 수신함으로 이동
	$("#goReceptionBtn").on("click", function(){
		location.href="${cPath}/office/approval/receptionList.do";
	});
//== 문서 푸시알림 끝 =================================================================================================
	
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/js/startbootstrap-sb-admin-gh-pages/dist/assets/demo/chart-area-demo.js"></script>
<script src="${pageContext.request.contextPath }/js/startbootstrap-sb-admin-gh-pages/dist/assets/demo/chart-bar-demo.js"></script>                
