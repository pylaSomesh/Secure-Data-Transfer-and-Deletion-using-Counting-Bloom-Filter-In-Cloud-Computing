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
    <title>Download</title>
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
            transition: color 0.3s ease;
        }

        .nav-link:hover, .nav-link.active {
            color: #4a00e0 !important;
        }

        .custom-card {
            background: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            margin-bottom: 30px;
            transition: transform 0.3s ease;
        }

        .custom-card:hover {
            transform: translateY(-5px);
        }

        .menu-card {
            background: white;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        }

        .menu-link {
            display: block;
            padding: 12px 20px;
            color: #444;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
            margin-bottom: 8px;
            font-weight: 500;
        }

        .menu-link:hover {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            color: white;
            transform: translateX(5px);
        }

        .menu-link i {
            margin-right: 10px;
        }

        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: #ffffff;
            text-align: center;
            padding: 20px 0;
            margin-top: 40px;
        }

        .style1 {
            color: #00FF00;
        }

        .style2 {
            color: #0000FF;
        }

        #textarea {
            width: 100%;
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #ddd;
            margin-bottom: 20px;
            font-family: 'Poppins', sans-serif;
        }

        .btn-download {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-download:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(126, 34, 206, 0.3);
        }
    </style>
    <script type='text/javascript'>
        function saveTextAsFile() {
            var textToWrite = document.getElementById("textarea").value;
            var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
            var fileNameToSaveAs = "File.txt";

            var downloadLink = document.createElement("a");
            downloadLink.download = fileNameToSaveAs;
            downloadLink.innerHTML = "Download File";
            if (window.webkitURL != null) {
                downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
            } else {
                downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
                downloadLink.onclick = destroyClickedElement;
                downloadLink.style.display = "none";
                document.body.appendChild(downloadLink);
            }
            downloadLink.click();
        }

        function destroyClickedElement(event) {
            document.body.removeChild(event.target);
        }
    </script>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="website images\purple png.png" alt="Logo" style="height: 40px;" class="me-2">
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

