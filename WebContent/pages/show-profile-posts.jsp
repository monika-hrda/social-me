<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="${pageContext.request.contextPath}/css/styling.css" type="text/css" rel="stylesheet">
		<title>SocialMe | Posts</title>
	</head>
	
	<body>
		
		<s:include value="common/header.jsp" />
		
		<h3>
			<s:property value="profileUser.firstName" />&nbsp;<s:property value="profileUser.lastName" />
			<small> - Profile</small>
		</h3>
		
		<div><h4>Write something..</h4></div>
		
		<s:form action="createPost" method="post">
			<s:textarea name="postText" rows="5" />
			<s:hidden name="currentProfileUserId" value="%{profileUser.userId}" />
			<s:submit value="Post" />
		</s:form>
			
		<h4>Profile Posts:</h4>
		
		<table>
		<s:iterator value="profileUserPosts">
			<tr>
				<td>
				From: <s:property value="byUser.firstName"/>&nbsp;<s:property value="byUser.lastName"/>
				</td>
				<td>
				On: <s:date name="createdTime" format="dd/MM/yyyy hh:mm a" />
				</td>
			</tr>
			<tr>
				<td>
				"<s:property value="postText"/>"
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
		</s:iterator>
		</table>
		
		<s:include value="common/footer.jsp" />
		
	</body>
</html>