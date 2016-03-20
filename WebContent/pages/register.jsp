<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="${pageContext.request.contextPath}/css/styling.css" type="text/css" rel="stylesheet">
		<title>SocialMe | Register</title>
	</head>
	
	<body>
		
		<s:include value="common/header.jsp" />
		
		<h3>Register to start making friends on SocialMe</h3>
		
		<s:form action="register" method="post">
			<s:textfield name="firstName" label="First Name" />
			<s:textfield name="lastName" label="Last Name" />
			<s:textfield name="email" label="Email" />
			<s:password name="pwd" label="Password" />
			<%-- <s:radio list="{'male','female'}" name="gender" /> --%>
			
			<s:submit value="Register" />
		</s:form>
		
		<s:include value="common/footer.jsp" />
		
	</body>
</html>