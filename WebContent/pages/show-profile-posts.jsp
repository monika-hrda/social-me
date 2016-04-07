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
		
		<title>SocialMe | Posts</title>
	</head>
	
	<body>
		<div id="page">
	
			<s:include value="common/header.jsp" />

			<section id="body" class="container">
			
				<section id="sidebar" role="navigation" class="col-md-2">
					<s:include value="common/profileMenu.jsp" />
				</section>
				
				<section id="main" class="col-md-10">
				
					<div class="page-header">
						<h3>
							<s:property value="profileUser.firstName" />&nbsp;<s:property value="profileUser.lastName" />
							<small> - Posts</small>
						</h3>
					</div>
					
					<div><h4>Write something..</h4></div>
					
					<s:form action="createPost" method="post" enctype="multipart/form-data" theme="bootstrap">
						<s:hidden name="currentProfileUserId" value="%{profileUser.userId}" />
						<s:textarea name="postText" rows="5" />
						<s:file name="image" />
						<s:submit value="Post" />
					</s:form>
						
					<h4>Profile Posts:</h4>
					
					<table>
					<s:iterator var="post" value="profileUserPosts">
						<tr>
							<td>
							From: <s:property value="#post.byUser.firstName"/>&nbsp;<s:property value="#post.byUser.lastName"/>
							</td>
							<td>
							On: <s:date name="#post.createdTime" format="dd/MM/yyyy hh:mm a" />
							</td>
						</tr>
						<tr>
							<td>
							<s:property value="#post.postText"/>
							</td>
						</tr>
						<tr>
							<td>
								<span>Likes: <s:property value='#post.likesOnPost.size()' />.</span>
							</td>
							
							<td>
								<s:url action="createLike" var="createLikeLink">
									<s:param name="likePostId" value="%{#post.postId}" />
								</s:url>
								<s:url action="deleteLike" var="deleteLikeLink">
									<s:param name="likePostId" value="%{#post.postId}" />
								</s:url>
								
								<s:if test="%{#post.likedBy(#session.LOGGEDINUSER)}">
									<s:a href="%{deleteLikeLink}">
										Unlike
									</s:a>
								</s:if>
								<s:else>
									<s:a href="%{createLikeLink}">
										Like
									</s:a>
								</s:else>
							</td>
						</tr>
						<tr>
							<td>
								<s:iterator var="comment" value="#post.commentsWrittenOnPost">
									<tr>
										<td>
										<s:property value="#comment.commentUser.firstName"/>&nbsp;<s:property value="#comment.commentUser.lastName"/>&nbsp;commented:
										</td>
										<td>
										On: <s:date name="#comment.createdTime" format="dd/MM/yyyy hh:mm a" />
										</td>
									</tr>
									<tr>
										<td>
										"<s:property value="#comment.commentText"/>"
										</td>
									</tr>
								</s:iterator>
							</td>
						</tr>
						<tr>
							<td>
								<s:form action="createComment" method="post">
									<s:textarea name="commentText" rows="2" />
									<s:hidden name="currentPostId" value="%{postId}" />
									<s:submit value="Comment" />
								</s:form>
							</td>
						</tr>
						<tr>
							<td>
								<hr/>
							</td>
						</tr>
					</s:iterator>
					</table>
				</section>
			</section>

			<s:include value="common/footer.jsp" />
		
		</div>
	</body>
</html>