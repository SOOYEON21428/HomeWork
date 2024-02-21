package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardWriteService {

    public void writeBoard(HttpServletRequest request, HttpServletResponse response) {
        // Get data from request
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");

        // Get user information from session
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("memId");
        String name = (String) session.getAttribute("memName");
        String email1 = (String) session.getAttribute("memEmail");

        // Create BoardDTO object
        BoardDTO boardDTO = new BoardDTO();
        boardDTO.setId(id);
        boardDTO.setName(name);
        boardDTO.setEmail(email1);
        boardDTO.setSubject(subject);
        boardDTO.setContent(content);

        // Save the board in the database
        BoardDAO boardDAO = BoardDAO.getInstance();
        boardDAO.boardWrite(boardDTO);
    }
}
