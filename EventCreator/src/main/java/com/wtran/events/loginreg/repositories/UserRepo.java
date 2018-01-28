package com.wtran.events.loginreg.repositories;

import java.util.Date;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.wtran.events.loginreg.models.User;

@Repository
public interface UserRepo extends CrudRepository<User, Long>{
	User findByEmail(String email);
	
	User findByFirstname(String firstname);
	User findByLastname(String lastname);
	User findByUpdatedAt(Date updatedAt);
	
}
