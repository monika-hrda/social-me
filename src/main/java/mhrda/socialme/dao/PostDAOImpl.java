package mhrda.socialme.dao;

import mhrda.socialme.entities.Post;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class PostDAOImpl implements PostDAO {
	
	private SessionFactory sf;
	
	public PostDAOImpl(SessionFactory sf){
		this.sf = sf;
	}

	@Override
	public int createPost(Post post) {
		Session session = sf.getCurrentSession();
		int postId = 0;
		try {
			postId = (int) session.save(post);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return postId;
	}
		
}
