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
    <title>Edit Details - Secure Cloud</title>
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
        .custom-card {
            background: white;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            margin-bottom: 30px;
        }
        .form-control {
            border-radius: 8px;
            padding: 12px;
            border: 1px solid #e0e0e0;
        }
        .form-select {
            border-radius: 8px;
            padding: 12px;
            border: 1px solid #e0e0e0;
        }
        .btn-primary {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            border: none;
            border-radius: 30px;
            padding: 12px 30px;
            font-weight: 600;
        }
        .btn-primary:hover {
            opacity: 0.9;
        }
        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: #ffffff;
            text-align: center;
            font-size: 0.9rem;
            padding: 20px 0;
            margin-top: auto;
        }
        .page-title {
            color: #333;
            font-weight: 600;
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">
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

    <!-- Main Content -->
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="custom-card">
                    <%
                    String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
                    int i=0,j=0,k=0;
                    try {
                        String cname=request.getParameter("cloudn");
                        String vm=request.getParameter("vmm");
                    %>
                    <h2 class="page-title text-center mb-4"><%=cname %> - Resource Details</h2>
                    <%
                        String tbl="";
                        if (cname.equalsIgnoreCase("Rackspace")) {
                            tbl = "charm_rvmcost";
                        } else if (cname.equalsIgnoreCase("Amazon S3")) {
                            tbl = "charm_Avmcost";
                        } else if (cname.equalsIgnoreCase("Windows Azure")) {
                            tbl = "charm_Wvmcost";
                        } else if (cname.equalsIgnoreCase("Aliyun OSS")) {
                            tbl = "charm_AOvmcost";
                        } 
                        
                        Statement st=connection.createStatement();
                        String query="select * from "+tbl+" where cname='"+cname+"' and memory='"+vm+"'";
                        ResultSet rs=st.executeQuery(query);
                        while(rs.next()) {
                            i=rs.getInt(1);
                            s2=rs.getString(2);
                            s3=rs.getString(3);
                            s4=rs.getString(4);
                        }
                        if(vm.equalsIgnoreCase(s2)&&cname.equalsIgnoreCase(s4)){
                            application.setAttribute("id",i);
                    %>
                    <form action="Alter.jsp" method="post" class="needs-validation" novalidate>
                        <div class="mb-4">
                            <label class="form-label fw-semibold">VM Memory</label>
                            <input name="t42" type="text" class="form-control" value="<%= vm%>" readonly>
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label fw-semibold">Cost</label>
                            <input name="t4" type="text" class="form-control" value="<%= s3 %>">
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label fw-semibold">Cloud Server</label>
                            <select name="cloud" class="form-select">
                                <option><%=cname %></option>
                            </select>
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label fw-semibold">Operation</label>
                            <select name="oper" class="form-select">
                                <option>Update</option>
                                <option>Delete</option>
                            </select>
                        </div>
                        
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary px-5">
                                <i class="bi bi-check-circle me-2"></i>Perform Operation
                            </button>
                        </div>
                    </form>
                    <%
                        } else {
                    %>
                        <div class="alert alert-danger" role="alert">
                            <i class="bi bi-exclamation-triangle me-2"></i>
                            The Memory you have chosen is not available
                        </div>
                    <%
                        }
                    } catch(Exception e) {
                        e.printStackTrace();
                        out.print(e.getMessage());
                    }
                    %>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="mt-auto">
        <div class="container">
            <p class="mb-0">© 2025 Secure Data Transfer using Counting Bloom Filter</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Form validation script -->
    <script>
        (() => {
            'use strict'
            const forms = document.querySelectorAll('.needs-validation')
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>
</body>
</html>
