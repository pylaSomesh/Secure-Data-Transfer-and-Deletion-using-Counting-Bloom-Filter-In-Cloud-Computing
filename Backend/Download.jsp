<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Download - Secure Data Transfer</title>
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
        .form-control {
            border-radius: 8px;
            padding: 12px;
            border: 1px solid #e0e0e0;
        }
        .form-control:focus {
            box-shadow: 0 0 0 3px rgba(74, 0, 224, 0.1);
            border-color: #4a00e0;
        }
        .btn-primary {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            border: none;
            border-radius: 8px;
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
            padding: 20px 0;
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
            background: rgba(74, 0, 224, 0.1);
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
            <div class="col-lg-8">
                <div class="custom-card">
                    <%String uname=(String) application.getAttribute("ename");%>
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="mb-0">Download File</h2>
                        <small class="text-muted"><%=new java.util.Date()%></small>
                    </div>
                    
                    <form action="Download1.jsp" method="post" name="form1" id="form1">
                        <div class="mb-4">
                            <label class="form-label fw-semibold">File Name</label>
                            <input required name="t1" type="text" class="form-control" placeholder="Enter file name">
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label fw-semibold">Owner Name</label>
                            <input name="oname" type="text" class="form-control" placeholder="Enter owner name">
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label fw-semibold">MAC</label>
                            <input name="t12" type="text" class="form-control" placeholder="Enter MAC">
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label fw-semibold">Secret Key</label>
                            <input name="t13" type="text" class="form-control" placeholder="Enter secret key">
                        </div>
                        
                        <div class="text-end">
                            <button type="submit" name="Submit" class="btn btn-primary">
                                <i class="bi bi-key-fill me-2"></i>Request MAC
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            
            <!-- Sidebar -->
            <div class="col-lg-4">
                <div class="sidebar-menu">
                    <h5 class="mb-4 fw-bold">Menu</h5>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center" href="FileSearch.jsp">
                                <i class="bi bi-search me-2"></i>Search Files
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center" href="Reqsk.jsp">
                                <i class="bi bi-key me-2"></i>Request Secret Key
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center" href="ViewResponse.jsp">
                                <i class="bi bi-file-text me-2"></i>View File Response
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active d-flex align-items-center" href="Download.jsp">
                                <i class="bi bi-download me-2"></i>Download
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center" href="index.html">
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
