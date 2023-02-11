package com.talentDonation.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Program {
	private int progId;
	private String progTrmemId;
	private int progKeyId;
	private String progTitle;
	private String progLocation;
	private int progPrice;
	private int progRecruitNum;
	private String progContent;
	private int progRsvStatus;
	private int progStatus;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date progDue;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date progStartDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date progEndDate;

	private String memName;

	private String keyName;

	private int rn;
}
