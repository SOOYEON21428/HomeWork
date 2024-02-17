<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <style>
        td {
            width: 300px;
        }

        textarea {
            width: 280px;
        }

        .cont {
            height: 400px;
        }

        .cont > textarea {
            height: 380px;
        }

        table {
            border-collapse: collapse;
            width: 50%;
            margin: auto;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        input[type="submit"], input[type="reset"], a {
            display: inline-block;
            width: auto;
            margin: 10px;
            padding: 10px;
            background-color: #3498db;
            color: #fff;
            border: none;
            cursor: pointer;
            text-decoration: none;
            border-radius: 3px;
            text-align: center;
        }

        input[type="submit"]:hover, input[type="reset"]:hover, a:hover {
            background-color: #2980b9;
        }

        .button-container {
            text-align: center;
        }
    </style>
    <script>
        function checkGuestbookWrite() {
            var writer = document.getElementById("writer").value.trim();
            var email = document.getElementById("email").value.trim();
            var homepage = document.getElementById("homepage").value.trim();
            var title = document.getElementById("title").value.trim();
            var content = document.getElementById("content").value.trim();

            if (writer === "") {
                alert("작성자를 입력하세요.");
                return false;
            }

            if (email === "") {
                alert("이메일을 입력하세요.");
                return false;
            }

            if (title === "") {
                alert("제목을 입력하세요.");
                return false;
            }

            if (content === "") {
                alert("내용을 입력하세요.");
                return false;
            }
        }
    </script>
</head>
<body>
    <form action="guestbookWrite.jsp" method="post" name="inputForm" onsubmit="return checkGuestbookWrite()">
        <table class="table" border="1">
            <tr>
                <th>작성자</th>
                <td><input type="text" name="writer" id="writer"></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <th>홈페이지</th>
                <td><input type="text" name="homepage" id="homepage"></td>
            </tr>
            <tr>
                <th>제목</th>
                <td class="sub"><input type="text" name="title" id="title"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td class="cont"><textarea name="content" id="content" style="resize: none;"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" value="글 작성">
                    <input type="reset" value="다시 작성">
                    <a href="guestbookList.jsp">글 목록</a>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
