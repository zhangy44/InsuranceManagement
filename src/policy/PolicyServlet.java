package policy;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/policy/*")
public class PolicyServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private PolicyDao policyDao;
	
	public void init() {
		policyDao = new PolicyDao();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		String name = request.getPathInfo();
		System.out.println("name is "+name);
		try {
			switch (name) {
//			case "/new":
//				showNewForm(request, response);
//				break;
			case "/insertPolicy":
				insertPolicy(request, response);
				break;
			case "/deletePolicy":
				deletePolicy(request, response);
				break;
			case "/editPolicy":
				showEditForm(request, response);
				break;
			case "/updatePolicy":
				System.out.println("updatePolicy");
				updatePolicy(request, response);
				break;
			case "/allPolicies":
				listAllPolicies(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}
	private void listAllPolicies(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		System.out.println("policyServlet.selectAllPolicies is called");
		List<PolicyBean> listPolicies= policyDao.selectAllPolicies();
		request.setAttribute("listPolicies", listPolicies);
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/adminMain.jsp");
		dispatcher.forward(request, response);
		
	}
	private void insertPolicy(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		System.out.println("policyServlet.insertPolicy is called");
		String type = request.getParameter("type");
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		int duration = Integer.parseInt(request.getParameter("duration"));
		int yi = Integer.parseInt(request.getParameter("yi"));
		PolicyBean pb = new PolicyBean(type,name,price,duration,yi);
		policyDao.insertPolicy(pb);
		response.sendRedirect("../jsp/adminMain.jsp");
		
	}
	private void deletePolicy(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		policyDao.deletePolicy(id);
		response.sendRedirect("../jsp/adminMain.jsp");
	}
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.getSession().setAttribute("id", id);
		PolicyBean pb = policyDao.selectPolicy(id);
		request.getSession().setAttribute("pb", pb);
		response.sendRedirect("../jsp/editPolicyForm.jsp");

	}
	private void updatePolicy(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String type = request.getParameter("type");
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		int duration = Integer.parseInt(request.getParameter("duration"));
		int yi = Integer.parseInt(request.getParameter("yi"));
		PolicyBean pb = new PolicyBean(type,name,price,duration,yi);
		policyDao.updatePolicy(pb,id);
		response.sendRedirect("../jsp/adminMain.jsp");
	}
}
