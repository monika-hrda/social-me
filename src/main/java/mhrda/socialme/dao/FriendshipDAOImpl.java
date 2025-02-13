package mhrda.socialme.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import mhrda.socialme.entities.Friendship;
import mhrda.socialme.entities.FriendshipStatus;
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
		Query query = session.createQuery("from Friendship f where (f.friendRequester = :user or f.friendResponder = :user)" + 
				"and f.friendshipStatus.friendshipStatusName='accepted'");
		query.setParameter("user", user);
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Friendship> getFriendRequests(User user) {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("from Friendship f where f.friendResponder = :user " + 
				"and f.friendshipStatus.friendshipStatusName = 'requested' order by f.requestTime DESC");
		query.setParameter("user", user);
		query.setFirstResult(0);
		query.setMaxResults(1000);
		
		List<Friendship> friendshipRequests = null;
		try {
			friendshipRequests = (List<Friendship>) query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
		
		return friendshipRequests;
	}

	@Override
	public int sendFriendRequest(User loggedInUser, User addFriendUser, FriendshipStatus status, Timestamp requestTime) {
		Session session = sf.getCurrentSession();
		int friendshipId = 0;
		try {
			Friendship newFriendship = new Friendship(loggedInUser, addFriendUser, status, requestTime);
			friendshipId = (int) session.save(newFriendship);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return friendshipId;
	}

	@Override
	public void actionFriendRequest(int requestedFriendshipId, FriendshipStatus newStatus, Timestamp responseTime) {
		Session session = sf.getCurrentSession();
		Friendship requestedFriendship = getFriendshipById(requestedFriendshipId);
		requestedFriendship.setFriendshipStatus(newStatus);
		requestedFriendship.setResponseTime(responseTime);
		session.update(requestedFriendship);
	}

	@Override
	public Friendship getFriendshipById(int friendshipId) {
		Session session = sf.getCurrentSession();
		return (Friendship) session.load(Friendship.class, friendshipId);
	}

	@Override
	public void deleteFriendshipById(int friendshipId) {
		Session session = sf.getCurrentSession();
		session.delete(getFriendshipById(friendshipId));
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getRespondersFor(User user) {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("select f.friendResponder from Friendship f where f.friendRequester = :user " +
				"order by f.friendResponder.lastName ASC");
		query.setParameter("user", user);
		query.setFirstResult(0);
		query.setMaxResults(1000);
		
		List<User> responders = new ArrayList<User>();
		try {
			responders = (List<User>) query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return responders;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<User, Integer> getRequestersFor(User user) {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("from Friendship f where f.friendResponder = :user " +
				"order by f.friendRequester.lastName ASC");
		query.setParameter("user", user);
		query.setFirstResult(0);
		query.setMaxResults(1000);
		
		List<Friendship> requestersFriendships = null;
		try {
			requestersFriendships = (List<Friendship>) query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		
		Map<User, Integer> requestersMap = new HashMap<User, Integer>();
		for (Friendship requestersFriendship : requestersFriendships) {
			requestersMap.put(requestersFriendship.getFriendRequester(), requestersFriendship.getFriendshipId());
		}
		
		return requestersMap;
	}

	@Override
	public Friendship getFriendshipBetweenUsers(User loggedInUser, User checkUser) {
		Session session = sf.getCurrentSession();
		Query friendQuery = session.createQuery("from Friendship f where " + 
				"(f.friendRequester = :loggedInUser and f.friendResponder = :checkUser) or " + 
				"(f.friendRequester = :checkUser and f.friendResponder = :loggedInUser)");
		friendQuery.setParameter("loggedInUser", loggedInUser);
		friendQuery.setParameter("checkUser", checkUser);
		
		Friendship foundFriendship = null;
		
		try {
			foundFriendship = (Friendship) friendQuery.uniqueResult();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		
		return foundFriendship;
	}

}
