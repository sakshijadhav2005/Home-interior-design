

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class home
 */
@WebServlet("/home")
public class home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at:").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		String Name=request.getParameter("name");
		String Email=request.getParameter("email");
		String Amount=request.getParameter("amount");
		String Message=request.getParameter("message");
		try
		{
			Connection con=DB_Connection.con();
			Statement st=con.createStatement();
			st.executeUpdate("insert into pr2 values('"+Name+"','"+Email+"','"+Amount+"','"+Message+"')");
			pw.println("<script> alert('Feedback SendSuccessfully');</script>");
			RequestDispatcher rd=request.getRequestDispatcher("/charity.jsp");
			rd.include(request, response);
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
		
		
	}

