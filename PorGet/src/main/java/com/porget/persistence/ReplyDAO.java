package com.porget.persistence;

import java.util.List;
import java.util.Map;

import com.porget.domain.ReplyVO;

public interface ReplyDAO {
	
	public void replySave(ReplyVO vo);
	public List<ReplyVO> replyList(int pfnum);
	public void replyDelete(Map<String, Integer>map);
	

}
