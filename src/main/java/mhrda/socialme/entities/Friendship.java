package mhrda.socialme.entities;

public class Friendship {

	private int friendshipId;
	private User friendRequester;
	private User friendResponder;
	private FriendshipStatus friendshipStatus;
	
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
	
}
