<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="${pageContext.request.contextPath}/css/styling.css" type="text/css" rel="stylesheet">
		<title>SocialMe | Friends</title>
	</head>
	
	<body>
		
		<s:include value="common/header.jsp" />
		
		<h3>
			<s:property value="profileUser.firstName" />&nbsp;<s:property value="profileUser.lastName" />
			<small> - Friends</small>
		</h3>
		
		<h4>Friends (<s:property value="numberOfFriends"/>):</h4>
		
		<s:if test="%{profileUserFriends.isEmpty()}">
			<em>You are not connected to anyone on SocialMe. <a href="<s:url action="search"/>">Find friends.</a></em><br/>
		</s:if>
		
		<s:else>
		<table>
			<tr>
				<th>Id</th>
				<th>Name</th>
			</tr>
			<s:iterator value="profileUserFriends">
				<s:url action="showProfile" var="showProfileLink">
					<s:param name="profileId" value="%{userId}" />
				</s:url>
				<tr>
					<td><s:property value="userId"/></td>
					<td>
						<s:a href="%{showProfileLink}"><s:property value="firstName"/>&nbsp;<s:property value="lastName"/></s:a>
					</td>
				</tr>
			</s:iterator>
		</table>
		</s:else>
		
		<s:include value="common/footer.jsp" />
		
	</body>
</html>