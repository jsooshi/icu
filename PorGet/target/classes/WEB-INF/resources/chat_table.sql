drop table chat cascade constraint

CREATE TABLE chat
(
    senderUname    VARCHAR2(30)    NOT NULL, 
    toUname        VARCHAR2(30)    NOT NULL, 
    chatContext    VARCHAR2(1000)    NOT NULL, 
    mCheck         NUMBER          NOT NULL, 
    sendDate       DATE            default sysdate NOT NULL
)
/

COMMENT ON TABLE chat IS '채팅'
/

COMMENT ON COLUMN chat.senderUname IS '보내는 사람'
/

COMMENT ON COLUMN chat.toUname IS '받는 사람'
/

COMMENT ON COLUMN chat.chatContext IS '내용'
/

COMMENT ON COLUMN chat.mCheck IS '수신여부'
/

COMMENT ON COLUMN chat.sendDate IS '보낸 시간'
/

ALTER TABLE chat
    ADD CONSTRAINT FK_chat_senderUname_userList_u FOREIGN KEY (senderUname)
        REFERENCES userList (uname)
/

ALTER TABLE chat
    ADD CONSTRAINT FK_chat_toUname_userList_uname FOREIGN KEY (toUname)
        REFERENCES userList (uname)
/

select senderUname, toUname,chatContext,mCheck,sendDate from chat
where (senderUname='jsooshi' and toUname='afterup') or (senderUname='afterup' and toUname='jsooshi')

select senderUname, toUname,chatContext,mCheck,sendDate from chat
where senderUname in ('jsooshi','afterup') and toUname in ('jsooshi','afterup')

insert into chat (senderUname, toUname,chatContext,mCheck,sendDate)
values ('afterup','jsooshi','안녕하세요jsooshi',0,sysdate);

insert into chat (senderUname, toUname,chatContext,mCheck,sendDate)
values ('jsooshi','afterup','안녕하세요afterup',0,sysdate);

insert into chat (senderUname, toUname,chatContext,mCheck,sendDate)
values ('jsooshi','gggggg','안녕하세요gg',0,sysdate);