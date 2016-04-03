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
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="${pageContext.request.contextPath}/css/socialme.css" type="text/css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<title>SocialMe | About</title>
	</head>
	
	<body>
		<div id="page">
		
			<s:include value="common/header.jsp" />
		
			<section id="body" class="container">
			
				<section id="sidebar" role="navigation" class="col-md-2">
					<s:include value="common/profileMenu.jsp" />
				</section>
				
				<section id="main" class="col-md-10">
					
					<s:actionmessage theme="bootstrap" />
					
					<div class="page-header col-md-12">						
						<div>
							<h3 class="col-md-10">
								<s:property value="profileUser.firstName" />&nbsp;<s:property value="profileUser.lastName" />
								<small> - About</small>
							</h3>
						</div>
					
						<div class="text-right col-md-2">
							<s:if test="%{profileUser.userId == loggedInUser.userId}">								
								<a class="btn btn-primary" href="<s:url action="showEditProfile"/>" role="button">Edit Profile</a>
							</s:if>
						</div>
					</div>
					
					<div class="col-md-12">
						<p>
							<s:push value="profileUser">		
					 			<div>Id: <s:property value="userId" /></div>
								<div>Email: <s:property value="email" /></div>
								<div>Password: <s:property value="pwd" /></div>
							</s:push>
						</p>
					</div>
					
				</section>
				
			</section>
			
			<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>