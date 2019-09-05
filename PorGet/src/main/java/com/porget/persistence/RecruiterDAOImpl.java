package com.porget.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.porget.domain.RecruiterVO;
import com.porget.domain.UserVO;

@Repository
public class RecruiterDAOImpl implements RecruiterDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertRecruiter(UserVO vo) {
		sqlSession.insert("userList.insertRecruiter",vo);
		
	}

	@Override
	public String loginRecruiter(UserVO vo) {
		return sqlSession.selectOne("userList.loginRecruiter",vo);
	}

	@Override
	public int cidCheck(String cname) {
		System.out.println("sqlSession="+ sqlSession+", uname="+cname);
		return sqlSession.selectOne("recruiter.cidCheck",cname);
	}

	@Override
	public int cemailCheck(String cemail) {
		return sqlSession.selectOne("recruiter.cemailCheck",cemail);
	}

	

}
