package com.techelevator.model.dao;

import java.time.LocalDate;

public interface UserDAO {

	public void saveUser(String userName, String password, LocalDate birthdate, String role, String userEmail);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password);

	public Object getUserByUserName(String userName);

}
