package com.porget.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public String selectUserPhoto(String uname) { //로그인한 유저네임으로 세션값 받아 회원의 프로필사진 받아오기
		return sqlSession.selectOne("portfolio.selectUphoto", uname);
	}

	@Override
	public List<Map<String, Object>> myPortfolio(String uname) {//마이페이지에서 유저네임으로 내포트폴리오 내역 가져오기
		return sqlSession.selectList("portfolio.selectMyportfolio", uname);
	}
	
	
}
