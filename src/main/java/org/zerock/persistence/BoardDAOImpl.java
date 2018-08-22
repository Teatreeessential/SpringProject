package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession; 
	private static String namespace = "org.zerock.mapper.MemberMapper";

	@Override
	public void create(BoardVO vo) throws Exception {
		sqlSession.insert(namespace+".create",vo);
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		return sqlSession.selectOne(namespace+".read",bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		sqlSession.update(namespace+".update",vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		sqlSession.delete(namespace+".delete",bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return sqlSession.selectList(namespace+".listAll");
	}

	@Override
	public void viewcnt(Integer bno) {
		sqlSession.update(namespace+".viewcnt",bno);
		
	}

	@Override
	public List<BoardVO> listPage(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace+".listPage",cri);
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		System.out.println("dao 에서 cri객체의 tosring");
		System.out.println(cri.toString());
		
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listSearch",cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace+".listSearchCount", cri);
	}

	@Override
	public void updateReplyCnt(int bno, int amount) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("bno", bno);
		param.put("amount", amount);
		System.out.println("---------------------------");
		System.out.println("updateReplyCnt 입니다.");
		System.out.println(param.get("bno"));
		System.out.println(param.get("amount"));
		
		System.out.println("---------------------------");
		sqlSession.update(namespace+".updateReplyCnt",param);
		
	}


	
}
