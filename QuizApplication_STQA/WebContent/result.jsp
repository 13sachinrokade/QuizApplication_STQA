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

<title>RESULT</title>

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

				ResultSet rs;
			%>
			<div class="card col-lg-12 ">
				<div class="card-body">
					<div class="card-title">
						<%
							out.print("User : " + session.getAttribute("username"));
						%>
					</div>
					<div class="card-title">
						<%
							ps = conn.prepareStatement("select answer from questions where id=1");
						rs = ps.executeQuery();
						rs.next();
						if (Integer.valueOf(rs.getString("answer")) == Integer.valueOf(session.getAttribute("1").toString()))
							out.print("Q1 : Correct");
						else
							out.print("Q1 : Wrong");
						%>
					</div>
					<div class="card-title">
						<%
							ps = conn.prepareStatement("select answer from questions where id=2");
						rs = ps.executeQuery();
						rs.next();

						if (Integer.valueOf(rs.getString("answer")) == Integer.valueOf(session.getAttribute("2").toString()))
							out.print("Q2 : Correct");
						else
							out.print("Q2 : Wrong");
						%>
					</div>
					<div class="card-title">
						<%
							ps = conn.prepareStatement("select answer from questions where id=3");
						rs = ps.executeQuery();
						rs.next();

						if (Integer.valueOf(rs.getString("answer")) == Integer.valueOf(session.getAttribute("3").toString()))
							out.print("Q3 : Correct");
						else
							out.print("Q3 : Wrong");
						%>
					</div>
					<div class="card-title">
						<%
							ps = conn.prepareStatement("select answer from questions where id=4");
						rs = ps.executeQuery();
						rs.next();

						if (Integer.valueOf(rs.getString("answer")) == Integer.valueOf(session.getAttribute("4").toString()))
							out.print("Q4 : Correct");
						else
							out.print("Q4 : Wrong");
						%>
					</div>
					<div class="card-title">
						<%
							ps = conn.prepareStatement("select answer from questions where id=5");
						rs = ps.executeQuery();
						rs.next();

						if (Integer.valueOf(rs.getString("answer")) == Integer.valueOf(session.getAttribute("5").toString()))
							out.print("Q5 : Correct");
						else
							out.print("Q5 : Wrong");
						%>
					</div>
					<a id="exit" href="index.html">Exit</a>


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