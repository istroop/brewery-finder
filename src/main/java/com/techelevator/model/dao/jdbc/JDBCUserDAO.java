package com.techelevator.model.dao.jdbc;

import javax.sql.DataSource;

import com.techelevator.model.dao.UserDAO;
import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.dto.User;
import com.techelevator.services.security.PasswordHasher;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Component
public class JDBCUserDAO implements UserDAO
{

	private JdbcTemplate jdbcTemplate;
	private PasswordHasher hashMaster;

	@Autowired
	public JDBCUserDAO(DataSource dataSource, PasswordHasher hashMaster) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.hashMaster = hashMaster;
	}
	
	@Override
	public void saveUser(String name, String userName, String password, String birthdate, String role,
						boolean activeStatus, String userEmail) {
		byte[] salt = hashMaster.generateRandomSalt();
		String hashedPassword = hashMaster.computeHash(password, salt);
		String saltString = new String(Base64.encode(salt));
		
		jdbcTemplate.update("INSERT INTO app_user(name, user_name, password, birthdate, role, email_address, " +
						"active_status, salt) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
				name, userName, hashedPassword, birthdate, role, userEmail, activeStatus, saltString);
	}

	@Override
	public boolean searchForUsernameAndPassword(String userName, String password) {
		String sqlSearchForUser = "SELECT * "+
							      "FROM app_user "+
							      "WHERE UPPER(user_name) = ? ";
		
		SqlRowSet user = jdbcTemplate.queryForRowSet(sqlSearchForUser, userName.toUpperCase());
		if(user.next()) {
			String dbSalt = user.getString("salt");
			String dbHashedPassword = user.getString("password");
			String givenPassword = hashMaster.computeHash(password, Base64.decode(dbSalt));
			return dbHashedPassword.equals(givenPassword);
		} else {
			return false;
		}
	}

	@Override
	public void updatePassword(String userName, String password) {
		jdbcTemplate.update("UPDATE app_user SET password = ? WHERE user_name = ?", password, userName);
	}

	@Override
	public void updateUser(int id, String name, String userName, String birthdate, String userEmail) {
		String sql = "UPDATE app_user SET name = ?, user_name = ?, birthdate = ?, email_address = ? WHERE id = ?";
		jdbcTemplate.update(sql, name, userName, birthdate, userEmail, id);
	}

	@Override
	public User getUserByUserName(String userName) {
		String sqlSearchForUsername ="SELECT * "+
		"FROM app_user "+
		"WHERE UPPER(user_name) = ? ";

		SqlRowSet user = jdbcTemplate.queryForRowSet(sqlSearchForUsername, userName.toUpperCase()); 
		User thisUser = null;
		if(user.next()) {
			thisUser = new User();
			thisUser.setUserName(user.getString("user_name"));
			thisUser.setPassword(user.getString("password"));
			thisUser.setName(user.getString("name"));
			thisUser.setRole(user.getString("role"));
			thisUser.setBirthdate(user.getString("birthdate"));
			thisUser.setUserEmail(user.getString("email_address"));
			thisUser.setId(user.getInt("id"));
			thisUser.setUserEmail(user.getString("email_address"));
			thisUser.setActiveStatus(user.getBoolean("active_status"));
		}

		return thisUser;
	}

	@Override
	public List<User> getAllBrewers() {

		List<User> brewers = new ArrayList<>();
		String search = "brewer";
		String sql = "SELECT id, name, user_name, role, birthdate, email_address, active_status FROM app_user WHERE " +
				"role = ?";
		SqlRowSet row = jdbcTemplate.queryForRowSet(sql, search);

		User user = null;

		while (row.next()) {
			user = new User();
			user.setId(row.getInt("id"));
			user.setName(row.getString("name"));
			user.setUserName(row.getString("user_name"));
			user.setRole(row.getString("role"));
			user.setBirthdate(row.getString("birthdate"));
			user.setUserEmail(row.getString("email_address"));
			user.setActiveStatus(row.getBoolean("active_status"));
			brewers.add(user);
		}

		return brewers;
	}

	@Override
	public List<User> getAllBeerLovers() {
		List<User> beerLovers = new ArrayList<>();
		String search = "beerLover";
		String sql = "SELECT id, name, user_name, role, birthdate, email_address, active_status FROM app_user WHERE " +
				"role = ?";
		SqlRowSet row = jdbcTemplate.queryForRowSet(sql, search);

		User user = null;

		while (row.next()) {
			user = new User();
			user.setId(row.getInt("id"));
			user.setName(row.getString("name"));
			user.setUserName(row.getString("user_name"));
			user.setRole(row.getString("role"));
			user.setBirthdate(row.getString("birthdate"));
			user.setUserEmail(row.getString("email_address"));
			user.setActiveStatus(row.getBoolean("active_status"));
			beerLovers.add(user);
		}

		return beerLovers;
	}

	@Override
	public List<User> getAllUsers() {
		List<User> users = new ArrayList<>();
		String sql = "SELECT id, name, user_name, role, birthdate, email_address, active_status FROM app_user";
		SqlRowSet row = jdbcTemplate.queryForRowSet(sql);

		User user = null;

		while (row.next()) {
			user = new User();
			user.setId(row.getInt("id"));
			user.setName(row.getString("name"));
			user.setUserName(row.getString("user_name"));
			user.setRole(row.getString("role"));
			user.setBirthdate(row.getString("birthdate"));
			user.setUserEmail(row.getString("email_address"));
			user.setActiveStatus(row.getBoolean("active_status"));
			users.add(user);
		}

		return users;
	}

	@Override
	public void makeUserInactive(int id) {
		String sql = "UPDATE app_user SET active_status = false WHERE id = ?";
		jdbcTemplate.update(sql, id);
	}

	@Override
	public void makeUserActive(int id) {
		String sql = "UPDATE app_user SET active_status = true WHERE id = ?";
		jdbcTemplate.update(sql, id);
	}

}
