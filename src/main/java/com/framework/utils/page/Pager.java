package com.framework.utils.page;

import java.util.List;

@SuppressWarnings("hiding")
public class Pager<Object> {
	/** 分页的结果集 */
	private List<Object> pageList;
	/** 总条数 */
	private int totalNum;

	public List<Object> getPageList() {
		return pageList;
	}

	public void setPageList(List<Object> pageList) {
		this.pageList = pageList;
	}

	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	@Override
	public String toString() {
		return "Pager [pageList=" + pageList + ", totalNum=" + totalNum + "]";
	}

}
