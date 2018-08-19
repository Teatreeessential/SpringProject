package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;

	
	public List<ReplyVO> list(int bno) throws Exception {
		return dao.list(bno);
	}

	public void create(ReplyVO vo) throws Exception {
		dao.create(vo);
	}

	public void update(ReplyVO vo) throws Exception {
		dao.update(vo);
	}

	public void delete(int rno) throws Exception {
		dao.delete(rno);
	}

	@Override
	public List<ReplyVO> page_reply_count(int bno, Criteria cri) throws Exception {
		return dao.page_reply_count(bno, cri);
	}

	@Override
	public int all_reply_count(int bno) throws Exception {
		return dao.all_reply_count(bno);
	}
	
	

}
