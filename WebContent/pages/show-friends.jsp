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
		
		<title>SocialMe | Friends</title>
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
							<small> - Friends (<s:property value="numberOfFriends"/>)</small>
						</h3>
					</div>
					
					<s:if test="%{profileUserFriends.isEmpty()}">
						<em>You are not connected to anyone on SocialMe. <a href="<s:url action="showSearch"/>">Find friends.</a></em><br/>
					</s:if>
					
					<s:else>
					<div class="list-group">
						<s:iterator value="profileUserFriends">
							<s:url action="showProfile" var="showProfileLink">
								<s:param name="profileId" value="%{userId}" />
							</s:url>
							
							<div class="list-group-item">
								<s:if test="%{profileImageFilenameThumb != null}">
									<img class="profile-pic-small" 
										 src="${pageContext.request.contextPath}/<s:property value='profileImageFilenameThumb' />" />
								</s:if>
								<s:else>
									<img class="profile-pic-small" 
										 src="${pageContext.request.contextPath}/images/HeadSilhouette.png" />
								</s:else>
								<s:a href="%{showProfileLink}">
									<s:property value="firstName"/>&nbsp;<s:property value="lastName"/>
								</s:a>
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