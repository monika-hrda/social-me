<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="${pageContext.request.contextPath}/css/styling.css" type="text/css" rel="stylesheet">
	</head>
	
	<body>
			
		<h3>Profile Posts:</h3>
		
		<table>
		<s:iterator value="profileUserPosts">
			<tr>
				<td>
				From: <s:property value="byUser.firstName"/>&nbsp;<s:property value="byUser.lastName"/>
				</td>
				<td>
				On: <s:date name="createdTime" format="dd/MM/yyyy hh:mm a" />
				</td>
			</tr>
			<tr>
				<td>
				"<s:property value="postText"/>"
				</td>
			</tr>
		</s:iterator>
		</table>
		
	</body>
</html>