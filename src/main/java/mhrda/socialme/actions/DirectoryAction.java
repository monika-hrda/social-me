package mhrda.socialme.actions;

import java.util.List;

import mhrda.socialme.entities.User;

public class DirectoryAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private List<User> users;
	private int pageNo;
	private int pageCount;
	
	public String view() throws Exception {
		pageNo = 1;
		getPage();
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getPage() throws Exception {
		pageCount = getPaginationDAO().getTotalPages("User", 10);
		users = (List<User>) getPaginationDAO().getPage(pageNo-1, "User", "lastName", "ASC", 10).getList();
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
	
}
