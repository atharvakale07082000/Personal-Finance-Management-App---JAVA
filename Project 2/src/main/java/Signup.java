

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out=response.getWriter();
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String passrepeat = request.getParameter("passrepeat");
		out.println(fname);
		out.println(lname);
		out.println(uname);
		out.println(pass);
		out.println(passrepeat);

		if(pass.equals(passrepeat)){
		try {
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
		 if(conn==null)
		 {
			 out.println("Conn null");
		 }
		 
		/* Statement st = conn.createStatement();
		 int i = st.executeUpdate("insert into users(uname,fname,lname,pass)values('"+uname+"','" + fname + "','" + lname
		 + "','" + pass + "')");*/ 
		PreparedStatement ps = conn.prepareStatement("insert into users(uname,fname,lname,pass) values(?,?,?,?)");
						ps.setString(1, uname);
						ps.setString(2, fname);
			    		ps.setString(3, lname);
			    		ps.setString(4, pass);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {}
	/*	PreparedStatement ps1 = conn.prepareStatement("insert into pd(uname,fname,lname) values(?,?,?)");
		ps1.setString(1, uname);
		ps1.setString(2, fname);
		ps1.setString(3, lname);
		ResultSet rs1=ps1.executeQuery();*/
//while(rs1.next()) {}
		out.println("Thank you for register ! Please <a href='login.html'>Login</a> to continue.");
		} catch (Exception e) {
		 System.out.print(e);
		 e.printStackTrace();
		}
		}else{
			out.print("Password Mismatch");
		}
		
	}

}
                  