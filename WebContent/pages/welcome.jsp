<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Welcome to SocialMe</title>
	</head>
	
	<body>
		
		<s:include value="hello-user.jsp" /> <%-- temporary --%>
		
		<div align="center"><h4>PROFILE PAGE</h4></div>
		
		<s:push value="user">
			<h3>Profile of user <s:property value="firstName" /></h3>
 			<h3>User's id is <s:property value="userId" /></h3>
			<h3>User's email is <s:property value="email" /></h3>
			<h3>User's password is <s:property value="pwd" /></h3>
		</s:push>
		
		<%-- testing: --%>
		JSP says your name in session is <s:property value="#session.LOGGEDINUSER.firstName" /> and your email is <s:property value="#session.LOGGEDINUSER.email" />.<br>
		Value of 'user.firstName' is <s:property value="user.firstName" />. <%-- JSP uses the getUser() from ShowProfileAction (or LoginAction) --%><br>
		Value of 'firstName' is <s:property value="firstName" />.
		
		<p> You can <a href="<s:url action="search"/>">search</a> for your friends on SocialMe. </p>
		<p> Or view <a href="<s:url action="showFriends"/>">your friends</a> you are connected to on SocialMe. </p>
		
		<h3><a href="<s:url action="logout"/>">Log out</a></h3>
	</body>
</html>