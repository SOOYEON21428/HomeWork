package com.param;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.

@WebServlet("/ParamServlet")
public class ParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<style>");
		out.println("#textSpan {font-size: 15pt; font-weight: bold; color:red; }");
		out.println("</style>");
		out.println("나의 이름은 " + name + "이고 나이는" + age + "살 입니다. </br>");
		if (age >= 20)
			out.println("그래서 <font size='5' color='red'> <strong>성인</strong></font>입니다.");
		else out.println("그래서 <span id='textSpan'>청소년</span>입니다.");
		out.println("<br><br>");
		out.println("<input type='button' value='뒤로'"
				 +"onclick =javascript: location.href='http://localhost:8080/testServlet2/param/param.html'>");
		
		/*out.println("""
				<input type=';button' value= '뒤로' onclick='history.go(-1)'>
				""")*/
		
		out.println("</body>");
		out.println("</html>");
	}
}