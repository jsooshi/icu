package com.porget.persistence;

import java.util.List;
import java.util.Map;

import com.porget.domain.ChatVO;
import com.porget.domain.Criteria;
import com.porget.domain.ReportVO;

public interface ReportDAO {
	
	public List<ReportVO> selectReportPage(Criteria cri);
	public ReportVO selectReport(int reportNum);
	
	public int updateReport(ReportVO vo);
	
	public int reportTotal(Criteria cri);
	
	public void insert(ReportVO rvo);
	
	public int selectReportNum();
	
	public List<ChatVO> selectChatContext(Map map);

	public int delete(int pfnum);
	
	public int deleteUser(String uname);
	
}
