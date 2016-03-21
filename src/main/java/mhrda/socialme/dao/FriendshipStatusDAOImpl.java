package mhrda.socialme.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import mhrda.socialme.entities.FriendshipStatus;

public class FriendshipStatusDAOImpl implements FriendshipStatusDAO {
	
	private SessionFactory sf;
	
	public FriendshipStatusDAOImpl(SessionFactory sf) {
		this.sf = sf;
	}

	@Override
	public FriendshipStatus getFriendshipStatusByName(String statusName) {
		Session session = sf.getCurrentSession();
        Query query = session.createQuery("from FriendshipStatus where friendshipStatusName = :statusName");
        query.setString("statusName", statusName);
        FriendshipStatus friendshipStatus = (FriendshipStatus) query.uniqueResult();
		return friendshipStatus;
	}

}
