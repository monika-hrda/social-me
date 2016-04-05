<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-bootstrap-tags" prefix="sb" %>

<nav id="menu" class="navbar navbar-inverse">
	<header class="container">
	
		<div class="navbar-header col-md-8 col-sm-6">			
			
			<button type="button"
					class="btn btn-success navbar-toggle collapsed"
					data-toggle="collapse"
					data-target="#navbar-collapse-1"
					aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
				<span class="glyphicon glyphicon-chevron-down"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			
			<span class="navbar-brand">SocialMe</span>
			
		</div>
		
		<div class="col-md-4 col-sm-6" id="signed-in">
		
			<s:if test="%{#session.LOGGEDINUSER != null}">
				<p class="navbar-text">
					Signed in as <s:property value="#session.LOGGEDINUSER.firstName" />&nbsp;<s:property value="#session.LOGGEDINUSER.lastName" />
				</p>
				<a class="btn btn-default navbar-btn" href="<s:url action="logout"/>" role="button">
					<span class="glyphicon glyphicon-log-out"></span> Log out</a>
			</s:if>
			<s:else>
				<a class="btn btn-default navbar-btn" href="<s:url action="showLogin"/>" role="button">Login</a>
			</s:else>
			
		</div>
		
		<div class="navbar-collapse collapse" id="navbar-collapse-1">
			
			<s:if test="%{#session.LOGGEDINUSER != null}">
				<ul class="nav navbar-nav">
					<li class="nav"><a href="<s:url action="showOwnProfile"/>">Profile</a></li>
					<li class="nav"><a href="<s:url action="showSearch"/>">Search</a></li>
				</ul>
			</s:if>
		
		</div>
	
	</header>
</nav>
