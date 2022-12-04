<%@page import="java.io.PrintWriter"%>
<%@page import="source.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="source.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/PostList.css?after">
<link rel="stylesheet" href="css/basic.css?after">
</head>

<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>
		<%
		PrintWriter script = response.getWriter();
		if(adminID == null){
			script.println("<script>");
			script.println("alert('관리자만 접근 가능합니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	%>
		<!--main-->
		<div class="users">
			<fieldset id="main_field">
                    <div class="account">
                        <legend>고객 목록</legend>
                        <div class="row">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>아이디</th>
                                        <th>고객명</th>
                                        <th>생년월일</th>
                                        <th>전화번호</th>
                                        <th>고객등급</th>
                                    </tr>
                                </thead>
                                <%
                                	AdminDAO adminDAO = new AdminDAO();
                                	ArrayList<Member> list = null;
                                	if(request.getParameter("name")!= null){
                                		String name = (String)request.getParameter("name");
                                	 	list = adminDAO.getUserList(name);
                                	 	
                                	} else {
                                		list = adminDAO.getUserList();
                                	}
                                
                                	for (int i = 0; i < list.size(); i++) {
        								Member member = list.get(i);
                                %>
                                <tbody style="border-top: none">
                                    <tr onclick="location.href = 'amendUserInfo.jsp?id=<%=member.getId()%>'">
                                        <td><%=i+1%></td>
                                        <td><%=member.getId() %></td>
                                        <td><%=member.getName()%></td>
                                        <td><%=member.getBirth() %></td>
                                        <td><%=member.getTel()%></td>
                                        <td><%=member.getRank() %></td>
                                        
                                    </tr>
                                    
                                </tbody>
                                <%} %>
                            </table>
                        </div>
                        <div class="saveBtn">
                        	<form action="users.jsp" method="get">
                        	<div class="user_search">
                        		<input type="text" placeholder="이름" name="name">
                            	<input class="searchBtn" type="submit" value="검색" >
                        	</div>
                            
                            </form>
                        </div>
                    </div>
			</fieldset>
		</div>

		<%@ include file="footer.jsp" %>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>
</html>