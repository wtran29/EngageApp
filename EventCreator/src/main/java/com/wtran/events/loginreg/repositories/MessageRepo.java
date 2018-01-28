package com.wtran.events.loginreg.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.wtran.events.loginreg.models.Event;
import com.wtran.events.loginreg.models.Message;

@Repository
public interface MessageRepo extends CrudRepository<Message, Long> {
	List<Message> findAll();
	List<Message> getCommentByEventId(Long eventId);

	Message save(Event e);

	
	
//	List<Message> findAll();


	
}
