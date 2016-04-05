<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-bootstrap-tags" prefix="sb" %>

<ul class="nav nav-pills nav-stacked">

	<li role="presentation"><a href="<s:url action="showProfile"/>">Posts</a></li>
	<li role="presentation"><a href="<s:url action="showProfileAbout"/>">About</a></li>
	<li role="presentation"><a href="<s:url action="showProfileFriends"/>">Friends</a></li>
	
	<s:if test="%{#session.ACTIVEUSERPROFILE == #session.LOGGEDINUSER.userId}">
		<li><a href="<s:url action="showFriendRequests"/>">Requests</a></li>
	</s:if>
	
</ul>

<!--
Adding this jquery function here means it's only called when the Profile sub-menu is part of the page.
This improves page loading times.
 -->

<script type="text/javascript">
$(document).ready(function() {
	var rawhref = window.location.href;	  
	var newpage = ((window.location.href.match(/([^\/]*)\/?$/)[1]));
	  
	if (rawhref.indexOf('showProfilePosts.action') != -1){
		newpage = "Posts"
	}
	else if ((rawhref.indexOf('showProfileAbout.action') != -1) || (rawhref.indexOf('showEditProfile.action') != -1)) {
		newpage = "About"
	}
	else if (rawhref.indexOf('showProfileFriends.action') != -1){
		newpage = "Friends"
	}
	else if (rawhref.indexOf('showFriendRequests.action') != -1){
		newpage = "Requests"
	}
	  
	$(".nav li a:contains('" + newpage + "')").parent().addClass('active');
});	
</script>
