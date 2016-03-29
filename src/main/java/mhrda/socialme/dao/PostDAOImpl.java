package mhrda.socialme.dao;

import java.util.List;

import mhrda.socialme.entities.Post;
import mhrda.socialme.entities.User;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class PostDAOImpl implements PostDAO {
	
	private SessionFactory sf;
	
	public PostDAOImpl(SessionFactory sf){
		this.sf = sf;
	}

	@Override
	public int createPost(Post newPost) {
		Session session = sf.getCurrentSession();
		int postId = 0;
		try {
			postId = (int) session.save(newPost);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return postId;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Post> getPostsForProfile(User profileUser) {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("from Post where forUser = :profileUser order by createdTime DESC");
		query.setParameter("profileUser", profileUser);
		query.setFirstResult(0);
		query.setMaxResults(20);
		
		List<Post> posts = null;
		try {
			posts = (List<Post>) query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		
		return posts;
	}

	@Override
	public Post getPostById(int postId) {
		Session session = sf.getCurrentSession();
		return (Post) session.load(Post.class, postId);
	}
		
}
