package com.porget.domain;

public class Porget_recruiterVO {
	
	private String cname;
	private String cemail;
	private String cdomain;
	private int cphoto;
	private int cpass;
	
	public Porget_recruiterVO() {
		// TODO Auto-generated constructor stub
	}

	public Porget_recruiterVO(String cname, String cemail, String cdomain, int cphoto, int cpass) {
		super();
		this.cname = cname;
		this.cemail = cemail;
		this.cdomain = cdomain;
		this.cphoto = cphoto;
		this.cpass = cpass;
	}

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

	public int getCphoto() {
		return cphoto;
	}

	public void setCphoto(int cphoto) {
		this.cphoto = cphoto;
	}

	public int getCpass() {
		return cpass;
	}

	public void setCpass(int cpass) {
		this.cpass = cpass;
	}

	
	

}
