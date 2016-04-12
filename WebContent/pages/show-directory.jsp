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
		
		<title>SocialMe | Directory</title>
	</head>
	
	<body>
		<div id="page">
			
			<s:include value="common/header.jsp" />
			
			<section id="body" class="container">
				
				<div id="custom-page-header">
					<h4 class="text-center">User Directory</h4>
				</div>
				
				<s:bean name="org.apache.struts2.util.Counter" id="counter">
					<s:param name="last" value="%{pageCount}" />
				</s:bean>
				
				<div id="main">
				
					<s:if test="%{users.isEmpty()}">
						<div class="text-center">
							<em>Currently there are no users registered on SocialMe. We are pretty sad about that :( </em>
						</div>
						<br/>
					</s:if>
					
					<s:else>
					
						<div class="col-md-8 col-md-offset-2 text-center">
							<s:form action="showDirectory" method="post" class="form-inline" theme="bootstrap">
								<div class="form-group">
									<label for="sortBy">Sort by</label>
									<s:select id="sortBy" name="sortBy" list="{'Last Name', 'First Name'}" />
								</div>
								<div class="form-group">
									<label for="sortOrder">In order</label>
									<s:select id="sortOrder" name="sortOrder" list="{'ASC','DESC'}" />
								</div>
								<div class="form-group">
									<label for="pageSize">Results per page</label>
									<s:select id="pageSize" name="pageSize" list="{'10','20'}" />
								</div>
								<s:submit value="Sort" class="btn btn-primary" />
							</s:form>
						</div>
						
						<div class="list-group col-md-8 col-md-offset-2">
							<s:iterator value="users" id="users" status="stat">
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
									<div class="col-md-5 col-xs-5">
										<s:a href="%{showProfileLink}">
											<s:property value="firstName"/>&nbsp;<s:property value="lastName"/>
										</s:a>
									</div>
								</div>
							</s:iterator>
						</div>
						
						<div class="col-md-12">
							<nav class="text-center">
								<ul class="pagination">
									<s:iterator value="#counter">
										<s:url action="iterateDirectory" var="iterateDirectoryLink">
											<s:param name="pageNo"><s:property/></s:param>
											<s:param name="sortBy"><s:property value="%{sortBy}" /></s:param>
											<s:param name="sortOrder"><s:property value="%{sortOrder}" /></s:param>
											<s:param name="pageSize"><s:property value="%{pageSize}" /></s:param>
										</s:url>
										
										<li>
											<s:a href="%{iterateDirectoryLink}">
												<s:property />
											</s:a>
										</li>
									</s:iterator>
								</ul>
							</nav>
						</div>
					</s:else>
				</div>
			</section>
			
			<s:include value="common/footer.jsp" />
			
		</div>
	</body>
</html>