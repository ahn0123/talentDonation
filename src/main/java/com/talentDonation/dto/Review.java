package com.talentDonation.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Review {
	private int revDogId;
	private int revProgId;
	private String revTitle;
	private String revContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date revRegDate;
	private int revRate;

	private String dogMemId;

	private String progTitle;

	private int rn;
}