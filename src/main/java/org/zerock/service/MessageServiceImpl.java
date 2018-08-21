package org.zerock.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.MessageVO;
import org.zerock.persistence.MessageDAO;
import org.zerock.persistence.PointDAO;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Inject
	private MessageDAO messageDAO;
	@Inject
	private PointDAO pointDAO;
	
	public void addMessage(MessageVO vo) throws Exception {
		messageDAO.create(vo);
		pointDAO.updatePoint(vo.getSender(), 10);
		
	}

	public MessageVO readMessage(String user_id, Integer mno) throws Exception {
		messageDAO.updateState(mno);
		pointDAO.updatePoint(user_id, 5);
		return messageDAO.readMessage(mno);
	}
	
}
