package com.exam.pro.vo;

import lombok.Data;

@Data
public class BoardInfoVO {
	private int biNum;
	private String biTitle;
	private String biContent;
	private String biFilePath;
	private String biCredat;
	private String biCretim;
	private String uiName;
	private int biCnt;
	private int uiNum;
	private int page = 1; // 1page 를 default값으로 해주기 위해서
	private int rows = 10;
	
}
