<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-bootstrap-tags" prefix="sb" %>
<!DOCTYPE html>

<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
		<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
		<link href="${pageContext.request.contextPath}/css/socialme.css" type="text/css" rel="stylesheet" />
		
		<!-- The order is important.  jquery must be before <sb:head/> which adds bootstrap script tags -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		<sb:head/>
		
		<title>SocialMe | Registration Successful</title>
	</head>
	
	<body>
		<div id="page">
		
		<s:include value="common/header.jsp" />
		
			<section id="body" class="container">
				
				<div><h4>Thank you for registering.</h4></div>
				
				<h3>Welcome <s:property value="firstName" /></h3>
				<h3>Thank you for registering with SocialMe.</h3>
		 		<h3>Your id is <s:property value="userId" /></h3>
				<h3>Your email is <s:property value="email" /></h3>
				<h3>Your password is <s:property value="pwd" /></h3>
				
				<p> You can now <a href="<s:url action="showSearch"/>">search</a> for your friends on SocialMe. </p>
				
				<h3><a href="<s:url action="logout"/>">Log out</a></h3>
		
			</section>
		
		<s:include value="common/footer.jsp" />		
		</div>
	</body>
</html>