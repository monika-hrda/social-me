<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-bootstrap-tags" prefix="sb" %>

<header class="container-fluid">
	<div id="menu" class="navbar navbar-inverse">
	
		<div class="navbar-header">
			<span class="navbar-brand">SocialMe</span>
			
			<s:if test="%{#session.LOGGEDINUSER != null}">
					<div>
						Welcome <s:property value="#session.LOGGEDINUSER.firstName" />&nbsp;<s:property value="#session.LOGGEDINUSER.lastName" />
					</div>
					<ul class="nav navbar-nav navbar-right">
						<li class="nav">
							<a href="<s:url action="logout"/>"><span class="glyphicon glyphicon-log-in"></span> Log out</a>
						</li>
					</ul>
			</s:if>
			<s:else>
					<ul class="nav navbar-nav navbar-right">
						<li class="nav">
							<a href="<s:url action="showLogin"/>">Login</a>
						</li>
					</ul>
			</s:else>
			
		</div>
	
		<s:if test="%{#session.LOGGEDINUSER != null}">
			<ul class="nav navbar-nav">
				<li class="nav"><a href="<s:url action="showOwnProfile"/>">My Profile</a></li>
				<li class="nav"><a href="<s:url action="search"/>">Search</a></li>
			</ul>
		</s:if>
		
	</div>
</header>