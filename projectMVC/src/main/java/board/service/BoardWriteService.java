package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardWriteService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        // 데이터
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");

        // 세션 설정
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        String name = (String) session.getAttribute("name");
        String email = (String) session.getAttribute("email");

        Map<String, String> map = new HashMap<>();
        map.put("id", id);
        map.put("name", name);
        map.put("email", email);
        map.put("subject", subject);
        map.put("content", content);

        // DB
        BoardDAO boardDAO = BoardDAO.getInstance();
        boardDAO.write(map);

        return "/board/boardWrite.jsp";
    }
}
