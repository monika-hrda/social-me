<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-bootstrap-tags" prefix="sb" %>


<header class="container">
	
	<div class="row">
		<div class="customHeader">
			<div class="row">
				<div class="col-md-8 col-sm-6 col-xs-6" id="logo">
					<img src="${pageContext.request.contextPath}/images/logo.png" />
				</div>
				
				
				<s:if test="%{#session.LOGGEDINUSER != null}">
					<div class="col-md-4 col-sm-6 col-xs-6 text-right" id="signed-in">
						<mark class="navbar-text">
							Signed in as <s:property value="#session.LOGGEDINUSER.firstName" />&nbsp;<s:property value="#session.LOGGEDINUSER.lastName" />
						</mark>
						<a class="btn btn-default navbar-btn" href="<s:url action="logout"/>" role="button">
							<span class="glyphicon glyphicon-log-out"></span> Log out</a>
					</div>
				</s:if>
				<s:else>
					<div class="col-md-4 col-sm-6 col-xs-6 text-right" id="not-signed-in">
						<a class="btn btn-default navbar-btn" href="<s:url action="showLogin"/>" role="button">Log in</a>
					</div>
				</s:else>
			</div>
		</div>
	</div>
	
	
	<nav id="menu" class="navbar navbar-inverse">
			
		<div class="navbar-header">
			<button type="button"
					class="btn btn-success navbar-toggle collapsed"
					data-toggle="collapse"
					data-target="#navbar-collapse-1"
					aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
				<span class="glyphicon glyphicon-chevron-down"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<span class="navbar-brand">SocialMe</span>
		</div>
		
		<div class="navbar-collapse collapse" id="navbar-collapse-1">
		
				<ul class="nav navbar-nav">
					<s:if test="%{#session.LOGGEDINUSER != null}">
						<li class="nav"><a href="<s:url action="showOwnProfile"/>">Profile</a></li>
						<li class="nav"><a href="<s:url action="showFeed"/>">Feed</a></li>
						<li class="nav"><a href="<s:url action="showSearch"/>">Search</a></li>
					</s:if>
					<li class="nav"><a href="<s:url action="showDirectory"/>">Directory</a></li>
				</ul>
				
		</div>
		
	</nav>
</header>
