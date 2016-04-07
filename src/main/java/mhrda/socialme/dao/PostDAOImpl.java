package mhrda.socialme.dao;

import java.util.List;

import mhrda.socialme.entities.Post;
import mhrda.socialme.entities.User;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
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
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Post> getPostsForFeedOf(User loggedInUser) {
		Session session = sf.getCurrentSession();
		
		/* This native SQL query returns all Posts for users who are friends of the logged-in user.
		 * Posts to the logged-in user are also shown.
		 * Most recent posts are shown at the top of the feed.
		 */
		StringBuilder query = new StringBuilder();
		query.append("select distinct p.* ");
		query.append("from socialme.post p ");
		query.append("join socialme.user u on u.id = p.for_user_id ");
		query.append("join socialme.friendship f on f.user_a_id = u.id or f.user_b_id = u.id ");
		query.append("where (f.user_a_id = :loggedInUser or f.user_b_id = :loggedInUser) ");
		query.append("and f.friendship_status_id = 2 ");
		query.append("order by p.created_time desc");
		
		SQLQuery feedQuery = session.createSQLQuery(query.toString());
		feedQuery.setParameter("loggedInUser", loggedInUser.getUserId());
		feedQuery.addEntity(Post.class);
		feedQuery.setFirstResult(0);
		feedQuery.setMaxResults(1000);
		
		List<Post> posts = null;
		
		try {
			posts = (List<Post>) feedQuery.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		
		return posts;
	}
		
}
