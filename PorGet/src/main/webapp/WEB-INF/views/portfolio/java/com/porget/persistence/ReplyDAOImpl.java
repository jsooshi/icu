package com.porget.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.porget.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void replySave(ReplyVO vo) { //댓글저장 
		sqlSession.insert("reply.save",vo);
		
	}
	
	@Override
	public List<ReplyVO> replyList(int pfnum) { //댓글 목록 보이기 
		return sqlSession.selectList("reply.list",pfnum);
		
	}
	
	@Override
	public void replyDelete(Map<String, Integer>map) {
		sqlSession.delete("reply.delete",map);
		
	}
	
}
