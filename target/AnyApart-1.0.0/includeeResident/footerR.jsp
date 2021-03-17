<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- footer close -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath }/js/digitalmarketing/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/digitalmarketing/js/menumaker.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/digitalmarketing/js/jquery.sticky.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/digitalmarketing/js/sticky-header.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/digitalmarketing/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/digitalmarketing/js/slider.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" crossorigin="anonymous"></script>

<style>
#footer{
	background-color: #FBFAF8;
	padding-top: 15px;
	margin-bottom: 0px;
	padding-bottom: 0px;
}
.col-lg-3 col-md-3 col-sm-3 col-xs-12{
	height: 150px;
}
.footer-title{
	margin-bottom: 25px;
	color: #F8A998;
}
.footer-widget ul {
    margin-bottom: 0px;
}
.footer-widget ul li {
    margin-bottom: 15px;
}
</style>

<div class="footer" id="footer">
<div class="container">
		<div class="row">
			<!-- footer-useful links-start -->
			<div class=" col-lg-3 col-md-3 col-sm-3 col-xs-12">
				<div class="footer-widget">
					<h3 class="footer-title">Quick Links</h3>
					<ul>
						<li><a href="#">Home </a></li>
						<li><a href="#">About us </a></li>
						<li><a href="#">Practice Area </a></li>
					</ul>
				</div>
			</div>
			<!-- footer-useful links-close -->
			<!-- footer-contactinfo-start -->
			<div class=" col-lg-4 col-md-4 col-sm-4 col-xs-12">
				<div class="footer-widget">
					<h3 class="footer-title">24 X 7 Support</h3>
					<div class="">
						<ul>
							<li><i class="fa fa-map-marker"></i>대전 중구 
							<li><i class="fa fa-phone"></i>042-123-4567</li>
							<li><i class="fa fa-envelope"></i>info@education.com</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- footer-contactinfo-close -->
			<!-- footer-about-start -->
			<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
				<div class="footer-widget" style="margin-left: 50px;">
					<h3 class="footer-title">관련 사이트</h3>
					<div class="">
						<ul>
							<li><i class="glyphicon glyphicon-cloud"></i><a href="${cPath}/vendor">벤더사이트</a></li>
							<li><i class="glyphicon glyphicon-user"></i><a href="${cPath}/office">관리사무소 사이트</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	