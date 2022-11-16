<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title><tiles:insertAttribute name="title"/></title>
	<style>
	body{
		margin:0px;
		padding:0px;
	}
	
	#container {
		padding:0px;
		margin:0px;
	}

	#header{
		padding:0px;
	} 

	#content{
		margin: auto;
		margin-bottom:30px;
	}
	
	#footer{
		clear: both;
	
	}
	</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div id="content">
			<tiles:insertAttribute name="body"/>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
</body>
</html>