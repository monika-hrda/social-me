package mhrda.socialme.actions;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

import com.opensymphony.xwork2.ModelDriven;

public class ShowProfileAction extends BaseAction implements ModelDriven<User>, RequestAware, UserAware {

	private static final long serialVersionUID = 1L;
	
	private User profileUser = new User();
	private User loggedInUser;
	private Map<String,Object> requestAttributes;

	@Override
	public String execute() throws Exception {
		int userId = (int) requestAttributes.get("userId");
		if (userId == 0) {
			userId = loggedInUser.getUserId();
		}
		profileUser = getUserDAO().getUserById(userId);
		return SUCCESS;
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
	
	@Override
	public User getModel() {
		return this.profileUser;
	}
	
	@Override
	public void setRequest(Map<String, Object> request) {
		this.requestAttributes = request;
	}

}
