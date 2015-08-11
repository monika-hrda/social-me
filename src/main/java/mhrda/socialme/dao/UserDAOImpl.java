package mhrda.socialme.dao;

import java.util.List;

import org.hibernate.HibernateException;
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
		Session session = sf.openSession();     // we should open a new session for each request in multi-threaded environment
		// Session session = sf.getCurrentSession();  this session object belongs to hibernate context and is not thread safe
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
	
	@Override
	public long testUserExists(String email) { //returns count of existing users with the entered email address
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("select count(*) from User where email=:email");
		query.setString("email", email);
		long countExistingUsers = (long) query.uniqueResult();
		tx.commit();
		System.out.println("(inside UserDAOImpl) How many users with email " + email + " exist already? " + countExistingUsers);
        session.close();
		return countExistingUsers;
	}

	@Override
	public int saveUser(User user) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		int id = 0;
		try {
			id = (int) session.save(user);
		} catch (HibernateException e) {
			e.printStackTrace();
			tx.rollback();
		}
		// save method guarantees that the identifier value will be assigned to the persistent instance immediately; Returns the generated ID of the entity
		tx.commit();
		System.out.println("user saved witd id " + id);
        session.close();
		return id;
	}

	@Override
	public List<User> findUsers(String firstName, String lastName) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("from User where firstName like :firstName and lastName like :lastName order by lastName ASC");
		query.setParameter("firstName", firstName + "%");
		query.setParameter("lastName", lastName + "%");
		query.setMaxResults(20);
		List<User> foundUsers = null;
		try {
			foundUsers = (List<User>) query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			tx.rollback();
		}
		tx.commit();
        session.close();
        for (User foundUser : foundUsers) {
        	System.out.println(foundUser.getFirstName() + " " + foundUser.getLastName());
        }
		return foundUsers;
	}

}
