package org.zerock.service;

import org.zerock.domain.MessageVO;

public interface MessageService {
	public void addMessage(MessageVO vo)throws Exception;
	public MessageVO readMessage(String user_id,Integer mno)throws Exception;
}
