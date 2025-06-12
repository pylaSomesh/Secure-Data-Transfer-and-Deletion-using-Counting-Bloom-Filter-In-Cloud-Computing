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
    <title>Data Integrity Verification</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
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
        .result-card {
            background: white;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            margin-bottom: 30px;
        }
        .success-icon {
            font-size: 3rem;
            color: #28a745;
        }
        .warning-icon {
            font-size: 3rem;
            color: #dc3545;
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
        .back-btn {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            border: none;
            border-radius: 30px;
            padding: 10px 30px;
            color: white;
            font-weight: bold;
            transition: 0.3s ease;
            text-decoration: none;
        }
        .back-btn:hover {
            opacity: 0.9;
            color: white;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="website images/purple png.png" alt="Logo" style="height: 40px;" class="me-2">
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

<!-- Main Content -->
<div class="container py-5" style="margin-bottom: 100px;">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <%
	 	int i;
	 	String s2, s3, s4, s5, s6, s7, s12="", s13="", s14="", s15="", s16="",s17="";

	 	try {
	 		String file = request.getParameter("tt");
	
	 		String cn = request.getParameter("cl");

	 		Statement st = connection.createStatement();

	 		String user = "Data Owner";
	 		String task = "Upload";

	 		String strQuery2 = "select * from charm_proxyserver where fname='"
	 				+ file + "' and cname='" + cn + "'";
	 		connection.createStatement();

	 		ResultSet rs = st.executeQuery(strQuery2);
	 		if (rs.next()) {
	 			i = rs.getInt(1);
	 			s2 = rs.getString(2);
	 			s3 = rs.getString(3);
	 			s4 = rs.getString(4);
	 			s5 = rs.getString(5);
	 			s6 = rs.getString(6);
	 			s7 = rs.getString(7);
	 			String strQuery3 = "Select * FROM charm_cloudserver where fname='"
									+ file + "' and cname='" + cn + "' ";

							Statement st2 = connection.createStatement();

							ResultSet rss = st2.executeQuery(strQuery3);
							if (rss.next()) {
								i = rss.getInt(1);
								s12 = rss.getString(2);
								s13 = rss.getString(4);
								s14 = rss.getString(5);
								s15 = rss.getString(6);
								s16 = rss.getString(7);
								s17 = rss.getString(8);
							}
							
							if(s2.equalsIgnoreCase(s12) && s3.equalsIgnoreCase(s13) && s4.equalsIgnoreCase(s14) && s6.equalsIgnoreCase(s16) && s7.equalsIgnoreCase(s17))
							{
							%>
                            <div class="result-card text-center">
                                <i class="bi bi-shield-check success-icon mb-4"></i>
                                <h2 class="mb-4">File Verification Result</h2>
                                <div class="alert alert-success" role="alert">
                                    <h4 class="alert-heading"><%=file %> in <%=cn %> is Secured!</h4>
                                    <p>The file integrity check has passed successfully.</p>
                                </div>
                                <a href="DataOwnerMain.jsp" class="back-btn mt-3">Back to Dashboard</a>
                            </div>
                            <%
							}	
							else {
							%>
                            <div class="result-card text-center">
                                <i class="bi bi-shield-x warning-icon mb-4"></i>
                                <h2 class="mb-4">File Verification Result</h2>
                                <div class="alert alert-danger" role="alert">
                                    <h4 class="alert-heading"><%=file %> in <%=cn %> has been Compromised!</h4>
                                    <p>Security breach detected. The file may have been attacked or modified.</p>
                                </div>
                                <a href="DataOwnerMain.jsp" class="back-btn mt-3">Back to Dashboard</a>
                            </div>
                            <%
							}
						}
	 					else{
						%>
                        <div class="result-card text-center">
                            <i class="bi bi-exclamation-triangle warning-icon mb-4"></i>
                            <h2 class="mb-4">Invalid Details</h2>
                            <div class="alert alert-warning" role="alert">
                                <h4 class="alert-heading"><%=file %> in <%=cn %> - Wrong Details!</h4>
                                <p>The provided file or cloud details could not be verified.</p>
                            </div>
                            <div class="mt-4">
                                <a href="ViewCloudFiles.jsp" class="back-btn me-2">View Files</a>
                                <a href="DataOwnerMain.jsp" class="back-btn">Back to Dashboard</a>
                            </div>
                        </div>
                        <%
	 					}	
		  	connection.close();
		  	}catch (Exception e) {
		  		out.println(e.getMessage());
		  		e.printStackTrace();
		  	}
            %>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="container">
        <p class="mb-0">© 2025 Secure Data Transfer using Counting Bloom Filter</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
