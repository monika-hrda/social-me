<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="${pageContext.request.contextPath}/css/styling.css" type="text/css" rel="stylesheet">
		<title>SocialMe | Search for Friends</title>
	</head>
	
	<body>
		
		<s:include value="common/header.jsp" />
				
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
		
		<s:include value="common/footer.jsp" />
		
	</body>
</html>