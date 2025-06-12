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
    <title>Upload File - Secure Cloud</title>
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

        .form-label {
            font-weight: 600;
            color: #444;
        }

        .form-control {
            border-radius: 8px;
            border: 1px solid #e0e0e0;
            padding: 12px;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: #7e22ce;
            box-shadow: 0 0 0 0.25rem rgba(126, 34, 206, 0.1);
        }

        .btn-primary {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            border: none;
            border-radius: 8px;
            padding: 12px 30px;
            font-weight: 600;
            transition: 0.3s ease;
        }

        .btn-primary:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }

        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: #ffffff;
            text-align: center;
            font-size: 0.9rem;
            padding: 20px 0;
            margin-top: auto;
        }

        .sidebar-menu {
            background: white;
            border-radius: 16px;
            padding: 20px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        }

        .sidebar-menu .nav-link {
            padding: 12px 16px;
            margin: 4px 0;
            border-radius: 8px;
            transition: all 0.3s;
        }

        .sidebar-menu .nav-link:hover {
            background: #f8f9fa;
        }

        .sidebar-menu .nav-link.active {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            color: white !important;
        }
    </style>
    <script language="javascript" type='text/javascript'>
        function loadFileAsText() {
            var fileToLoad = document.getElementById("file").files[0];
            var fileReader = new FileReader();
            fileReader.onload = function(fileLoadedEvent) {
                var textFromFileLoaded = fileLoadedEvent.target.result;
                document.getElementById("textarea").value = textFromFileLoaded;
            };
            fileReader.readAsText(fileToLoad, "UTF-8");
        }
    </script>
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
        <div class="row">
            <!-- Sidebar -->
            <div class="col-lg-3 mb-4">
                <div class="sidebar-menu">
                    <h5 class="mb-3 fw-bold">Owner Menu</h5>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="GetCloudCost.jsp">
                                <i class="bi bi-currency-dollar me-2"></i>Find Cost and Memory
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="PurchaseVm.jsp">
                                <i class="bi bi-cart-plus me-2"></i>Purchase VM
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Vmdetails.jsp">
                                <i class="bi bi-hdd-stack me-2"></i>My VM Details
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="Upload.jsp">
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
                            <a class="nav-link" href="VReq.jsp">
                                <i class="bi bi-envelope me-2"></i>View Request
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ViewOwnerDetails.jsp">
                                <i class="bi bi-folder me-2"></i>View Owner Files
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

            <!-- Main Content Area -->
            <div class="col-lg-9">
                <div class="custom-card">
                    <h4 class="mb-4 fw-bold text-primary">File Upload Details</h4>
                    
                    <% try 
                    {
                        String file=request.getParameter("tt");
                        String cont=request.getParameter("text");
                        String keys = "ef50a0ef2c3e3a5f";
                        String h1="";
                        String filename="filename.txt";
                        
                        String cname=(String)application.getAttribute("ocl");
                        
                        byte[] keyValue = keys.getBytes();
                        Key key = new SecretKeySpec(keyValue, "AES");
                        Cipher c = Cipher.getInstance("AES");
                        c.init(Cipher.ENCRYPT_MODE, key);
                        String encryptedValue = new String(Base64.encode(cont.getBytes()));
                        
                        PrintStream p = new PrintStream(new FileOutputStream(filename));
                        p.print(new String(cont));
                        
                        MessageDigest md = MessageDigest.getInstance("SHA1");
                        FileInputStream fis11 = new FileInputStream(filename);
                        DigestInputStream dis1 = new DigestInputStream(fis11, md);
                        BufferedInputStream bis1 = new BufferedInputStream(dis1);
                
                        while (true) {
                            int b1 = bis1.read();
                            if (b1 == -1)
                                break;
                        }
                
                        BigInteger bi1 = new BigInteger(md.digest());
                        String spl1 = bi1.toString();
                        h1 = bi1.toString(16);
                    %>

                    <form action="Upload2.jsp" method="post" class="needs-validation" novalidate>
                        <div class="mb-4">
                            <label class="form-label">File Name</label>
                            <input name="t42" type="text" class="form-control" value="<%= file %>" readonly>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Encrypted Content</label>
                            <textarea name="text2" class="form-control" rows="8" readonly><%= encryptedValue %></textarea>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">MAC</label>
                            <input name="t4" type="text" class="form-control" value="<%= h1 %>" readonly>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Select Cloud Server</label>
                            <select name="cloud" class="form-select">
                                <option><%=cname %></option>
                            </select>
                        </div>

                        <div class="text-end">
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-cloud-upload me-2"></i>Upload File
                            </button>
                        </div>
                    </form>

                    <%
                        connection.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e.getMessage());
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
