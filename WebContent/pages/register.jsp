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
						<li class="active"><a href="<s:url action="showRegister"/>" id="grey-tab">Register</a></li>
					</ul>
				</div>
				
				<div class="tab-content col-md-8 col-md-offset-2">
					<div id="register" class="tab-pane fade in active">
						
						<s:form action="register" 
								method="post" 
								theme="bootstrap" 
								class="well form-horizontal" 
								label="Register to start making friends on SocialMe"
								role="form">
								
							<s:actionerror theme="bootstrap"/>
							
							<div class="form-group col-md-8 col-md-offset-2 pull-right">
								<s:textfield name="firstName" label="First Name" class="form-control" />
							</div>
							<div class="form-group col-md-8 col-md-offset-2 pull-right">
								<s:textfield name="lastName" label="Last Name" class="form-control" />
							</div>
							<div class="form-group col-md-8 col-md-offset-2 pull-right">
								<s:textfield name="email" label="Email" class="form-control" />
							</div>
							<div class="form-group col-md-8 col-md-offset-2 pull-right">
								<s:password name="pwd" label="Password" class="form-control" />
							</div>
							<div class="form-group col-md-8 col-md-offset-2 pull-right">
								<s:password name="confirmPwd" label="Confirm Password" class="form-control" />
							</div>
								<%-- <s:radio list="{'male','female'}" name="gender" /> --%>							
							<div class="form-group col-md-8 col-md-offset-2 pull-right">
								<s:submit value="Register" class="btn btn-primary pull-right" />
							</div>
						</s:form>
					</div>
					
				</div>
		
			</section>
				
			<s:include value="common/footer.jsp" />
		</div>
		
	</body>
</html>