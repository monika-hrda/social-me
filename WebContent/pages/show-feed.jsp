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
				
				<div class="col-md-10 col-md-offset-1">
				<s:iterator var="post" value="feedPosts">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-8">
									<p class="panel-title">
									
												<!-- PROFILE PICTURE OF POST SENDER -->
												
										<s:if test="%{#post.byUser.profileImageFilenameThumb != null}">
											<img class="profile-pic-small" 
												 src="${pageContext.request.contextPath}/<s:property value='#post.byUser.profileImageFilenameThumb' />" />
										</s:if>
										<s:else>
											<img class="profile-pic-small" 
												 src="${pageContext.request.contextPath}/images/HeadSilhouette.png" />
										</s:else>
										
												<!-- NAME OF POST SENDER -->
												
										<s:url action="showProfile" var="showProfileLink">
											<s:param name="profileId" value="%{#post.byUser.userId}" />
										</s:url>
										<s:a href="%{showProfileLink}">
											<s:property value="#post.byUser.firstName"/>&nbsp;<s:property value="#post.byUser.lastName"/>
										</s:a>
											
										<!-- IF POST IS NOT WRITTEN BY USER ON HIS/HER OWN WALL (SENDER/RECEIVER ARE NOT THE SAME USER), DO THIS -->
											
										<s:if test="%{#post.byUser.userId != #post.forUser.userId}">
											<img class="feedArrow" 
												 src="${pageContext.request.contextPath}/images/ArrowRight.png" />
												 
												 <!-- PROFILE PICTURE OF POST RECEIVER -->
											
											<s:if test="%{#post.forUser.profileImageFilenameThumb != null}">
												<img class="profile-pic-small" 
													 src="${pageContext.request.contextPath}/<s:property value='#post.forUser.profileImageFilenameThumb' />" />
											</s:if>
											<s:else>
												<img class="profile-pic-small" 
													 src="${pageContext.request.contextPath}/images/HeadSilhouette.png" />
											</s:else>
											
												<!-- NAME OF POST RECEIVER -->
												
											<s:url action="showProfile" var="showProfileLink">
												<s:param name="profileId" value="%{#post.forUser.userId}" />
											</s:url>
											<s:a href="%{showProfileLink}">
												<s:property value="#post.forUser.firstName"/>&nbsp;<s:property value="#post.forUser.lastName"/>
											</s:a>
											
										</s:if>
									</p>
								</div>
												<!-- DATE AND TIME POST WAS CREATED -->
												
								<div class="col-xs-4">
									<p class="text-right">
										<s:date name="#post.createdTime" format="dd/MM/yyyy hh:mm a" />
									</p>
								</div>
							</div>
						</div>
						
						<div class="panel-body">
							<div class="row">
							
												<!-- POST TEXT -->
												
								<div class="col-xs-6">
									<strong><s:property value="#post.postText"/></strong>
								</div>
								
												<!-- POST IMAGE -->
												
								<div class="col-xs-6 text-right">
									<s:if test="%{#post.postImageFileNameThumb != null}">
										<a target="_blank" 
										   href="${pageContext.request.contextPath}/<s:property value='#post.postImageFileName' />">
											<img src="${pageContext.request.contextPath}/<s:property value='#post.postImageFileNameThumb' />"
												 class="img-thumbnail" />
										</a>
									</s:if>
								</div>
							</div>
						</div>
						
						<div class="panel-footer">
							<div class="row">
							
										<!-- NUMBER OF LIKES ON POST AND A CHANCE TO LIKE / UNLIKE THE POST -->
							
								<div class="col-xs-4">
									<span class="heart-like">
										<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
										<span class="sr-only">Likes:</span>
										<s:property value='#post.likesOnPost.size()' />
									</span>
									
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
								<br/>
								
										<!-- COMMENTS ON POST -->
						
								<ul class="list-group feed-comments">
									<s:iterator var="comment" value="#post.commentsWrittenOnPost">
										<li class="list-group-item feed-comment">
											<div class="row">
												
															<!-- PROFILE PICTURE OF THE USER COMMENTING -->
												
												<div class="col-md-1">
													<s:if test="%{#comment.commentUser.profileImageFilenameThumb != null}">
														<img class="profile-pic-small" 
															 src="${pageContext.request.contextPath}/<s:property value='#comment.commentUser.profileImageFilenameThumb' />" />
													</s:if>
													<s:else>
														<img class="profile-pic-small" 
															 src="${pageContext.request.contextPath}/images/HeadSilhouette.png" />
													</s:else>
												</div>
													
															<!-- CLICKABLE NAME OF USER COMMENTING AND COMMENT TEXT -->
															
												<div class="col-md-8">
													<s:url action="showProfile" var="showProfileLink">
														<s:param name="profileId" value="%{#comment.commentUser.userId}" />
													</s:url>
													<strong>
														<s:a href="%{showProfileLink}">
															<s:property value="#comment.commentUser.firstName"/>
															<s:property value="#comment.commentUser.lastName"/>
														</s:a>
													</strong>
													<s:property value="#comment.commentText"/>
												</div>
												
															<!-- DATE AND TIME COMMENT WAS CREATED -->
												
												<div class="col-md-3">
													<p class="text-right">
														<small class="comment-time">
															~ <s:date name="#comment.createdTime" format="dd/MM/yyyy hh:mm a" />
														</small>
													</p>
												</div>
												
											</div>
										</li>
									</s:iterator>
								</ul>
								
										<!-- A FORM TO POST A COMMENT -->
								
								<div class="text-center">
									<s:form action="createComment" method="post" theme="bootstrap" class="form-inline" role="form">
										<s:hidden name="currentPostId" value="%{postId}" />
										<div class="form-group">
											<s:label for="commentText" value="Comment Text" class="sr-only"/>
											<s:textarea name="commentText" rows="2" cols="60" class="form-control" />
										</div>
										<s:submit value="Comment" class="btn btn-primary" />
									</s:form>
								</div>
								
							</div>
						</div>
					</div>
				</s:iterator>
				</div>
			</section>

			<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>