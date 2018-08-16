package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {
	public void register(BoardVO vo)throws Exception;
	public BoardVO read(Integer bno)throws Exception;
	public void modify(BoardVO vo)throws Exception;
	public void remove(Integer bno)throws Exception;
	public List<BoardVO> ListAll()throws Exception;
	public void viewcnt(Integer bno) throws Exception;
	public List<BoardVO> listPage(Criteria cri)throws Exception;
}
