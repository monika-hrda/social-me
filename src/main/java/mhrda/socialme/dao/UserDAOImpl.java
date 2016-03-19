package mhrda.socialme.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import mhrda.socialme.entities.User;

public class UserDAOImpl implements UserDAO {
	
	private SessionFactory sf;
	
	public UserDAOImpl(SessionFactory sf){
		this.sf = sf;
	}

	@Override
	public User getUserByCredentials(String email, String password) {
		Session session = sf.getCurrentSession();
        Query query = session.createQuery("from User where email=:email and pwd=:pwd");
        query.setString("email", email); 
        query.setString("pwd", password);
        User user = (User) query.uniqueResult();
        return user;
	}
	
	@Override
	public User getUserById(int userId) {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("from User where id=:userId");
		query.setInteger("userId", userId);
		User user = (User) query.uniqueResult();		
		System.out.println("User Retrieved from DB:" + user);
		return user;
	}
	
	@Override
	public long testUserExists(String email) {  //returns count of existing users with the entered email address
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("select count(*) from User where email=:email");
		query.setString("email", email);
		long countExistingUsers = (long) query.uniqueResult();
		System.out.println("(inside UserDAOImpl) How many users with email " + email + " exist already? : " + countExistingUsers);
		return countExistingUsers;
	}

	@Override
	public int saveUser(User user) {
		Session session = sf.getCurrentSession();
		int userId = 0;
		try {
			userId = (int) session.save(user);
			// save method guarantees that the identifier value will be assigned to the persistent instance immediately; 
			// returns the generated ID of the entity
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			System.out.println("new user saved witd id " + userId);
		}
		return userId;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findUsers(String firstName, String lastName) {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("from User where firstName like :firstName and lastName like :lastName order by lastName ASC");
		query.setParameter("firstName", firstName + "%");
		query.setParameter("lastName", lastName + "%");
		query.setFirstResult(0);
		query.setMaxResults(10);
		List<User> foundUsers = null;
		try {
			foundUsers = (List<User>) query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
        for (User foundUser : foundUsers) {
        	System.out.println("Users found by search: ");
        	System.out.println(foundUser.getFirstName() + " " + foundUser.getLastName());
        }
		return foundUsers;
	}

}
