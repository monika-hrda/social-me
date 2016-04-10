package mhrda.socialme.dao;

import mhrda.socialme.utilities.Page;

public interface PaginationDAO {
	
	Page getPage(int page, String tableName, String sortColumn1, String sortColumn2, String sortOrder, int pageSize);
	
	int getTotalPages(String tableName, int pageSize);

}
