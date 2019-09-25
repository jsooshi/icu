-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.
select * from reply;
select * from userList;
select * from portfolio;
-- user Table Create SQL
DROP TRIGGER recommend_trg;
drop table recommend;
DROP TRIGGER reply_trg;
DROP SEQUENCE reply_SEQ;
drop table reply cascade CONSTRAINTS;
DROP TRIGGER portfolio_trg;
drop sequence portfolio_SEQ;
drop table portfolio cascade CONSTRAINTS;
drop table userList cascade CONSTRAINTS;

CREATE TABLE userList
(
    uname     VARCHAR2(30)    NOT NULL, 
    upass     VARCHAR2(60)    NOT NULL, 
    uemail    VARCHAR2(100)    NOT NULL, 
    uphoto    varchar2(500)         NULL,
    uinfo     varchar2(500)         NULL,
    udate	  date			  default sysdate not null ,
    enabled number default '1',
    CONSTRAINT userList_PK PRIMARY KEY (uname)
);


create table userlist_auth (

   uname varchar2(30) not null,
   auth varchar2(50) not null,
   constraint fk_userlist_auth foreign key(uname) references userlist(uname) on delete cascade
 
);


CREATE TABLE portfolio
(
    uname         VARCHAR2(30)     NOT NULL, 
    pfnum         NUMBER           NOT NULL, 
    pfname        VARCHAR2(90)     NOT NULL, 
    pfdate        DATE             default sysdate not null, 
    pfthumb       VARCHAR2(1000)     NOT NULL, 
    pfread        NUMBER           NOT NULL, 
    pfurl         VARCHAR2(500)    NULL, 
    pffile        VARCHAR2(500)    NULL, 
    pfposition    VARCHAR2(90)     NOT NULL,
    tagname       VARCHAR2(250)    NULL,
    CONSTRAINT PORTFOLIO_PK PRIMARY KEY (pfnum)
)
;

select * from userList;
CREATE SEQUENCE portfolio_SEQ
START WITH 1
INCREMENT BY 1;


ALTER TABLE portfolio
    ADD CONSTRAINT FK_portfolio_uname FOREIGN KEY (uname)
        REFERENCES userList (uname)ON DELETE CASCADE
;

CREATE OR REPLACE TRIGGER portfolio_trg
    AFTER UPDATE ON userList FOR EACH ROW
    BEGIN
        UPDATE portfolio
        SET uname = :NEW.uname
        WHERE uname = :OLD.uname;
    END;
/
        


CREATE TABLE reply
(
    pfnum       NUMBER           NOT NULL, 
    rcontent    VARCHAR2(300)    NOT NULL, 
    uname       VARCHAR2(30)     NULL, 
    rdate       DATE             default sysdate NOT NULL, 
    rnum        NUMBER           NOT NULL,
    rdeep       NUMBER           NOT NULL, 
    rgroup      NUMBER           NOT NULL, 
    CONSTRAINT REPLY_PK PRIMARY KEY (rnum)
)
;


CREATE SEQUENCE reply_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE reply
    ADD CONSTRAINT FK_reply_pfnum FOREIGN KEY (pfnum)
        REFERENCES portfolio (pfnum)on delete cascade
;
ALTER TABLE reply
    ADD CONSTRAINT FK_reply_uname FOREIGN KEY (uname)
        REFERENCES userList (uname)on delete set null
;


CREATE OR REPLACE TRIGGER reply_trg
    AFTER UPDATE ON userList FOR EACH ROW
    BEGIN
        UPDATE reply
        SET uname = :NEW.uname
        WHERE uname = :OLD.uname;
    END;
/

CREATE TABLE recommend
(
    pfnum    NUMBER          NOT NULL, 
    uname    VARCHAR2(30)    NULL
)
;

ALTER TABLE recommend
    ADD CONSTRAINT FK_recommend_pfnum FOREIGN KEY (pfnum)
        REFERENCES portfolio (pfnum)ON DELETE CASCADE
;
ALTER TABLE recommend
    ADD CONSTRAINT FK_recommend_uname FOREIGN KEY (uname)
        REFERENCES userList (uname)on delete set null
;


