package mhrda.socialme.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

public class TestAction extends ActionSupport implements UserAware, ModelDriven<User> {

	private static final long serialVersionUID = 1L;
	
	private User user;
	
	@Override
	public String execute() {
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

}
