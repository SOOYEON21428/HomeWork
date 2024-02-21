package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardWriteFormService {

    public String getWriteForm(HttpServletRequest request, HttpServletResponse response) {
        // Perform any logic needed for the write form, if necessary
        // For simplicity, no logic is included here

        // Return the JSP page to display the write form
        return "/WEB-INF/views/boardWriteForm.jsp";
    }
}
