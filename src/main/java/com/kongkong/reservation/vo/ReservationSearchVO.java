package com.kongkong.reservation.vo;

import com.kongkong.common.vo.PagingVO;

@SuppressWarnings("serial")
public class ReservationSearchVO extends PagingVO{
	
		// 검색 관련 필드
		private String searchType;
		private String searchShipping;
		private String searchWord;
		private String searchCategory;
		private String searchYN;
		private String searchStartDate;
		private String searchEndDate;
		private String userId;
		
		// get / set
		
		
		public String getSearchType() {
			return searchType;
		}
		public void setSearchType(String searchType) {
			this.searchType = searchType;
		}
		public String getSearchWord() {
			return searchWord;
		}
		public void setSearchWord(String searchWord) {
			this.searchWord = searchWord;
		}
		public String getSearchCategory() {
			return searchCategory;
		}
		public void setSearchCategory(String searchCategory) {
			this.searchCategory = searchCategory;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getSearchStartDate() {
			return searchStartDate;
		}
		public void setSearchStartDate(String searchStartDate) {
			this.searchStartDate = searchStartDate;
		}
		public String getSearchEndDate() {
			return searchEndDate;
		}
		public void setSearchEndDate(String searchEndDate) {
			this.searchEndDate = searchEndDate;
		}
		public String getSearchShipping() {
			return searchShipping;
		}
		public void setSearchShipping(String searchShipping) {
			this.searchShipping = searchShipping;
		}
		public String getSearchYN() {
			return searchYN;
		}
		public void setSearchYN(String searchYN) {
			this.searchYN = searchYN;
		}
		
}
