package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdService  implements CommandProcess{

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		
		String id = request.getParameter("id");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		boolean exist = memberDAO.isExistId(id);
		
		request.setAttribute("exist", exist);
		return "/member/checkId.jsp";
	} // requestPro
	
	
	
} // end class
