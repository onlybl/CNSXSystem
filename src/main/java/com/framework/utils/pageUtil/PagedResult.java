package com.framework.utils.pageUtil;

import java.util.List;


public class PagedResult<T> extends PageBaseEntity {
	
	/*serialVersionUID*/
	private static final long serialVersionUID = 1L;

	private List<T> dataList;
	
	private long pageNo;
	
	private long pageSize;//条数
	
	private long total;//总条
	
	private long pages;//总页

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	public long getPageNo() {
		return pageNo;
	}

	public void setPageNo(long pageNo) {
		this.pageNo = pageNo;
	}

	public long getPageSize() {
		return pageSize;
	}

	public void setPageSize(long pageSize) {
		this.pageSize = pageSize;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public long getPages() {
		return pages;
	}

	public void setPages(long pages) {
		this.pages = pages;
	}
	
}
