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
		<title>SocialMe | Registration Successful</title>
	</head>
	
	<body>
		<div id="page">
		
		<s:include value="common/header.jsp" />
		
			<section id="body" class="container">
				
				<h3>Welcome <s:property value="firstName" /></h3>
				<h3>Thank you for registering with SocialMe.</h3>
		 		<h3>Your id is <s:property value="userId" /></h3>
				<h3>Your email is <s:property value="email" /></h3>
				<h3>Your password is <s:property value="pwd" /></h3>
				
				<p> You can now <a href="<s:url action="search"/>">search</a> for your friends on SocialMe. </p>
				
				<h3><a href="<s:url action="logout"/>">Log out</a></h3>
		
			</section>
		
		<s:include value="common/footer.jsp" />		
		</div>
	</body>
</html>