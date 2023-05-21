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
 * Servlet implementation class Accept
 */
@WebServlet("/accept")
public class Accept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Accept() {
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
		
		String ccode = request.getParameter("ccode");
		String cname = request.getParameter("cname");
		String dept = request.getParameter("dept");
		String teacher = request.getParameter("teacher");
//		String student = String.valueOf(session.getAttribute("name"));
//		String stemail = String.valueOf(session.getAttribute("email"));

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtech?useSSL=false","root","mynewpass");
			pst = con.prepareStatement("insert into acourses(ccode,cname,dept,teacher) values(?,?,?,?)");
			
			pst.setString(1, ccode);
			pst.setString(2, cname);
			pst.setString(3, dept);
			pst.setString(4, teacher);

			int rows = pst.executeUpdate();
			if(rows > 0) {
				request.setAttribute("status", "success");
				response.sendRedirect("homeT.jsp");
			}
			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("homeT.jsp");
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
