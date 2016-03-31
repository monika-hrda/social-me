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
		<title>Welcome to SocialMe</title>
	</head>
	
	<body>	
		<div id="page">
		
		<s:include value="common/header.jsp" />
		
			<section id="body" class="container">
		
				<div><h4>Thank you for registering.</h4></div>
				
				<s:push value="user">
					<h3>Profile of user <s:property value="firstName" /></h3>
		 			<h3>User's id is <s:property value="userId" /></h3>
					<h3>User's email is <s:property value="email" /></h3>
					<h3>User's password is <s:property value="pwd" /></h3>
				</s:push>
				
				<%-- testing: --%>
				JSP says your name in session is <s:property value="#session.LOGGEDINUSER.firstName" /> and your email is <s:property value="#session.LOGGEDINUSER.email" />.<br>
				Value of 'user.firstName' is <s:property value="user.firstName" />. <%-- JSP uses the getUser() from ShowProfileAction (or LoginAction) --%><br>
				Value of 'firstName' is <s:property value="firstName" />.
		
			</section>
		
		<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>