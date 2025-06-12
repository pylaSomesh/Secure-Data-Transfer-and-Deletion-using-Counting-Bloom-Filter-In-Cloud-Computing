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
    <title>VM Details - Secure Cloud System</title>
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

        .table-container {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            padding: 2rem;
            margin: 2rem 0;
            animation: fadeIn 0.5s ease-in-out;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead th {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            color: white;
            font-weight: 500;
            border: none;
            padding: 1rem;
        }

        .table tbody td {
            padding: 1rem;
            vertical-align: middle;
            border-color: #f0f0f0;
        }

        .back-btn {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            border: none;
            border-radius: 30px;
            padding: 10px 30px;
            color: white;
            font-weight: 500;
            transition: 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .back-btn:hover {
            opacity: 0.9;
            color: white;
            transform: translateY(-2px);
        }

        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: #ffffff;
            text-align: center;
            font-size: 0.9rem;
            padding: 20px 0;
            box-shadow: 0 -2px 8px rgba(0,0,0,0.04);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .custom-card {
                padding: 20px;
            }
            .table-container {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container d-flex align-items-center justify-content-between">
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
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="DataOwner.html">Data Owner</a></li>
                <li class="nav-item"><a class="nav-link" href="ProxyServer.html">Proxy Server</a></li>
                <li class="nav-item"><a class="nav-link" href="CloudServer.html">Cloud Server</a></li>
                <li class="nav-item"><a class="nav-link" href="EndUser.html">End User</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container py-5">
    <div class="custom-card">
        <%
        String on=(String)application.getAttribute("onname");
        %>
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h2 class="mb-0"><i class="bi bi-cloud-fill me-2 text-primary"></i><%=on %> VM Details</h2>
        </div>

        <div class="table-container">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th class="text-center">Cloud Name</th>
                            <th class="text-center">Memory</th>
                            <th class="text-center">Cost</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        String clo=(String)application.getAttribute("ownercloud");
                        String u=(String)application.getAttribute("onname");
                        String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
                        int i=0,j=0,k=0;

                        try 
                        {
                            String tbl = "";
                            if (clo.equalsIgnoreCase("Rackspace")) {
                                tbl = "charm_RackspaceVm";
                            } else if (clo.equalsIgnoreCase("Amazon S3")) {
                                tbl = "charm_amazons3vm";
                            } else if (clo.equalsIgnoreCase("Windows Azure")) {
                                tbl = "charm_windowsazurevm";
                            } else if (clo.equalsIgnoreCase("Aliyun OSS")) {
                                tbl = "charm_aliyunossvm";
                            }
                            
                            String query="select * from "+tbl+" where cloudname='"+clo+"' and ownername='"+u+"' "; 
                            Statement st=connection.createStatement();
                            ResultSet rs=st.executeQuery(query);

                            while ( rs.next() )
                            {
                                i=rs.getInt(1);
                                s2=rs.getString(2);
                                s3=rs.getString(3);
                                s4=rs.getString(4);
                                s5=rs.getString(5);
                                s6=rs.getString(6);
                        %>
                        <tr>
                            <td class="text-center"><%=s3%></td>
                            <td class="text-center"><%=s5%></td>
                            <td class="text-center"><%=s6%></td>
                        </tr>
                        <%
                            }
                            connection.close();
                        }
                        catch(Exception e)
                        {
                            out.println(e.getMessage());
                            e.printStackTrace();
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="DataOwnerMain.jsp" class="back-btn">
                <i class="bi bi-arrow-left me-2"></i>Back to Dashboard
            </a>
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
