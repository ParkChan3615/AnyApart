<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath }/js/digitalmarketing/css/bootstrap.min.css" rel="stylesheet">
<!-- Style CSS -->
<link href="${pageContext.request.contextPath }/js/digitalmarketing/css/style.css" rel="stylesheet">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
<!-- FontAwesome CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/digitalmarketing/css/fontello.css">
<link href="${pageContext.request.contextPath }/js/digitalmarketing/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/js/digitalmarketing/css/owl.carousel.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/js/digitalmarketing/css/owl.theme.default.css" rel="stylesheet">

<!-- 이경륜: jquery, ajaxForm, asyncForm 추가 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/asyncForm.js"></script>
<!-- 이경륜: jquery 관련파일 끝 -->

<!-- 이경륜: noty 추가 -->
<link rel="stylesheet" href="${cPath }/js/noty-3.1.4/noty.css">
<script type="text/javascript" src="${cPath }/js/noty-3.1.4/noty.min.js"></script>
<!-- 이경륜: noty 끝 -->

<!-- 이경륜: jquery validator 추가 -->
<script type="text/javascript" src="${cPath }/js/jquery-validation-1.19.2/jquery.validate.min.js"></script>
<script type="text/javascript" src="${cPath }/js/jquery-validation-1.19.2/additional-methods.min.js"></script>
<script type="text/javascript" src="${cPath }/js/jquery-validation-1.19.2/localization/messages_ko.min.js"></script>
<!-- 이경륜: jquery validator 끝 -->

<!-- 이경륜: 공통 js 함수 -->
<script type="text/javascript" src="${cPath }/js/anyapartUtil.js"></script>
<!-- 이경륜: 공통js 함수 끝 -->


<!-- 박찬: 입주민 홈페이지  -->
	<link rel="shortcut icon" type="image/x-icon" href="../ico/ico.ico">
	<link rel="apple-touch-icon" href="../ico/ico.ico">
	
	<link rel="stylesheet" type="text/css" href="${cPath }/css/resident/maincss/theartpixel.css">
	<link rel="stylesheet" type="text/css" href="${cPath }/css/resident/maincss/menu.css">
	
	<link rel="stylesheet" type="text/css" href="${cPath }/css/resident/maincss/motion.css">
	<link rel="stylesheet" href="${cPath }/css/resident/maincss/swiper.min.css">

<!--제이쿼리 설치 CDN-->
	<script src="${cPath }/js/resident/min.js"></script>
	<script type="text/javascript" charset="UTF-8" src="${cPath }/js/resident/gnb-main.js"></script>
	<script type="text/javascript" charset="UTF-8" src="${cPath }/js/resident/gnb-main2.js"></script>
	<script src="${cPath }/js/resident/global.js"></script>
	<script src="${cPath }/js/resident/app.js"></script>
	<script src="${cPath }/js/resident/tm.min.js" type="text/javascript" charset="utf-8"></script>
<!-- 박찬: 입주민 홈페이지  end-->


<!-- 박찬: chartJs 시작-->
<script src="${pageContext.request.contextPath }/js/chartjs/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/js/chartjs/Chart.min.js"></script>
<!-- 박찬: chartJs 끝-->

<script type="text/javascript">
	// 이경륜: 별도 js파일에서 cPath 사용하기 위한 함수
	$.getContextPath = function(){
		return "${cPath }";
	}
	// 이경륜: jquery validator 사용시 한국어 나오게 하는 설정..이 잘 안되서 우선 ko로 위에서 로딩시킴
// 	const language = "${pageContext.response.locale.language }";
// 	if(language != "en")
// 	$.getScript($.getContextPath()+`/js/jquery-validation-1.19.2/localization/messages_\${language}.min.js`);
</script>

<style type="text/css">
.residentContent{
	padding-top: 50px;
	padding-left: 200px;
	padding-right: 200px;
}	
.content-container{
	padding-top: 50px;
	padding-left: 200px;
	padding-right: 200px;
}
</style>