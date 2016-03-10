<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<%-- only testing access to variables in JSP pages, will be done with the help of AuthenticationInterceptor  --%>
	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Say hello to me!</title>
	</head>
	
	<body>
		<div align="center" style="background-color:green; color:white; height:40px; padding-top:20px">
			<s:if test="%{#session.LOGGEDINUSER != null}"><s:property value="#session.LOGGEDINUSER.firstName" />, you are in!!</s:if>
			<s:else>Nobody is logged in at the moment :( </s:else>
		</div>
	</body>
</html>