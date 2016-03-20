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
	<ul id="headerMenu">
		<s:if test="%{#session.LOGGEDINUSER != null}">
			<li>
				<a href="<s:url action="showProfile"/>">Profile</a>
			</li>
			<li>
				<a href="<s:url action="showFriends"/>">Friends</a>
			</li>
			<li>
				<a href="<s:url action="showFriendRequests"/>">Friend Requests</a>
			</li>
			<li>
				<a href="<s:url action="search"/>">Search</a>
			</li>
		</s:if>
	</ul>
</div>
