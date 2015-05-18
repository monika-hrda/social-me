package mhrda.socialme.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import mhrda.socialme.entities.User;

public class UserDAOImpl implements UserDAO {
	
	private SessionFactory sf;
	
	public UserDAOImpl(SessionFactory sf){
		this.sf = sf;
	}

	@Override
	public User getUserByCredentials(String email, String password) {
		Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("from User where email=:email and pwd=:pwd");
        query.setString("email", email); 
        query.setString("pwd", password);
        User user = (User) query.uniqueResult();
        if(user != null){
            System.out.println("User Retrieved from DB:" + user);
        }
        tx.commit();
        session.close();
        return user;
	}

}
