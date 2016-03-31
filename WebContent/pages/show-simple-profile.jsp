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
		<title>SocialMe | Profile Unavailable</title>
	</head>
	
	<body>
		<div id="page">
		
		<s:include value="common/header.jsp" />
		
			<section id="body" class="container">
		
				<h3>
					<s:property value="profileUser.firstName" />&nbsp;<s:property value="profileUser.lastName" />
				</h3>
				
				<div>You are not connected on SocialMe.</div>
				<div>Would you like to add <s:property value="profileUser.firstName" /> as a friend?</div>
				<div>Add Friend</div>
				
				<!-- Needs work! -->
				<!-- Different scenarios - you are to accept/reject friendship request, are waiting for a response, or can add a friend -->
				<!-- There should be no left-side navbar with the simple profile .. this will be solved when Bootstrap is involved -->
		
			</section>
		
		<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>