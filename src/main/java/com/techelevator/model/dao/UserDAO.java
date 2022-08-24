package com.techelevator.model.dao;

import com.techelevator.model.dto.User;

import java.time.LocalDate;
import java.util.List;

public interface UserDAO {

	void saveUser(String name, String userName, String password, String birthdate, String role, String userEmail);

	boolean searchForUsernameAndPassword(String userName, String password);

	void updatePassword(String userName, String password);

	Object getUserByUserName(String userName);

	List<User> getAllBrewers();

	List<User> getAllBeerLovers();

}
