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
    <title>Request Secret Key</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            margin: 0;
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

        .custom-card {
            background: white;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            margin-bottom: 30px;
        }

        .form-select {
            border-radius: 8px;
            padding: 12px;
            border: 1px solid #e0e0e0;
            background-color: #f8f9fa;
            transition: all 0.3s ease;
        }

        .form-select:focus {
            border-color: #4a00e0;
            box-shadow: 0 0 0 0.25rem rgba(74, 0, 224, 0.25);
        }

        .btn-primary {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            border: none;
            border-radius: 30px;
            padding: 10px 30px;
            font-weight: 600;
            transition: 0.3s ease;
        }

        .btn-primary:hover {
            opacity: 0.9;
            transform: translateY(-2px);
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
            margin-top: 10rem;
        }

        .sidebar-menu {
            background: white;
            border-radius: 16px;
            padding: 20px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        }

        .sidebar-menu .nav-link {
            padding: 12px 20px;
            border-radius: 8px;
            margin: 5px 0;
            transition: all 0.3s ease;
        }

        .sidebar-menu .nav-link:hover {
            background: #f8f9fa;
        }

        .page-title {
            color: #2d3748;
            font-weight: 600;
            margin-bottom: 30px;
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
                <li class="nav-item"><a class="nav-link" href="DataOwner.html">Data Owner</a></li>
                <li class="nav-item"><a class="nav-link" href="ProxyServer.html">Proxy Server</a></li>
                <li class="nav-item"><a class="nav-link" href="CloudServer.html">Cloud Server</a></li>
                <li class="nav-item"><a class="nav-link active" href="EndUser.html">End User</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container py-5">
    <div class="row">
        <!-- Main Content -->
        <div class="col-lg-8">
            <div class="custom-card">
                <h2 class="page-title">Request Secret Key</h2>
                
                <form id="form1" name="form1" method="post" action="request.jsp">
                    <%
                    String cl=(String) application.getAttribute("euc");
                    %>
                    <h5 class="text-muted mb-4">Current User: <%=cl %></h5>
                    
                    <div class="mb-4">
                        <%
                        try {
                            Statement st5=connection.createStatement();
                            ResultSet rs5=st5.executeQuery("select fname from charm_cloudserver where cname='"+cl+"'");
                        %>
                        <label for="s1" class="form-label fw-semibold">Select File Name</label>
                        <select id="s1" name="fr" class="form-select">
                            <%while(rs5.next()){ %>
                            <option><%=rs5.getString("fname") %></option>
                            <%} %>
                        </select>
                    </div>

                    <div class="text-end">
                        <button type="submit" name="Submit" class="btn btn-primary">
                            <i class="bi bi-key-fill me-2"></i>Request Key
                        </button>
                    </div>
                    <%}catch(Exception e){
                        e.printStackTrace();
                        out.print(e.getMessage());
                    }%>
                </form>
            </div>
        </div>

        <!-- Sidebar -->
        <div class="col-lg-4">
            <div class="sidebar-menu">
                <h5 class="mb-4 fw-bold">Menu</h5>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="FileSearch.jsp">
                            <i class="bi bi-search me-2"></i>Search Files
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="Reqsk.jsp">
                            <i class="bi bi-key me-2"></i>Request Secret Key
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewResponse.jsp">
                            <i class="bi bi-envelope me-2"></i>View File Response
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Download.jsp">
                            <i class="bi bi-download me-2"></i>Download
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">
                            <i class="bi bi-box-arrow-right me-2"></i>Log Out
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="container">
        <p class="mb-0">© 2025 Secure Data Transfer using Counting Bloom Filter</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
