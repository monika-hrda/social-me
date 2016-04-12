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
		<script src="${pageContext.request.contextPath}/scripts/bootbox.min.js"></script>
		<script src="${pageContext.request.contextPath}/scripts/siteScripts.js" type="text/javascript"></script>
		<sb:head/>
		
		<title>SocialMe | Friends</title>
	</head>
	
	<body>
		<div id="page">
		
			<s:include value="common/header.jsp" />
			
			<section id="body" class="container">
			
				<section id="profile-header">
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-2">        	
					            <s:if test="%{profileUser.profileImageFilenameThumb != null}">
					            	<a target="_blank" 
									   href="${pageContext.request.contextPath}/<s:property value='profileUser.profileImageFilename' />">
										<img class="profilePicMedium img-thumbnail" 
											 src="${pageContext.request.contextPath}/<s:property value='profileUser.profileImageFilenameThumb' />" />
									</a>
								</s:if>
								<s:else>
									<img class="profilePicMedium img-thumbnail" src="${pageContext.request.contextPath}/images/HeadSilhouette.png" />
								</s:else>
							</div>
							<div class="col-md-8">
								<h3>
									<s:property value="profileUser.firstName" />&nbsp;<s:property value="profileUser.lastName" />
									<small> - Friends (<s:property value="numberOfFriends"/>)</small>
								</h3>
							</div>
						
							<div class="text-right col-md-2">
								<s:if test="%{profileUser.userId == loggedInUser.userId}">								
									<a href="<s:url action="showEditProfile"/>" role="button" class="btn btn-primary">Edit Profile</a>
								</s:if>
								<s:else>
									<s:include value="common/profile-friendship-control.jsp" />
								</s:else>
							</div>
						</div>
					</div>
				</section>
			
				<section id="sidebar" role="navigation" class="col-md-2">
					<div>
						<s:include value="common/profileMenu.jsp" />
					</div>
				</section>
				
				<section id="main" class="col-md-10">
					
					<s:if test="%{profileUserFriends.isEmpty()}">
						<em>You are not connected to anyone on SocialMe. <a href="<s:url action="showSearch"/>">Find friends.</a></em><br/>
					</s:if>
					
					<s:else>
					<div class="list-group">
						<s:iterator value="profileUserFriends">
							<s:url action="showProfile" var="showProfileLink">
								<s:param name="profileId" value="%{userId}" />
							</s:url>
							
							<div class="list-group-item clearfix">
								<div class="col-md-1 col-xs-1">
									<s:if test="%{profileImageFilenameThumb != null}">
										<img class="profile-pic-small" 
											 src="${pageContext.request.contextPath}/<s:property value='profileImageFilenameThumb' />" />
									</s:if>
									<s:else>
										<img class="profile-pic-small" 
											 src="${pageContext.request.contextPath}/images/HeadSilhouette.png" />
									</s:else>
								</div>
								<div class="col-md-11 col-xs-11">
									<s:a href="%{showProfileLink}">
										<s:property value="firstName"/>&nbsp;<s:property value="lastName"/>
									</s:a>
								</div>
							</div>
						</s:iterator>
					</div>
					</s:else>
					
				</section>
		
			</section>
			
			<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>