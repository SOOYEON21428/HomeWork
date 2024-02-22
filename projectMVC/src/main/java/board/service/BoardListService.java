package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));

		int endNum = pg*5;
		int startNum = endNum-4;

		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> list=  boardDAO.boardList(startNum,endNum);

		//페이징처리
		int totalA = boardDAO.getTotalA(); //총글수
		int totalP = (totalA+ 4)/5;//총 페이지 수

		//응답
		request.setAttribute("pg", pg);
		request.setAttribute("list", list);
		request.setAttribute("totalP", totalP);
		
		return "/board/boardList.jsp";
	}
}
		