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
  <title>Response - VM Allocation</title>
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
    .sidebar-menu {
      background: white;
      border-radius: 16px;
      padding: 20px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.06);
    }
    .sidebar-menu .nav-link {
      padding: 12px 20px;
      margin: 5px 0;
      border-radius: 8px;
      transition: all 0.3s ease;
    }
    .sidebar-menu .nav-link:hover {
      background: #f8f9fa;
    }
    .sidebar-menu .nav-link.active {
      background: linear-gradient(90deg, #7e22ce, #9333ea);
      color: white !important;
    }
    footer {
      background: linear-gradient(90deg, #4a00e0, #8e2de2);
      color: #ffffff;
      text-align: center;
      font-size: 0.9rem;
      padding: 20px 0;
      margin-top: 50px;
    }
    .response-message {
      padding: 30px;
      border-radius: 12px;
      background: #e8f5e9;
      border-left: 5px solid #4caf50;
      margin: 20px 0;
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
  <div class="row">
    <!-- Main Content -->
    <div class="col-lg-9">
      <div class="custom-card">
        <h2 class="mb-4">VM Allocation Details</h2>
        
        <%
        String s7="";
        	try {
          		String id=request.getParameter("id");
          		String uname=request.getParameter("name");
          		String cname=request.getParameter("cname");
          		String fname=request.getParameter("fname");
          		SimpleDateFormat sdfDate = new SimpleDateFormat(
				"dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat(
				"HH:mm:ss");

		Date now = new Date();

		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;
		
		
		String query="select * from charm_CloudServer where fname='"+fname+"' and cname='"+cname+"' "; 
        Statement st=connection.createStatement();
        ResultSet rs=st.executeQuery(query);
	if ( rs.next() )
	   {
		
		s7=rs.getString(8);
		
	   }

			String processsts="Processed";
			String prss="Service Processed";
			
			String resp="Responsed";
			
			
			Statement stss=connection.createStatement();
stss.executeUpdate("Update charm_userrequest set sk='"+s7+"',resdate='"+dt+"', resstatus='"+resp+"' where username='"+uname+"' and fnamereq='"+fname+"' ; "); 
		
%>
        <div class="response-message">
          <h4 class="mb-3">Success!</h4>
          <p class="fs-5 mb-0">Responded to request for User <strong><%=uname %></strong> to process <strong><%=fname %></strong></p>
        </div>
<%
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
            e.printStackTrace();
          }
%>
      </div>
    </div>

    <!-- Sidebar -->
    <div class="col-lg-3">
      <div class="sidebar-menu">
        <h5 class="mb-3 fw-bold">Owner Menu</h5>
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" href="GetCloudCost.jsp">
              <i class="bi bi-calculator me-2"></i>Find Cost and Memory
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="PurchaseVm.jsp">
              <i class="bi bi-cart me-2"></i>Purchase VM
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Vmdetails.jsp">
              <i class="bi bi-hdd-stack me-2"></i>My VM Details
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Upload.jsp">
              <i class="bi bi-cloud-upload me-2"></i>Upload
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Verify.jsp">
              <i class="bi bi-check-circle me-2"></i>Verify
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Migrate.jsp">
              <i class="bi bi-arrow-left-right me-2"></i>Migrate
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="ViewOwnerDetails.jsp">
              <i class="bi bi-file-text me-2"></i>View Owner Files
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
