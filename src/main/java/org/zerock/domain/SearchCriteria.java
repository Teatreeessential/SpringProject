package org.zerock.domain;

public class SearchCriteria extends Criteria {

	private String searchType;
	private String keyword;
	
	public SearchCriteria() {
		super();
		
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", getPer_page_value()="
				+ getPer_page_value() + ", getPage()=" + getPage() + ", getMaxPage()=" + getMaxPage()
				+ ", start_page()=" + start_page() + ", end_page()=" + end_page() + ", getStart_page()="
				+ getStart_page() + ", getEnd_page()=" + getEnd_page() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}

	
	
	
	
}
