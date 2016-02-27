<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Search for Friends on SocialMe</title>
	</head>
	
	<body>
		
		<s:include value="hello-user.jsp" /> <%-- temporary --%>
				
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
	</body>
</html>