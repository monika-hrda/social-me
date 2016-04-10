package mhrda.socialme.actions;

import java.util.List;

import mhrda.socialme.entities.User;

public class DirectoryAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private List<User> users;
	private int pageNo;
	private int pageCount;
	
	private String sortBy;
	private String sortColumn1; 
	private String sortColumn2;
	
	//default values
	private String sortOrder = "ASC";
	private int pageSize = 10;
	
	public String view() throws Exception {
		pageNo = 1;
		getPage();
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getPage() throws Exception {
		pageCount = getPaginationDAO().getTotalPages("User", pageSize);
		
		if (getSortBy() != null && getSortBy().equals("First Name")) {
			setSortColumn1("firstName");
			setSortColumn2("lastName");
		} else {
			setSortColumn1("lastName");
			setSortColumn2("firstName");
		}
		
		users = (List<User>) getPaginationDAO().getPage(pageNo-1, "User", sortColumn1, sortColumn2, sortOrder, pageSize).getList();
		return SUCCESS;
	}
	
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public String getSortColumn1() {
		return sortColumn1;
	}

	public void setSortColumn1(String sortColumn1) {
		this.sortColumn1 = sortColumn1;
	}

	public String getSortColumn2() {
		return sortColumn2;
	}

	public void setSortColumn2(String sortColumn2) {
		this.sortColumn2 = sortColumn2;
	}

	public String getSortBy() {
		return sortBy;
	}

	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}

	public String getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
