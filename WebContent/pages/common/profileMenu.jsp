<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-bootstrap-tags" prefix="sb" %>

<ul class="nav nav-pills nav-stacked">

	<li role="presentation"><a href="<s:url action="showProfile"/>">Profile</a></li>
	<li role="presentation"><a href="<s:url action="showProfileAbout"/>">About</a></li>
	<li role="presentation"><a href="<s:url action="showProfileFriends"/>">Friends</a></li>
	
	<s:if test="%{#session.ACTIVEUSERPROFILE == #session.LOGGEDINUSER.userId}">
		<li><a href="<s:url action="showFriendRequests"/>">Friend Requests</a></li>
	</s:if>
	
</ul>
