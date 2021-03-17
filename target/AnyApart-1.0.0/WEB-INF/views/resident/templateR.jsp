<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Digital marketing courses website template that can help you boost your business courses website and its completely free.">
    <meta name="keywords" content="seo,free website template, free responsive website template, seo marketing, search engine optimization, web analytics">
    <title>입주민 사이트</title>
		<tiles:insertAttribute name="preScript"/>  
	<style type="text/css">
	/* 	상단 색상 변경 */
		.bg-default{
			background-color: #FDA28F;
		}
		#navigation ul ul li:hover > a, #navigation ul ul li a:hover {
		    color: #fff;
		    background-color: #FB8F78;
		}
		.counter-title {
		    font-weight: 600;
		}
	</style>	
    </head>
    <body>
	<tiles:insertAttribute name="topMenu"/>  
		<!------------------  content  ---------------------------->
		<div class="space-medium">
 				<div class="container">
 					<div class="row" id="rowDiv">
		            <tiles:insertAttribute name="contents"/>  
 					</div>
			</div>
		</div>
           
	<tiles:insertAttribute name="footer"/>
		<!-- 이경륜: noty 띄우기 위한 코드 -->
		<c:if test="${not empty message }">
			<script type="text/javascript">
				new Noty({
					 text:'${message.text }', 
					 layout: '${message.layout }',
					 type: '${message.type }',
					 timeout: ${message.timeout },
					 progressBar: true
				}).show();
			</script>
		</c:if>
		<!-- 이경륜: noty 코드 끝 -->
    </body>
</html>