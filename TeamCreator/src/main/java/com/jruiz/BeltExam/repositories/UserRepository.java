package com.jruiz.BeltExam.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.jruiz.BeltExam.models.User;

public interface UserRepository extends CrudRepository<User, Long> {
	
	List<User> findAll();
	Optional<User> findByEmail(String email);

}
