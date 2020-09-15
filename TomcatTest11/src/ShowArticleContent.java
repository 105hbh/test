
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowArticleContent
 */
@WebServlet("/ShowArticleContent")
public class ShowArticleContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowArticleContent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out= response.getWriter(); 
		out.println("Working in doGet");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String content = request.getParameter("content").strip();
		
		if (content == "") {
			ServletContext sc = this.getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}
		
		String [] words = content.split(" "); // split string into words. Does not work well if there is more than one space between words.
		PrintWriter out= response.getWriter(); 
		out.println("<html>");
		out.println("<p><a href=\"index.jsp\">Back</a></p>");
		out.println("<h2>The current article</h2>");
		out.println("<p>Total words:" + words.length + "</p>");
		out.println("<p><font size=+2>" + content + "</font></p>");

		
		// Save article and word frequency into SQLite database

		Connection  con = null;
		try {
			try {
				Class.forName("org.sqlite.JDBC");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\drlan\\Downloads\\Software\\freq.db");
			Statement statement = con.createStatement();
			statement.executeUpdate("create table if not exists wordcount (id integer PRIMARY KEY autoincrement, content string, count integer, level integer DEFAULT 0)");
			PreparedStatement statement1 = con.prepareStatement("insert into wordcount(content, count) values(?, ?)"); 
			statement1.setString(1, content);
			statement1.setInt(2, words.length);
			statement1.executeUpdate();
			
			out.println("<h2>Historical articles</h2>");
			ResultSet rs = statement.executeQuery("select * from wordcount");
			while (rs.next()) {
				out.println("<p>Word count: " + rs.getInt("count") + " | " + rs.getString("content") + " | " + rs.getInt("level") + "</p>");
			}
			
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
		}
		out.println("</html>");
	}

}