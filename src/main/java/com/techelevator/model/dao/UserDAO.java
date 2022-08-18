package com.techelevator.model.dao;

import java.time.LocalDate;

public interface UserDAO {

	public void saveUser(String name, String userName, String password, String birthdate, String role, String userEmail);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password);

	public Object getUserByUserName(String userName);

}
