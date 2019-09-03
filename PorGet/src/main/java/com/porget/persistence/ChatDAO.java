package com.porget.persistence;

import java.util.List;

import com.porget.domain.ChatVO;

public interface ChatDAO {

	public List<ChatVO> getChatList(ChatVO vo);
	public List<ChatVO> chatListRecent(ChatVO vo, int base);
	public void send(ChatVO vo);
}
