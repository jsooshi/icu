package com.porget.domain;

import java.util.Date;

public class ReportVO {
	
	private int reportNum;
	private String reportContext;
	private String reportPath;
	private String reportType;
	private Date reportDate;
	private Date reportResultDate;
	private String reporter;
	private String defendant;
	private String reportResult;

	public ReportVO() {
		
	}
	
	

	public ReportVO(int reportNum, String reportContext, String reportPath, String reportType, Date reportDate,
			Date reportResultDate, String reporter, String defendant, String reportResult) {
		super();
		this.reportNum = reportNum;
		this.reportContext = reportContext;
		this.reportPath = reportPath;
		this.reportType = reportType;
		this.reportDate = reportDate;
		this.reportResultDate = reportResultDate;
		this.reporter = reporter;
		this.defendant = defendant;
		this.reportResult = reportResult;
	}



	public int getReportNum() {
		return reportNum;
	}

	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}

	public String getReportContext() {
		return reportContext;
	}

	public void setReportContext(String reportContext) {
		this.reportContext = reportContext;
	}

	public String getReportPath() {
		return reportPath;
	}

	public void setReportPath(String reportPath) {
		this.reportPath = reportPath;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public Date getReportResultDate() {
		return reportResultDate;
	}

	public void setReportResultDate(Date reportResultDate) {
		this.reportResultDate = reportResultDate;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getDefendant() {
		return defendant;
	}

	public void setDefendant(String defendant) {
		this.defendant = defendant;
	}

	public String getReportResult() {
		return reportResult;
	}

	public void setReportResult(String reportResult) {
		this.reportResult = reportResult;
	}

	@Override
	public String toString() {
		return "reportVO [reportNum=" + reportNum + ", reportContext=" + reportContext + ", reportPath=" + reportPath
				+ ", reportType=" + reportType + ", reportDate=" + reportDate + ", reportResultDate=" + reportResultDate
				+ ", reporter=" + reporter + ", defendant=" + defendant + ", reportResult=" + reportResult + "]";
	}
	
}
