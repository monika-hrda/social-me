package mhrda.socialme.entities;

public class Friendship {

	private int friendshipId;
	private int userA;
	private int userB;
	private int friendshipStatus;
	
	public int getFriendshipId() {
		return friendshipId;
	}
	public void setFriendshipId(int friendshipId) {
		this.friendshipId = friendshipId;
	}
	public int getUserA() {
		return userA;
	}
	public void setUserA(int userA) {
		this.userA = userA;
	}
	public int getUserB() {
		return userB;
	}
	public void setUserB(int userB) {
		this.userB = userB;
	}
	public int getFriendshipStatus() {
		return friendshipStatus;
	}
	public void setFriendshipStatus(int friendshipStatus) {
		this.friendshipStatus = friendshipStatus;
	}
	
}
