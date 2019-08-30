package com.porget.domain;

public class Portget_ordinaryVO {

	private String uemail;
	private String uname;
	private String upass;
	private String uphoto;
	private String ucheck;
	
	
	public Portget_ordinaryVO() {
		// TODO Auto-generated constructor stub
	}


	public Portget_ordinaryVO(String uemail, String uname, String upass, String uphoto, String ucheck) {
		super();
		this.uemail = uemail;
		this.uname = uname;
		this.upass = upass;
		this.uphoto = uphoto;
		this.ucheck = ucheck;
	}


	public String getUemail() {
		return uemail;
	}


	public void setUemail(String uemail) {
		this.uemail = uemail;
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


	public String getUphoto() {
		return uphoto;
	}


	public void setUphoto(String uphoto) {
		this.uphoto = uphoto;
	}


	public String getUcheck() {
		return ucheck;
	}


	public void setUcheck(String ucheck) {
		this.ucheck = ucheck;
	}

	
	
	
	
}
