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
    <title>Cloud Cost Details - Secure Data Transfer</title>
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
        .table {
            border-radius: 8px;
            overflow: hidden;
        }
        .table th {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            color: white;
            font-weight: 500;
            border: none;
        }
        .table td {
            vertical-align: middle;
            color: #444;
        }
        .btn-primary {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            border: none;
            padding: 10px 30px;
            font-weight: 500;
        }
        .btn-primary:hover {
            opacity: 0.9;
        }
        .form-select {
            border-radius: 8px;
            padding: 10px;
            border-color: #ddd;
        }
        .form-select:focus {
            border-color: #9333ea;
            box-shadow: 0 0 0 0.25rem rgba(147, 51, 234, 0.25);
        }
        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
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

<div class="container py-5">
    <!-- Main Content -->
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="custom-card fade-in">
                <h2 class="text-center mb-4">Cloud Cost Details</h2>
                
                <%
                String clo=(String)application.getAttribute("ocl");
                %>

                <form id="form1" name="form1" method="post" action="GetCloudCost.jsp" class="mb-5">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <div class="mb-4">
                                <label for="s1" class="form-label fw-bold">Select Cloud Server</label>
                                <select id="s1" name="cname" class="form-select">
                                    <option>--Select Cloud Server--</option>
                                    <option><%=clo %></option>
                                </select>
                            </div>
                            <div class="text-center">
                                <button type="submit" name="Submit" class="btn btn-primary">
                                    <i class="bi bi-cloud-arrow-up-fill me-2"></i>Get VM Details
                                </button>
                            </div>
                        </div>
                    </div>
                </form>

                <div class="table-responsive fade-in">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">Memory Size</th>
                                <th class="text-center">Cloud Cost (₹)</th>
                                <th class="text-center">Cloud Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
                            int i=0,j=0,k=0;

                            try 
                            {
                                String cname=request.getParameter("cname");
                                String tbl = "";
                                if (cname.equalsIgnoreCase("Rackspace")) {
                                    tbl = "charm_rvmcost";
                                } else if (cname.equalsIgnoreCase("Amazon S3")) {
                                    tbl = "charm_Avmcost";
                                } else if (cname.equalsIgnoreCase("Windows Azure")) {
                                    tbl = "charm_Wvmcost";
                                } else if (cname.equalsIgnoreCase("Aliyun OSS")) {
                                    tbl = "charm_AOvmcost";
                                } 

                                String query="select * from "+tbl+" where cname='"+clo+"' "; 
                                Statement st=connection.createStatement();
                                ResultSet rs=st.executeQuery(query);

                                while(rs.next())
                                {
                                    i=rs.getInt(1);
                                    s2=rs.getString(2);
                                    s3=rs.getString(3);
                                    s4=rs.getString(4);
                            %>
                            <tr>
                                <td class="text-center"><%=s2%></td>
                                <td class="text-center"><%=s3%></td>
                                <td class="text-center"><%=s4%></td>
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

                <div class="text-center mt-4">
                    <a href="DataOwnerMain.jsp" class="btn btn-outline-primary">
                        <i class="bi bi-arrow-left me-2"></i>Back to Dashboard
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="py-4 text-center" style="background: linear-gradient(90deg, #4a00e0, #8e2de2); color: white;">
    <div class="container">
        <p class="mb-0">© 2025 Secure Data Transfer using Counting Bloom Filter</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
