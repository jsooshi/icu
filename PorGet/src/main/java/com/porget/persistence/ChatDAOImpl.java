package com.porget.persistence;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.porget.domain.ChatVO;

@Repository
public class ChatDAOImpl implements ChatDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ChatVO> getChatList(ChatVO vo) {
		return sqlSession.selectList("chat.getChatList", vo);
	}

	@Override
	public List<ChatVO> chatListRecent(ChatVO vo, int base) {
		RowBounds bounds = new RowBounds(0, base);
		return sqlSession.selectList("chat.getChatList", vo, bounds);
	}

	@Override
	public void send(ChatVO vo) {
		sqlSession.insert("chat.sendMessage", vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
