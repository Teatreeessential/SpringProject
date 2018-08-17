

/* Drop Tables */

DROP TABLE tbl_board CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_tbl_board_bno;








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
/* Create Sequences */

CREATE SEQUENCE SEQ_tbl_board_bno INCREMENT BY 1 START WITH 1;



select * from tbl_board

select b.bno,b.title,b.content,b.writer,b.regdate,b.viewcnt
  		from 
	  		(select rownum as rnum,a.bno,a.title,a.content,a.writer,a.regdate,a.viewcnt
		  		from (
		  			select rownum,bno,title,content,writer,regdate,viewcnt
		  			from tbl_board
		  			order by bno desc
		  		) a
	  		where rownum <= 100) b
  		where b.rnum >= 91






