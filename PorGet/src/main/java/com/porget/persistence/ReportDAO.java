package com.porget.persistence;

import com.porget.domain.ReportVO;

public interface ReportDAO {

	public void insert(ReportVO rvo);

	public int selectReportNum();
}
