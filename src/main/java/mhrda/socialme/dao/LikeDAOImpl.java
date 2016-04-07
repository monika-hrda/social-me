package mhrda.socialme.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import mhrda.socialme.entities.Like;

public class LikeDAOImpl implements LikeDAO {

	private SessionFactory sf;
	
	public LikeDAOImpl(SessionFactory sf) {
		this.sf = sf;
	}
	
	@Override
	public int createLike(Like newLike) {
		Session session = sf.getCurrentSession();
		
		int likeId = 0;
		
		try {
			likeId = (int) session.save(newLike);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return likeId;
	}

	@Override
	public int deleteLike(int postId, int userId) {
		Session session = sf.getCurrentSession();		
		Query query = session.createQuery("delete from Like l where l.post.postId = :postId and l.likeUser.userId = :userId");
		query.setInteger("postId", postId);
		query.setInteger("userId", userId);
		return (query.executeUpdate());
	}

}
