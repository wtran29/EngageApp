package com.wtran.events.loginreg.services;

import java.util.Date;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.wtran.events.loginreg.models.Event;
import com.wtran.events.loginreg.models.User;
import com.wtran.events.loginreg.repositories.EventRepo;
import com.wtran.events.loginreg.repositories.UserRepo;



@Service
public class UserService {
	private UserRepo userRepository;
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    public UserService(UserRepo userRepository, BCryptPasswordEncoder bCryptPasswordEncoder)     {
        this.userRepository = userRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }
    
    

    public void saveWithUserRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }
     
     // 2 
//    public void saveUserWithAdminRole(User user) {
//        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
//        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
//        userRepository.save(user);
//    }    
    
    // 3
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    
    //4
    public User findByFirstname(String firstname) {
    	return userRepository.findByFirstname(firstname);
    }
    //5
    public User findByLastname(String lastname) {
    	return userRepository.findByLastname(lastname);
    }
    
    public User findByUpdatedAt(Date updatedAt) {
    	return userRepository.findByUpdatedAt(updatedAt);
    }

    public User createUser(User user) {
    	user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
    	return userRepository.save(user);
    }

	public void findByUpdatedAt(User findByEmail) {
		// TODO Auto-generated method stub
		findByEmail.setUpdatedAt(new Date());
		userRepository.save(findByEmail);
	}
	
	public User findByCurrentId(Long currentId) {
		return userRepository.findOne(currentId);
	}
	
}

