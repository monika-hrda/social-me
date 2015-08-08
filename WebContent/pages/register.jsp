<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>SocialMe Register</title>
	</head>
	
	<body>
		<h3>Register to start making friends on SocialMe</h3>
		
		<s:form action="register" method="post">
			<s:textfield name="firstName" label="First Name"></s:textfield>
			<s:textfield name="lastName" label="Last Name"></s:textfield>
			<s:textfield name="email" label="Email"></s:textfield>
			<s:password name="pwd" label="Password"></s:password>
			<%-- <s:radio list="{'male','female'}" name="gender"></s:radio> --%>
			
			<s:submit value="Register"></s:submit>
		</s:form>
	</body>
</html>