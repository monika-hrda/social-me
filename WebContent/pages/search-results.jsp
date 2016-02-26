<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Search Results</title>
	</head>
	
	<body>
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
					<s:param name="userId" value="%{userId}"></s:param>
				</s:url>
				<tr>
					<td>
					<s:a href="%{showProfileLink}"><s:property value="firstName"/><s:property value="lastName"/></s:a>
					</td>
					<td><s:property value="email"/></td>
					<td><s:property value="userId"/></td>
					<td><s:form action="befriend" method="post"><s:submit value="Add Friend"></s:submit></s:form></td>
				</tr>
			</s:iterator>
		</table>
	</body>
</html>