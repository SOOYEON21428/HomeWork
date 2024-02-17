<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <table>
      <%-- for문 같이 구역이 나눠져 있으면 하나하나 <% %>을 사용해줘야 함 --%>
      <%for(int i=2; i<=9; i++) { %>
         <tr>
            <%for(int dan=1; dan<=9; dan++) { %>
               <td>
                  <%=i%> * <%=dan%> = <%= i * dan %>&emsp;
               </td> 
               <% } //for dan%>
            <% } //for i%>
         </tr>
   </table>
</body>
</html>