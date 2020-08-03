package registration;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class UserServlet extends HttpServlet{
	private UserDao userdao;
	public void init() {
		userdao = new UserDao();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		String Type = request.getParameter("type");
		String Username = request.getParameter("username");
		String Password = request.getParameter("password");
		String Firstname = request.getParameter("firstname");
		String Lastname = request.getParameter("lastname");
		String Gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String DOB = request.getParameter("DOB").replace("/", "");
		String Country= request.getParameter("country");
		String State = request.getParameter("state");
		String City = request.getParameter("city");
		
		UserBean user = new UserBean();
		user.setType(Type);
		user.setUsername(Username);
		user.setPassword(Password);
		user.setFirstname(Firstname);
		user.setLastname(Lastname);
		user.setGender(Gender);
		user.setEmail(email);
		user.setDOB(DOB);
		user.setCountry(Country);
		user.setState(State);
		user.setCity(City);
		
		try {
			userdao.registerUser(user);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		if(Type.equals("agent")) {
			response.sendRedirect("jsp/agentMain.jsp");
		}
		else if(Type.equals("client")) {
			response.sendRedirect("jsp/clientMain.jsp");
		}
		HttpSession session=request.getSession();  
        session.setAttribute("username",Username); 
		
	}
}
