package com.porget.domain;

public class UserVO {
	
	private String uname;
	private String upass;
	private String uemail;
	private String uphoto;
	private int ucheck;
	
	
	
	
	public int getUcheck() {
		return ucheck;
	}
	public void setUcheck(int ucheck) {
		this.ucheck = ucheck;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUphoto() {
		return uphoto;
	}
	public void setUphoto(String uphoto) {
		this.uphoto = uphoto;
	}
	@Override
	public String toString() {
		return "UserVO [uname=" + uname + ", upass=" + upass + ", uemail=" + uemail + ", uphoto=" + uphoto + ", ucheck="
				+ ucheck + "]";
	}
	
	
	
	
	
	

}
