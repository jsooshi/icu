package com.porget.persistence;

import java.util.List;

import com.porget.domain.Criteria;
import com.porget.domain.ReportVO;

public interface ReportDAO {
	
	public List<ReportVO> selectReportPage(Criteria cri);
	public ReportVO selectReport(int reportNum);
	
	public int updateReport(ReportVO vo);
	
	public int reportTotal(Criteria cri);
	
	public void insert(ReportVO rvo);
	
	public int selectReportNum();

}
