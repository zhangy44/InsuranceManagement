package registration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;

public class UserDao {
	public int registerUser(UserBean user) throws ClassNotFoundException{
		String INSERT_USERS_SQL = "INSERT INTO login" + 
	" (type , username, password, firstname, lastname, gender, email, DOB, country, state, city, assignedAgent, valid) VALUES" + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?);";
	
	int result = 0;
	Class.forName("com.mysql.jdbc.Driver");

	try(Connection connection = DriverManager
			.getConnection("jdbc:mysql://localhost/InsuranceMgmt?serverTimezone=UTC&useSSL=false", "admin", "admin");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            
            preparedStatement.setString(1, user.getType());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getFirstname());
            preparedStatement.setString(5, user.getLastname());
            preparedStatement.setString(6, user.getGender());
            preparedStatement.setString(7, user.getEmail());
            preparedStatement.setString(8, user.getDOB());
            preparedStatement.setString(9, user.getCountry());
            preparedStatement.setString(10, user.getState());
            preparedStatement.setString(11, user.getCity());
            preparedStatement.setString(12, "0000");
            preparedStatement.setInt(13, 0);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        }catch (SQLException e) {
            printSQLException(e);
        }
        return result;
	}
	private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
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
