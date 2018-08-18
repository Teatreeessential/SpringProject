package org.zerock.web;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class TestCriteria {
	
	private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	@Test
	public void CriteriaOK(){
		SearchCriteria cri = new SearchCriteria();
		cri.setAll_page_num(10);
		logger.info(cri.getSearchType());
		logger.info(cri.getKeyword());
		
	
		logger.info("테스트를 시작합니다.");
		logger.info(String.valueOf(cri.getEnd_page()));
		logger.info(cri.toString());
		
		assertEquals(1,cri.getPage());
		assertEquals(10,cri.getPer_page_value());
		assertEquals(1,cri.getStart_page());
		assertEquals(10,cri.getEnd_page());
		
		
		
		cri.setPer_page_value(20);
	
		assertEquals(1,cri.getStart_page());
		assertEquals(20,cri.getEnd_page());
		
		
		
	}
	

	
}
