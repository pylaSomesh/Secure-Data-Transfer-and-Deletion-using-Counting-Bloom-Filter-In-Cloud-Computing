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
  <title>File Request Status</title>
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
    .status-card {
      background: white;
      border-radius: 16px;
      padding: 2rem;
      box-shadow: 0 4px 20px rgba(0,0,0,0.06);
      margin-bottom: 30px;
    }
    .back-btn {
      background: linear-gradient(90deg, #7e22ce, #9333ea);
      border: none;
      border-radius: 30px;
      padding: 10px 30px;
      color: white;
      font-weight: 500;
      text-decoration: none;
      transition: 0.3s ease;
      display: inline-flex;
      align-items: center;
    }
    .back-btn:hover {
      opacity: 0.9;
      color: white;
    }
    footer {
      background: linear-gradient(90deg, #4a00e0, #8e2de2);
      color: white;
      padding: 20px 0;
      position: fixed;
      bottom: 0;
      width: 100%;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="#">
      <img src="purple png.png" alt="Logo" style="height: 40px;" class="me-2">
      <span class="fw-bold">
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

<!-- Main Content -->
<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-lg-8">
      <div class="status-card">
        <%
        String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
        int i=0,j=0,k=0;
        
        try 
        {
          String user=(String) application.getAttribute("euname");
          String euc=(String) application.getAttribute("euc");
          
          String file=request.getParameter("fr");
          SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
          SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

          Date now = new Date();

          String strDate = sdfDate.format(now);
          String strTime = sdfTime.format(now);
          String reqdt = strDate + "   " + strTime;
          String query="select * from charm_attacker where fname='"+file+"' and user='"+user+"' and cname='"+euc+"' "; 
          Statement st5=connection.createStatement();
          ResultSet rs=st5.executeQuery(query);
          String respdate="Waiting for Response";
          String status="Waiting",attack="No", recover="....",process="Response Service";
          String username=(String)application.getAttribute("uename");
          
          if (!rs.next())
          {
            String owner="";
            String query1="select ownername from charm_cloudserver where cname='"+euc+"' and fname='"+file+"' "; 
            Statement st51=connection.createStatement();
            ResultSet rs1=st51.executeQuery(query1);

            if(rs1.next()){
              owner=rs1.getString("ownername");
            }

            String sk="Requested";
            Statement stss=connection.createStatement();
            stss.executeUpdate("insert into charm_userrequest(username,ownername,userfrm,fnamereq,sk,reqdate,resdate,resstatus) values ('"+username+"','"+owner+"','"+euc+"','"+file+"','"+sk+"','"+reqdt+"','"+respdate+"','"+status+"')"); 
        %>
            <div class="text-center">
              <i class="bi bi-check-circle-fill text-success" style="font-size: 3rem;"></i>
              <h2 class="mt-3 mb-4">Request Sent Successfully</h2>
              <p class="lead mb-4">Hi <%= username %>, your request has been sent to the Data Owner.</p>
              <a href="EndUserMain.jsp" class="back-btn">
                <i class="bi bi-arrow-left me-2"></i>Back to Dashboard
              </a>
            </div>
        <%
          } else {
        %>
            <div class="text-center">
              <i class="bi bi-x-circle-fill text-danger" style="font-size: 3rem;"></i>
              <h2 class="mt-3 mb-4">Access Blocked</h2>
              <p class="lead mb-4">Hi <%= username %>, you are blocked in Cloud Server.</p>
              <p class="text-muted mb-4">Please contact the <%= euc %> Server administrator.</p>
              <a href="EndUserMain.jsp" class="back-btn">
                <i class="bi bi-arrow-left me-2"></i>Back to Dashboard
              </a>
            </div>
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
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<footer class="text-center">
  <div class="container">
    <p class="mb-0">© 2025 Secure Data Transfer using Counting Bloom Filter</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
