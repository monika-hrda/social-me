package mhrda.socialme.actions;

import java.util.List;

import mhrda.socialme.entities.User;

import com.opensymphony.xwork2.ModelDriven;

public class SearchAction extends BaseAction implements ModelDriven<User> {

	private static final long serialVersionUID = 1L;
	
	private User user = new User();
	private List<User> foundUsers;

	@Override
	public String execute() throws Exception {
		System.out.println("inside SearchAction execute");
		
		if((user.getFirstName() == null || user.getFirstName().isEmpty()) && (user.getLastName() == null || user.getLastName().isEmpty())) 
			return INPUT;
		
        setFoundUsers(getUserDAO().findUsers(user.getFirstName(), user.getLastName()));
		return SUCCESS;
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
	
}
