<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-bootstrap-tags" prefix="sb" %>
<!DOCTYPE html>

<html lang="en">
	<head>
		<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
		<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->		
		<sb:head/>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>SocialMe | Search Results</title>
	</head>
	
	<body>
		<div id="page">
		
		<s:include value="common/header.jsp" />
		
			<section id="body" class="container">
				
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
							<s:param name="profileId" value="%{userId}" />
						</s:url>
						
						<tr>
							<td>
								<s:a href="%{showProfileLink}"><s:property value="firstName"/>&nbsp;<s:property value="lastName"/></s:a>
							</td>
							<td><s:property value="email"/></td>
							<td><s:property value="userId"/></td>
							<td>
								<s:if test="%{#session.LOGGEDINUSER.userId != userId}">
									<strong>Friend</strong>
								</s:if>				
							</td>
						</tr>
						
					</s:iterator>
					
					<s:iterator value="foundUsersRequestersMap">
					
						<s:url action="showProfile" var="showProfileLink">
							<s:param name="profileId" value="%{key.userId}" />
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
							<s:param name="profileId" value="%{userId}" />
						</s:url>
						
						<tr>
							<td>
								<s:a href="%{showProfileLink}"><s:property value="firstName"/>&nbsp;<s:property value="lastName"/></s:a>
							</td>
							<td><s:property value="email"/></td>
							<td><s:property value="userId"/></td>
							<td>
								<strong>Friend request sent</strong>			
							</td>
						</tr>
						
					</s:iterator>
					
					<s:iterator value="foundUsersNoRelationship">
					
						<s:url action="showProfile" var="showProfileLink">
							<s:param name="profileId" value="%{userId}" />
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
				
			</section>
		
		<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>