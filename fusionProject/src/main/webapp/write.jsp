<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 작성하기</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
    crossorigin="anonymous">
<link rel="stylesheet" href="css/basic.css?after">
<link rel="stylesheet" href="css/write.css?after">
</head>

<body>
    <!--header-->
    <div class="main">
        <%@ include file="nav.jsp"%>

        <div class="container">
            <div class="row">
                <form method="post" action="writeProcess.jsp">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="thead_th">글쓰기 양식</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                               <td>
                               		<input type="radio" name="category" value="news" checked="checked">새소식
                                	<input type="radio" name="category" value="notice">공지사항
                                	<input type="radio" name="category" value="qna">Q&A
                                </td>
                            </tr>
                            <tr>
                                <td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td>
                            </tr>
                            <tr>
                                <td><textarea class="form-control" placeholder="글 내용" name="contents" maxlength="2048" style="height: 350px;"></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
                </form>
            </div>
        </div>

        <%@ include file="footer.jsp" %>

        <script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
    </div>
</body>