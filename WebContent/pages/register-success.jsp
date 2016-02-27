<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Registration Successful</title>
	</head>
	
	<body>
		
		<s:include value="hello-user.jsp" /> <%-- temporary --%>
				
		<h3>Welcome <s:property value="firstName" /></h3>
		<h3>Thank you for registering with SocialMe.</h3>
 		<h3>Your id is <s:property value="userId" /></h3>
		<h3>Your email is <s:property value="email" /></h3>
		<h3>Your password is <s:property value="pwd" /></h3>
		
		<p> You can now <a href="pages/search.jsp">search</a> for your friends on SocialMe. </p>
		
		<h3><a href="<s:url action="logout"/>">Log out</a></h3>
	</body>
</html>