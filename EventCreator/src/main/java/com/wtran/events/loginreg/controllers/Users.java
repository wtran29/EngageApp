package com.wtran.events.loginreg.controllers;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.PropertyAccessException;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.DefaultBindingErrorProcessor;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wtran.events.loginreg.models.Event;
import com.wtran.events.loginreg.models.Message;
import com.wtran.events.loginreg.models.User;
import com.wtran.events.loginreg.models.UsersEvents;
import com.wtran.events.loginreg.services.EventService;
import com.wtran.events.loginreg.services.MessageService;
import com.wtran.events.loginreg.services.UserService;
import com.wtran.events.loginreg.services.UsersEventsService;
import com.wtran.events.loginreg.validator.UserValidator;

@Controller
public class Users {
	private UserService userService;
	private UserValidator userValidator;
	private EventService eventService;
	private MessageService messageService;
	private UsersEventsService usersEventsService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		/*binder.registerCustomEditor( String.class, new StringTrimmerEditor( true ));*/
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    dateFormat.setLenient(false);
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	    
	    /*binder.setBindingErrorProcessor(new DefaultBindingErrorProcessor() {
	        @Override
	        public void processPropertyAccessException(PropertyAccessException ex, BindingResult bindingResult) {
	            String propertyName = ex.getPropertyName();
	            Object value = ex.getValue();
	            bindingResult.addError(new FieldError(bindingResult.getObjectName(), propertyName, value, true,
	            new String[] { "moderation.field.error" }, new Object[] { propertyName, value },
	            "Invalid value for " + propertyName + "(" + value + ")"));
	        }
	    });*/
	}
	
    public Users(UserService userService, UserValidator userValidator, EventService eventService, MessageService messageService, UsersEventsService usersEventsService) {
        this.userService = userService;
        this.userValidator = userValidator;
        this.eventService = eventService;
        this.messageService = messageService;
        this.usersEventsService = usersEventsService;
    }
 
	
	@RequestMapping("/registration")
    public String register(@Valid @ModelAttribute("user") User user) {
        System.out.println("hit the index page");
		return "/loginReg/indexPage.jsp";
    }
	
	
	@PostMapping("/registration")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		userValidator.validate(user, result);
		if(result.hasErrors()) {
			System.out.println("hit errors in registration");
			return "/loginReg/indexPage.jsp";
		}
		
		if(userService.findByEmail(user.getEmail()) != null) {
			System.out.println("going to index after reg");
			model.addAttribute("regMessage", "Email already exists!");
			return "/loginReg/indexPage.jsp";
			
		}
		
		else {
			System.out.println("creating user");
			userService.createUser(user);
			
		}
		return "redirect:/events";
		
	}
    

    
    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model, @ModelAttribute("user") User user) {
    	if(error !=null) {
    		System.out.println("errors at login");
    		model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
    		
    	}
    	if(logout != null) {
    		System.out.println("logging out");
    		model.addAttribute("logoutMessage", "Logout Successful!");
    		
    	}
    	return "/loginReg/indexPage.jsp";
    }
     
    @RequestMapping(value = {"/events", "/home", "/"})
    public String home(Principal principal, Model model, @ModelAttribute("event") Event event) {
    	String username = principal.getName();
    	User currentUser = userService.findByEmail(username);
    	System.out.println(currentUser);
    	List<Event> eventInState = eventService.findByState(currentUser.getState());
    	List<Event> eventNotInState = eventService.findInOtherState(currentUser.getState());
    	System.out.println(eventInState.size());
    	model.addAttribute("currentUser", currentUser);
    	model.addAttribute("eventHere", eventInState);
    	model.addAttribute("eventOther", eventNotInState);
    	return "/events/eventPage.jsp";
    	
    }
    
    @PostMapping("/createEvent")
    public String makeEvent(@Valid @ModelAttribute("event") Event event, @RequestParam(value="logout", required=false) String logout, BindingResult result,  Model model, Principal principal) {
    	event.setOpen(true);
    	if(result.hasErrors()) {
    		System.out.println("errors creating event");
    		model.addAttribute("eventMessage", "Invalid credentials, Please try again.");
    		return "redirect:/events";
    	}
    	else {
			System.out.println("creating event");
			
			eventService.createEvent(event);
			return "redirect:/events";
		}
		
    }
    
    @RequestMapping("/events/join/{eid}")
    public String join(@PathVariable("eid") Long eventId, Event event, Principal principal) {
    	System.out.println("joining event");
    	String username = principal.getName();
    	User currentUser = userService.findByEmail(username);
    	usersEventsService.createJoin(eventId, currentUser);
    	
    	return "redirect:/events";
    }
   
    @RequestMapping("/events/{eid}")
    public String showEvents(@PathVariable("eid") Long eventId, Model model, @ModelAttribute("message") Message message, Principal principal, @ModelAttribute("event") UsersEvents usersEvents, User userId) {
    	Event event = eventService.getEvent(eventId);
    	
    	List<Message> messages = messageService.allComments(eventId);
    	
    	List<UsersEvents> events = usersEventsService.findByEvent(event); 
    	model.addAttribute("events", events);
    	System.out.println(messages);
    	System.out.println("showing events");
//    	model.addAttribute("id", eventId);
    	model.addAttribute("event", event);
    	String username = principal.getName();
    	User currentUser = userService.findByEmail(username);
    	model.addAttribute("currentUser", currentUser);
    	usersEventsService.getJoin(eventId, currentUser.getId());
    	model.addAttribute("messages", messages);
//    	UsersEvents events = usersEventsService.allJoin();
    	return "events/showPage.jsp";
    	
    }
    
    
    @PostMapping("/message/{eid}")
    public String createMessage(@Valid @ModelAttribute("message") Message message, BindingResult result, @PathVariable("eid") Long eventId, Model model, Principal principal) {
    	if(result.hasErrors()) {
    		return "events/showPage.jsp";
    	} 
    	else {
    		
        	String username = principal.getName();
        	User currentUser = userService.findByEmail(username);
        	model.addAttribute("currentUser", currentUser);
    		System.out.println("creating comment");
    		System.out.println("event:"+ eventId);
    		messageService.addMessage(message);
    		return "redirect:/events/" + eventId;
    	}
    }
    
    @RequestMapping("/events/cancel/{eid}")
    public String cancel(@PathVariable("eid") Long eventId, Event event, Principal principal) {
    	System.out.println("cancelling join");
    	String username = principal.getName();
    	User currentUser = userService.findByEmail(username);
    	usersEventsService.cancelJoin(eventId,currentUser.getId());
    	
    	
    	return "redirect:/events";
    }
    
    @RequestMapping("/event/delete/{eid}")
    public String deleteEvent(@PathVariable("eid") Long eventId) {
    	List<Message> messages = messageService.allComments(eventId);
    	messageService.delete(messages);
    	eventService.delete(eventId);
    	return "redirect:/events";
    }
    
    @RequestMapping("/events/{eid}/edit")
    public String edit(@PathVariable("eid") Long eventId, Model model, Principal principal) {
    	String username = principal.getName();
    	User currentUser = userService.findByEmail(username);
    	model.addAttribute("currentUser", currentUser);
    	Event event = eventService.getEvent(eventId);
    	model.addAttribute("eventId",eventId);
    	model.addAttribute("event", event);
    	return "/events/editPage.jsp";
    }
    
    
    @PostMapping("/events/{eid}/update")
    public String update(@Valid @ModelAttribute("event") Event event, BindingResult result, Model model, Principal principal) {
    	if(result.hasErrors()) {
    		System.out.println("errors update event");
    		model.addAttribute("eventMessage", "Invalid credentials, Please try again.");
    		return "/events/editPage.jsp";
    	}
    	else {
			System.out.println("updating event");
			System.out.println(event.getId());
			eventService.updateEvent(event);
			return "redirect:/events";
		}
    }
}