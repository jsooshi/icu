package com.porget.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.porget.domain.Porget_recruiterVO;
import com.porget.domain.Portget_ordinaryVO;

@Repository
public class PorgetDAOImpl implements PorgetDAO {

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Portget_ordinaryVO> selectAll() {
		return sqlSession.selectList("porget.selectAll");
	}

	@Override
	public List<Porget_recruiterVO> selectAllRec() {
		return sqlSession.selectList("porget.selectAllRec");
	}
	
	
	@Override
	public Portget_ordinaryVO select(String uemail) {
		return sqlSession.selectOne("porget.select", uemail);
	}

	@Override
	public void update(Portget_ordinaryVO vo) {
		sqlSession.update("porget.update", vo);
		
	}


	@Override
	public Porget_recruiterVO selectRec(String cemail) {
		return sqlSession.selectOne("porget.selectRec", cemail);
	}

	@Override
	public void updateRec(Porget_recruiterVO vo) {
		sqlSession.update("porget.updateRec", vo);
	}


	@Override
	public void delete(String uemail) {
		sqlSession.delete("porget.delete", uemail);
		
	}
	
	@Override
	public void deleteRec(String cemail) {
		sqlSession.delete("porget.deleteRec", cemail);
		
	}
	
	

}
