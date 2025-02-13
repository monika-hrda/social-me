package mhrda.socialme.actions;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import mhrda.socialme.entities.User;
import mhrda.socialme.utilities.GeneralUtilities;

import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends BaseAction implements ModelDriven<User>, SessionAware {

	private static final long serialVersionUID = 1L;
	
	private User user = new User();   // instantiating because of model-driven approach to action class
	private SessionMap<String, Object> sessionAttributes;
	
	@Override
	public String execute() throws Exception {
		//Hash the entered password before checking credentials against the database.
		user.setPwd(GeneralUtilities.toSHA1(user.getPwd()));
		user = getUserDAO().getUserByCredentials(getUser().getEmail(), getUser().getPwd());
		
        if(user == null) {
        	addActionError("Invalid Email/Password. Please try again.");
        	return ERROR;
        }
        else {
        	sessionAttributes.put("LOGGEDINUSER", user);
        	return SUCCESS;
        }
	}

	public String logout() {
		if (sessionAttributes.containsKey("LOGGEDINUSER")) {
			sessionAttributes.invalidate();
		}
		return SUCCESS;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public User getModel() {
		return user;
	}
	
	@Override
	public void setSession(Map<String, Object> sessionAttributes) {
		this.sessionAttributes = (SessionMap<String, Object>) sessionAttributes;
	}

}
