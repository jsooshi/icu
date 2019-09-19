package com.porget.persistence;

import java.util.List;
import java.util.Map;

import com.porget.domain.ChatVO;

public interface ChatDAO {
	
	public int insertChat(ChatVO vo);
	//public String selectUphoto(String )
	
	public List<Map<String, Object>> chatList(ChatVO vo);
}
