package com.talentDonation.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Apply {
	private int applyDogId;
	private int applyProgId;
	private int applyStatus;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date applyDate;

	private int rn;

	private String dogMemId;
	private String dogName;
	private String dogBreed;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dogBirthday;

	private int memType;
	private String memId;
	private String memName;
	private String memTel;

	private String progPrice;
	private String progTrmemId;
	private String progTitle;
	private String progLocation;

}
