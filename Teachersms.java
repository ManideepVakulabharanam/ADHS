

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Teachersms
 */
@WebServlet("/Teachersms")
public class Teachersms extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Teachersms() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			// Construct data
			Connection con = DBConnection.DBconnect();
			String sql = "select mobilenumber from teacher_details;";
			//String[] str = null;
			ArrayList al = new ArrayList();
			Statement st = con.createStatement();
			ResultSet rst = st.executeQuery(sql);
			while(rst.next()){
				al.add(rst.getString(1));
			}
			int si = al.size();
			for(int i = 0;i<si;i++){
				System.out.println(al.get(i));
			
			String msg = request.getParameter("message");
			String sendnm = "TXTLCL";
			String apiKey = "apikey=" + "Ow2j8dbKrVs-EpuS4VjguPEDpgj8l43MqGzZzEuu0c";
			String message = "&message=" + msg;
			String sender = "&sender=" + sendnm;
			String numbers = "&numbers=" +"91"+al.get(i);
			System.out.println(numbers);
			// Send data
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			int x = 0;
			while ((line = rd.readLine()) != null) {
				System.out.print(line);
				x++;
			}
			rd.close();
			System.out.print(stringBuffer.toString());
			if(x>0){ 
				 con.close();
			request.setAttribute("result", "successfully sent");
				RequestDispatcher rsd = request.getRequestDispatcher("Teachersms.jsp");
				rsd.forward(request, response);
			}
			}
		} catch (Exception e) {
			e.printStackTrace();
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
