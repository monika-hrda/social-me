<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="${pageContext.request.contextPath}/css/styling.css" type="text/css" rel="stylesheet">
		<title>SocialMe | Profile</title>
	</head>
	
	<body>
		<s:include value="common/header.jsp" />
		
		<s:push value="profileUser">
			<div><h4><s:property value="firstName" />&nbsp;<s:property value="lastName" />'s Profile</h4></div>
		
 			<div>Id: <s:property value="userId" /></div>
			<div>Email: <s:property value="email" /></div>
			<div>Password: <s:property value="pwd" /></div>
		</s:push>
		
		<div><h5>Write something..</h5></div>
		<s:form action="createPost" method="post">
			<s:textarea name="postText" rows="5" />
			<s:hidden name="currentProfileUserId" value="%{profileUser.userId}" />
			<s:submit value="Post" />
		</s:form>
		
		<s:include value="common/footer.jsp" />
		
	</body>
</html>