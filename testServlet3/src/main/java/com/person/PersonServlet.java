package com.person;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/PersonServlet")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // 파라미터 받기
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String color = request.getParameter("color");
        String[] hobbies = request.getParameterValues("hobby");
        String[] subjects = request.getParameterValues("subject");

        // 유효성 검사
        if (name == null || name.trim().isEmpty()) {
            out.println("이름이 입력되지 않았습니다.");
            return;
        }

        // 성별 출력
        out.println("이름: " + name);
        if ("0".equals(gender)) {
            out.println(" / 성별: 남자");
        } else if ("1".equals(gender)) {
            out.println(" / 성별: 여자");
        }

        // 색깔에 따른 글자색 변환
        out.println(" / 색깔: <span style='color:" + color + "'>" + color + "</span>");

        // 취미 출력
        out.print(" / 취미: ");
        if (hobbies != null && hobbies.length > 0) {
            for (String hobby : hobbies) {
                out.print(hobby + " ");
            }
        } else {
            out.print("취미가 없습니다.");
        }

        // 과목 출력
        out.print(" / 과목: ");
        if (subjects != null && subjects.length > 0) {
            for (String subject : subjects) {
                out.print(subject + " ");
            }
        }

        out.close();
    }

	}


