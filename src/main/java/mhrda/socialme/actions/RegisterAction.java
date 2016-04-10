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
 
        long numberOfExistingUsers = getUserDAO().testUserExists(user.getEmail());  //checks whether user with the email address exists already
        
        if (numberOfExistingUsers>0) {
        	addActionError("This email address is already being used on SocialMe!");
        	addFieldError("email", "This email address is already being used on SocialMe!");
        	return ERROR;
        }
        
        if (!(user.getPwd().equals(user.getConfirmPwd()))) {
        	addActionError("Both entered passwords must match.");
        	addFieldError("confirmPwd", "Both entered passwords must match.");
        	return ERROR;
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
        	if (sessionAttributes.containsKey("ACTIVEUSERPROFILE")) {
    			sessionAttributes.remove("ACTIVEUSERPROFILE");
    		}
        	addActionMessage("Thank you for registering with SocialMe. Would you like to edit your details or upload a profile picture?");
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
