package mhrda.socialme.utilities;

import java.util.List;

import org.hibernate.Query;

public class Page {
	
	private List<?> results;
	private int page;
	private int pageSize;
	
	public Page(Query query, int page, int pageSize) {
		this.page = page;  //the page number to be retrieved
		this.pageSize = pageSize;  //the number of records on that page
		results = query.setFirstResult(page*pageSize).setMaxResults(pageSize).list();
	}
	
	/*
	 * returns true if there exists another page after the current page
	 */
	public boolean isNextPage() {
		return results.size() > pageSize;
	}
	
	/*
	 * returns true if there exists a page before the current page
	 */
	public boolean isPreviousPage() {
		return page> 0;
	}
	
	/*
	 * returns the list created by the constructor of this class
	 */
	public List<?> getList() {
		return isNextPage() ? results.subList(0, pageSize-1) : results;
	}

}
