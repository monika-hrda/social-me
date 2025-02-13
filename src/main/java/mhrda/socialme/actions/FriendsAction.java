package mhrda.socialme.actions;

import java.sql.Timestamp;
import org.apache.struts2.ServletActionContext;

import mhrda.socialme.entities.FriendshipStatus;
import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

public class FriendsAction extends BaseAction implements UserAware {

	private static final long serialVersionUID = 1L;
	
	private User loggedInUser;
	private String addFriendUserId;
	private int requestedFriendshipId;
	private String source;
	
	public String requestFriend() throws Exception {
		addFriendUserId = ServletActionContext.getRequest().getParameter("addFriendUserId");
		User addFriendUser = getUserDAO().getUserById(Integer.parseInt(addFriendUserId));
		FriendshipStatus status = getFriendshipStatusDAO().getFriendshipStatusByName("requested");
		if (loggedInUser == null || addFriendUser == null || status == null)
			return ERROR;
		getFriendshipDAO().sendFriendRequest(loggedInUser, addFriendUser, status, new Timestamp(System.currentTimeMillis()));
		return SUCCESS;
	}
	
	public String acceptFriend() throws Exception {
		requestedFriendshipId = Integer.parseInt(ServletActionContext.getRequest().getParameter("requestedFriendshipId"));
		source = ServletActionContext.getRequest().getParameter("source");		
		if (requestedFriendshipId != 0) {
			FriendshipStatus newStatus = getFriendshipStatusDAO().getFriendshipStatusByName("accepted");
			getFriendshipDAO().actionFriendRequest(requestedFriendshipId, newStatus, new Timestamp(System.currentTimeMillis()));
		}
		if (source != null) {
			if (source.equals("friendReq")) {
				addActionMessage("You just made a new friend!");
				return "requestPage";
			}
			if (source.equals("simple")) {
				return "simple";
			}
		}
		return SUCCESS;
	}
	
	public String rejectFriend() throws Exception {
		requestedFriendshipId = Integer.parseInt(ServletActionContext.getRequest().getParameter("requestedFriendshipId"));
		source = ServletActionContext.getRequest().getParameter("source");		
		if (requestedFriendshipId != 0) {
			getFriendshipDAO().deleteFriendshipById(requestedFriendshipId);
		}
		if (source != null) {
			if (source.equals("friendReq")) {
				return "requestPage";
			}
			if (source.equals("simple")) {
				return "simple";
			}
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
	
	public String getAddFriendUserId() {
		return addFriendUserId;
	}

	public void setAddFriendUserId(String addFriendUserId) {
		this.addFriendUserId = addFriendUserId;
	}

	public int getRequestedFriendshipId() {
		return requestedFriendshipId;
	}

	public void setRequestedFriendshipId(int requestedFriendshipId) {
		this.requestedFriendshipId = requestedFriendshipId;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}
	
}
