package policy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import registration.UserBean;


public class PolicyDao {
//jdbc info
	private String jdbcURL = "jdbc:mysql://localhost/InsuranceMgmt?serverTimezone=UTC&useSSL=false";
	private String jdbcUsername = "admin";
	private String jdbcPassword = "admin";
	
//Query	
	private static final String SELECT_ALL_USERS = "select * from policy";
	private static final String INSERT_POLICY_SQL = "INSERT INTO policy"+ " (type,name,price,duration,yearintereste) VALUES " + " (?, ?, ?, ?, ?);";
	private static final String DELETE_POLICY_SQL = "delete from policy where id = ?;";
	private static final String SELECT_BY_ID = "select id,type,name,price,duration,yearintereste from policy where id =?";
	private static final String UPDATE_POLICY_SQL = "update policy set type  = ?,name=?,price=?,duration=?,yearintereste=? where id = ?;";
	
	
	public PolicyDao() {
		
	}
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
	public List<PolicyBean> selectAllPolicies() {

		List<PolicyBean> result = new ArrayList<>();
		System.out.println("policyDao.selectAllPolicies is called");
		// Establishing a Connection
		try (Connection connection = getConnection();

			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while(rs.next()) {
            	PolicyBean pb = new PolicyBean();
            	pb.setId(String.valueOf(rs.getInt("id")));
            	pb.setType(rs.getString("type"));
            	pb.setName(rs.getString("name"));
            	pb.setPrice(rs.getInt("price"));
            	pb.setDuration(rs.getInt("duration"));
            	pb.setYearInterest(rs.getInt("yearintereste"));
            	result.add(pb);
            	
            }
		} catch (SQLException e) {
			printSQLException(e);
		}
		return result;
	}
	public void insertPolicy(PolicyBean pb) throws SQLException {
		System.out.println(INSERT_POLICY_SQL);
		
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_POLICY_SQL)) {
			preparedStatement.setString(1, pb.getType());
			preparedStatement.setString(2, pb.getName());
			preparedStatement.setInt(3, pb.getPrice());
			preparedStatement.setInt(4, pb.getDuration());
			preparedStatement.setInt(5, pb.getYearInterest());
			
			preparedStatement.executeUpdate();
			System.out.println("New policy Inserted");
		} catch (SQLException e) {
			printSQLException(e);
		}
	}
	public boolean deletePolicy(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_POLICY_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}
	
	public PolicyBean selectPolicy(int id) {
		PolicyBean pb = new PolicyBean();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
            	pb.setId(String.valueOf(rs.getInt("id")));
            	pb.setType(rs.getString("type"));
            	pb.setName(rs.getString("name"));
            	pb.setPrice(rs.getInt("price"));
            	pb.setDuration(rs.getInt("duration"));
            	pb.setYearInterest(rs.getInt("yearintereste"));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		System.out.println("policyDao" + pb.toString());
		return pb;
	}
	public boolean updatePolicy(PolicyBean pb, int id) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_POLICY_SQL);) {
			statement.setString(1, pb.getType());
			statement.setString(2, pb.getName());
			statement.setInt(3, pb.getPrice());
			statement.setInt(4, pb.getDuration());
			statement.setInt(5, pb.getYearInterest());
			statement.setInt(6, id);
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
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
