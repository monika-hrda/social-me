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
		<title>SocialMe | Problem posting</title>
	</head>
	
	<body>
		<div id="page">
	
			<s:include value="common/header.jsp" />

			<section id="body" class="container">
			
				<section id="sidebar" role="navigation" class="col-md-2">
					<s:include value="common/profileMenu.jsp" />
				</section>
				
				<section id="main" class="col-md-10">
										
					<div><h4>There was a problem with your post. Please <a href="<s:url action="showProfile"/>">go back</a> and try again..</h4></div>
					
					<s:actionerror theme="bootstrap" />
					<s:fielderror theme="bootstrap" />
					
				</section>
			</section>

			<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>