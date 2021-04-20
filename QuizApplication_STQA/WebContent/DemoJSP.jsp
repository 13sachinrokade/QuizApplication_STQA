<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*,javax.servlet.http.*,java.util.Enumeration"
	pageEncoding="ISO-8859-1"%>

<!doctype html>
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

<title>RESULT</title>
</head>
<body
	style="background-image: url('bg.jpg'); background-color: #cccccc; background-position: center; background-repeat: no-repeat; background-size: cover;">
	<div class="container">
		<div class="row justify-content-lg-around my-5">
			<%
				session.setAttribute("1", 0);
			session.setAttribute("2", 0);
			session.setAttribute("3", 0);
			session.setAttribute("4", 0);
			session.setAttribute("5", 0);

			String dbUrl = "jdbc:mysql://localhost:3306/demo";
			String username = "root";
			String password = "";

			Connection conn = null;
			response.setContentType("text/html");

			try {
				Class.forName("com.mysql.jdbc.Driver");

				conn = DriverManager.getConnection(dbUrl, username, password);

				if (conn != null) {
					System.out.println("Connection Successful");
				}
				Enumeration<String> names = request.getParameterNames();
				String action = request.getParameter("action");
				int i;
				PreparedStatement ps;
				if (request.getParameter("uname").isEmpty() || request.getParameter("pass").isEmpty()) {
			%>
			<div
				class="col-lg-12 alert alert-dismissible fade show alert-primary"
				role="alert">
				<%
					out.print("Login Failed");
				%>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<%
				}
			switch (action) {
			case "Register":
				ps = conn.prepareStatement("insert into users values(?,?)");
				i = 1;
				while (names.hasMoreElements()) {
					if (i == 3) {
				break;
					}
					ps.setString(i, request.getParameter(names.nextElement()));
					i++;
				}

				ps.executeUpdate();
			%>
			<div
				class="col-lg-12 alert alert-dismissible fade show alert-primary"
				role="alert">
				<%
					out.print("Registration successful");
				%>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<%
				break;

						case "Login":
							ps = conn.prepareStatement("select * from users where uname=? and pass=?");
							i = 1;
							while (names.hasMoreElements()) {
								if (i == 3) {
									break;
								}
								ps.setString(i, request.getParameter(names.nextElement()));
								i++;
							}

							ResultSet rs = ps.executeQuery();
							boolean flag = false;
							while (rs.next()) {

								flag = true;
							}
							if (flag) {
								session.setAttribute("username", request.getParameter("uname"));
			%>
			<jsp:forward page="home.jsp">
				<jsp:param name="qno" value="1"></jsp:param>
			</jsp:forward>
			<div
				class="col-lg-12 alert alert-dismissible fade show alert-primary"
				role="alert">
				<%
					out.print("Login successful");
				%>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<%
				} else {
			%>
			<div
				class="col-lg-12 alert alert-dismissible fade show alert-primary"
				role="alert">
				<%
					out.print("User does not exist");
				%>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<%
				}
			break;

			}
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

</body>
</html>