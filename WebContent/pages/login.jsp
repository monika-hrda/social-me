<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>SocialMe Login Page</title>
	</head>
	
	<body>
		<h3>Welcome User, please login below</h3>
		<s:form action="login" method="post">
			<s:textfield name="email" label="Email"></s:textfield>
			<s:textfield name="pwd" label="Password" type="password"></s:textfield>
			<s:submit value="Login"></s:submit>
		</s:form>
		
		<h3>Don't have an account yet? <a href="<s:url action="signup"/>">Register here.</a></h3>
	</body>
</html>