<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Viewer - Secure Cloud</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
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

        .image-container {
            background: white;
            border-radius: 16px;
            padding: 20px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            margin: 40px auto;
            text-align: center;
        }

        .image-display {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }

        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: #ffffff;
            text-align: center;
            font-size: 0.9rem;
            padding: 20px 0;
            box-shadow: 0 -2px 8px rgba(0,0,0,0.04);
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container d-flex align-items-center justify-content-between">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="purple png.png" alt="Logo" style="height: 40px;" class="me-2">
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
                    <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="DataOwner.html">Data Owner</a></li>
                    <li class="nav-item"><a class="nav-link" href="ProxyServer.html">Proxy Server</a></li>
                    <li class="nav-item"><a class="nav-link" href="CloudServer.html">Cloud Server</a></li>
                    <li class="nav-item"><a class="nav-link" href="EndUser.html">End User</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <div class="image-container">
            <%
                int id =  Integer.parseInt(request.getParameter("imgid"));
                try{      
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sdtd","root","root");      
                    Statement st=con.createStatement();
                    String strQuery = "select imagess from charm_owner where id='"+id+"'" ;
            // 		String strQuery = "select imagew from image where id=+id ORDER BY ";
                    ResultSet rs = st.executeQuery(strQuery);
                    String imgLen="";
                    if(rs.next()){
                        imgLen = rs.getString(1);
                    }  
                    rs = st.executeQuery(strQuery);
                    if(rs.next()){
                        int len = imgLen.length();
                        byte [] rb = new byte[len];
                        InputStream readImg = rs.getBinaryStream(1);
                        int index=readImg.read(rb, 0, len);  
                        st.close();
                        response.reset();
                        response.getOutputStream().write(rb,0,len); 
                        response.getOutputStream().flush();        
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }
            %>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p class="mb-0">© 2025 Secure Data Transfer using Counting Bloom Filter</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>