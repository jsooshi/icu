drop table report cascade CONSTRAINTS;
drop sequence report_seq;

CREATE TABLE report
(
    reportNum         NUMBER            NOT NULL,  --신고 번호
    reportContext     VARCHAR2(1000)    NOT NULL,  --신고 내용
    reportPath        VARCHAR2(30)      NOT NULL,  --신고 
    reportType        VARCHAR2(30)      NOT NULL,  --신고 유형
    reportDate        DATE              NOT NULL,  --신고 날짜
    reportResultDate         DATE,                 --신고 접수 처리 날짜
    reporter          VARCHAR2(30)      NOT NULL,  --신고자
    defendant         VARCHAR2(30)      NOT NULL,  --신고대상자
    reportResult         VARCHAR2(20)      NOT NULL, --신고 결과
    CONSTRAINT REPORT_PK PRIMARY KEY (reportNum)
)
/

CREATE SEQUENCE report_SEQ
START WITH 1
INCREMENT BY 1;
/



--DROP TRIGGER report_AI_TRG;
/

--DROP SEQUENCE report_SEQ;
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
    ADD CONSTRAINT FK_report_defendant_userList_u FOREIGN KEY (defendant)
        REFERENCES userList (uname)
/