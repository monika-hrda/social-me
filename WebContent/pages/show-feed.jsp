<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-bootstrap-tags" prefix="sb" %>
<!DOCTYPE html>

<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
		<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
		<link href="${pageContext.request.contextPath}/css/socialme.css" type="text/css" rel="stylesheet" />
		
		<!-- The order is important.  jquery must be before <sb:head/> which adds bootstrap script tags -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		<sb:head/>
		
		<title>SocialMe | News Feed</title>
	</head>
	
	<body>
		<div id="page">
	
			<s:include value="common/header.jsp" />

			<section id="body" class="container">
				
				<div class="page-header">
					<h4 class="text-center">News Feed</h4>
				</div>
				
				<s:iterator var="post" value="feedPosts">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-6"> <!-- Half the row -->
									<p class="panel-title">
										From: <s:property value="#post.byUser.firstName"/>&nbsp;<s:property value="#post.byUser.lastName"/>
										
									</p>
								</div>
								<div class="col-xs-6"> <!-- Half the row -->
									<p class="text-right">
										<s:date name="#post.createdTime" format="dd/MM/yyyy hh:mm a" />
									</p>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-6">
									<strong><s:property value="#post.postText"/></strong>
								</div>
								<div class="col-xs-6 text-right">
								
								</div>
							</div>
						</div>
						<ul class="list-group">
							<s:iterator var="comment" value="#post.commentsWrittenOnPost">
								<li class="list-group-item">
									<div class="row">
										<div class="col-xs-8">
											"<s:property value="#comment.commentText"/>"
										</div>
										<div class="col-xs-4">
											<p class="text-right">
												<s:property value="#comment.commentUser.firstName"/>
												<s:property value="#comment.commentUser.lastName"/>
												~ <s:date name="#comment.createdTime" format="dd/MM/yyyy hh:mm a" />
											</p>
										</div>
									</div>
								</li>
							</s:iterator>
						</ul>
						<div class="panel-footer">
							<div class="row">
								<div class="col-xs-4">
									<span>Likes: <s:property value='#post.likesOnPost.size()' />.</span>
									
									<s:url action="createLike" var="createLikeLink">
										<s:param name="likePostId" value="%{#post.postId}" />
									</s:url>
									<s:url action="deleteLike" var="deleteLikeLink">
										<s:param name="likePostId" value="%{#post.postId}" />
									</s:url>
									
									<s:if test="%{#post.likedBy(#session.LOGGEDINUSER)}">
										<s:a href="%{deleteLikeLink}">Unlike</s:a>
									</s:if>
									<s:else>
										<s:a href="%{createLikeLink}">Like</s:a>
									</s:else>
								</div>
								<div class="col-xs-8 text-right">
									<s:form action="createComment" method="post" theme="bootstrap" class="form-inline" role="form">
										<s:hidden name="currentPostId" value="%{postId}" />
										<div class="form-group">
											<s:label for="commentText" value="Comment Text" class="sr-only"/>
											<s:textarea name="commentText" rows="2" class="form-control" />
										</div>
										<s:submit value="Comment" class="btn btn-primary" />
									</s:form>
								</div>
							</div>
						</div>
					</div>
				</s:iterator>
			</section>

			<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>