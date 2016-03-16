<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>SocialMe | Friends</title>
	</head>
	
	<body>
		
		<s:include value="hello-user.jsp" /> <%-- temporary --%>
				
		<h3>Friends (<s:property value="numberOfFriends"/>):</h3>
		
		<table>
			<tr>
				<th>Id</th>
				<th>Name</th>
			</tr>
			<s:iterator value="foundFriends">
				<s:url action="showProfile" var="showProfileLink">
					<s:param name="userId" value="%{userId}" />
				</s:url>
				<tr>
					<td><s:property value="userId"/></td>
					<td>
						<s:a href="%{showProfileLink}"><s:property value="firstName"/>&nbsp;<s:property value="lastName"/></s:a>
					</td>
				</tr>
			</s:iterator>
		</table>
	</body>
</html>