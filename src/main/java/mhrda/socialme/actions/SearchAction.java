package mhrda.socialme.actions;

import java.util.ArrayList;
import java.util.List;

import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

import com.opensymphony.xwork2.ModelDriven;

public class SearchAction extends BaseAction implements ModelDriven<User>, UserAware {

	private static final long serialVersionUID = 1L;
	
	private User user = new User();
	private User loggedInUser;
	private List<User> foundUsers;
	
	private List<User> foundUsersFriends = new ArrayList<User>();
	private List<User> foundUsersNonFriends = new ArrayList<User>();

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
		List<User> existingFriends = getFriendshipDAO().getExistingFriendsOf(loggedInUser);
		for (User foundUser : foundUsers) {
			if(foundUser.getUserId() == loggedInUser.getUserId()) {
				foundUsersFriends.add(0, foundUser);
			}
			else if(existingFriends.contains(foundUser)) {
				foundUsersFriends.add(foundUser);
			} else foundUsersNonFriends.add(foundUser);
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

	@Override
	public void setLoggedInUser(User loggedInUser) {
		this.loggedInUser = loggedInUser;
	}

	public List<User> getFoundUsersFriends() {
		return foundUsersFriends;
	}

	public List<User> getFoundUsersNonFriends() {
		return foundUsersNonFriends;
	}
	
}
