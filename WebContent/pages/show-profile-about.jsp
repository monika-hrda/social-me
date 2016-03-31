<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-bootstrap-tags" prefix="sb" %>
<!DOCTYPE html>

<html lang="en">
	<head>
		<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
		<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->		
		<sb:head/>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="${pageContext.request.contextPath}/css/socialme.css" type="text/css" rel="stylesheet" />
		<title>SocialMe | About</title>
	</head>
	
	<body>
		<div id="page">
		
		<s:include value="common/header.jsp" />
		
			<section id="body" class="container">
		
				<h3>
					<s:property value="profileUser.firstName" />&nbsp;<s:property value="profileUser.lastName" />
					<small> - About</small>
				</h3>
				
				<s:push value="profileUser">		
		 			<div>Id: <s:property value="userId" /></div>
					<div>Email: <s:property value="email" /></div>
					<div>Password: <s:property value="pwd" /></div>
				</s:push>
				
				<s:include value="common/footer.jsp" />
				
			</section>
		
		</div>
	</body>
</html>