<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*,javax.servlet.http.*,java.util.Enumeration"
	pageEncoding="ISO-8859-1"%>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

<title>HOME</title>
<script type="text/javascript">

let i=0;
setInterval(()=>{
	i++;
	document.getElementById("timer").innerHTML=i;
	if(i==10){
	alert("timeup");window.location.replace("result.jsp");
	}
	
	}, 1000);
              

</script>
</head>
<body
	style="background-image: url('bg.jpg'); background-color: #cccccc; background-position: center; background-repeat: no-repeat; background-size: cover;">

	<div class="container">
		<div class="row justify-content-lg-around my-5">
			<%
				String dbUrl = "jdbc:mysql://localhost:3306/demo";
			String username = "root";
			String password = "";

			Connection conn = null;
			response.setContentType("text/html");

			try {
				Class.forName("com.mysql.jdbc.Driver");

				conn = DriverManager.getConnection(dbUrl, username, password);

				if (conn != null) {

				}

				PreparedStatement ps;
				Integer qno = Integer.valueOf(request.getParameter("qno"));
				switch (qno) {
				case 1:
					break;
				case 2:
					;
				case 3:
					;
				case 4:
					;
				case 5:
					;
				case 6:
					session.setAttribute("" + (qno - 1) + "",
					request.getParameter("answer") != null ? request.getParameter("answer") : 0);
					break;
				}
				if (qno == 6) {
					conn.close();
			%>
			<jsp:forward page="result.jsp">
				<jsp:param name="qno" value="1"></jsp:param>
			</jsp:forward>
			<%
				}
			ps = conn.prepareStatement("select * from questions where id=?");
			ps.setInt(1, qno);
			System.out.print(ps.toString());
			ResultSet rs = ps.executeQuery();
			rs.next();
			%>
			<div class="card col-lg-12 ">
				<h1 id="timer">0</h1>
				<div class="card-body">
					<div class="card-title">
						<%
							out.print(rs.getString("question"));
						%>
					</div>

					<form class="p-3" action="home.jsp" method="post" name="register">

						<div class="form-group col-md-6">

							<input type="radio" id="o1" name="answer" value="1"> <label
								for="o1">
								<%
									out.print(rs.getString("option1"));
								%>
							</label>
						</div>
						<div class="form-group col-md-6">
							<input type="radio" id="o2" name="answer" value="2"> <label
								for="o2">
								<%
									out.print(rs.getString("option2"));
								%>
							</label>

						</div>
						<div class="form-group col-md-6">
							<input type="radio" id="o3" name="answer" value="3"> <label
								for="o3">
								<%
									out.print(rs.getString("option3"));
								%>
							</label>

						</div>
						<div class="form-group col-md-6">
							<input type="radio" id="o4" name="answer" value="4"> <label
								for="o4">
								<%
									out.print(rs.getString("option4"));
								%>
							</label>

						</div>
						<input name="qno" value=<%out.print(++qno);%> type="hidden">
						<div class="form-group col-md-6">

							<input id="next" value="Next" type="submit"
								class="btn btn-primary">

						</div>
					</form>
				</div>
			</div>

			<%
				conn.close();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
			%>
			<div
				class="col-lg-12 alert alert-dismissible fade show alert-primary"
				role="alert">
				<%
					out.print(e.getMessage());
				%>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<%
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			%>
			<div
				class="col-lg-12 alert alert-dismissible fade show alert-primary"
				role="alert">
				<%
					out.print(e.getMessage());
				%>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<%
				e.printStackTrace();
			} catch (NullPointerException e) {
				// TODO Auto-generated catch block
			%>
			<div
				class="col-lg-12 alert alert-dismissible fade show alert-primary"
				role="alert">
				<%
					out.print(e.getMessage());
				%>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<%
				e.printStackTrace();
			}
			%>

		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>

</html>