<!-- Main Content -->
<div class="container py-5">
    <div class="row">
        <!-- Main Content Area -->
        <div class="col-lg-8 mb-4">
            <div class="custom-card">
                <h2 class="mb-4 text-primary">Download File</h2>
                <div class="d-flex align-items-center mb-4">
                    <span class="badge bg-success me-2">End User</span>
                    <span class="text-muted">|</span>
                    <span class="badge bg-primary ms-2">Control Panel</span>
                </div>
                
                <%
                String uname=(String) application.getAttribute("ename");
                String cname=(String) application.getAttribute("euc");
                %>
                <h5 class="text-end mb-4"><%=new java.util.Date()%></h5>

                <%
                try {
                    String file = request.getParameter("t1");
                    String owner = request.getParameter("oname");
                    String mac = request.getParameter("t12");
                    String sk = request.getParameter("t13");
                    String un=(String)application.getAttribute("uename");
                    
                    application.setAttribute("file2", file);
                    application.setAttribute("sk2", sk);
                    String prcs1="Responsed";
                    String query25 = "select * from charm_userrequest where username='"+un+"' and fnamereq='"
                        + file+ "' and resstatus='"+prcs1+"'";
                    Statement st25 = connection.createStatement();
                    ResultSet rs25 = st25.executeQuery(query25);

                    if (rs25.next()) {
                        String strQuery = "select * from charm_cloudserver where fname='"
                            + file
                            + "' and ownername='"
                            + owner
                            + "' and  mac='"
                            + mac
                            + "' and  sk='" + sk + "'";
                        String strQuery1 = "select * from charm_cloudserver where fname='"
                            + file + "'";

                        ResultSet rs = connection.createStatement().executeQuery(strQuery);
                        {
                            if (rs.next() == true) {
                                ResultSet rs1 = connection.createStatement()
                                    .executeQuery(strQuery1);
                                {
                                    if (rs1.next() == true) {
                                        String rank = rs1.getString(9);
                                        int updaterank = Integer.parseInt(rank)+ 1;
                                        String strQuery2 = "update charm_cloudserver set rank='"
                                            + updaterank
                                            + "' where fname='"
                                            + file+ "' and ownername='"+owner+"' ";
                                        connection.createStatement().executeUpdate(strQuery2);
                                        String ct = rs.getString(3);

                                        String keys = "ef50a0ef2c3e3a5f";
                                        byte[] keyValue1 = keys.getBytes();
                                        Key key1 = new SecretKeySpec(keyValue1, "AES");
                                        Cipher c1 = Cipher.getInstance("AES");
                                        c1.init(Cipher.DECRYPT_MODE, key1);
                                        String decryptedValue = new String(Base64.decode(ct.getBytes()));
                %>
                <div class="text-center mb-4">
                    <h4 class="text-success">File Contents</h4>
                    <textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue%></textarea>
                    <div class="mt-3">
                        <button class="btn btn-download" onClick="saveTextAsFile()">
                            <i class="bi bi-download me-2"></i>Download File
                        </button>
                    </div>
                </div>
                <%
                                    } else {
                %>
                <div class="alert alert-danger text-center">
                    <h4>File Doesn't Exist !!!</h4>
                    <a href="Download.jsp" class="btn btn-outline-primary mt-3">Back</a>
                </div>
                <%
                                    }
                                }
                            } else {
                                SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
                                SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
                                Date now = new Date();
                                String strDate = sdfDate.format(now);
                                String strTime = sdfTime.format(now);
                                String dt = strDate + "   " + strTime;
                                String user = (String) application.getAttribute("uename");
                                String type="Wrong Credentials";
                                String strQuery2 = "insert into charm_attacker(user,fname,cname,sk,type,dt) values('"
                                    + user
                                    + "','"
                                    + file
                                    + "','"+cname+"','"
                                    + sk
                                    + "','"+type+"','"
                                    + dt
                                    + "')";
                                connection.createStatement().executeUpdate(strQuery2);
                %>
                <div class="alert alert-danger text-center">
                    <h4>Wrong Credential Ur Automatically Blocked in <%=cname %> !!!</h4>
                    <p class="mb-3">Please contact Cloud Server Admin</p>
                    <h5 class="text-danger">MAC / Secret Key Mismatch !!!</h5>
                    <a href="Download.jsp" class="btn btn-outline-primary mt-3">Back</a>
                </div>
                <%
                            }
                        }
                    } else {
                        SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
                        SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
                        Date now = new Date();
                        String strDate = sdfDate.format(now);
                        String strTime = sdfTime.format(now);
                        String dt = strDate + "   " + strTime;
                        String user = (String) application.getAttribute("ename");
                        String type="Access Denied";
                        String strQuery2 = "insert into charm_attacker(user,fname,cname,sk,type,dt) values('"
                            + user
                            + "','"
                            + file
                            + "','"+cname+"','"
                            + sk
                            + "','"+type+"','"
                            + dt
                            + "')";
                        connection.createStatement().executeUpdate(strQuery2);
                %>
                <div class="alert alert-danger text-center">
                    <h4>U Dont Have Permission To DownLoad File!!!</h4>
                    <p class="mb-3">Please contact Cloud Server Admin</p>
                    <a href="Download.jsp" class="btn btn-outline-primary mt-3">Back</a>
                </div>
                <%
                    }
                    connection.close();
                } catch (Exception e) {
                    out.println(e.getMessage());
                    e.printStackTrace();
                }
                %>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <div class="col-lg-4">
            <div class="menu-card">
                <h4 class="mb-4 text-primary">
                    <i class="bi bi-gear-fill me-2"></i>
                    End User Menu
                </h4>
                <div class="menu-links">
                    <a href="FileSearch.jsp" class="menu-link">
                        <i class="bi bi-search"></i>
                        Search Files
                    </a>
                    <a href="Reqsk.jsp" class="menu-link">
                        <i class="bi bi-key"></i>
                        Request Secret Key
                    </a>
                    <a href="ViewResponse.jsp" class="menu-link">
                        <i class="bi bi-file-text"></i>
                        View File Response
                    </a>
                    <a href="Download.jsp" class="menu-link">
                        <i class="bi bi-download"></i>
                        Download
                    </a>
                    <a href="index.html" class="menu-link">
                        <i class="bi bi-box-arrow-right"></i>
                        Log Out
                    </a>
                </div>
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

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        })
    });
</script>
</body>
</html>
