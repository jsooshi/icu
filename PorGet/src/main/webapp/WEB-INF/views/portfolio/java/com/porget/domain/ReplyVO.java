package com.porget.domain;

import java.util.Date;

public class ReplyVO {

	private int pfnum;
	private String rcontent; //댓글내용
	private String uname; //유저이름
	private Date rdate;
	private int rnum; //댓글번호,pk, reply_seq
	private int rdeep; //깊이 0,1 
	private int rgroup;//reply_seq.currval
	
	
	
	public ReplyVO() {
		
	}
	
	
	public ReplyVO(int pfnum, String rcontent, String uname, Date rdate, int rnum, int rdeep, int rgroup) {
		
		this.pfnum = pfnum;
		this.rcontent = rcontent;
		this.uname = uname;
		this.rdate = rdate;
		this.rnum = rnum;
		this.rdeep = rdeep;
		this.rgroup = rgroup;
	}
	public int getPfnum() {
		return pfnum;
	}
	public void setPfnum(int pfnum) {
		this.pfnum = pfnum;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getRdeep() {
		return rdeep;
	}
	public void setRdeep(int rdeep) {
		this.rdeep = rdeep;
	}
	public int getRgroup() {
		return rgroup;
	}
	public void setRgroup(int rgroup) {
		this.rgroup = rgroup;
	}


	@Override
	public String toString() {
		return "ReplyVO [pfnum=" + pfnum + ", rcontent=" + rcontent + ", uname=" + uname + ", rdate=" + rdate
				+ ", rnum=" + rnum + ", rdeep=" + rdeep + ", rgroup=" + rgroup + "]";
	}
	
	
	
	
	
	
	
}
