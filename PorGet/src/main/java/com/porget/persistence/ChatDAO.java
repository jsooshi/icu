package com.porget.persistence;

import java.util.List;
import java.util.Map;

import com.porget.domain.ChatVO;

public interface ChatDAO {
	
	public int insertChat(ChatVO vo);
	public String selectUphoto(String uname);
	public int chatListCount(ChatVO vo);
	public int deleteChat(ChatVO vo);
	public List<Map<String, Object>> deleteChattoUname(String uname);
	public List<Map<String, Object>> chatList(ChatVO vo, int base, int bound);
	public List<Map<String, Object>> chatListAll(String uname);
}
