package board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardService {
    
    public ArrayList<BoardDTO> getBoardList(HttpServletRequest request, HttpServletResponse response) {
        int pg = (request.getParameter("pg") == null) ? 1 : Integer.parseInt(request.getParameter("pg"));
        int pageSize = 5; // Number of items per page
        int startNum = (pg - 1) * pageSize + 1;
        int endNum = startNum + pageSize - 1;

        BoardDAO boardDAO = BoardDAO.getInstance();
        return boardDAO.loadContents(startNum, endNum);
    }

    public int getTotalPages() {
        BoardDAO boardDAO = BoardDAO.getInstance();
        int totalA = boardDAO.getTotalA(); // Total number of items
        int pageSize = 5; // Number of items per page
        return (totalA + pageSize - 1) / pageSize; // Total pages
    }
}
