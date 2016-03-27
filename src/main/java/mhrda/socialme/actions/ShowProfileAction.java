package mhrda.socialme.actions;

import org.apache.struts2.ServletActionContext;
import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

public class ShowProfileAction extends BaseAction implements UserAware {

	private static final long serialVersionUID = 1L;
		
	private User profileUser;
	private User loggedInUser;
	private String profileId;
	

	@Override
	public String execute() throws Exception {
		String profileId = ServletActionContext.getRequest().getParameter("userId");
		if (profileId == null) {
			profileId = Integer.toString(loggedInUser.getUserId());
		}
		profileUser = getUserDAO().getUserById(Integer.parseInt(profileId));
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

	public String getProfileId() {
		return profileId;
	}
	
}
