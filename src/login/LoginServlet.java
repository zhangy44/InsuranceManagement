package login;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;







@WebServlet("/user/*")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDao loginDao;

	public void init() {
		loginDao = new LoginDao();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String info = request.getPathInfo();
	
		System.out.println(info);
		try {
			switch(info){
				case "/login":
					
					login(request, response);
					break;
				
			}
		}catch (ServletException ex) {
			throw ex;
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String info = request.getPathInfo();
		
		try {
			switch(info){
				case "/approveAgent":
					System.out.println("Agent is approved!!");
					approveAgent(request, response);
					break;
					
				case "/deleteUser":
					System.out.println("A user is being deleted");
					deleteUser(request,response);
					break;
				}
			
		}catch (ServletException ex) {
			throw ex;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void approveAgent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		int id = Integer.parseInt(request.getParameter("id"));
		loginDao.approveNewAgent(id);
		response.sendRedirect(request.getContextPath()+"/jsp/adminMain.jsp");
		
		
	}
	protected void deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		int id = Integer.parseInt(request.getParameter("id"));
		loginDao.deleteUser(id);
		response.sendRedirect(request.getContextPath()+"/jsp/adminMain.jsp");
		
		
	}
	
	
	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoginBean loginBean = new LoginBean();
		loginBean.setUsername(username);
		loginBean.setPassword(password);

		try {
			if (loginDao.validate(loginBean)) {
				if(loginBean.getType().equals("admin")) {
					System.out.println("log in as admin");
					response.sendRedirect("../jsp/adminMain.jsp");
					
				}
				else if(loginBean.getType().equals("agent")) {
					response.sendRedirect("../jsp/agentMain.jsp");
				}
				else if(loginBean.getType().equals("client")) {
					response.sendRedirect("../jsp/clientMain.jsp");
				}
				else {
					
				}
				HttpSession session=request.getSession();  
		        session.setAttribute("username",loginBean.getUsername()); 
				System.out.println("login success");
			} else {
				response.sendRedirect("index.jsp");
				System.out.println("login not success");
				
			}
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
	}
}

