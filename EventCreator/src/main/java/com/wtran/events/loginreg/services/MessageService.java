package com.wtran.events.loginreg.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wtran.events.loginreg.models.Event;
import com.wtran.events.loginreg.models.Message;
import com.wtran.events.loginreg.models.User;
import com.wtran.events.loginreg.repositories.EventRepo;
import com.wtran.events.loginreg.repositories.MessageRepo;

@Service
public class MessageService {
	private MessageRepo messageRepository;
	private EventRepo eventRepository;
	
	public MessageService(MessageRepo messageRepository, EventRepo eventRepository) {
		this.messageRepository = messageRepository;
		this.eventRepository = eventRepository;
	}
	
	
	public List<Message> allComments(Long eventId) {
//		messageRepository.findOne(eventId);

		return messageRepository.getCommentByEventId(eventId);
	}
	public Message addMessage(Message message) {
		
		return messageRepository.save(message);
	}

	public void delete(List<Message> messages) {
		messageRepository.delete(messages);
	}
	
	
//	public Message allJoin(Long eventId) {
//		Message join = new Message();
//		Event e = eventRepository.findOne(eventId);
//		join.setEvent(e);
//		return messageRepository.save(join);
//		
//	}
}