CREATE OR REPLACE TRIGGER recommend_trg
    AFTER UPDATE ON userList FOR EACH ROW
    BEGIN
        UPDATE recommend
        SET uname = :NEW.uname
        WHERE uname = :OLD.uname;
    END;
/
      
--user 추가 //  회원가입하고 글 insert 해줘야합니다( ㅠㅠ..)
--INSERT INTO userList VALUES ('gildong','1a2s3d4f','gildong@naver.com','yellow.png',4,null);
--INSERT INTO userList VALUES ('afterup','asd1234','afterup@naver.com','girl.png',0,'심아영입니다.');
--INSERT INTO userList values ('jsooshi','1q2w3e4r','jsooshi@gmail.com','수염.png',0,'박종수입니다.');
--INSERT INTO userList values ('yunajo','1q2w1q2w','yunajo@gmail.com','라이언.jpg',0,'조윤아입니다.');
--INSERT INTO userList values ('jinju','1q2w3e5t','jinju@gmail.com','어피치.jpg',0,'이진주입니다');
--INSERT INTO userList values ('jihwan','1q2w3e6y','jihwan@gmail.com','상담원.png',0,'최지환입니다');
--INSERT INTO userList values ('bonjin','1q2w3e6y','bonjin@gmail.com','ugi.png',0,'구본진입니다');
--INSERT INTO userList values ('rhrnak','1q2w3e6y','rhrnak@gmail.com','who.jpg',0,'사용자2입니다');
--INSERT INTO userList values ('ekdrms','1q2w3e6y','ekdrms@gmail.com','하이.png',0,'사용자3입니다');
--INSERT INTO userList values ('ghrnak','1q2w3e6y','ghrnak@gmail.com','의사.png',2,'사용자4입니다');
--INSERT INTO userList values ('새우우','1q2w3e6y','todndn@gmail.com','동석.jpg',2,'사용자5입니다');

--
--INSERT INTO portfolio VALUES ('afterup',portfolio_SEQ.nextval, '이렇게 만들었습니다',sysdate,'이렇게 만든다.jpg|',2,'https://www.youtube.com/watch?v=RQSUnhri518',null,'웹개발자','#JAVA#JAVASCRIPT');
--INSERT INTO portfolio VALUES ('jsooshi',portfolio_SEQ.nextval, '무조건 뽑힙니다',sysdate,'무조건뽑히는포트폴리오.jpg|',2,'https://www.youtube.com/watch?v=SvKCs-80uk4',null,'백엔드','#파이썬');
--INSERT INTO portfolio VALUES ('yunajo',portfolio_SEQ.nextval, '열정이 가득',sysdate,'열정이 가득.jpg|',2,'https://www.youtube.com/watch?v=UJwU85tTevI',null,'백엔드','#java#SPRING#websocket');
--INSERT INTO portfolio VALUES ('jinju',portfolio_SEQ.nextval, '클린합니다',sysdate,'클린.jpg|',2,'https://www.youtube.com/watch?v=yYOVnZts0Ns',null,'프론트엔드','#javascript#spring');
--INSERT INTO portfolio VALUES ('jihwan',portfolio_SEQ.nextval, '공략법',sysdate,'공략법.png|',2,'https://www.youtube.com/watch?v=x60mB0zXZ38',null,'웹개발자','#WEB#INFO');
--INSERT INTO portfolio VALUES ('bonjin',portfolio_SEQ.nextval, '이정도다',sysdate,'문의.png|',2,'https://www.youtube.com/watch?v=fwjyFSbFkT0',null,'웹개발자','#JAVA#JAVASCRIPT');
--INSERT INTO portfolio VALUES ('rhrnak',portfolio_SEQ.nextval, '자소서가아니다',sysdate,'자소서가아니다.png|',2,'https://www.youtube.com/watch?v=50uiNkGLfHI',null,'웹개발자','#JAVA#JAVASCRIPT');
--INSERT INTO portfolio VALUES ('ekdrms',portfolio_SEQ.nextval, '당근의 포트폴리오입니다',sysdate,'20171124171320_SEU.jpg|',2,'https://www.youtube.com/watch?v=YnLtR9HT52U',null,'웹개발자','#당근');