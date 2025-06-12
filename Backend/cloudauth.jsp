<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Authentication Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
        .custom-card {
            background: white;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            margin-bottom: 30px;
        }
        .auth-container {
            min-height: calc(100vh - 180px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }
        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: #ffffff;
            text-align: center;
            font-size: 0.9rem;
            padding: 20px 0;
            position: relative;
            bottom: 0;
            width: 100%;
        }
        .cloud-name {
            color: #4a00e0;
            font-weight: 600;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        .loading-spinner {
            display: none;
            justify-content: center;
            margin: 2rem 0;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="purple png.png" alt="Logo" style="height: 40px;" class="me-2">
                <span class="fw-bold fs-5">
                    <span style="color: #1a8fb3d4;">Secure</span>
                    <span style="color: #83ce76;">Cloud</span>
                </span>
            </a>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="auth-container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="custom-card">
                        <div class="text-center mb-4">
                            <i class="bi bi-shield-lock-fill text-primary" style="font-size: 3rem;"></i>
                            <h2 class="mt-3 mb-4">Cloud Authentication</h2>
                        </div>
                        
                        <%@ include file="connect.jsp" %>
                        <%@ page import="java.util.Date" %>
                        <%
                            String name=request.getParameter("userid");      
                            String pass=request.getParameter("pass");
                            String clname=request.getParameter("cname");
                            try {
                                application.setAttribute("cloudName",clname);
                        %>
                                <h4 class="cloud-name"><%=clname %></h4>
                        <%
                                session.setAttribute("cnames",clname);
                                String sql="SELECT * FROM charm_cloud where username='"+name+"' and password='"+pass+"' and cname='"+clname+"'";
                                Statement stmt = connection.createStatement();
                                ResultSet rs =stmt.executeQuery(sql);
                                String utype="";
                                if(rs.next()){
                                    if(clname.equalsIgnoreCase("Rackspace")){
                                        application.setAttribute("cnames1",clname);
                                        response.sendRedirect("CloudServerMain.jsp");
                                    }else if(clname.equalsIgnoreCase("Amazon S3")){
                                        application.setAttribute("cnames2",clname);
                                        response.sendRedirect("CloudServerMain.jsp");
                                    }else if(clname.equalsIgnoreCase("Windows Azure")){
                                        application.setAttribute("cnames3",clname);
                                        response.sendRedirect("CloudServerMain.jsp");
                                    }else if(clname.equalsIgnoreCase("Aliyun OSS")){
                                        application.setAttribute("cnames4",clname);
                                        response.sendRedirect("CloudServerMain.jsp");
                                    }
                                    response.sendRedirect("CloudServerMain.jsp");
                        %>
                                    <form action="CloudServerMain.jsp" method="post" id="clouddet" class="d-none">
                                        <input id="cname" name="cname" class="form-control" type="text" value="<%=clname %>" />
                                    </form>
                                    <div class="loading-spinner">
                                        <div class="spinner-border text-primary" role="status">
                                            <span class="visually-hidden">Loading...</span>
                                        </div>
                                    </div>
                        <%
                                }
                                else {
                                    response.sendRedirect("wronglogin.html");
                                }
                            }
                            catch(Exception e) {
                        %>
                                <div class="alert alert-danger" role="alert">
                                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                    <%= e.getMessage() %>
                                </div>
                        <%
                                e.printStackTrace();
                            }
                        %>
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
    <script>
        // Show loading spinner when form is submitted
        document.getElementById('clouddet').onsubmit = function() {
            document.querySelector('.loading-spinner').style.display = 'flex';
        };
    </script>
</body>
</html>