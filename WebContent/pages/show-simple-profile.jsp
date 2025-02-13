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
		
		<title>SocialMe | Profile Unavailable</title>
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
									<img class="profilePicMedium img-thumbnail" 
										 src="${pageContext.request.contextPath}/<s:property value='profileUser.profileImageFilenameThumb' />" />
								</s:if>
								<s:else>
									<img class="profilePicMedium img-thumbnail" src="${pageContext.request.contextPath}/images/HeadSilhouette.png" />
								</s:else>
							</div>
							<div class="col-md-7">
								<h3>
									<s:property value="profileUser.firstName" />&nbsp;<s:property value="profileUser.lastName" />
									<small> - About</small>
								</h3>
							</div>
						
							<div class="text-right col-md-3">
								<div id="ajaxResults">
									<s:include value="common/profile-friendship-control.jsp" />
								</div>
							</div>
						</div>
					</div>
				</section>
				
			</section>
		
		<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>