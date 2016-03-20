<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="${pageContext.request.contextPath}/css/styling.css" type="text/css" rel="stylesheet">
		<title>Welcome to SocialMe</title>
	</head>
	
	<body>
		<s:include value="common/header.jsp" />
		
		<div><h4>PROFILE PAGE</h4></div>
		
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
		
		<s:include value="common/footer.jsp" />
		
	</body>
</html>