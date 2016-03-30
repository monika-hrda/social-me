package mhrda.socialme.actions;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import mhrda.socialme.entities.User;
import mhrda.socialme.utilities.GeneralUtilities;

import com.opensymphony.xwork2.ModelDriven;

public class RegisterAction extends BaseAction implements ModelDriven<User>, SessionAware {

	private static final long serialVersionUID = 1L;
	
	private User user = new User();   // instantiating because of model-driven approach to action class
	private SessionMap<String, Object> sessionAttributes;
	
	@Override
	public String execute() throws Exception {
		System.out.println("inside RegisterAction execute");
 
        long numberOfExistingUsers = getUserDAO().testUserExists(user.getEmail());  //checks whether user with the email address exists already
        
        if (numberOfExistingUsers>0) {
        	System.out.println("inside RegisterAction: user with given email address exists already; cannot register new user");
        	return ERROR;   //TODO add special note about email/user existing already
        }
        
       	int id = 0;
       	
       	//Create a one-way hash of the user's password before saving to the database.
       	//Passwords cannot be recovered. User can only set a new password if forgotten.
       	user.setPwd(GeneralUtilities.toSHA1(user.getPwd()));
       	
        try {
        	id = getUserDAO().saveUser(getModel());
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        if (id>0) {
        	sessionAttributes.put("LOGGEDINUSER", user);
        	System.out.println("inside RegisterAction: new user registered successfully");
        	return SUCCESS;
        } else return ERROR;
	}

	@Override
	public User getModel() {
		return this.user;
	}

	@Override
	public void setSession(Map<String, Object> sessionAttributes) {
		this.sessionAttributes = (SessionMap<String, Object>) sessionAttributes;	
	}

}
