package org.zerock.domain;


public class Criteria {
	
	private int per_page_value=10;
	private int page_value=10;
	private int page = 1;
	private int all_page_num;

	
	
	
	public Criteria() {
		super();
	}



	public int getPer_page_value() {
		return per_page_value;
	}

	public void setPer_page_value(int per_page_value) {
		//사용자가 0보다 작은 한페이지의 게시글 갯수를 입력할 경우 , 100개를 초과하는 경우
		if(per_page_value<=0||per_page_value>100) {
			this.per_page_value = 10;
		}
		this.per_page_value = per_page_value;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		
		//만약 사용자가 page를 1미만의 값으로 입력할 경우
		if(page<=0) {
			this.page=1;
			return;
		//만약 사용자가 page를 최대치 보다 높게 검색할 경우
		}else if(getMaxPage()<page) {
			this.page= getMaxPage();
		}
		this.page = page;
	}
	
	
	public void setAll_page_num(int all_page_num) {
		this.all_page_num = all_page_num;
	}



	public int getMaxPage() {
		double max_page = this.all_page_num/(double)this.per_page_value;
		return (int)Math.ceil(max_page);
	}
	
	
	public int start_page() {
		return ((this.page-1)/this.page_value)*this.page_value+1;
	}
	public int end_page() {
		if(((this.page-1)/this.page_value+1)*this.page_value==getMaxPage()) {
			return getMaxPage();
		}else {
			return ((this.page-1)/this.page_value+1)*this.page_value;
		}
	}

	public int getStart_page() {
		return this.per_page_value*(this.page-1)+1;
	}

	public int getEnd_page() {
		if(this.per_page_value*this.page<this.all_page_num) {
			return this.per_page_value*this.page;
		}else{
			return this.all_page_num;
		}
	}
	
	

	@Override
	public String toString() {
		return "Criteria [per_page_value=" + per_page_value + ", page_value=" + page_value + ", page=" + page
				+ ", all_page_num=" + all_page_num + ", getPer_page_value()=" + getPer_page_value() + ", getPage()="
				+ getPage() + ", start_page()=" + start_page() + ", end_page()=" + end_page() + ", getStart_page()="
				+ getStart_page() + ", getEnd_page()=" + getEnd_page() + "]";
	}

	
	
	
		

	
}
