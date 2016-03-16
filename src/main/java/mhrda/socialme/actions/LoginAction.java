package mhrda.socialme.actions;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import mhrda.socialme.entities.User;

import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends BaseAction implements ModelDriven<User>, SessionAware {

	private static final long serialVersionUID = 1L;
	
	private User user = new User();   // instantiating because of model-driven approach to action class
	private SessionMap<String, Object> sessionAttributes;
	
	@Override
	public String execute() throws Exception {
		System.out.println("inside LoginAction execute");
		user = getUserDAO().getUserByCredentials(getUser().getEmail(), getUser().getPwd());
        if(user == null) return ERROR;
        else {
        	System.out.println("Logged in user's name: " + getUser().getFirstName() + " " + getUser().getLastName());
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
