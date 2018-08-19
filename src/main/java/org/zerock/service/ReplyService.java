package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> list(int bno)throws Exception;
	public void create(ReplyVO vo)throws Exception;
	public void update(ReplyVO vo)throws Exception;
	public void delete(int rno)throws Exception;
	public List<ReplyVO> page_reply_count(int bno, Criteria cri)throws Exception; 
	public int all_reply_count(int bno)throws Exception;
}
