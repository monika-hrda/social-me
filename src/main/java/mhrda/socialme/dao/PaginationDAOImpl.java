package mhrda.socialme.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import mhrda.socialme.utilities.Page;

public class PaginationDAOImpl implements PaginationDAO {
	
	private SessionFactory sf;
	
	public PaginationDAOImpl(SessionFactory sf) {
		this.sf = sf;
	}

	/*
	 * Extracts appropriate records from a table belonging to the page number and 
	 * returns the same in the form of Page object.
	 * If there are a column to order by and a sort order provided, then the returned records are ordered.
	 * Number of records returned can be chosen by providing the pageSize.
	 * This method retrieves the records by calling the constructor of the Page class.
	 * This method allows retrieving the page when user clicks on page number from a JSP page.
	 */
	@Override
	public Page getPage(int page, String tableName, String sortColumn, String sortOrder, int pageSize) {
		Session session = sf.getCurrentSession();
		
		StringBuilder query = new StringBuilder();
		query.append("from " + tableName);
		if (sortColumn != null && sortOrder != null) {
			query.append(" order by " + sortColumn);
			query.append(" " + sortOrder);
		}
		
		Query paginationQuery = session.createQuery(query.toString());
		
		try {
			return new Page(paginationQuery, page, pageSize);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	/*
	 * Retrieves the total number of pages 
	 * based on the number of records in the table and the maximum number of records on a page.
	 * 
	 */
	@Override
	public int getTotalPages(String tableName, int pageSize) {
		Session session = sf.getCurrentSession();
		SQLQuery query = session.createSQLQuery("select count(*) as Total from " + tableName);
		
		try {
			String total = query.addScalar("Total").uniqueResult().toString();
			return (int) Math.ceil(Double.parseDouble(total)/pageSize);
		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}

}
