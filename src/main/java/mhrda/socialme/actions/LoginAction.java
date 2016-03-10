package mhrda.socialme.actions;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import mhrda.socialme.entities.User;

import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends BaseAction implements ModelDriven<User>, SessionAware {

	private static final long serialVersionUID = 1L;
	
	private User user = new User();
	private Map<String, Object> sessionAttributes = null;  //get rid of = null ??
	
	@Override
	public String execute() throws Exception {
		System.out.println("inside LoginAction execute");		
		user = getUserDAO().getUserByCredentials(getUser().getEmail(), getUser().getPwd());
        if(user == null) return ERROR;
        else {
        	System.out.println("Logged in user's first name is " + getUser().getFirstName());
        	sessionAttributes.put("LOGGEDINUSER", user);
        	return SUCCESS;
        }
//        User userDB = getUserDAO().getUserByCredentials(user.getEmail(), user.getPwd());
//        if(userDB == null) return ERROR;
//        else {
//            user.setUserId(userDB.getUserId());
//            user.setFirstName(userDB.getFirstName());
//            user.setLastName(userDB.getLastName());
//            sessionAttributes.put("USER", user);
//            return SUCCESS;
//        }
	}

	public String logout() {
		if (sessionAttributes.containsKey("LOGGEDINUSER")) {
			sessionAttributes.remove("LOGGEDINUSER");
		}
		return SUCCESS;
		
//		sessionAttributes.clear();
//		sessionAttributes.remove("USER");
//		if (sessionAttributes instanceof org.apache.struts2.dispatcher.SessionMap) {
//			try {
//				((org.apache.struts2.dispatcher.SessionMap) sessionAttributes).invalidate();
//			} catch (IllegalStateException e) { //if attempting to invalidate an already-invalid session
//				System.out.println("logout exception!: " + e);
//			}
//		}
// 
//		if (sessionAttributes != null) {
//			sessionAttributes.invalidate();
//		}
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
		this.sessionAttributes = sessionAttributes;
	}

}
