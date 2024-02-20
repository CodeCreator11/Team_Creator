package com.jruiz.BeltExam.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.jruiz.BeltExam.models.Team;

public interface TeamRepository extends CrudRepository<Team, Long> {
	
	List<Team> findAll();

}
