package org.zerock.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAOImpl implements PointDAO{

	@Inject
	private SqlSession session;
	private String namespace = "org.zerock.mapper.pointMapper";
	
	@Override
	public void updatePoint(String user_id, int user_point) throws Exception {
		
		Map<String,Object> mappram = new HashMap<>();
		mappram.put("user_id", user_id);
		mappram.put("user_point", user_point);
		
		
		session.update(namespace+".updatePoint",mappram);
	}

}
