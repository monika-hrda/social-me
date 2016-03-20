package mhrda.socialme.interceptors;

import mhrda.socialme.entities.User;

public interface UserAware {

	public void setLoggedInUser(User loggedInUser);

}
