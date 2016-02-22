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
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th> </th>
			</tr>
			<s:iterator value="foundUsers">
				<tr>
					<td><s:property value="firstName"/></td>
					<td><s:property value="lastName"/></td>
					<td><s:property value="email"/></td>
					<td><s:form action="befriend" method="post"><s:submit value="Add Friend"></s:submit></s:form></td>
				</tr>
			</s:iterator>
		</table>
	</body>
</html>