package mhrda.socialme.actions;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

import com.opensymphony.xwork2.ModelDriven;

public class ShowProfileAction extends BaseAction implements ModelDriven<User>, RequestAware, UserAware {

	private static final long serialVersionUID = 1L;
	
	private User user = new User();
	private User loggedInUser;
	private Map<String,Object> requestAttributes;

	@Override
	public String execute() throws Exception {
		System.out.println("inside ShowProfileAction execute");
		int userId = (int) requestAttributes.get("userId");
		if (userId == 0) {
			userId = loggedInUser.getUserId();
		}
		user = getUserDAO().getUserById(userId);
		if(user == null) return ERROR;
		return SUCCESS;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public void setLoggedInUser(User loggedInUser) {
		this.loggedInUser = loggedInUser;
	}
	
	@Override
	public User getModel() {
		return this.user;
	}
	
	@Override
	public void setRequest(Map<String, Object> request) {
		this.requestAttributes = request;
	}

}
