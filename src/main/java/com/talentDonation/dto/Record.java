package com.talentDonation.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Record {
	private int rcDogId;
	private int rcProgId;
	private String rcTitle;
	private String rcContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date rcRegDate;

	private String dogMemId;
	private String dogName;

	private String progTrmemId;
	private String progTitle;

	private int rn;
}
