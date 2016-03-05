package mhrda.socialme.entities;

import java.util.HashSet;
import java.util.Set;

public class FriendshipStatus {
	
	private int friendshipStatusId;
	private String friendshipStatusName;	
	private Set<Friendship> friendshipsByStatus = new HashSet<Friendship>();
	
	public int getFriendshipStatusId() {
		return friendshipStatusId;
	}
	public void setFriendshipStatusId(int friendshipStatusId) {
		this.friendshipStatusId = friendshipStatusId;
	}
	public String getFriendshipStatusName() {
		return friendshipStatusName;
	}
	public void setFriendshipStatusName(String friendshipStatusName) {
		this.friendshipStatusName = friendshipStatusName;
	}
	public Set<Friendship> getFriendshipsByStatus() {
		return friendshipsByStatus;
	}
	public void setFriendshipsByStatus(Set<Friendship> friendshipsByStatus) {
		this.friendshipsByStatus = friendshipsByStatus;
	}

}
