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
		<title>SocialMe | Edit profile</title>
	</head>
	
	<body>
		<div id="page">
		
			<s:include value="common/header.jsp" />
		
			<section id="body" class="container">
			
				<section id="sidebar" role="navigation" class="col-md-2">
					<s:include value="common/profileMenu.jsp" />
				</section>
				
				<section id="main" class="col-md-10">
					
					<s:actionerror theme="bootstrap" />
					<s:fielderror theme="bootstrap" />
					
					<s:form action="saveProfile" theme="bootstrap" class="well form-horizontal" label="Edit Profile Details" method="post" enctype="multipart/form-data">
						<s:textfield name="firstName" value="%{profileUser.firstName}" label="First Name" tooltip="Enter your first name here. Make sure your friends can find you!"/>
						<s:textfield name="lastName" value="%{profileUser.lastName}" label="Last Name" tooltip="Enter your last name here."/>
						<s:file id="profilePic" name="profilePic" label="Profile Picture" />
						<s:submit value="Save Changes" class="btn btn-success pull-right"/>
					</s:form>
									
				</section>
				
			</section>
			
			<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>