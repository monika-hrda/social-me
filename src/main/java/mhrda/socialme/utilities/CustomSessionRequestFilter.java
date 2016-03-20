package mhrda.socialme.utilities;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.hibernate.SessionFactory;
import org.hibernate.StaleObjectStateException;

/**
 * custom transaction interceptor, Hibernate thread filter
 * Open Session in View pattern
 * https://developer.jboss.org/wiki/OpenSessionInView?_sscc=t
 *
 */
public class CustomSessionRequestFilter implements Filter {

	private SessionFactory sf;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		
		try {  
            System.out.println("Starting a database transaction");  
            sf.getCurrentSession().beginTransaction();  
  
            // Call the next filter (continue request processing)  
            chain.doFilter(request, response);  
  
            // Commit and cleanup  
            System.out.println("Committing the database transaction");  
            sf.getCurrentSession().getTransaction().commit();  
  
        } catch (StaleObjectStateException staleEx) {  
        	System.err.println("This interceptor does not implement optimistic concurrency control!");  
        	System.err.println("Your application will not work until you add compensation actions!");  
            // Rollback, close everything, possibly compensate for any permanent changes  
            // during the conversation, and finally restart business conversation. Maybe  
            // give the user of the application a chance to merge some of his work with  
            // fresh data... what you do here depends on your applications design.  
            throw staleEx;  
        } catch (Throwable ex) {  
            // Rollback only  
            ex.printStackTrace();  
            try {  
                if (sf.getCurrentSession().getTransaction().isActive()) {  
                	System.out.println("Trying to rollback database transaction after exception");  
                    sf.getCurrentSession().getTransaction().rollback();  
                }  
            } catch (Throwable rbEx) {  
            	System.err.println("Could not rollback transaction after exception!");  
            }  
  
            // Let others handle it... maybe another interceptor for exceptions?  
            throw new ServletException(ex);  
        }
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Initializing filter...");
		System.out.println("Obtaining SessionFactory from static HibernateUtil singleton");
		sf = HibernateUtil.getSessionFactory();
	}
	
	@Override
	public void destroy() {}

}
