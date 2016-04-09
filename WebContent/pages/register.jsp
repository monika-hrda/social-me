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
		
		<title>SocialMe | Register</title>
	</head>
	
	<body>
		<div id="page">
		
			<section id="body" class="container">
			
				<s:include value="common/jumbotron.jsp" />
				
				<div class="col-md-8 col-md-offset-2">
					<ul class="nav nav-tabs nav-justified">
						<li><a href="<s:url action="showLogin"/>">Login</a></li>
						<li class="active"><a href="<s:url action="showRegister"/>">Register</a></li>
					</ul>
				</div>
				
				<div class="tab-content col-md-8 col-md-offset-2">
					<div id="register" class="tab-pane fade in active">
						<h4>Register to start making friends on SocialMe</h4>
						
						<s:actionerror theme="bootstrap"/>
						
						<s:form action="register" method="post" theme="bootstrap" role="form">
							<div class="form-group">
								<s:textfield name="firstName" label="First Name" class="form-control" />
							</div>
							<div class="form-group">
								<s:textfield name="lastName" label="Last Name" class="form-control" />
							</div>
							<div class="form-group">
								<s:textfield name="email" label="Email" class="form-control" />
							</div>
							<div class="form-group">
								<s:password name="pwd" label="Password" class="form-control" />
							</div>
								<%-- <s:radio list="{'male','female'}" name="gender" /> --%>							
							<div class="form-group">
								<s:submit value="Register" class="btn btn-primary" />
							</div>
						</s:form>
					</div>
					
				</div>
		
			</section>
				
			<s:include value="common/footer.jsp" />
		</div>
		
		<script>
		$(document).ready(function(){
			$(".nav-tabs a").click(function(){
				$(this).tab('show');
			});
		});
		</script>
		
	</body>
</html>