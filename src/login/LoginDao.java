package login;


import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import policy.PolicyBean;

public class LoginDao {
	
	private String jdbcURL = "jdbc:mysql://localhost/InsuranceMgmt?serverTimezone=UTC&useSSL=false";
	private String jdbcUsername = "admin";
	private String jdbcPassword = "admin";
	
	private static final String FIND_ID_BY_UN = "SELECT profileid FROM login WHERE username=?";
	private static final String FIND_POLICY_BY_USERID = "SELECT * FROM transaction LEFT JOIN policy ON transaction.insuranceID = policy.id WHERE transaction.clientID = ?";
	private static final String FIND_CLIENTS_OF_AGENT = "SELECT * FROM login WHERE assignedAgent = ?";
	private static final String ADMIN_VALIDAT_AGENT = "SELECT * FROM login WHERE type='agent' AND valid=0;";
	private static final String ALL_CLIENTS = "SELECT * FROM login WHERE type=? ;";
	private static final String APPROVE_BY_ID = "update login set valid=1 where profileid = ?;";
	private static final String DELETE_BY_ID = "delete from login where profileid = ?;";
	
	
	public Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
	public void deleteUser(int id) throws SQLException{
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_BY_ID);){
			statement.setInt(1,id);
			System.out.println(statement);
			statement.executeUpdate();
		}
		catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		
	}
			
	public String findUserIDbyUserName(String username) throws SQLException{
		String id = "";
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(FIND_ID_BY_UN);
				){
			statement.setString(1, username);
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				id = rs.getString("profileid");
			}
		}
		return id;
		
	}
	public List<LoginBean> allClients(String type) throws SQLException{
		List<LoginBean> result = new ArrayList<>();
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(ALL_CLIENTS);
				){
			statement.setString(1, type);
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				LoginBean lb = new LoginBean();
				lb.setProfileID(String.valueOf(rs.getInt("profileid")));
				lb.setFirstName(rs.getString("firstname"));
				lb.setLastName(rs.getString("lastname"));
				lb.setEmail(rs.getString("email"));
				lb.setGender(rs.getString("gender"));
				result.add(lb);
				System.out.println(lb.toString());
			}
		}
		return result;
		
	}
	public List<LoginBean> findClients(String id) throws SQLException{
		List<LoginBean> result = new ArrayList<>();
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(FIND_CLIENTS_OF_AGENT);
				){
			statement.setString(1, id);
			//System.out.println(statement);
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				LoginBean lb = new LoginBean();
				lb.setProfileID(String.valueOf(rs.getInt("profileid")));
				lb.setFirstName(rs.getString("firstname"));
				lb.setLastName(rs.getString("lastname"));
				lb.setEmail(rs.getString("email"));
				lb.setGender(rs.getString("gender"));
				result.add(lb);
				System.out.println(lb.toString());
			}
		}
		return result;
		
	}
	public List<LoginBean> ValidateAgent() throws SQLException{
		List<LoginBean> result = new ArrayList<>();
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(ADMIN_VALIDAT_AGENT);
				){
			
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				LoginBean lb = new LoginBean();
				lb.setProfileID(String.valueOf(rs.getInt("profileid")));
				lb.setFirstName(rs.getString("firstname"));
				lb.setLastName(rs.getString("lastname"));
				lb.setEmail(rs.getString("email"));
				lb.setGender(rs.getString("gender"));
				result.add(lb);
				System.out.println(lb.toString());
			}
		}
		return result;
		
	}
	public List<PolicyBean> findPolicyOfUser(String id) throws SQLException{
		List<PolicyBean> result = new ArrayList<>();
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(FIND_POLICY_BY_USERID);){
			statement.setInt(1,Integer.parseInt(id));
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
            	PolicyBean pb = new PolicyBean();
            	pb.setId(String.valueOf(rs.getInt("policy.id")));
            	pb.setType(rs.getString("policy.type"));
            	pb.setName(rs.getString("policy.name"));
            	pb.setPrice(rs.getInt("policy.price"));
            	pb.setDuration(rs.getInt("policy.duration"));
            	pb.setYearInterest(rs.getInt("policy.yearintereste"));
            	result.add(pb);
            	
            }
		}
		return result;
		
	}
	public boolean validate(LoginBean loginBean) throws ClassNotFoundException {
		boolean status = false;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from login where username = ? and password = ?")) {
			preparedStatement.setString(1, loginBean.getUsername());
			preparedStatement.setString(2, loginBean.getPassword());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			status = rs.next();
			String userType = rs.getString("Type");
			
			loginBean.setType(userType);
		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return status;
	}
	public void approveNewAgent(int id) throws SQLException{
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(APPROVE_BY_ID);){
			statement.setInt(1,id);
			System.out.println(statement);
			statement.executeUpdate();
		}
		catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
			
	}
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
