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
		
		<title>SocialMe | Search for Friends</title>
	</head>
	
	<body>
		<div id="page">
		
		<s:include value="common/header.jsp" />
				
			<section id="body" class="container">
				
				<div class="page-header">
					<h4 class="text-center">Find your Friends on SocialMe</h4>
				</div>
				
				<div class="col-md-10">
					<s:form action="search" method="post" theme="bootstrap" class="form-horizontal">
						<s:textfield name="firstName" label="First Name" placeholder="First Name" />							
						<s:textfield name="lastName" label="Last Name" placeholder="Last Name"/>
						<s:submit value="Search" class="btn btn-primary pull-right" />
					</s:form>
				</div>
				
				
			</section>
		
		<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>