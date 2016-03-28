<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="${pageContext.request.contextPath}/css/styling.css" type="text/css" rel="stylesheet">
		<title>SocialMe | About</title>
	</head>
	
	<body>
		<s:include value="common/header.jsp" />
		
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
		
	</body>
</html>