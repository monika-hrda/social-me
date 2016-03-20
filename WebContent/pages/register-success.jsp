<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="${pageContext.request.contextPath}/css/styling.css" type="text/css" rel="stylesheet">
		<title>SocialMe | Registration Successful</title>
	</head>
	
	<body>
		
		<s:include value="common/header.jsp" />
				
		<h3>Welcome <s:property value="firstName" /></h3>
		<h3>Thank you for registering with SocialMe.</h3>
 		<h3>Your id is <s:property value="userId" /></h3>
		<h3>Your email is <s:property value="email" /></h3>
		<h3>Your password is <s:property value="pwd" /></h3>
		
		<p> You can now <a href="<s:url action="search"/>">search</a> for your friends on SocialMe. </p>
		
		<h3><a href="<s:url action="logout"/>">Log out</a></h3>
		
		<s:include value="common/footer.jsp" />
		
	</body>
</html>