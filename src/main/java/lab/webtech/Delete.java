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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher= null;
		Connection con = null;
		PreparedStatement pst = null;
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String role = request.getParameter("role");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtech?useSSL=false","root","mynewpass");
			if(role.equals("student")) {
				pst = con.prepareStatement("delete from students where id = ?");
			}
			else {
				pst = con.prepareStatement("delete from teachers where id = ?");
			}
			
			pst.setString(1, id);
			

			int rows = pst.executeUpdate();
			if(rows > 0) {
				request.setAttribute("status", "success");
				response.sendRedirect("homeA.jsp");
			}
			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("homeA.jsp");
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
