package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.dto.User;
import com.techelevator.model.dao.UserDAO;

import java.util.List;

@Controller
public class UserController {

	private UserDAO userDAO;

	@Autowired
	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/users/new", method=RequestMethod.GET)
	public String displayNewUserForm(ModelMap modelHolder) {
		if( ! modelHolder.containsAttribute("user")) {
			modelHolder.addAttribute("user", new User());
		}
		return "users/newUser";
	}
	
	@RequestMapping(path="/users", method=RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute User user, BindingResult result, RedirectAttributes flash) {
		if(result.hasErrors()) {
			flash.addFlashAttribute("user", user);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
			return "redirect:/users/new";
		}

		List<User> currentUsers = userDAO.getAllUsers();

		for (User currentUser : currentUsers) {
			if (currentUser.getUserName().equalsIgnoreCase(user.getUserName())) {
				return "redirect:/users/error";
			}
		}

		user.setActiveStatus(true);
		
		userDAO.saveUser(user.getName(), user.getUserName(), user.getPassword(), user.getBirthdate(), user.getRole(),
				user.isActiveStatus(), user.getUserEmail());
		return "login/login";
	}
	
	@RequestMapping("/userDirectory")
	public String viewAllUsers(HttpServletRequest request){

		List<User> brewers = userDAO.getAllBrewers();
		List<User> beerLovers = userDAO.getAllBeerLovers();

		request.setAttribute("brewers", brewers);
		request.setAttribute("beerLovers", beerLovers);

		return "/users/userDirectory";
	}

	@RequestMapping("/users/{userName}/update")
	public String getUpdateUserForm(HttpServletRequest request, @PathVariable String userName) {
		return "/users/updateUser";
	}

	@RequestMapping(path="/users/{userName}/doUpdate")
	public String updateUser(@PathVariable String userName, @Valid @ModelAttribute User user, HttpSession session) {

		User existingUser = userDAO.getUserByUserName(userName);

		userDAO.updateUser(existingUser.getId(), user.getName(), user.getUserName(), user.getBirthdate(),
				user.getUserEmail());

		session.setAttribute("currentUser", user);

		return "redirect:/users/" + userName;
	}

	@RequestMapping("/users/{userName}/delete")
	public String removeUser(@PathVariable String userName, ModelMap model, HttpSession session) {

		User user = userDAO.getUserByUserName(userName);

		userDAO.makeUserInactive(user.getId());
		model.remove("currentUser");
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/users/{id}/deactivate")
	public String adminDeleteUser(@PathVariable int id) {

		userDAO.makeUserInactive(id);

		return "redirect:/userDirectory";
	}

	@RequestMapping("/users/{id}/reactivate")
	public String reactivateUser(@PathVariable int id) {

		userDAO.makeUserActive(id);

		return "redirect:/userDirectory";
	}

	@RequestMapping("users/error")
	public String usernameErrorPage () {
		return "misc/userNameErrorPage";
	}

	@RequestMapping("users/error/redirect")
	public String errorRedirect() {
		return "redirect:/users/new";
	}
}
