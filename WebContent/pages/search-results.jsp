<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-bootstrap-tags" prefix="sb" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
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
		<sj:head/>
		<sb:head/>
		
		<title>SocialMe | Search Results</title>
	</head>
	
	<body>
		<div id="page">
		
			<s:include value="common/header.jsp" />
		
			<section id="body" class="container">
				
				<div id="custom-page-header">
					<h4 class="text-center">Search Results</h4>
				</div>
				
				<div id="main">
					<s:if test="%{foundUsers.isEmpty()}">
						<span class="col-md-4"></span>
						<span class="col-md-8"><em>No results. Try to broaden your search criteria.</em><br/></span>
					</s:if>
					
					<s:else>
					<div class="col-md-10 col-md-offset-1 panel panel-default">
					<table class="table">
						<tr>
							<th> </th>
							<th> </th>
							<th>Name</th>
							<th>Email</th>
							<th> </th>
						</tr>
						
						<s:iterator value="foundUsersFriends">
						
							<s:url action="showProfile" var="showProfileLink">
								<s:param name="profileId" value="%{userId}" />
							</s:url>
							
							<tr>
								<td></td>
								<td>
									<s:if test="%{profileImageFilenameThumb != null}">
										<img class="profile-pic-small" 
											 src="${pageContext.request.contextPath}/<s:property value='profileImageFilenameThumb' />" />
									</s:if>
									<s:else>
										<img class="profile-pic-small" 
											 src="${pageContext.request.contextPath}/images/HeadSilhouette.png" />
									</s:else>
								</td>
								<td>
									<s:a href="%{showProfileLink}"><s:property value="firstName"/>&nbsp;<s:property value="lastName"/></s:a>
								</td>
								<td><s:property value="email"/></td>
								<td>
									<s:if test="%{#session.LOGGEDINUSER.userId != userId}">
										<strong class="btn btn-primary disabled" role="button">Friend</strong>
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
								<td></td>
								<td>
									<s:if test="%{key.profileImageFilenameThumb != null}">
										<img class="profile-pic-small" 
											 src="${pageContext.request.contextPath}/<s:property value='key.profileImageFilenameThumb' />" />
									</s:if>
									<s:else>
										<img class="profile-pic-small" 
											 src="${pageContext.request.contextPath}/images/HeadSilhouette.png" />
									</s:else>
								</td>
								<td>
									<s:a href="%{showProfileLink}"><s:property value="key.firstName"/>&nbsp;<s:property value="key.lastName"/></s:a>
								</td>
								<td></td>
								<td>
									<s:a href="%{acceptFriendLink}" class="btn btn-success" role="button">Accept</s:a>
									<span></span>
									<s:a href="%{rejectFriendLink}" class="btn btn-danger" role="button">Reject</s:a>
								</td>
							</tr>
							
						</s:iterator>
						
						<s:iterator value="foundUsersResponders">
						
							<s:url action="showProfile" var="showProfileLink">
								<s:param name="profileId" value="%{userId}" />
							</s:url>
							
							<tr>
								<td></td>
								<td>
									<s:if test="%{profileImageFilenameThumb != null}">
										<img class="profile-pic-small" 
											 src="${pageContext.request.contextPath}/<s:property value='profileImageFilenameThumb' />" />
									</s:if>
									<s:else>
										<img class="profile-pic-small" 
											 src="${pageContext.request.contextPath}/images/HeadSilhouette.png" />
									</s:else>
								</td>
								<td>
									<s:a href="%{showProfileLink}"><s:property value="firstName"/>&nbsp;<s:property value="lastName"/></s:a>
								</td>
								<td></td>
								<td>
									<strong class="btn btn-primary disabled" role="button">Friend request sent</strong>			
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
								<td></td>
								<td>
									<s:if test="%{profileImageFilenameThumb != null}">
										<img class="profile-pic-small" 
											 src="${pageContext.request.contextPath}/<s:property value='profileImageFilenameThumb' />" />
									</s:if>
									<s:else>
										<img class="profile-pic-small" 
											 src="${pageContext.request.contextPath}/images/HeadSilhouette.png" />
									</s:else>
								</td>
								<td>
									<s:a href="%{showProfileLink}"><s:property value="firstName"/>&nbsp;<s:property value="lastName"/></s:a>
								</td>
								<td></td>
								<td>
									<div id="ajaxResults">
									<sj:a cssClass="btn btn-primary" role="button" href="%{requestFriendLink}" targets="ajaxResults">Add Friend</sj:a>
									</div>	
								</td>
							</tr>
							
						</s:iterator>
					</table>
					</div>
					</s:else>
				</div>
			</section>
		
		<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>