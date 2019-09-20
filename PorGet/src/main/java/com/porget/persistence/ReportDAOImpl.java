package com.porget.persistence;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.porget.domain.Criteria;

import com.porget.domain.ReportVO;

@Repository
public class ReportDAOImpl implements ReportDAO{

	@Inject
	private SqlSession sqlSession;
	

	@Override
	public void insert(ReportVO rvo) {
		sqlSession.insert("report.insert",rvo);
	}

	@Override
	public int selectReportNum() {
		return 0;
	}
	

	@Override
	public List<ReportVO> selectReportPage(Criteria cri) {
		RowBounds bounds = new RowBounds((cri.getPageNum()-1)*10, 10);
		return sqlSession.selectList("report.selectReportPage",cri,bounds);
	}

	@Override
	public ReportVO selectReport(int reportNum) {
		return sqlSession.selectOne("report.selectReport",reportNum);
	}

	@Override
	public int updateReport(ReportVO vo) {
		return sqlSession.update("report.updateReport",vo);
	}

	@Override
	public int reportTotal(Criteria cri) {
		return sqlSession.selectOne("report.reportTotal",cri);
	}

	@Override
	public int delete(int pfnum) {
		return sqlSession.delete("report.deletePf",pfnum);
	}

	
	


}
