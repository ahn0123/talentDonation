package com.talentDonation.dto;

import lombok.Data;

@Data
public class Criteria {
    private int pageNum; //현재 페이지
    private int amount; //한 페이지 당 보여질 게시물 갯수
    private String type; //검색 타입
    private String[] typeArr; //검색 타입 배열 변환
    private String keyword; //검색 키워드
    private int skip; //스킵할 게시물 수 : (pageNum-1) * amount


    /* 기본 생성자 --> 기본 세팅 : pageNum = 1, amount = 10 */
    public Criteria() {
        this(1, 10);
    }

    /* 생성자 --> 원하는 pageNum, 원하는 amount */
    public Criteria(int pageNum, int amount) {
        super();
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum-1)*amount;
    }


    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
        this.skip = (pageNum - 1) * this.amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
        this.skip = (this.pageNum - 1) * amount;
    }

    public void setkeyword(String keyword) {
    	this.keyword = keyword;
    }

    public void setType(String type) {
    	this.type = type;
    	this.typeArr = type.split("");
    }

    /* 검색 타입 배열 */

	/*
	 * public String[] getTypeArr() {
	 *
	 * return type == null ? new String[] {} : type.split("");
	 *
	 * }
	 */



	/*
	 * public String makeQueryString(int pageNum) {
	 *
	 * UriComponents uriComponents = UriComponentsBuilder.newInstance()
	 * .queryParam("pageNum", pageNum) .queryParam("amount", amount)
	 * .queryParam("searchType", type) .queryParam("keyword", keyword) .build()
	 * .encode();
	 *
	 * return uriComponents.toUriString(); }
	 */


}