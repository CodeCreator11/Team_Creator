package com.jruiz.BeltExam.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jruiz.BeltExam.models.Team;
import com.jruiz.BeltExam.repositories.TeamRepository;

@Service
public class TeamService {
	
	@Autowired
	private TeamRepository repo;
	
	public Team findById(Long id) {
		Optional<Team> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<Team>all(){
		return repo.findAll();
	}
	
	public Team create(Team team) {
		return repo.save(team);
	}

	public void save(Team team) {
		repo.save(team);
	}
	
	public void destroy(Long id) {
		repo.deleteById(id);
	}
	
}
