package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.persistence.BoardDAO;
@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	@Override
	public void register(BoardVO vo) throws Exception {
		dao.create(vo);
		
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		dao.update(vo);
	}
	

	@Override
	public void remove(Integer bno) throws Exception {
		dao.delete(bno);
		
	}

	@Override
	public List<BoardVO> ListAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public void viewcnt(Integer bno){
		dao.viewcnt(bno);
	}

	@Override
	public List<BoardVO> listPage(Criteria cri) throws Exception {
		return dao.listPage(cri);
	}

}
