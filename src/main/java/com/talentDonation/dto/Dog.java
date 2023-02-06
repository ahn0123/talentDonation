package com.talentDonation.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Dog {
	private int dogId;
	private String dogMemId;
	private String dogName;
	private String dogBreed;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dogBirthday;
	private int dogWeight;
	private String dogRemark;
	private int dogStatus;
}
