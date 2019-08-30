-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- user Table Create SQL
drop table userList cascade CONSTRAINTS;



CREATE TABLE userList
(
    uname     VARCHAR2(30)    unique NOT NULL, 
    upass     VARCHAR2(20)    NOT NULL, 
    uemail    VARCHAR2(60)    NOT NULL, 
    uphoto    varchar2(1000)         NULL,
    ucheck     NUMBER          NULL,
    CONSTRAINT userList_PK PRIMARY KEY (uemail)
);

INSERT INTO userList VALUES ('afterup','1234','afterup@naver.com',userList_SEQ.nextval,0);

drop sequence userList_SEQ;
CREATE SEQUENCE userList_SEQ
START WITH 1
INCREMENT BY 1;

COMMENT ON TABLE userList IS '회원'
;

COMMENT ON COLUMN userList.uname IS '닉네임(U)'
;

COMMENT ON COLUMN userList.upass IS '비밀번호'
;

COMMENT ON COLUMN userList.uemail IS '이메일'
;

COMMENT ON COLUMN userList.uphoto IS '프로필사진'
;

COMMENT ON COLUMN userList.ucheck IS '관리자 체크'
;


drop table portfolio cascade CONSTRAINTS;
CREATE TABLE portfolio
(
    uname         VARCHAR2(30)     NOT NULL, 
    pfnum         NUMBER           NOT NULL, 
    pfname        VARCHAR2(30)     NOT NULL, 
    pfdate        DATE             default sysdate not null, 
    pfthumb       VARCHAR2(1000)     NOT NULL, 
    pfread        NUMBER           NOT NULL, 
    pfurl         VARCHAR2(200)    NULL, 
    pffile        VARCHAR2(200)    NULL, 
    pfposition    VARCHAR2(30)     NOT NULL,
    tagname       VARCHAR2(100)    NULL,
    CONSTRAINT PORTFOLIO_PK PRIMARY KEY (pfnum)
)
;


INSERT INTO portfolio VALUES ('afterup',portfolio_SEQ.nextval, '포트폴리오명',to_date(sysdate,'yyyy.mm.dd hh24:mi'),'cat.jpg',0,null,null,'웹개발자','JAVA, JAVASCRIPT')

drop sequence portfolio_SEQ;
CREATE SEQUENCE portfolio_SEQ
START WITH 1
INCREMENT BY 1;

COMMENT ON TABLE portfolio IS '포트폴리오'
;

COMMENT ON COLUMN portfolio.uname IS '닉네임(U)'
;

COMMENT ON COLUMN portfolio.pfnum IS '게시글 넘버'
;

COMMENT ON COLUMN portfolio.pfname IS '제목'
;

COMMENT ON COLUMN portfolio.pfdate IS '등록일'
;

COMMENT ON COLUMN portfolio.pfthumb IS '썸네일'
;

COMMENT ON COLUMN portfolio.pfread IS '조회수'
;

COMMENT ON COLUMN portfolio.pfurl IS '내용url'
;

COMMENT ON COLUMN portfolio.pffile IS '파일url'
;

COMMENT ON COLUMN portfolio.pfposition IS '포지션'
;
COMMENT ON COLUMN portfolio.tagname IS '태그명'
;

ALTER TABLE portfolio
    ADD CONSTRAINT FK_portfolio_uname FOREIGN KEY (uname)
        REFERENCES userList (uname)ON DELETE CASCADE;


drop table reply cascade CONSTRAINTS;
CREATE TABLE reply
(
    pfnum       NUMBER           NOT NULL, 
    rcontent    VARCHAR2(300)    NOT NULL, 
    uname       VARCHAR2(30)     NOT NULL, 
    rdate       DATE             default sysdate NOT NULL, 
    rnum        NUMBER           NOT NULL,
    rdeep       NUMBER           NOT NULL, 
    rgroup      NUMBER           NOT NULL, 
    CONSTRAINT REPLY_PK PRIMARY KEY (rnum)
)
;

DROP SEQUENCE reply_SEQ;
CREATE SEQUENCE reply_SEQ
START WITH 1
INCREMENT BY 1;


COMMENT ON TABLE reply IS '댓글'
;

COMMENT ON COLUMN reply.pfnum IS '게시글 넘버'
;

COMMENT ON COLUMN reply.rcontent IS '댓글내용'
;

COMMENT ON COLUMN reply.uname IS '닉네임(U)'
;

COMMENT ON COLUMN reply.rdate IS '댓글게시일'
;

COMMENT ON COLUMN reply.rnum IS '댓글번호'
;

COMMENT ON COLUMN reply.rdeep IS '댓글 깊이'
;

COMMENT ON COLUMN reply.rgroup IS '댓글 그룹'
;

ALTER TABLE reply
    ADD CONSTRAINT FK_reply_pfnum FOREIGN KEY (pfnum)
        REFERENCES portfolio (pfnum)on delete cascade
;


drop table recruiter cascade CONSTRAINTS;
CREATE TABLE recruiter
(
    cname      VARCHAR2(60)    NOT NULL, 
    cemail     VARCHAR2(40)    NOT NULL, 
    cdomain    VARCHAR2(60)    NULL, 
    cphoto     varchar2(1000)   NULL, 
    cpass      VARCHAR2(20)    NOT NULL, 
    CONSTRAINT RECRUITER_PK PRIMARY KEY (cemail)
)
;

DROP SEQUENCE recruiter_SEQ;
CREATE SEQUENCE recruiter_SEQ
START WITH 1
INCREMENT BY 1;

COMMENT ON TABLE recruiter IS '채용담당자'
;

COMMENT ON COLUMN recruiter.cname IS '회사명'
;

COMMENT ON COLUMN recruiter.cemail IS '회사이메일'
;

COMMENT ON COLUMN recruiter.cdomain IS '회사도메인'
;

COMMENT ON COLUMN recruiter.cphoto IS '프로필사진(ex 로고)'
;

COMMENT ON COLUMN recruiter.cpass IS '비밀번호'
;


drop table recommend;
;
CREATE TABLE recommend
(
    pfnum    NUMBER          NOT NULL, 
    uname    VARCHAR2(30)    NULL
)
;

DROP SEQUENCE recommend_SEQ;
;
CREATE SEQUENCE recommend_SEQ
START WITH 1
INCREMENT BY 1;
;

COMMENT ON TABLE recommend IS '추천수'
;

COMMENT ON COLUMN recommend.pfnum IS '게시글 넘버'
;

COMMENT ON COLUMN recommend.uname IS '닉네임(U)'
;

ALTER TABLE recommend
    ADD CONSTRAINT FK_recommend_pfnum FOREIGN KEY (pfnum)
        REFERENCES portfolio (pfnum)ON DELETE CASCADE
;

select * from portfolio;