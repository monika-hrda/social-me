package mhrda.socialme.dao;

import java.util.ArrayList;
import java.util.List;

import mhrda.socialme.entities.Friendship;
import mhrda.socialme.entities.User;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class FriendshipDAOImpl implements FriendshipDAO {
	
	private SessionFactory sf;
	
	public FriendshipDAOImpl(SessionFactory sf){
		this.sf = sf;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getExistingFriendsOf(User user) {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("from Friendship f where (f.friendRequester.userId=:userId or f.friendResponder.userId=:userId)" + 
				"and f.friendshipStatus.friendshipStatusName='accepted'");
		query.setInteger("userId", user.getUserId());
		query.setFirstResult(0);
		query.setMaxResults(1000);
		
		List<Friendship> acceptedFriendships = null;
		try {
			acceptedFriendships = (List<Friendship>) query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
		
		List<User> foundFriends = new ArrayList<User>();
		for (Friendship acceptedFriendship : acceptedFriendships) {
			if (acceptedFriendship.getFriendRequester().getUserId() != user.getUserId()) {
				foundFriends.add(acceptedFriendship.getFriendRequester());
			} else {
				foundFriends.add(acceptedFriendship.getFriendResponder());
			}
		}
		
		return foundFriends;
	}

}
