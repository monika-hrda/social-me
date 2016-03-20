<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="${pageContext.request.contextPath}/css/styling.css" type="text/css" rel="stylesheet">
		<title>SocialMe | Search Results</title>
	</head>
	
	<body>
		
		<s:include value="common/header.jsp" />
				
		<h3>Search Results</h3>
		
		<table>
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Id</th>
				<th> </th>
			</tr>
			<s:iterator value="foundUsers">
				<s:url action="showProfile" var="showProfileLink">
					<s:param name="userId" value="%{userId}" />
				</s:url>
				<tr>
					<td>
					<s:a href="%{showProfileLink}"><s:property value="firstName"/>&nbsp;<s:property value="lastName"/></s:a>
					</td>
					<td><s:property value="email"/></td>
					<td><s:property value="userId"/></td>
					<td><s:form action="befriend" method="post"><s:submit value="Add Friend" /></s:form></td>
				</tr>
			</s:iterator>
		</table>
		
		<s:include value="common/footer.jsp" />
		
	</body>
</html>