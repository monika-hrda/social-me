<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="${pageContext.request.contextPath}/css/styling.css" type="text/css" rel="stylesheet">
		<title>SocialMe | Profile Unavailable</title>
	</head>
	
	<body>
		<s:include value="common/header.jsp" />
		
		<h3>
			<s:property value="profileUser.firstName" />&nbsp;<s:property value="profileUser.lastName" />
		</h3>
		
		<div>You are not connected on SocialMe.</div>
		<div>Would you like to add <s:property value="profileUser.firstName" /> as a friend?</div>
		<div>Add Friend</div>
		
		<!-- Needs work! -->
		<!-- Different scenarios - you are to accept/reject friendship request, are waiting for a response, or can add a friend -->
		<!-- There should be no left-side navbar with the simple profile .. this will be solved when Bootstrap is involved -->
		
		<s:include value="common/footer.jsp" />
		
	</body>
</html>