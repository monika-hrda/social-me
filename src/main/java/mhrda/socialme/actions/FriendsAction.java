package mhrda.socialme.actions;

import java.util.List;

import mhrda.socialme.entities.Friendship;
import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

public class FriendsAction extends BaseAction implements UserAware {

	private static final long serialVersionUID = 1L;
	
	private User loggedInUser;
	private List<User> foundFriends;
	private int numberOfFriends;
	private List<Friendship> friendRequests;

	public String showFriends() throws Exception {
		System.out.println("inside ShowFriends action");
		setFoundFriends(getFriendshipDAO().getExistingFriendsOf(getLoggedInUser()));
		setNumberOfFriends(foundFriends.size());
		System.out.println("ShowFriendsAction - Found " + getNumberOfFriends() + " friends of " + getLoggedInUser().getFirstName() + ".");
		//TODO add special note about no existing friends / invite user to search for friends
		return SUCCESS;
	}
	
	public String showFriendRequests() throws Exception {
		setFriendRequests(getFriendshipDAO().getFriendRequests(getLoggedInUser()));
		//TODO add special note about having no friend requests
		return SUCCESS;
	}

	@Override
	public void setUser(User user) {
		this.loggedInUser = user;
	}
	
	public User getLoggedInUser() {
		return this.loggedInUser;
	}

	public List<User> getFoundFriends() {
		return foundFriends;
	}

	public void setFoundFriends(List<User> foundFriends) {
		this.foundFriends = foundFriends;
	}

	public int getNumberOfFriends() {
		return numberOfFriends;
	}

	public void setNumberOfFriends(int numberOfFriends) {
		this.numberOfFriends = numberOfFriends;
	}
	
	public List<Friendship> getFriendRequests() {
		return friendRequests;
	}

	public void setFriendRequests(List<Friendship> friendRequests) {
		this.friendRequests = friendRequests;
	}

}
