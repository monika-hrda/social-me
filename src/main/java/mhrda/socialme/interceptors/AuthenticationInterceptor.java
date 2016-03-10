package mhrda.socialme.interceptors;

import java.util.Map;

import mhrda.socialme.entities.User;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthenticationInterceptor extends AbstractInterceptor {  //implements Interceptor

	private static final long serialVersionUID = -2736371062123196564L;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		System.out.println("inside auth interceptor");
		Map<String, Object> sessionAttributes = actionInvocation.getInvocationContext().getSession();
		
		User user = (User) sessionAttributes.get("LOGGEDINUSER");
		
		if(user == null) {
			return Action.LOGIN;
		} else {
			Action action = (Action) actionInvocation.getAction();
			if(action instanceof UserAware) {	// to make sure that action class is implementing UserAware interface
				((UserAware) action).setUser(user);	// if session is valid, then user is injected into action class
			}
			return actionInvocation.invoke();	// ActionInvocation invoke() method that will call the next interceptor or action class in the chain
		}
	}

}
