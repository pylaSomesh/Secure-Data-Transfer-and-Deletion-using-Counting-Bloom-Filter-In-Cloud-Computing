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
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Download - Secure Data Transfer</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
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

    .form-control {
      border-radius: 8px;
      padding: 12px;
      border: 1px solid #e2e8f0;
    }

    .form-control:focus {
      border-color: #7e22ce;
      box-shadow: 0 0 0 0.2rem rgba(126, 34, 206, 0.25);
    }

    .btn-primary {
      background: linear-gradient(90deg, #7e22ce, #9333ea);
      border: none;
      border-radius: 8px;
      padding: 12px 24px;
      font-weight: 500;
    }

    .btn-primary:hover {
      background: linear-gradient(90deg, #6b21a8, #7e22ce);
    }

    .table {
      border-radius: 8px;
      overflow: hidden;
    }

    .table th {
      background-color: #f8f9fa;
      font-weight: 600;
    }

    footer {
      background: linear-gradient(90deg, #4a00e0, #8e2de2);
      color: #ffffff;
      text-align: center;
      font-size: 0.9rem;
      padding: 20px 0;
      box-shadow: 0 -2px 8px rgba(0,0,0,0.04);
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
      <a class="navbar-brand d-flex align-items-center" href="index.html">
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
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="custom-card">
          <div class="text-center mb-4">
            <h2 class="fw-bold text-primary mb-3">Download File</h2>
            <p class="text-muted">Secure file download with integrity verification</p>
          </div>

          <%
            String uname = (String) application.getAttribute("ename");
            String cname = (String) application.getAttribute("euc");
          %>
          <div class="text-end mb-4">
            <small class="text-muted"><%=new java.util.Date()%></small>
          </div>

          <%
            try {
              String file = request.getParameter("t1");
              String a = (String)application.getAttribute("a");
              String fn = (String)application.getAttribute("file");
              String un = (String)application.getAttribute("uename");
              String oname = request.getParameter("oname");
              String eu = (String)application.getAttribute("euc");
              String prcs = "Service Processed";

              String mac = "";
              String sk = "";
              String strQuery = "select * from charm_cloudserver where fname='"+file+"' and ownername='"+oname+"' and cname='"+cname+"' ";
              ResultSet rs = connection.createStatement().executeQuery(strQuery);
              
              if(rs.next()==true) {
                mac = rs.getString(7);
                sk = rs.getString(8);
                
                SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
                SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
                Date now = new Date();
                String strDate = sdfDate.format(now);
                String strTime = sdfTime.format(now);
                String dt = strDate + "   " + strTime;	
                String task = "Download";
                String user = (String) application.getAttribute("uename");
                String strQuery2 = "insert into charm_transaction(user,fname,cname,sk,task,dt) values('"+user+"','"+file+"','"+cname+"','"+sk+"','"+task+"','"+dt+"')";
                connection.createStatement().executeUpdate(strQuery2);
          %>

          <form action="Download2.jsp" method="post" name="form1" id="form1" class="needs-validation" novalidate>
            <div class="mb-4">
              <label class="form-label fw-semibold">File Name</label>
              <input type="text" class="form-control" name="t1" value="<%=file%>" required readonly>
            </div>

            <div class="mb-4">
              <label class="form-label fw-semibold">Owner Name</label>
              <select class="form-select" name="oname" required>
                <option value="<%=oname%>"><%=oname%></option>
              </select>
            </div>

            <div class="mb-4">
              <label class="form-label fw-semibold">User Name</label>
              <input type="text" class="form-control" name="un" value="<%=un%>" required readonly>
            </div>

            <div class="mb-4">
              <label class="form-label fw-semibold">MAC</label>
              <input type="text" class="form-control" name="t12" value="<%=mac%>" required readonly>
            </div>

            <div class="mb-4">
              <label class="form-label fw-semibold">Secret Key</label>
              <input type="text" class="form-control" name="t13" required>
            </div>

            <div class="text-center">
              <button type="submit" class="btn btn-primary btn-lg">
                <i class="bi bi-download me-2"></i>Decrypt and Download
              </button>
            </div>
          </form>

          <%
              } else {
          %>
          <div class="alert alert-danger text-center">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>
            File Doesn't Exist or its Not in <%=cname%> !!!
          </div>
          <div class="text-center mt-4">
            <a href="Download.jsp" class="btn btn-outline-primary">
              <i class="bi bi-arrow-left me-2"></i>Back
            </a>
          </div>
          <%
              }
              connection.close();
            } catch(Exception e) {
          %>
          <div class="alert alert-danger">
            <i class="bi bi-exclamation-circle-fill me-2"></i>
            <%=e.getMessage()%>
          </div>
          <%
            }
          %>
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
  <script>
    // Form validation
    (function () {
      'use strict'
      var forms = document.querySelectorAll('.needs-validation')
      Array.prototype.slice.call(forms)
        .forEach(function (form) {
          form.addEventListener('submit', function (event) {
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
