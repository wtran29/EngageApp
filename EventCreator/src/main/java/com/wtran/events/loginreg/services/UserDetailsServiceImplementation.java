package com.wtran.events.loginreg.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.wtran.events.loginreg.models.Event;
import com.wtran.events.loginreg.models.User;
import com.wtran.events.loginreg.repositories.UserRepo;

@Service
public class UserDetailsServiceImplementation implements UserDetailsService{
	private UserRepo userRepository;
	
	public UserDetailsServiceImplementation(UserRepo userRepository) {
		this.userRepository = userRepository;
	}
	
	//1
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		User user = userRepository.findByEmail(email);
		
		if(user == null) {
			throw new UsernameNotFoundException("User not found");
			
		}
		
		return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), getAuthorities(user));
	}
	
	//2
	private List<GrantedAuthority> getAuthorities(User user){
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for(Event events : user.getEvents()) {
			GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(events.getName());
			authorities.add(grantedAuthority);
		}
		return authorities;
	}
}