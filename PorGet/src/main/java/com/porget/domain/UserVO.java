package com.porget.domain;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	
	private String uname;
	private String upass;
	private String uemail;
	private String uphoto;
	private String uinfo;
	private Date udate;
	private int enabled;
	
	private List<AuthVO> authList;
	
	public UserVO() {
	}

	public UserVO(String uname, String upass, String uemail, String uphoto, String uinfo, int enabled) {
		super();
		this.uname = uname;
		this.upass = upass;
		this.uemail = uemail;
		this.uphoto = uphoto;
		this.uinfo = uinfo;
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "UserVO [uname=" + uname + ", upass=" + upass + ", uemail=" + uemail + ", uphoto=" + uphoto + ", uinfo="
				+ uinfo + ", udate=" + udate + ", enabled=" + enabled + ", authList=" + authList + "]";
	}

	
	
		
	
	
}
