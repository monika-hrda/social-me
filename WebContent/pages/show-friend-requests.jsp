<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="${pageContext.request.contextPath}/css/styling.css" type="text/css" rel="stylesheet">
		<title>SocialMe | Friend Requests</title>
	</head>

	<body>
		
		<s:include value="common/header.jsp" />
				
		<h3>Friend Requests (<s:property value="numberOfFriendRequests"/>):</h3>
		
		<table>
			<tr>
				<th>FriendshipId</th>
				<th>UserId</th>
				<th>Name</th>
			</tr>
			<s:iterator value="friendRequests">
				<s:url action="showProfile" var="showProfileLink">
					<s:param name="userId" value="%{friendRequester.userId}" />
				</s:url>
				<tr>
					<td><s:property value="friendshipId"/></td>
					<td><s:property value="friendRequester.userId"/></td>
					<td>
						<s:a href="%{showProfileLink}"><s:property value="friendRequester.firstName"/>&nbsp;<s:property value="friendRequester.lastName"/></s:a>
					</td>
				</tr>
			</s:iterator>
		</table>
		
		<s:include value="common/footer.jsp" />
		
	</body>
</html>