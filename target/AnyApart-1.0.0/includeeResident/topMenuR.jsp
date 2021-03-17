<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<style type="text/css">
.counter-content{
	margin-left: 100px;
}
.counter-text{
	font-size: 1.2em;
	padding-left: 20px;
	color: black;
}
</style>    
 <div class="header-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-1 col-md-2 col-sm-2 col-xs-12" style="width: 16%; height: 10%;">
                <div class="logo">
                    <a href="${pageContext.request.contextPath}/resident"><img src="${pageContext.request.contextPath}/images/residentLogo.png"  alt=""></a>
                </div>
            </div>
            <div class="col-lg-9 col-md-10 col-sm-8 col-xs-12">
            
            <!-- 메뉴(대분류) -->
                <div class="navigation-wrapper">
<!--                     <div id="navigation" onclick="checkTarget()"> -->
                    <div id="navigation" >
                        <ul>
                            <li class="active"><a href="#">관리비</a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/resident/maintenanceCost/feeView.do">관리비 조회</a></li>
                                    <li><a href="#" id="d">관리비 납부</a>
		                                <ul>
		                                    <li><a href="${pageContext.request.contextPath}/resident/maintenanceCost/feePayment.do">이번달 관리비 납부</a></li>
		                                    <li><a href="${pageContext.request.contextPath}/resident/maintenanceCost/paymentView.do">납부내역 조회</a></li>
		                                </ul>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="#">에너지 조회</a> 
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/resident/energy/energyView.do">에너지 조회</a></li>
                                </ul>
                            </li>
                            <li class="has-sub"><a href="#">차량관리</a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/resident/car/residentCar.do">내 차량 관리</a></li>
                                </ul>
                            </li>
                            <li class="has-sub"><a href="#">생활지원</a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/resident/support/afterServiceList.do">수리신청</a></li>
                                    <li><a href="${pageContext.request.contextPath}/resident/support/remodelingList.do">리모델링 신고</a></li>
                                </ul>
                            </li>
                            <li class="has-sub"><a href="#">입주민 공간</a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/resident/space/boardList.do">자유게시판</a></li>
                                    <li><a href="${pageContext.request.contextPath}/resident/officeQna/officeQnaList.do">문의하기</a></li>
                                </ul>
                            </li>
                            <li class="has-sub"><a href="#">알림마당</a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/resident/notice/noticeList.do">공지사항</a></li>
                                    <li><a href="${pageContext.request.contextPath}/resident/notice/apartNewsList.do">아파트 소식</a></li>
                                </ul>
                            </li>
                            <li class="has-sub"><a href="#">커뮤니티센터</a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/resident/community/reservation.do">시설예약</a></li>
                                    <li><a href="${pageContext.request.contextPath}/resident/community/myReservation.do"">나의 예약조회</a></li>
                                </ul>
                            </li>
                        </ul>
                            
                    </div>
                </div>
                <diV class="navigation-wrapper" id="navigation">
                    <ul >
          			<security:authorize access="isAuthenticated()">
                   		<security:authentication property="principal" var="principal" />
                   		<c:set var="authMember" value="${principal.realMember }" />
                   		<li class="has-sub"><a class="me-2 link-primary" href="${pageContext.request.contextPath }/mypage.do">${authMember.memNick }${principal.authorities}</a></li>
                   		<li class="has-sub"><a href="${cPath }/login/logout.do" class="link-success">로그아웃</a></li>
                   	</security:authorize>
                   	<security:authorize access="isAnonymous()">
                   		<li class="has-sub"><a href="${cPath }/login">로그인</a></li>
                   	</security:authorize>
                   	</ul>
                </diV>
            </div>
        </div>
    </div>
</div>
<div id="indexDiv">
<div class="space-small bg-default" id="menuDiv">
    <div class="counter-block">
        <div class="counter-content">
            <span class="counter-title" style="padding-left: 400px" id="residentTitle">여기부분 수정</span>
            <span class="counter-text"id="residentSubTitle">리모델링 신고</span></div>
    </div>
</div>
</div>
<%--a태그 클릭하면 그 text가져와서 뿌리도록 --%>
<script>
// console.log($("#d").text());

</script>
