package mhrda.socialme.interceptors;

import org.apache.struts2.dispatcher.SessionMap;

import mhrda.socialme.entities.User;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthenticationInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		System.out.println("inside auth interceptor");
		SessionMap<String, Object> sessionAttributes = (SessionMap<String, Object>) actionInvocation.getInvocationContext().getSession();
		
		User loggedInUser = (User) sessionAttributes.get("LOGGEDINUSER");
		
		if(loggedInUser == null) {
			System.out.println("AUTH INTERCEPTOR - No logged in user. Returning to Login.");
			return Action.LOGIN;
		} else {
			Action action = (Action) actionInvocation.getAction();
			
			if(action instanceof UserAware) {  // to make sure that action class is implementing UserAware interface
				System.out.println("AUTH INTERCEPTOR - Setting logged in user in action.");
				((UserAware) action).setLoggedInUser(loggedInUser);  // if session is valid, then user is injected into action class
			}
			
			return actionInvocation.invoke();  // the invoke() method will call the next interceptor or action class in the chain
		}
	}

}
