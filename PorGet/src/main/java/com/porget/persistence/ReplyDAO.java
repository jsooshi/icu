package com.porget.persistence;

import java.util.List;

import com.porget.domain.ReplyVO;

public interface ReplyDAO {
	
	public void replySave(ReplyVO vo);
	public List<ReplyVO> replyList(int pfnum);
	

}
