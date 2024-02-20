package com.jruiz.BeltExam.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jruiz.BeltExam.models.LoginUser;
import com.jruiz.BeltExam.models.Team;
import com.jruiz.BeltExam.models.User;
import com.jruiz.BeltExam.services.TeamService;
import com.jruiz.BeltExam.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class TeamController {

	@Autowired
	private UserService users;
	
	@Autowired
	private TeamService teams;
	
	@GetMapping("/main")
	public String mainpage() {
		return "mainpage.jsp";
	}
	
	
	@GetMapping("/")
	public String login(Model model) {
		
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "login.jsp";
		
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser")User newUser,
			BindingResult result, Model model, HttpSession session) {
		User user = users.register(newUser, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "login.jsp";
		}
		session.setAttribute("userId", user.getId());
		
		return "redirect:/dashboard";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin")LoginUser newLogin,
			BindingResult result, Model model, HttpSession session) {
		
		User user = users.Login(newLogin, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}
		session.setAttribute("userId", user.getId());
		
		return "redirect:/dashboard";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		
		model.addAttribute("teams",teams.all());
		model.addAttribute("user",users.findById((Long)session.getAttribute("userId")));
		return "dashboard.jsp";
		
	}
	
	@GetMapping("/create")
	public String create(@ModelAttribute("team")Team team, Model model, HttpSession session) {
	
		User user = users.findById((Long)session.getAttribute("userId"));
		model.addAttribute("user", user);
		
		return "create.jsp";
	}
	
	@PostMapping("/teams")
	public String createTeam(@Valid @ModelAttribute("team") Team team, BindingResult result) {
		
		if(result.hasErrors()) {
			return "create.jsp";
		}
		
		teams.create(team);
		
		return "redirect:/dashboard";
		
	}
	
	@GetMapping("/teams/{id}")
	public String showpage(Model model, @PathVariable("id")Long id, HttpSession session) {
		
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		
		Team team = teams.findById(id);
		model.addAttribute("team", team);
		model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
		
		return "view.jsp";
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@DeleteMapping("/teams/{id}")
	public String destroy(
			@PathVariable("id")Long id, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/dashboard";
		}
		
		Team team = teams.findById(id);
		
		Long teamUserId = team.getUser().getId();
		
		if(!userId.equals(teamUserId)) {
			redirectAttributes.addFlashAttribute("null", "You cant do that no no no!");
			return "redirect:/dashboard";
		}
		
		teams.destroy(id);
		
		return "redirect:/dashboard";
		
	}
	
	@GetMapping("/teams/{id}/edit")
	public String update(
			@PathVariable("id")Long id, Model model, HttpSession session) {
		
		Long userId = (Long)session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/dashboard";
		}
		
		Team team = teams.findById(id);
		model.addAttribute("team",team);
		
		return "edit.jsp";
		
	}
	
	@PutMapping("/teams/{id}")
	public String updateThis(
			@PathVariable("id")Long id,
			@Valid @ModelAttribute("team")Team team,
			BindingResult result,
			Model model,
			HttpSession session
			){
		
		Long userId = (Long) session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/dashboard";
		}
		
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		
		team.setUser(users.findById(userId));
		teams.save(team);
		
		return "redirect:/dashboard";
		
	}
	
		
}
