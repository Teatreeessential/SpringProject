package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO replydao;
	@Inject
	private BoardDAO boarddao;

	
	public List<ReplyVO> list(int bno) throws Exception {
		return replydao.list(bno);
	}
	@Transactional
	public void create(ReplyVO vo) throws Exception {
		replydao.create(vo);
		boarddao.updateReplyCnt(vo.getBno(), 1);

		
		
	}

	public void update(ReplyVO vo) throws Exception {
		replydao.update(vo);
	}
	
	@Transactional
	public void delete(int rno) throws Exception {
		replydao.delete(rno);
		boarddao.updateReplyCnt(replydao.getBno(rno), -1);
	}

	@Override
	public List<ReplyVO> page_reply_count(int bno, Criteria cri) throws Exception {
		return replydao.page_reply_count(bno, cri);
	}

	@Override
	public int all_reply_count(int bno) throws Exception {
		return replydao.all_reply_count(bno);
	}
	
	

}
