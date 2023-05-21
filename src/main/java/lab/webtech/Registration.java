package lab.webtech;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/register")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		RequestDispatcher dispatcher= null;
		Connection con = null;
		PreparedStatement pst = null;
		
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("position");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtech", "root", "mynewpass");
			if(role.equals("student")) {
				pst = con.prepareStatement("insert into students(username,name,email,password,role) values(?,?,?,?,?)");
			}
			else if(role.equals("teacher")) {
				pst = con.prepareStatement("insert into teachers(username,name,email,password,role) values(?,?,?,?,?)");
			}
			else {
				pst = con.prepareStatement("insert into admins(username,name,email,password,role) values(?,?,?,?,?)");
			}
			
			pst.setString(1, username);
			pst.setString(2, name);
			pst.setString(3, email);
			pst.setString(4, password);
			pst.setString(5, role);

			int rows = pst.executeUpdate();
			if(rows > 0) {
				request.setAttribute("status", "success");
			}
			else {
				request.setAttribute("status", "failed");
			}
			
			if(role.equals("student")) {
				dispatcher = request.getRequestDispatcher("loginS.jsp");
			}
			else if(role.equals("teacher")) {
				dispatcher = request.getRequestDispatcher("loginT.jsp");
			}
			else {
				dispatcher = request.getRequestDispatcher("loginA.jsp");
			}
			
			dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
