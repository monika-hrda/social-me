package mhrda.socialme.entities;

import java.util.HashSet;
import java.util.Set;

public class User {
	
	private int userId;
	private String firstName;
	private String lastName;
	private String pwd;
    private String email;
    private Set<Friendship> friendshipsInitiatedByUser = new HashSet<Friendship>(); //list of friendships initiated / requested by the user
    private Set<Friendship> friendshipsInitiatedByAnotherUser = new HashSet<Friendship>(); //list of friendships where the user is a responder
    
	public int getUserId() {
		return userId;
	}
	public void setUserId(int id) {
		this.userId = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Set<Friendship> getFriendshipsInitiatedByUser() {
		return friendshipsInitiatedByUser;
	}
	public void setFriendshipsInitiatedByUser(Set<Friendship> friendshipsInitiatedByUser) {
		this.friendshipsInitiatedByUser = friendshipsInitiatedByUser;
	}
	public Set<Friendship> getFriendshipsInitiatedByAnotherUser() {
		return friendshipsInitiatedByAnotherUser;
	}
	public void setFriendshipsInitiatedByAnotherUser(Set<Friendship> friendshipsInitiatedByAnotherUser) {
		this.friendshipsInitiatedByAnotherUser = friendshipsInitiatedByAnotherUser;
	}

//	//preferred way to add friendship to 'setFriendships..' or to 'getFriendships...add(..)'
//	public void addFriendshipInitiatedByUser(Friendship friendship) {
//		friendship.setUserA(this.getUserId());
//		friendshipsInitiatedByUser.add(friendship);		
//	}
}
