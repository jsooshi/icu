package com.porget.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.porget.domain.ChatVO;
import com.porget.domain.Criteria;

import com.porget.domain.ReportVO;

public interface ReportService {
	
	public int insert(ReportVO rvo);
	public ReportVO get(int reportNum);

	public List<ReportVO> selectReportPage(Criteria cri);//신고글 조회
	public ReportVO selectReport(int reportNum);//신고내용 확인
	
	public boolean updateReport(ReportVO vo);
	
	public int reportTotal(Criteria cri);
	
	public List<ChatVO> selectChatContext(String reporter,String defendant);
	
	public boolean removePortpolio(int pfnum);
}
