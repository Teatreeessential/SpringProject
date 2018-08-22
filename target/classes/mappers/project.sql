
/* Drop Triggers */

DROP TRIGGER TRI_tbl_board_bno;
DROP TRIGGER TRI_tbl_message_mid;
DROP TRIGGER TRI_tbl_reply_rno;



/* Drop Tables */

DROP TABLE tbl_reply CASCADE CONSTRAINTS;
DROP TABLE tbl_board CASCADE CONSTRAINTS;
DROP TABLE tbl_message CASCADE CONSTRAINTS;
DROP TABLE tbl_user CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_tbl_board_bno;
DROP SEQUENCE SEQ_tbl_message_mid;
DROP SEQUENCE SEQ_tbl_reply_rno;




/* Create Sequences */

CREATE SEQUENCE SEQ_tbl_board_bno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tbl_message_mid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tbl_reply_rno INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE tbl_board
(
	bno number NOT NULL,
	title varchar2(200) NOT NULL,
	content varchar2(2000),
	writer varchar2(50) NOT NULL,
	regdate timestamp DEFAULT SYSDATE NOT NULL,
	viewcnt number DEFAULT 0,
	PRIMARY KEY (bno)
);


CREATE TABLE tbl_message
(
	mid number NOT NULL,
	targetid varchar2(50) NOT NULL,
	sender varchar2(50) NOT NULL,
	message varchar2(500) NOT NULL,
	opendate date,
	senddate date DEFAULT SYSDATE,
	PRIMARY KEY (mid)
);


CREATE TABLE tbl_reply
(
	rno number NOT NULL,
	replytext varchar2(1000) NOT NULL,
	replyer varchar2(50) NOT NULL,
	regdate date DEFAULT SYSDATE NOT NULL,
	updatedate date DEFAULT SYSDATE NOT NULL,
	bno number NOT NULL,
	PRIMARY KEY (rno)
);





CREATE TABLE tbl_user
(
	uid varchar2(50) NOT NULL,
	upw varchar2(50) NOT NULL,
	uname varchar2(100) NOT NULL,
	upoint number DEFAULT 0 NOT NULL,
	PRIMARY KEY (uid)
);

create table tbl_user(
user_id varchar2(50) primary key,
user_pw varchar2(50) not null,
user_name varchar2(100) not null,
user_point number default 0 not null
);

select * from tbl_user



select * from tbl_user;


/* Create Foreign Keys */

ALTER TABLE tbl_reply
	ADD FOREIGN KEY (bno)
	REFERENCES tbl_board (bno)
;




ALTER TABLE tbl_message
	ADD FOREIGN KEY (targetid)
	REFERENCES tbl_user (user_id)
;


ALTER TABLE tbl_message
	ADD FOREIGN KEY (sender)
	REFERENCES tbl_user (user_id)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_tbl_board_bno BEFORE INSERT ON tbl_board
FOR EACH ROW
BEGIN
	SELECT SEQ_tbl_board_bno.nextval
	INTO :new.bno
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_tbl_message_mid BEFORE INSERT ON tbl_message
FOR EACH ROW
BEGIN
	SELECT SEQ_tbl_message_mid.nextval
	INTO :new.mid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_tbl_reply_rno BEFORE INSERT ON tbl_reply
FOR EACH ROW
BEGIN
	SELECT SEQ_tbl_reply_rno.nextval
	INTO :new.rno
	FROM dual;
END;

/

insert into tbl_user(user_id,user_pw,user_name) values ('user00','user00','iron man');
insert into tbl_user(user_id,user_pw,user_name) values ('user01','user01','captain');
insert into tbl_user(user_id,user_pw,user_name) values ('user02','user02','hulk');
insert into tbl_user(user_id,user_pw,user_name) values ('user03','user03','thor');
insert into tbl_user(user_id,user_pw,user_name) values ('user04','user04','quick silver');

alter table tbl_board add column replycnt number default 0

ALTER TABLE tbl_board ADD(replycnt number default 0);
alter table tbl_board drop column replycnt


select * from tbl_board
where bno = 202;

select null+1 from dual;

