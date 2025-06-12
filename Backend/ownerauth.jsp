<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Authentication - Secure Cloud</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	<style>
		body {
			font-family: 'Poppins', sans-serif;
			background: linear-gradient(to right, #f7f9fc, #e6ecf3);
			min-height: 100vh;
		}
		.navbar {
			background-color: white;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
		}
		.navbar-brand {
			font-weight: 700;
			color: #111;
		}
		.nav-link {
			color: #555 !important;
			font-weight: 500;
			margin-left: 20px;
		}
		.nav-link:hover, .nav-link.active {
			color: #4a00e0 !important;
		}
		.auth-card {
			background: white;
			border-radius: 16px;
			padding: 40px;
			box-shadow: 0 4px 20px rgba(0,0,0,0.06);
			margin-top: 2rem;
		}
		.auth-title {
			color: #333;
			font-weight: 600;
			margin-bottom: 1.5rem;
		}
		footer {
			background: linear-gradient(90deg, #4a00e0, #8e2de2);
			color: #ffffff;
			text-align: center;
			font-size: 0.9rem;
			padding: 20px 0;
			position: fixed;
			bottom: 0;
			width: 100%;
		}
		.processing-message {
			display: none;
			position: fixed;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			background: rgba(255, 255, 255, 0.9);
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0 0 20px rgba(0,0,0,0.1);
			z-index: 1000;
		}
	</style>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg sticky-top">
		<div class="container">
			<a class="navbar-brand d-flex align-items-center" href="#">
				<img src="purple png.png" alt="Logo" style="height: 40px;" class="me-2">
				<span class="fw-bold fs-5">
					<span style="color: #1a8fb3d4;">Secure</span>
					<span style="color: #83ce76;">Cloud</span>
				</span>
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
					<li class="nav-item"><a class="nav-link active" href="DataOwner.html">Data Owner</a></li>
					<li class="nav-item"><a class="nav-link" href="ProxyServer.html">Proxy Server</a></li>
					<li class="nav-item"><a class="nav-link" href="CloudServer.html">Cloud Server</a></li>
					<li class="nav-item"><a class="nav-link" href="EndUser.html">End User</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Processing Message -->
	<div class="processing-message" id="processingMessage">
		<div class="d-flex align-items-center">
			<div class="spinner-border text-primary me-3" role="status">
				<span class="visually-hidden">Loading...</span>
			</div>
			<span>Processing your authentication...</span>
		</div>
	</div>

	<%
		String name = request.getParameter("userid");
		String pass = request.getParameter("pass");
		String cname = request.getParameter("cname");
		application.setAttribute("ownercloud",cname);
		application.setAttribute("ocl",cname);
		try {
			application.setAttribute("onname", name);

			String sql = "SELECT * FROM charm_owner where name='" + name
					+ "' and pass='" + pass + "' and cloudname='" + cname
					+ "'";
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			String utype = "";
			if (rs.next()) {
				int i = rs.getInt(1);
				response.sendRedirect("DataOwnerMain.jsp");
			} else {
				response.sendRedirect("wronglogin.html");
			}
	%>
	<%
		} catch (Exception e) {
			out.print(e);
			e.printStackTrace();
		}
	%>

	<!-- Footer -->
	<footer>
		<div class="container">
			<p class="mb-0">© 2025 Secure Data Transfer using Counting Bloom Filter</p>
		</div>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		// Show processing message when form is submitted
		document.addEventListener('DOMContentLoaded', function() {
			const processingMessage = document.getElementById('processingMessage');
			if (document.referrer) {
				processingMessage.style.display = 'block';
			}
		});
	</script>
</body>
</html>

