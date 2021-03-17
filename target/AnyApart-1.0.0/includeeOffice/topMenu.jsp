<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 1. 27.  박정민      최초작성
* 2021. 2. 18.  이경륜      안쓰는 search box 주석처리함
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!------------------------------  상단메뉴 ---------------------------------->

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark ">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/office" id="apartName">대덕아트힐</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
<!--         <div class="input-group"> -->
<!--             <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" /> -->
<!--             <div class="input-group-append"> -->
<!--                 <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button> -->
<!--             </div> -->
<!--         </div> -->
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">Settings</a>
                <a class="dropdown-item" href="#">Activity Log</a>
                <div class="dropdown-divider"></div>
                <security:authorize access="isAuthenticated()">
                    	<security:authentication property="principal" var="principal" />
                    	<c:set var="authMember" value="${principal.realMember }" />
                    	<a class="dropdown-item me-2 link-primary" href="${pageContext.request.contextPath }/mypage.do">${authMember.memNick }${principal.authorities}</a>
                    	<a href="${cPath }/login/logout.do" class="dropdown-item link-success">로그아웃</a>
                    </security:authorize>
                    <security:authorize access="isAnonymous()">
                    	<a class="dropdown-item" href="${cPath }/login">로그인</a>
                    </security:authorize>
            </div>
        </li>
    </ul>
</nav>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

<style>
a {
    font-family: 'Nanum Gothic', sans-serif;
	}
</style>
