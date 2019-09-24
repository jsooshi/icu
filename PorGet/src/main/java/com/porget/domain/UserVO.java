package com.porget.domain;

import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	
	private String uname;
	private String upass;
	private String uemail;
	private String uphoto;
	private String uinfo;
	private int enabled;
	
	private List<AuthVO> authList;
		
}
