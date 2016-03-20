package mhrda.socialme.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

public class TestAction extends ActionSupport implements UserAware, ModelDriven<User> {

	private static final long serialVersionUID = 1L;
	
	private User loggedInUser;  //logged in user - injected into this action from Authentication Interceptor
	
	@Override
	public String execute() {
		if(loggedInUser != null) {
			System.out.println("User detected as a logged in user is: " + loggedInUser.getFirstName());
		}
		return SUCCESS;	
	}

	@Override
	public User getModel() {
		return this.loggedInUser;
	}

	@Override
	public void setLoggedInUser(User loggedInUser) {
		this.loggedInUser = loggedInUser;
	}
	
	public User getUser() {
		return this.loggedInUser;
	}

}
