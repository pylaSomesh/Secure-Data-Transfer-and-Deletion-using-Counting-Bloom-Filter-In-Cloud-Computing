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
    <title>View Users - Secure Cloud</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
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

        .page-header {
            background: linear-gradient(to right, #f7f9fc, #e6ecf3);
            padding: 2rem 0;
            margin-bottom: 2rem;
        }

        .user-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            transition: transform 0.3s ease;
        }

        .user-card:hover {
            transform: translateY(-5px);
        }

        .user-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #fff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .table {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        }

        .table thead {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            color: white;
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
            display: inline-block;
            margin-top: 2rem;
        }

        .back-btn:hover {
            opacity: 0.9;
            color: white;
        }

        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: #ffffff;
            text-align: center;
            font-size: 0.9rem;
            padding: 20px 0;
            margin-top: 13rem;
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
                <li class="nav-item"><a class="nav-link active" href="CloudServer.html">Cloud Server</a></li>
                <li class="nav-item"><a class="nav-link" href="EndUser.html">End User</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Header -->
<div class="page-header">
    <div class="container">
        <h1 class="fw-bold mb-0">View Data Users</h1>
        <p class="text-muted">Manage and monitor registered users in the system</p>
    </div>
</div>

<!-- Main Content -->
<div class="container">
    <div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead>
                <tr>
                    <!-- <th class="text-center">User Image</th> -->
                    <th>Owner Name</th>
                    <th>E-Mail</th>
                    <th>Mobile</th>
                    <th>Address</th>
                    <th>DOB</th>
                    <th>Location</th>
                    <th>Cloud Name</th>
                </tr>
            </thead>
            <tbody>
                <%
                String a = (String) application.getAttribute("cloudName");
                String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9,s10,s11,s12,s13="";
                int i=0,j=0;
                String ii="";
                try 
                {
                    String query="select * from charm_user where cloudname='"+a+"' "; 
                    Statement st=connection.createStatement();
                    ResultSet rs=st.executeQuery(query);
                    while ( rs.next() )
                    {
                        ii=rs.getString("id");
                        s2=rs.getString("name");
                        s3=rs.getString("email");
                        s4=rs.getString("mobile");
                        s5=rs.getString("addr");
                        s6=rs.getString("dob");
                        s7=rs.getString("location");
                        s8=rs.getString("cloudname");
                        s9=rs.getString("imagess");
                        
                        i=Integer.parseInt(ii);
                %>
                <tr class="align-middle">
                    <!-- <td class="text-center">
                        <img class="user-image" src="images.jsp?imgid=<%=ii%>" alt="User Image">
                    </td> -->
                    <td><%=s2%></td>
                    <td><%=s3%></td>
                    <td><%=s4%></td>
                    <td><%=s5%></td>
                    <td><%=s6%></td>
                    <td><%=s7%></td>
                    <td><%=s8%></td>
                </tr>
                <%
                    }
                    connection.close();
                }
                catch(Exception e)
                {
                    out.println(e.getMessage());
                }
                %>
            </tbody>
        </table>
    </div>

    <div class="text-center">
        <a href="CloudServerMain.jsp" class="back-btn">
            <i class="bi bi-arrow-left me-2"></i>Back to Dashboard
        </a>
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
