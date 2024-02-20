package com.jruiz.BeltExam.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.jruiz.BeltExam.models.LoginUser;
import com.jruiz.BeltExam.models.User;
import com.jruiz.BeltExam.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository repo;
	
//	login
	@Autowired
	private UserRepository uRepo;

public User register(User newUser, BindingResult result) {
	
	Optional<User> userFind = uRepo.findByEmail(newUser.getEmail());
	if(userFind.isPresent()) {
		result.rejectValue("email", "Unique","Email already exists.");
	}
	
	if(!newUser.getPassword().equals(newUser.getConfirm())) {
		result.rejectValue("confirm", "Matches", "Confirm password must to match");
	}
	if(result.hasErrors()) {
		return null;
	}

	String hashed=BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
	newUser.setPassword(hashed);
	
	newUser = repo.save(newUser);
	
	return newUser;
}

public User Login(LoginUser newLogin, BindingResult result) {
	
	Optional<User> userFind = uRepo.findByEmail(newLogin.getEmail());
	if(!userFind.isPresent()) {
	result.rejectValue("email", "MissingAccount", "No Account Found");
	return null;
	}
	
	User user = userFind.get();
	
	if(!BCrypt.checkpw(newLogin.getPassword(),user.getPassword())) {
		result.rejectValue("password", "Matches", "Invalid Password");
	}
	if(result.hasErrors()) {
		return null;
	}
	return user;
}

public User findByEmail(String email) {
	Optional<User> result = repo.findByEmail(email);
	if(result.isPresent()) {
		return result.get();
	}
	return null;
}

public User findById(Long id) {
	Optional<User> result = repo.findById(id);
	if(result.isPresent()) {
		return result.get();
	}
	return null;
}
	
	
	
} 