package com.wtran.events.loginreg.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.wtran.events.loginreg.models.Event;



@Repository
public interface EventRepo extends CrudRepository<Event, Long>{

	List<Event> findAll();
	
	List<Event> findByName(String name);
	List<Event> findByState(String state);
	List<Event> findByStateNot(String state);

	Event getById(Long id);

	
	
//	@Query("SELECT e.name, e.date, e.location, u.firstname, e.id, u.id, e.open, e.state FROM Event e JOIN e.user u WHERE e.state= ?1")
//	List<Object[]> findByState(String state);
//	
//	@Query("SELECT e.name, e.date, e.location, u.firstname, e.id, u.id, e.open, e.state FROM Event e JOIN e.user u WHERE e.state!= ?1")
//	List<Object[]> findByStateNot(String state);
	
	
}
