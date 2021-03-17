<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<nav>
    <div id="head">
        <h1><a href="${pageContext.request.contextPath }/vendor"><img alt="" src="${pageContext.request.contextPath }/js/main/img/common/logo.png"></a></h1>
        <div id="gnb">
            <ul id="menu">
                <li><a href="${pageContext.request.contextPath }/vendor">AnyApart</a></li>
                <li><a href="${pageContext.request.contextPath }/vender/apartList.do">관리사무소 회원 관리</a></li>
                <li><a href="${pageContext.request.contextPath }/vendor/noticeList.do">관리사무소 공지사항 관리</a></li>
                <li><a href="${pageContext.request.contextPath }/vendor/qna/qnaList.do">관리사무소 문의글 관리</a></li>
                <security:authorize access="isAuthenticated()">
                   	<security:authentication property="principal" var="principal" />
                   	<c:set var="authMember" value="${principal.realMember }" />
                   	<li data-menuanchor="page3"><a class="me-2 link-primary" href="${pageContext.request.contextPath }/mypage.do">${authMember.memNick }${principal.authorities}</a></li>
                   	<li data-menuanchor="page3"><a href="${cPath }/login/logout.do" class="link-success">로그아웃</a></li>
                </security:authorize>
                <security:authorize access="isAnonymous()">
                	<li data-menuanchor="page3"><a href="${cPath }/login">로그인</a></li>
                </security:authorize>
            </ul>
        </div>
    </div>
</nav>
