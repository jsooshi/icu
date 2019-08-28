package com.porget.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.porget.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void replySave(ReplyVO vo) {
		sqlSession.insert("reply.save",vo);
		
	}
	
	@Override
	public List<ReplyVO> replyList(int pfnum) {
		return sqlSession.selectList("reply.list",pfnum);
		
	}
	
}
