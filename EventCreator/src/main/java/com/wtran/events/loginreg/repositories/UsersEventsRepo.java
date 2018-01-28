package com.wtran.events.loginreg.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.wtran.events.loginreg.models.Event;
import com.wtran.events.loginreg.models.User;
import com.wtran.events.loginreg.models.UsersEvents;

@Repository
public interface UsersEventsRepo extends CrudRepository<UsersEvents, Long> {
	List<UsersEvents> findAll();
	UsersEvents findByEventIdAndUserId(Long eventId, Long userId);
	UsersEvents getById(Long id);
	
	List<UsersEvents> findByEvent(Event event);
	
	
}
