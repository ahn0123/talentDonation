package com.talentDonation.dto;

import lombok.Data;

@Data
public class Member {
	private String memId;
	private String memPwd;
	private String memName;
	private String memTel;
	private String memEmail;
	private int memStatus;
	private int memType;

	private String trMemId;
	private String trCareer;
	private String trLicense;

	private int rn;
}
