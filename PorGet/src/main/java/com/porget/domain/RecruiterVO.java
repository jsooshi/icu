package com.porget.domain;

public class RecruiterVO {
	
	private String cname;
	private String cemail;
	private String cdomain;
	private String cpass;
	private String cphoto;
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCemail() {
		return cemail;
	}
	public void setCemail(String cemail) {
		this.cemail = cemail;
	}
	public String getCdomain() {
		return cdomain;
	}
	public void setCdomain(String cdomain) {
		this.cdomain = cdomain;
	}
	public String getCpass() {
		return cpass;
	}
	public void setCpass(String cpass) {
		this.cpass = cpass;
	}
	public String getCphoto() {
		return cphoto;
	}
	public void setCphoto(String cphoto) {
		this.cphoto = cphoto;
	}
	@Override
	public String toString() {
		return "RecruiterVO [cname=" + cname + ", cemail=" + cemail + ", cdomain=" + cdomain + ", cpass=" + cpass
				+ ", cphoto=" + cphoto + "]";
	}
	
	
	
	
	
	

}
