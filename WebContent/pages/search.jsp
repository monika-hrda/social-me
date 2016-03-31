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
		<title>SocialMe | Search for Friends</title>
	</head>
	
	<body>
		<div id="page">
		
		<s:include value="common/header.jsp" />
				
			<section id="body" class="container">
			
				<h3>Find your Friends on SocialMe</h3>
				
				<s:form action="search" method="post"> <%-- theme="simple" to display textfields in one row --%>
					<table>
						<%-- <tr><td colspan="3"><h3>Find your Friends on SocialMe</h3></td></tr> --%>
						<tr>
							<td><s:textfield name="firstName" label="First Name" /></td>
							<td><s:textfield name="lastName" label="Last Name" /></td>
							<td><s:submit value="Search" /></td>
						</tr>
					</table>
				</s:form>
				
			</section>
		
		<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>