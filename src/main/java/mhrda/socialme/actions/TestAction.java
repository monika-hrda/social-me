package mhrda.socialme.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

public class TestAction extends ActionSupport implements UserAware, ModelDriven<User> {

	private static final long serialVersionUID = 1L;
	
	private User user;  //logged in user - injected into this action from Authentication Interceptor
	
	@Override
	public String execute() {
		if(user != null)
		System.out.println("User detected as a logged in user is: " + user.getFirstName());
		return SUCCESS;		
	}

	@Override
	public User getModel() {
		return this.user;
	}

	@Override
	public void setUser(User user) {
		this.user = user;
	}
	
	public User getUser() {
		return this.user;
	}

}
