package mhrda.socialme.entities;

import java.sql.Timestamp;

public class Friendship {

	private int friendshipId;
	private User friendRequester;
	private User friendResponder;
	private FriendshipStatus friendshipStatus;
	private Timestamp requestTime;
	private Timestamp responseTime;
	
	public Friendship() {}
	
	public Friendship(User friendRequester, User friendResponder, FriendshipStatus friendshipStatus, Timestamp requestTime) {
		this.friendRequester = friendRequester;
		this.friendResponder = friendResponder;
		this.friendshipStatus = friendshipStatus;
		this.requestTime = requestTime;
	}
	
	public int getFriendshipId() {
		return friendshipId;
	}
	public void setFriendshipId(int friendshipId) {
		this.friendshipId = friendshipId;
	}
	public User getFriendRequester() {
		return friendRequester;
	}
	public void setFriendRequester(User friendRequester) {
		this.friendRequester = friendRequester;
	}
	public User getFriendResponder() {
		return friendResponder;
	}
	public void setFriendResponder(User friendResponder) {
		this.friendResponder = friendResponder;
	}
	public FriendshipStatus getFriendshipStatus() {
		return friendshipStatus;
	}
	public void setFriendshipStatus(FriendshipStatus friendshipStatus) {
		this.friendshipStatus = friendshipStatus;
	}

	public Timestamp getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(Timestamp requestTime) {
		this.requestTime = requestTime;
	}

	public Timestamp getResponseTime() {
		return responseTime;
	}

	public void setResponseTime(Timestamp responseTime) {
		this.responseTime = responseTime;
	}
	
}
