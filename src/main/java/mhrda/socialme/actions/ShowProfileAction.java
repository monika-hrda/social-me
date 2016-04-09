package mhrda.socialme.actions;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import mhrda.socialme.entities.Friendship;
import mhrda.socialme.entities.Post;
import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

public class ShowProfileAction extends BaseAction implements UserAware, SessionAware {

	private static final long serialVersionUID = 1L;
	
	private static final String lastViewedUserProfileKey = "ACTIVEUSERPROFILE";
	
	private User profileUser;
	private User loggedInUser;
	private String profileId;
	private List<Post> profileUserPosts;
	private List<User> profileUserFriends;
	private int numberOfFriends;
	private List<Friendship> friendRequests;
	private int numberOfFriendRequests;
	
	private Friendship friendshipWithProfileUser;
	
	private SessionMap<String, Object> sessionAttributes;

	@Override
	public String execute() throws Exception {
		configureProfileToView();
		if (profileUser.getUserId() != loggedInUser.getUserId()) {
			if (!isFriend(getProfileUser())) {
				return ERROR;
			}
		}
		return SUCCESS;
	}
	
	public String showProfilePosts() throws Exception {
		configureProfileToView();
		setProfileUserPosts(getPostDAO().getPostsForProfile(getProfileUser()));
		return SUCCESS;
	}
	
	public String showProfileAbout() throws Exception {
		configureProfileToView();
		return SUCCESS;
	}
	
	public String showProfileFriends() throws Exception {
		configureProfileToView();
		setProfileUserFriends(getFriendshipDAO().getExistingFriendsOf(getProfileUser()));
		setNumberOfFriends(getProfileUserFriends().size());
		return SUCCESS;
	}
	
	public String showFriendRequests() throws Exception {
		configureProfileToView();
		setFriendRequests(getFriendshipDAO().getFriendRequests(getProfileUser()));
		setNumberOfFriendRequests(getFriendRequests().size());
		return SUCCESS;
	}
	
	public String showSimpleProfile() throws Exception {
		configureProfileToView();
		return SUCCESS;
	}
	
	public String showEditProfile() throws Exception {
		configureProfileToView();
		return SUCCESS;
	}
	
	/**
	 * This action is only used when the user clicks on "Profile" from the top menu.
	 * It removes the last-viewed profileUser from the session, then it redirects
	 * to the showProfile action, which sees there is nothing in session
	 * and so shows the logged-in-user's profile.
	 */
	public String clearSessionProfile() throws Exception {
		if (sessionAttributes.containsKey(lastViewedUserProfileKey)) {
			sessionAttributes.remove(lastViewedUserProfileKey);
		}
		return SUCCESS;
	}
	
	public String checkFriendship() throws Exception {
		friendshipWithProfileUser = getFriendshipDAO().getFriendshipBetweenUsers(loggedInUser, profileUser);
		return SUCCESS;
	}
	
	/**
	 * This method centralizes the logic of which user's profile we are viewing.
	 * If the request contains a "?profileId=N", then profile N is used and stored in the session for later.
	 * If the request does NOT contain a profileId, then:
	 * 	If there's a saved profileId to view, then view it.
	 * 	If there isn't, then show the logged-in-user's profile.
	 */
	private void configureProfileToView() {
		profileId = ServletActionContext.getRequest().getParameter("profileId");
		boolean sessionContainsProfileToView = sessionAttributes.containsKey(lastViewedUserProfileKey);
		
		if (profileId != null) {
			setProfileUser(getUserDAO().getUserById(Integer.parseInt(profileId)));
			sessionAttributes.put(lastViewedUserProfileKey, Integer.parseInt(profileId));
		} else {
			if (sessionContainsProfileToView) {
				setProfileUser(getUserDAO().getUserById((int) sessionAttributes.get(lastViewedUserProfileKey)));
			} else {
				setProfileUser(getLoggedInUser());
				sessionAttributes.put(lastViewedUserProfileKey, getLoggedInUser().getUserId());
			}
		}
	}
	
	private boolean isFriend(User profileUser) {
		if (getFriendshipDAO().getExistingFriendsOf(getLoggedInUser()).contains(profileUser)) {
			return true;
		} else return false;
	}
	
	public User getProfileUser() {
		return profileUser;
	}

	public void setProfileUser(User profileUser) {
		this.profileUser = profileUser;
	}

	@Override
	public void setLoggedInUser(User loggedInUser) {
		this.loggedInUser = loggedInUser;
	}

	public User getLoggedInUser() {
		return loggedInUser;
	}

	public String getProfileId() {
		return profileId;
	}
	
	public List<Post> getProfileUserPosts() {
		return profileUserPosts;
	}

	public void setProfileUserPosts(List<Post> profileUserPosts) {
		this.profileUserPosts = profileUserPosts;
	}
	
	public List<User> getProfileUserFriends() {
		return profileUserFriends;
	}

	public void setProfileUserFriends(List<User> profileUserFriends) {
		this.profileUserFriends = profileUserFriends;
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
	
	public Friendship getFriendshipWithProfileUser() {
		return friendshipWithProfileUser;
	}

	public void setFriendshipWithProfileUser(Friendship friendshipWithProfileUser) {
		this.friendshipWithProfileUser = friendshipWithProfileUser;
	}

	@Override
	public void setSession(Map<String, Object> sessionAttributes) {
		this.sessionAttributes = (SessionMap<String, Object>) sessionAttributes;
	}
}
