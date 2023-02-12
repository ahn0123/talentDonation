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

	private String memName;
	private String memTel;

	private int progId;
	private String progTitle;

	private int dogId;
}
