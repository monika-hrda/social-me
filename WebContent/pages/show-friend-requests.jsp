<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-bootstrap-tags" prefix="sb" %>
<!DOCTYPE html>

<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
		<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
		<link href="${pageContext.request.contextPath}/css/socialme.css" type="text/css" rel="stylesheet" />
		
		<!-- The order is important.  jquery must be before <sb:head/> which adds bootstrap script tags -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		<sb:head/>
		
		<title>SocialMe | Friend Requests</title>
	</head>
	
	<body>
		<div id="page">
		
			<s:include value="common/header.jsp" />
		
			<section id="body" class="container">
			
				<section id="sidebar" role="navigation" class="col-md-2">
					<s:include value="common/profileMenu.jsp" />
				</section>
				
				<section id="main" class="col-md-10">
					
					<div class="page-header">
						<h3>
							<s:property value="profileUser.firstName" />&nbsp;<s:property value="profileUser.lastName" />
							<small> - Friend Requests</small>
						</h3>
					</div>
					
					<h4>Friend Requests (<s:property value="numberOfFriendRequests"/>):</h4>
					
					<s:if test="%{friendRequests.isEmpty()}">
						<em>You have no friend requests.</em><br/>
					</s:if>
					
					<s:else>
					<table>
						<tr>
							<th>FriendshipId</th>
							<th>UserId</th>
							<th>Name</th>
							<th>Requested on</th>
						</tr>
						
						<s:iterator value="friendRequests">
						
							<s:url action="showProfile" var="showProfileLink">
								<s:param name="profileId" value="%{friendRequester.userId}" />
							</s:url>
							<s:url action="acceptFriend" var="acceptFriendLink">
								<s:param name="requestedFriendshipId" value="%{friendshipId}" />
							</s:url>
							<s:url action="rejectFriend" var="rejectFriendLink">
								<s:param name="requestedFriendshipId" value="%{friendshipId}" />
							</s:url>
							
							<tr>
								<td><s:property value="friendshipId"/></td>
								<td><s:property value="friendRequester.userId"/></td>
								<td>
									<s:a href="%{showProfileLink}"><s:property value="friendRequester.firstName"/>&nbsp;<s:property value="friendRequester.lastName"/></s:a>
								</td>
								<td>
									<s:date name="requestTime" format="dd/MM/yyyy hh:mm a" nice="true" />
								</td>
								<td>
									<s:a href="%{acceptFriendLink}">Accept</s:a>
								</td>
								<td>
									<s:a href="%{rejectFriendLink}">Reject</s:a>
								</td>
							</tr>
							
						</s:iterator>
					</table>
					</s:else>
					
				</section>
				
			</section>
		
			<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>