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
		<title>SocialMe | Login</title>
	</head>
	
	<body>
		<div id="page">
	
		<s:include value="common/header.jsp" />
		
			<section id="body" class="container">
			
				<h3>SocialMe Login</h3>
				
				<s:form action="login" method="post">
					<s:textfield name="email" label="Email" />
					<s:password name="pwd" label="Password" />
					<s:submit value="Login" />
				</s:form>
				
				<h3>Don't have an account yet? <a href="<s:url action="signup"/>">Register here.</a></h3>
		
			</section>
		
		<s:include value="common/footer.jsp" />
		</div>
	</body>
</html>