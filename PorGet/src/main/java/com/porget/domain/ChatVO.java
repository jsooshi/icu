package com.porget.domain;

import java.util.Date;
import com.google.gson.Gson;

public class ChatVO {
	
	private String senderUname;
	private String toUname;
	private String chatContext;
	private int mCheck;
	private Date sendDate;
	
	public static ChatVO convertMessage(String source) {
		ChatVO message = new ChatVO();
		Gson gson = new Gson();
		message = gson.fromJson(source,  ChatVO.class);
		return message;
	}
	
	
	
	public String getSenderUname() {
		return senderUname;
	}
	public void setSenderUname(String senderUname) {
		this.senderUname = senderUname;
	}
	public String getToUname() {
		return toUname;
	}
	public void setToUname(String toUname) {
		this.toUname = toUname;
	}
	public String getChatContext() {
		return chatContext;
	}
	public void setChatContext(String chatContext) {
		this.chatContext = chatContext;
	}
	public int getmCheck() {
		return mCheck;
	}
	public void setmCheck(int mCheck) {
		this.mCheck = mCheck;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	
	@Override
	public String toString() {
		return "ChatVO [senderUname=" + senderUname + ", toUname=" + toUname + ", chatContext=" + chatContext
				+ ", mCheck=" + mCheck + ", sendDate=" + sendDate + "]";
	}
	
	
}
