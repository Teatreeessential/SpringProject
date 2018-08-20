
/* Drop Triggers */

DROP TRIGGER TRI_tbl_board_bno;
DROP TRIGGER TRI_tbl_reply_rno;



/* Drop Tables */

DROP TABLE tbl_reply CASCADE CONSTRAINTS;
DROP TABLE tbl_board CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_tbl_board_bno;
DROP SEQUENCE SEQ_tbl_reply_rno;




/* Create Sequences */

CREATE SEQUENCE SEQ_tbl_board_bno INCREMENT BY 1 START WITH 1;
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



/* Create Foreign Keys */

ALTER TABLE tbl_reply
	ADD FOREIGN KEY (bno)
	REFERENCES tbl_board (bno)
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

CREATE OR REPLACE TRIGGER TRI_tbl_reply_rno BEFORE INSERT ON tbl_reply
FOR EACH ROW
BEGIN
	SELECT SEQ_tbl_reply_rno.nextval
	INTO :new.rno
	FROM dual;
END;

/

select * from tbl_reply;

select count(rno)
from tbl_reply
where bno=3;





