package com.wtran.events.loginreg.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wtran.events.loginreg.models.Event;
import com.wtran.events.loginreg.models.User;
import com.wtran.events.loginreg.models.UsersEvents;
import com.wtran.events.loginreg.repositories.EventRepo;
import com.wtran.events.loginreg.repositories.UsersEventsRepo;

@Service
public class UsersEventsService {
	private UsersEventsRepo usersEventsRepository;
	private EventRepo eventRepository;

	
	public UsersEventsService(UsersEventsRepo usersEventsRepository, EventRepo eventRepository) {
		this.usersEventsRepository = usersEventsRepository;
		this.eventRepository = eventRepository;

	}

	public UsersEvents createJoin(Long eventId, User currentUser) {
		// pass in event and user
		// create new userEvent table
		// set event and user
		// save
		UsersEvents join = new UsersEvents();
		Event e = eventRepository.findOne(eventId);
		join.setEvent(e);
		join.setUser(currentUser);
		return usersEventsRepository.save(join);
	}
	
	public void cancelJoin(Long eventId, Long userId) {
		UsersEvents e = usersEventsRepository.findByEventIdAndUserId(eventId, userId);
		usersEventsRepository.delete(e);
	}

	public UsersEvents getById(Long id) {
		return usersEventsRepository.getById(id);
	}

	public void getJoin(Long event, Long userId) {
		// TODO Auto-generated method stub
		usersEventsRepository.findByEventIdAndUserId(event, userId);
	}

	public List<UsersEvents> allUsersEvents() {
		// TODO Auto-generated method stub
		return usersEventsRepository.findAll();
		
	}

	public List<UsersEvents> findByEvent(Event event) {
		// TODO Auto-generated method stub
		return usersEventsRepository.findByEvent(event);
	}

	
}
