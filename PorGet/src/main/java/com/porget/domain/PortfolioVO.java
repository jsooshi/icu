package com.porget.domain;

import java.util.Date;

public class PortfolioVO { //포트폴리오 테이블 VO
	
	private String uname;
	private int pfnum;
	private String pfname;
	private Date pfdate;
	private String pfthumb;
	private int pfread;
	private String pfurl;
	private String pffile;
	private String pfposition;
	private String tagname;
	
	@Override
	public String toString() {
		return "PortfolioVO [uname=" + uname + ", pfnum=" + pfnum + ", pfname=" + pfname + ", pfdate=" + pfdate
				+ ", pfthumb=" + pfthumb + ", pfread=" + pfread + ", pfurl=" + pfurl + ", pffile=" + pffile
				+ ", pfposition=" + pfposition + ", tagname=" + tagname + "]";
	}
	
	public PortfolioVO() {
	}

	public PortfolioVO(String uname,String pfname, String pfthumb, String pfurl, String pffile, String pfposition, String tagname) {
		//닉네임, 제목, 썸네일, 주소url, 사진파일, 포지션, 태그 
		
		this.uname = uname;
		this.pfname = pfname;
		this.pfthumb = pfthumb;
		this.pfurl = pfurl;
		this.pffile = pffile;
		this.pfposition = pfposition;
		this.tagname = tagname;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public int getPfnum() {
		return pfnum;
	}

	public void setPfnum(int pfnum) {
		this.pfnum = pfnum;
	}

	public String getPfname() {
		return pfname;
	}

	public void setPfname(String pfname) {
		this.pfname = pfname;
	}

	public Date getPfdate() {
		return pfdate;
	}

	public void setPfdate(Date pfdate) {
		this.pfdate = pfdate;
	}

	public String getPfthumb() {
		return pfthumb;
	}

	public void setPfthumb(String pfthumb) {
		this.pfthumb = pfthumb;
	}

	public int getPfread() {
		return pfread;
	}

	public void setPfread(int pfread) {
		this.pfread = pfread;
	}

	public String getPfurl() {
		return pfurl;
	}

	public void setPfurl(String pfurl) {
		this.pfurl = pfurl;
	}

	public String getPffile() {
		return pffile;
	}

	public void setPffile(String pffile) {
		this.pffile = pffile;
	}

	public String getPfposition() {
		return pfposition;
	}

	public void setPfposition(String pfposition) {
		this.pfposition = pfposition;
	}

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

	
	
	
	
	

}
