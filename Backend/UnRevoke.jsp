<!DOCTYPE html>
<%@include file="connect.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Un Revoke - Secure Cloud</title>
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
        .result-message {
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            background: #f8f9fa;
            border-left: 4px solid #4a00e0;
        }
        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: #ffffff;
            text-align: center;
            font-size: 0.9rem;
            padding: 20px 0;
            /* position: fixed; */
            bottom: 0;
            width: 100%;
            margin-top: 20rem;
        }
        .back-btn {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            border: none;
            border-radius: 30px;
            padding: 10px 30px;
            color: white;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s ease;
        }
        .back-btn:hover {
            opacity: 0.9;
            color: white;
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
                String userA=request.getParameter("us");
                String cl=(String) application.getAttribute("cloudName");
                String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9="",s10="",s11,s12,s13;
                int i=0,j=0,k=0;

                try {
                %>
                    <h2 class="text-center mb-4">Un-Revoke Access</h2>
                    <div class="alert alert-info">
                        <h5 class="mb-0">User: <%=userA%> | Cloud: <%=cl%></h5>
                    </div>
                    <%
                    String query="Delete from charm_attacker where user='"+userA+"' and cname='"+cl+"' ";
                    Statement st=connection.createStatement();
                    st.executeUpdate(query);
                    %>
                    <div class="result-message">
                        <h4 class="text-success mb-0"><i class="bi bi-check-circle-fill me-2"></i>Attacker Un-Revoked Successfully</h4>
                    </div>
                    <%
                    connection.close();
                } catch(Exception e) {
                    %>
                    <div class="alert alert-danger">
                        <h4 class="text-danger mb-0"><i class="bi bi-exclamation-triangle-fill me-2"></i>Error: <%=e.getMessage()%></h4>
                    </div>
                    <%
                    e.printStackTrace();
                }
                %>
                <div class="text-center mt-4">
                    <a href="CloudServerMain.jsp" class="back-btn">
                        <i class="bi bi-arrow-left me-2"></i>Back to Cloud Server
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
