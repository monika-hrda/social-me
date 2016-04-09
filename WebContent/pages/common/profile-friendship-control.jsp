<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!-- This code is re-used in 5 different pages, so it is centralised in one place. -->

<div>
	<p>
	
						<!-- CHECK THAT WE ARE VIEWING A PROFILE OF ANOTHER USER, NOT OUR OWN -->
					
		<s:if test="%{profileUser.userId != loggedInUser.userId}">
			<s:action var="checkFriendshipResult" name="checkFriendship" executeResult="false" />
			
						<!-- CASE WHEN THERE'S NO RELATIONSHIP WITH THE USER ("ADD FRIEND")-->
			
			<s:if test="%{#checkFriendshipResult.friendshipWithProfileUser == null}">
				<s:url action="requestFriend" var="requestFriendLink">
					<s:param name="addFriendUserId" value="%{profileUser.userId}" />
				</s:url>
				<s:a href="%{requestFriendLink}" class="btn btn-primary" role="button">Add Friend</s:a>
			</s:if>
			
			<s:else>
				<s:if test="%{#checkFriendshipResult.friendshipWithProfileUser.friendshipStatus.friendshipStatusName == 'requested'}">
				
						<!-- CASE WHEN WE ARE WAITING FOR A RESPONSE TO OUR FRIEND REQUEST ("FRIEND REQUEST SENT")-->
				
					<s:if test="%{#checkFriendshipResult.friendshipWithProfileUser.friendRequester.userId == loggedInUser.userId}">
						<s:a class="btn btn-primary disabled" role="button">Friend request sent</s:a>
					</s:if>
					
						<!-- CASE WHEN WE HAVE BEEN ASKED FOR FRIENDSHIP ("ACCEPT / REJECT")-->
					
					<s:else>
						<s:url action="acceptFriend" var="acceptFriendLink">
							<s:param name="requestedFriendshipId" 
									 value="%{#checkFriendshipResult.friendshipWithProfileUser.friendshipId}" />
						</s:url>
						<s:url action="rejectFriend" var="rejectFriendLink">
							<s:param name="requestedFriendshipId" 
									 value="%{#checkFriendshipResult.friendshipWithProfileUser.friendshipId}" />
						</s:url>
						<s:a href="%{acceptFriendLink}" class="btn btn-success" role="button">Accept Friend</s:a>
						<s:a href="%{rejectFriendLink}" class="btn btn-danger" role="button">Reject</s:a>
					</s:else>
				</s:if>
				
						<!-- CASE WHEN WE ARE FRIENDS WITH THE USER ("UNFRIEND")-->
				
				<s:else>
					<s:hidden name="hiddenFriendshipId" value="%{#checkFriendshipResult.friendshipWithProfileUser.friendshipId}" />
					<a id="unfriendButton" class="btn btn-danger" role="button">Unfriend</a>
				</s:else>
			</s:else>
		</s:if>
	</p>
</div>