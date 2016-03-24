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
		
		<s:if test="%{foundUsers.isEmpty()}">
			<em>No results. Try to broaden your search criteria.</em><br/>
		</s:if>
		
		<s:else>
		<table>
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Id</th>
				<th> </th>
			</tr>
			
			<s:iterator value="foundUsersFriends">
			
				<s:url action="showProfile" var="showProfileLink">
					<s:param name="userId" value="%{userId}" />
				</s:url>
				
				<tr>
					<td>
						<s:a href="%{showProfileLink}"><s:property value="firstName"/>&nbsp;<s:property value="lastName"/></s:a>
					</td>
					<td><s:property value="email"/></td>
					<td><s:property value="userId"/></td>
					<td>
						<s:if test="%{#session.LOGGEDINUSER.userId != userId}">
							<strong>Friends</strong>
						</s:if>				
					</td>
				</tr>
				
			</s:iterator>
			
			<s:iterator value="foundUsersRequestersMap">
			
				<s:url action="showProfile" var="showProfileLink">
					<s:param name="userId" value="%{key.userId}" />
				</s:url>
				<s:url action="acceptFriend" var="acceptFriendLink">
					<s:param name="requestedFriendshipId" value="%{value}" />
				</s:url>
				<s:url action="rejectFriend" var="rejectFriendLink">
					<s:param name="requestedFriendshipId" value="%{value}" />
				</s:url>
				
				<tr>
					<td>
						<s:a href="%{showProfileLink}"><s:property value="key.firstName"/>&nbsp;<s:property value="key.lastName"/></s:a>
					</td>
					<td><s:property value="key.email"/></td>
					<td><s:property value="key.userId"/></td>
					<td>
						<s:a href="%{acceptFriendLink}">Accept</s:a>
					</td>
					<td>
						<s:a href="%{rejectFriendLink}">Reject</s:a>
					</td>
				</tr>
				
			</s:iterator>
			
			<s:iterator value="foundUsersResponders">
			
				<s:url action="showProfile" var="showProfileLink">
					<s:param name="userId" value="%{userId}" />
				</s:url>
				
				<tr>
					<td>
						<s:a href="%{showProfileLink}"><s:property value="firstName"/>&nbsp;<s:property value="lastName"/></s:a>
					</td>
					<td><s:property value="email"/></td>
					<td><s:property value="userId"/></td>
					<td>
						<strong>Awaits Response</strong>			
					</td>
				</tr>
				
			</s:iterator>
			
			<s:iterator value="foundUsersNoRelationship">
			
				<s:url action="showProfile" var="showProfileLink">
					<s:param name="userId" value="%{userId}" />
				</s:url>
				<s:url action="requestFriend" var="requestFriendLink">
					<s:param name="addFriendUserId" value="%{userId}" />
				</s:url>
				
				<tr>
					<td>
						<s:a href="%{showProfileLink}"><s:property value="firstName"/>&nbsp;<s:property value="lastName"/></s:a>
					</td>
					<td><s:property value="email"/></td>
					<td><s:property value="userId"/></td>
					<td>
						<s:a href="%{requestFriendLink}">Add Friend</s:a>			
					</td>
				</tr>
				
			</s:iterator>
		</table>
		</s:else>
		
		<s:include value="common/footer.jsp" />
		
	</body>
</html>