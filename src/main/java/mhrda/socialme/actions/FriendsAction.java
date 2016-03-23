package mhrda.socialme.actions;

import java.sql.Timestamp;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import mhrda.socialme.entities.Friendship;
import mhrda.socialme.entities.FriendshipStatus;
import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

public class FriendsAction extends BaseAction implements UserAware {

	private static final long serialVersionUID = 1L;
	
	private User loggedInUser;
	private List<User> foundFriends;
	private int numberOfFriends;
	private List<Friendship> friendRequests;
	private int numberOfFriendRequests;

	public String showFriends() throws Exception {
		System.out.println("inside ShowFriends action");
		setFoundFriends(getFriendshipDAO().getExistingFriendsOf(getLoggedInUser()));
		setNumberOfFriends(foundFriends.size());
		System.out.println("ShowFriendsAction - Found " + getNumberOfFriends() + " friends of " + getLoggedInUser().getFirstName() + ".");
		return SUCCESS;
	}
	
	public String showFriendRequests() throws Exception {
		setFriendRequests(getFriendshipDAO().getFriendRequests(getLoggedInUser()));
		setNumberOfFriendRequests(friendRequests.size());
		return SUCCESS;
	}
	
	public String requestFriend() throws Exception {
		System.out.println("inside requestFriend action");
		String addFriendUserId = ServletActionContext.getRequest().getParameter("addFriendUserId");
		User addFriendUser = getUserDAO().getUserById(Integer.parseInt(addFriendUserId));
		FriendshipStatus status = getFriendshipStatusDAO().getFriendshipStatusByName("requested");
		if (loggedInUser == null || addFriendUser == null || status == null)
			return ERROR;
		getFriendshipDAO().sendFriendRequest(loggedInUser, addFriendUser, status, new Timestamp(System.currentTimeMillis()));
		return SUCCESS;
	}
	
	public String acceptFriend() throws Exception {
		int requestedFriendshipId = Integer.parseInt(ServletActionContext.getRequest().getParameter("requestedFriendshipId"));
		if(requestedFriendshipId != 0) {
			FriendshipStatus newStatus = getFriendshipStatusDAO().getFriendshipStatusByName("accepted");
			getFriendshipDAO().actionFriendRequest(requestedFriendshipId, newStatus, new Timestamp(System.currentTimeMillis()));
		}
		return SUCCESS;
	}
	
	public String rejectFriend() throws Exception {
		int requestedFriendshipId = Integer.parseInt(ServletActionContext.getRequest().getParameter("requestedFriendshipId"));
		if(requestedFriendshipId != 0) {
			getFriendshipDAO().deleteFriendshipById(requestedFriendshipId);
		}
		return SUCCESS;
	}

	@Override
	public void setLoggedInUser(User loggedInUser) {
		this.loggedInUser = loggedInUser;
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

	public int getNumberOfFriendRequests() {
		return numberOfFriendRequests;
	}

	public void setNumberOfFriendRequests(int numberOfFriendRequests) {
		this.numberOfFriendRequests = numberOfFriendRequests;
	}

}
