﻿drop table report cascade CONSTRAINTS;
drop sequence report_seq;

CREATE TABLE report
(
    reportNum         NUMBER            NOT NULL, 
    reportContext     VARCHAR2(1000)    NOT NULL, 
    reportPath        VARCHAR2(30)      NOT NULL, 
    reportType        VARCHAR2(30)      NOT NULL, 
    reportDate        DATE              NOT NULL,
    reportResultDate         DATE,
    reporter          VARCHAR2(30)      NOT NULL, 
    defendant         VARCHAR2(30)      NOT NULL,
    reportResult         VARCHAR2(20)      NOT NULL,
    CONSTRAINT REPORT_PK PRIMARY KEY (reportNum)
)
/

CREATE SEQUENCE report_SEQ
START WITH 1
INCREMENT BY 1;
/

COMMENT ON TABLE report IS '신고'
/

COMMENT ON COLUMN report.reportNum IS '신고번호'
/

COMMENT ON COLUMN report.reportContext IS '신고사유'
/

COMMENT ON COLUMN report.reportPath IS '신고 글유형'
/

COMMENT ON COLUMN report.reportType IS '신고 유형'
/

COMMENT ON COLUMN report.reportDate IS '신고날짜'
/

COMMENT ON COLUMN report.reporter IS '신고자'
/

COMMENT ON COLUMN report.defendant IS '피신고자'
/

COMMENT ON COLUMN report.reportResult IS '처리결과'
/

ALTER TABLE report
    ADD CONSTRAINT FK_report_reporter_userList_un FOREIGN KEY (reporter)
        REFERENCES userList (uname)
/

ALTER TABLE report
	drop constraint FK_report_reporter_userList_un
ALTER TABLE REPORT
	drop constraint FK_REPORT_REPORTER_USERLIST_U
	
SELECT * FROM    ALL_CONSTRAINTS
WHERE    TABLE_NAME = 'REPORT'

ALTER TABLE report
    ADD CONSTRAINT FK_report_defendant_userList_u FOREIGN KEY (defendant)
        REFERENCES userList (uname)
/

select * from report
select reportNum, reportType, reportDate, reportResultDate, reportResult, pfnum
		from report, portfolio
		where portfolio.uname = report.defendant

update report set defendant='ekdrms'

insert into report (reportNum, reportContext, reportPath, reportType, reportDate, reportResultDate, reporter, defendant, reportResult)
values(report_seq.nextval,'욕했습니다 저 사람이','P1','1',sysdate,null,'jsooshi','jsooshi','처리중')