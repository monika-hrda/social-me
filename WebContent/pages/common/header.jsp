<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<div id="headerDiv">
	<table id="headerTop">
		<tr>
			<td>
				<h1 id="headerLogo">SocialMe</h1>
			</td>
			<td style="width:20%">&nbsp;</td>
			<s:if test="%{#session.LOGGEDINUSER != null}">
				<td>
					Welcome <s:property value="#session.LOGGEDINUSER.firstName" />&nbsp;<s:property value="#session.LOGGEDINUSER.lastName" />
				</td>
				<td>&nbsp;</td>
				<td>
					<a href="<s:url action="logout"/>">Log out</a>
				</td>
			</s:if>
			<s:else>
				<td>
					<a href="<s:url action="showLogin"/>">Login</a>
				</td>
			</s:else>
		</tr>
	</table>
	<br/>
	
	<s:if test="%{#session.LOGGEDINUSER != null}">
		<ul id="headerMenu">
			<li><a href="<s:url action="showOwnProfile"/>">Profile</a></li>
			<li><a href="<s:url action="search"/>">Search</a></li>
		</ul>
		
		<ul id="profileMenu">
			<li><a href="<s:url action="showProfile"/>">Profile</a></li>
			<li><a href="<s:url action="showProfileAbout"/>">About</a></li>
			<li><a href="<s:url action="showProfileFriends"/>">Friends</a></li>
			<s:if test="%{#session.ACTIVEUSERPROFILE == #session.LOGGEDINUSER.userId}">
				<li><a href="<s:url action="showFriendRequests"/>">Friend Requests</a></li>
			</s:if>
		</ul>
	</s:if>
	
</div>
