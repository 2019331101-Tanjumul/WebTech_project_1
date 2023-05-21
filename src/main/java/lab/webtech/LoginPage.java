package lab.webtech;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginPage
 */
@WebServlet("/fjakldsjflk")
public class LoginPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		RequestDispatcher view = request.getRequestDispatcher("landing.jsp");
//		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		RequestDispatcher dispatcher = null;
		Connection con = null;
		PreparedStatement pst = null;
		HttpSession session = request.getSession();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
//		PrintWriter out = response.getWriter();
//		out.println(username +"-"+ password);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtech?useSSL=false","root","mynewpass");
			if(session.getAttribute("role").equals("student")) {
				pst = con.prepareStatement("select * from students where username = ? and password = ?");
			}
			else if(session.getAttribute("role").equals("teacher")) {
				pst = con.prepareStatement("select * from teachers where username = ? and password = ?");
			}
			else {
				pst = con.prepareStatement("select * from admins where username = ? and password = ?");
			}
			
			pst.setString(1, username);
			pst.setString(2, password);
			
			ResultSet res = pst.executeQuery();
//			System.out.println(res.getString("username"));
			if(res.next()) {
				session.setAttribute("name", res.getString("name"));
				session.setAttribute("email", res.getString("email"));
//				System.out.println(session.getAttribute("email"));
				if(session.getAttribute("role").equals("student")) {
					dispatcher = request.getRequestDispatcher("homeS.jsp");
				}
				else if(session.getAttribute("role").equals("teacher")) {
					dispatcher = request.getRequestDispatcher("homeT.jsp");
				}
				else {
					dispatcher = request.getRequestDispatcher("homeA.jsp");
				}
			}
			else {
				request.setAttribute("status", "failed");
				if(session.getAttribute("role").equals("student")) {
					dispatcher = request.getRequestDispatcher("loginS.jsp");
				}
				else if(session.getAttribute("role").equals("teacher")) {
					dispatcher = request.getRequestDispatcher("loginT.jsp");
				}
				else {
					dispatcher = request.getRequestDispatcher("loginA.jsp");
				}			}
			dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
