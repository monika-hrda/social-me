package mhrda.socialme.actions;

import java.sql.Timestamp;
import org.apache.struts2.ServletActionContext;

import mhrda.socialme.entities.FriendshipStatus;
import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

public class FriendsAction extends BaseAction implements UserAware {

	private static final long serialVersionUID = 1L;
	
	private User loggedInUser;
		
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
	
}
