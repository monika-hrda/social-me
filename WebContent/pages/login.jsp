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
		
		<title>SocialMe | Login</title>
	</head>
	
	<body>
		<div id="page">
		
			<section class="container">
			
				<div class="jumbotron">
					<h1>Welcome to SocialMe!</h1>
					<p>It's time to get social.</p>
					<p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
				</div>
				
				<div class="col-md-8 col-md-offset-2">
					<ul class="nav nav-tabs nav-justified">
						<li class="active"><a href="#login">Login</a></li>
						<li><a href="#register">Register</a></li>
					</ul>
				</div>
				
				<div class="tab-content col-md-8 col-md-offset-2">
					<div id="login" class="tab-pane fade in active">
						<h4>Welcome! Please log in below or click "Register" to sign up</h4>
						
						<s:actionerror theme="bootstrap"/>
						
						<s:form action="login" method="post" theme="bootstrap" role="form">
							<div class="form-group">
								<s:label for="email" value="Email" />
								<s:textfield name="email" class="form-control" />
							</div>
							<div class="form-group">
								<s:label for="pwd" value="Password" />
								<s:password name="pwd" class="form-control" />
							</div>
							<div class="form-group">
								<s:submit value="Login" class="btn btn-primary" />
							</div>
						</s:form>
					</div>
					<div id="register" class="tab-pane fade">
						<h4>Register to start making friends on SocialMe</h4>
						<s:form action="register" method="post" role="form">
							<div class="form-group">
								<s:label for="firstName" value="First Name"/>
								<s:textfield name="firstName" class="form-control" />
							</div>
							<div class="form-group">
								<s:label for="lastName" value="Last Name"/>
								<s:textfield name="lastName" class="form-control" />
							</div>
							<div class="form-group">
								<s:label for="email" value="Email"/>
								<s:textfield name="email" class="form-control" />
							</div>
							<div class="form-group">
								<s:label for="pwd" value="Password"/>
								<s:password name="pwd" class="form-control" />
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