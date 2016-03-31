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
		<title>SocialMe | Register</title>
	</head>
	
	<body>
		<div id="page">
		
		<s:include value="common/header.jsp" />
		
			<section id="body" class="container">
		
				<h3>Register to start making friends on SocialMe</h3>
				
				<s:form action="register" method="post">
					<s:textfield name="firstName" label="First Name" />
					<s:textfield name="lastName" label="Last Name" />
					<s:textfield name="email" label="Email" />
					<s:password name="pwd" label="Password" />
					<%-- <s:radio list="{'male','female'}" name="gender" /> --%>
					
					<s:submit value="Register" />
				</s:form>
		
			</section>
			
		<s:include value="common/footer.jsp" />
		</div>
	</body>
</html>