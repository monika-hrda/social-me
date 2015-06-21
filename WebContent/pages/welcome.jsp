<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Welcome to SocialMe</title>
	</head>
	
	<body>
		<h3>Welcome <s:property value="firstName"></s:property></h3>
 		<h3>Your id is <s:property value="userId"></s:property></h3>
		<h3>Your email is <s:property value="email"></s:property></h3>
		<h3>Your password is <s:property value="pwd"></s:property></h3>
		
		<h3><a href="<s:url action="logout"/>">Log out</a></h3>
	</body>
</html>