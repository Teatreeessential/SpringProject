package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession sqlSession;
	private String namespace ="org.zerock.mapper.replyMapper";
	

	@Override
	public List<ReplyVO> list(int bno) throws Exception {
		return sqlSession.selectList(namespace+".list",bno);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		sqlSession.insert(namespace+".create",vo);
		
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		sqlSession.update(namespace+".update",vo);
	}

	@Override
	public void delete(int rno) throws Exception {
		sqlSession.delete(namespace+".delete",rno);
		
	}

	@Override
	public List<ReplyVO> page_reply_count(int bno,Criteria cri) throws Exception {
		Map<String,Object> paramMap = new HashMap();
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		return sqlSession.selectList(namespace+".page_reply_count",paramMap);
	}

	@Override
	public int all_reply_count(int bno) throws Exception {
		return sqlSession.selectOne(namespace+".all_reply_count",bno);
	}

}
