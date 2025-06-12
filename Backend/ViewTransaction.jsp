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
    <title>View Transaction</title>
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
            overflow: hidden;
        }
        .custom-table {
            margin-bottom: 0;
        }
        .custom-table thead th {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            color: white;
            font-weight: 500;
            border: none;
        }
        .btn-gradient {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            border: none;
            color: white;
            padding: 10px 30px;
            border-radius: 30px;
            font-weight: 500;
            transition: 0.3s ease;
        }
        .btn-gradient:hover {
            opacity: 0.9;
            color: white;
        }
        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: #ffffff;
            text-align: center;
            font-size: 0.9rem;
            padding: 20px 0;
            margin-top: 16rem;
        }
        .form-select {
            border-radius: 10px;
            padding: 10px;
            border: 1px solid #ddd;
        }
        .page-title {
            color: #4a00e0;
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
                <li class="nav-item"><a class="nav-link active" href="ProxyServer.html">Proxy Server</a></li>
                <li class="nav-item"><a class="nav-link" href="CloudServer.html">Cloud Server</a></li>
                <li class="nav-item"><a class="nav-link" href="EndUser.html">End User</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container py-5">
    <h2 class="text-center page-title mb-5">View Transactions</h2>
    
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="custom-card">
                <form id="form1" name="form1" method="post" action="ViewTransaction.jsp">
                    <div class="mb-4">
                        <label for="s1" class="form-label fw-medium">Select Cloud Server</label>
                        <select id="s1" name="tran" class="form-select">
                            <option value="">--Select Cloud Server--</option>
                            <option value="Upload">Upload</option>
                            <option value="Download">Download</option>
                            <option value="Migrated">Migrated</option>
                        </select>
                    </div>
                    <div class="text-center">
                        <button type="submit" name="Submit" class="btn btn-gradient">
                            <i class="bi bi-search me-2"></i>Get Transactions
                        </button>
                    </div>
                </form>
            </div>

            <% if(request.getParameter("tran") != null) { %>
            <div class="table-container mt-4">
                <div class="table-responsive">
                    <table class="table custom-table align-middle">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>File Name</th>
                                <th>Cloud Name</th>
                                <th>Secret Key</th>
                                <th>Task</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            String transaction=request.getParameter("tran");
                            String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
                            int i=0,j=0,k=0;

                            try {
                                String query="select * from charm_transaction where task='"+transaction+"'"; 
                                Statement st=connection.createStatement();
                                ResultSet rs=st.executeQuery(query);
                                while (rs.next()) {    
                                    i=rs.getInt(1);
                                    s2=rs.getString(2);
                                    s3=rs.getString(3);
                                    s4=rs.getString(4);
                                    s5=rs.getString(5);
                                    s6=rs.getString(6);
                                    s7=rs.getString(7);
                            %>
                            <tr>
                                <td><%=s2%></td>
                                <td><%=s3%></td>
                                <td><%=s4%></td>
                                <td><%=s5%></td>
                                <td><%=s6%></td>
                                <td><%=s7%></td>
                            </tr>
                            <%
                                }
                                connection.close();
                            } catch(Exception e) {
                                out.println(e.getMessage());
                                e.printStackTrace();
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            <% } %>

            <div class="text-center mt-4">
                <a href="ProxyServerMain.jsp" class="btn btn-gradient">
                    <i class="bi bi-arrow-left me-2"></i>Back to Dashboard
                </a>
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
