package mhrda.socialme.actions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

import com.opensymphony.xwork2.ModelDriven;

public class SearchAction extends BaseAction implements ModelDriven<User>, UserAware {

	private static final long serialVersionUID = 1L;
	
	private User user = new User();
	private User loggedInUser;
	private List<User> foundUsers;
	
	private List<User> foundUsersFriends = new ArrayList<User>(); //icon 'Friend' in search-results.jsp
	private Map<User, Integer> foundUsersRequestersMap = new HashMap<User, Integer>(); //buttons 'Accept' or 'Reject' in search-results.jsp
	private List<User> foundUsersResponders = new ArrayList<User>(); //icon 'Awaits Response' in search-results.jsp
	private List<User> foundUsersNoRelationship = new ArrayList<User>(); //button 'Add Friend' in search-results.jsp

	@Override
	public String execute() throws Exception {
		System.out.println("inside SearchAction execute");
		
		if((user.getFirstName() == null || user.getFirstName().isEmpty()) && (user.getLastName() == null || user.getLastName().isEmpty())) 
			return INPUT;
		
        setFoundUsers(getUserDAO().findUsers(user.getFirstName(), user.getLastName()));
        if(!getFoundUsers().isEmpty()) {
        	populateRelationships(getFoundUsers());
        }
		return SUCCESS;
	}
	
	private void populateRelationships(List<User> foundUsers) {
		if(!foundUsers.isEmpty()) {
			List<User> existingFriends = getFriendshipDAO().getExistingFriendsOf(loggedInUser);
			Map<User, Integer> requestersMap = getFriendshipDAO().getRequestersFor(loggedInUser);
			List<User> responders = getFriendshipDAO().getRespondersFor(loggedInUser);
			
			for (User foundUser : foundUsers) {
				if(foundUser.getUserId() == loggedInUser.getUserId()) {
					foundUsersFriends.add(0, foundUser);
				} 
				else if(!existingFriends.isEmpty() && existingFriends.contains(foundUser)) {
					foundUsersFriends.add(foundUser);
				} 
				else if(!requestersMap.isEmpty() && requestersMap.containsKey(foundUser)) {
					foundUsersRequestersMap.put(foundUser, requestersMap.get(foundUser));
				} 
				else if(!responders.isEmpty() && responders.contains(foundUser)) {
					foundUsersResponders.add(foundUser);
				}
				else foundUsersNoRelationship.add(foundUser);
			}
		}
	}
	
	public List<User> getFoundUsers() {
		return foundUsers;
	}

	public void setFoundUsers(List<User> foundUsers) {
		this.foundUsers = foundUsers;
	}
	
	@Override
	public User getModel() {
		return this.user;
	}

	public User getLoggedInUser() {
		return loggedInUser;
	}
	
	@Override
	public void setLoggedInUser(User loggedInUser) {
		this.loggedInUser = loggedInUser;
	}

	public List<User> getFoundUsersFriends() {
		return foundUsersFriends;
	}

	public Map<User, Integer> getFoundUsersRequestersMap() {
		return foundUsersRequestersMap;
	}

	public List<User> getFoundUsersResponders() {
		return foundUsersResponders;
	}

	public List<User> getFoundUsersNoRelationship() {
		return foundUsersNoRelationship;
	}
	
}
