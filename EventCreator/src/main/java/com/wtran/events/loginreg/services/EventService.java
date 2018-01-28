package com.wtran.events.loginreg.services;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.wtran.events.loginreg.models.Event;
import com.wtran.events.loginreg.models.User;
import com.wtran.events.loginreg.repositories.EventRepo;

@Service
public class EventService {
	private EventRepo eventRepository;
	
	public EventService(EventRepo eventRepository) {
		this.eventRepository = eventRepository;
	}

	
    public List<Event> findByState(String state) {
    	return eventRepository.findByState(state);
    }
    
    public Event createEvent(Event event) {
		return eventRepository.save(event);
	}

	public List<Event> findInOtherState(String state) {
		// TODO Auto-generated method stub
		return eventRepository.findByStateNot(state);
	}
	
	public Event findByEventId(Long eventId) {
		return eventRepository.findOne(eventId);
	}


	public Event getById(Long id) {
		return eventRepository.getById(id);
	}


	public void delete(Long eventId) {
		eventRepository.delete(eventId);
		
	}





	public Event getEvent(Long eventId) {
		// TODO Auto-generated method stub
		return eventRepository.findOne(eventId);
	}
	
	public void updateEvent(Event event) {
		eventRepository.save(event);
	}


	public List<Event> getEvents() {
		return eventRepository.findAll();
	}

	
	
}
