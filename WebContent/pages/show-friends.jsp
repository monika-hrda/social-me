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
		<title>SocialMe | Friends</title>
	</head>
	
	<body>
		<div id="page">
		
			<s:include value="common/header.jsp" />
			
			<section id="body" class="container">
			
				<section id="sidebar" role="navigation" class="col-md-2">
					<s:include value="common/profileMenu.jsp" />
				</section>
				
				<section id="main" class="col-md-10">
		
					<h3>
						<s:property value="profileUser.firstName" />&nbsp;<s:property value="profileUser.lastName" />
						<small> - Friends</small>
					</h3>
					
					<h4>Friends (<s:property value="numberOfFriends"/>):</h4>
					
					<s:if test="%{profileUserFriends.isEmpty()}">
						<em>You are not connected to anyone on SocialMe. <a href="<s:url action="search"/>">Find friends.</a></em><br/>
					</s:if>
					
					<s:else>
					<table>
						<tr>
							<th>Id</th>
							<th>Name</th>
						</tr>
						<s:iterator value="profileUserFriends">
							<s:url action="showProfile" var="showProfileLink">
								<s:param name="profileId" value="%{userId}" />
							</s:url>
							<tr>
								<td><s:property value="userId"/></td>
								<td>
									<s:a href="%{showProfileLink}"><s:property value="firstName"/>&nbsp;<s:property value="lastName"/></s:a>
								</td>
							</tr>
						</s:iterator>
					</table>
					</s:else>
					
				</section>
		
			</section>
			
			<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>