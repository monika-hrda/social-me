package mhrda.socialme.dao;

import mhrda.socialme.entities.Comment;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class CommentDAOImpl implements CommentDAO {
	
	private SessionFactory sf;
	
	public CommentDAOImpl(SessionFactory sf){
		this.sf = sf;
	}

	@Override
	public int createComment(Comment newComment) {
		Session session = sf.getCurrentSession();
		int commentId = 0;
		try {
			commentId = (int) session.save(newComment);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return commentId;
	}
		
}
