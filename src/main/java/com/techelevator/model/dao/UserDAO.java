package com.techelevator.model.dao;

import com.techelevator.model.dto.User;

import java.time.LocalDate;
import java.util.List;

public interface UserDAO {

	void saveUser(String name, String userName, String password, String birthdate, String role,
						boolean activeStatus,  String userEmail);

	boolean searchForUsernameAndPassword(String userName, String password);

	void updatePassword(String userName, String password);

	void updateUser(int id, String name, String userName, String birthdate, String userEmail);

	User getUserByUserName(String userName);

	User getUserById(int id);

	List<User> getAllBrewers();

	List<User> getAllBeerLovers();

	List<User> getAllUsers();

    void makeUserInactive(int id);

    void makeUserActive(int id);
}
