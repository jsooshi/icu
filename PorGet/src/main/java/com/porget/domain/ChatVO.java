package com.porget.domain;

import oracle.sql.DATE;

public class ChatVO {
	
	private int chatID;
	private String fromID;
	private String toID;
	private String chatContent;
	private DATE chatTime;
	
	public ChatVO() {
	}
	
	public ChatVO(int chatID, String fromID, String toID, String chatContent, DATE chatTime) {
		super();
		this.chatID = chatID;
		this.fromID = fromID;
		this.toID = toID;
		this.chatContent = chatContent;
		this.chatTime = chatTime;
	}

	public int getChatID() {
		return chatID;
	}
	public void setChatID(int chatID) {
		this.chatID = chatID;
	}
	public String getFromID() {
		return fromID;
	}
	public void setFromID(String fromID) {
		this.fromID = fromID;
	}
	public String getToID() {
		return toID;
	}
	public void setToID(String toID) {
		this.toID = toID;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public DATE getChatTime() {
		return chatTime;
	}
	public void setChatTime(DATE chatTime) {
		this.chatTime = chatTime;
	}
	@Override
	public String toString() {
		return "ChatVO [chatID=" + chatID + ", fromID=" + fromID + ", toID=" + toID + ", chatContent=" + chatContent
				+ ", chatTime=" + chatTime + "]";
	}
	
	
	
	
	
	

}
