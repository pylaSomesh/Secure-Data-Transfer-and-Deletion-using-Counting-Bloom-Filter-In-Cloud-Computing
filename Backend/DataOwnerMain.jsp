<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Owner Main</title>
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
        .welcome-section {
            background: linear-gradient(to right, #f7f9fc, #e6ecf3);
            padding: 2rem 0;
            border-radius: 16px;
            margin: 1rem 0;
        }
        .menu-card {
            background: white;
            border-radius: 16px;
            padding: 1.5rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        }
        .menu-item {
            transition: all 0.3s ease;
            text-decoration: none;
            color: #333;
            display: block;
            padding: 0.75rem 1rem;
            border-radius: 8px;
            margin-bottom: 0.5rem;
        }
        .menu-item:hover {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            color: white;
            transform: translateX(5px);
        }
        .menu-item i {
            margin-right: 10px;
        }
        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: #ffffff;
            padding: 20px 0;
            margin-top: 12rem;
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

<div class="container py-4">
    <!-- Welcome Section -->
    <div class="welcome-section mb-4 p-4">
        <h2 class="text-primary mb-3">
            <i class="bi bi-person-circle me-2"></i>
            Welcome <%=application.getAttribute("ocl")%> DataOwner :: <%=application.getAttribute("onname")%>
        </h2>
        <p class="mb-0 text-muted">
            <span class="badge bg-success me-2">Owner</span>
            <span class="badge bg-primary">Control Panel</span>
        </p>
    </div>

    <div class="row">
        <!-- Main Content -->
        <div class="col-lg-8 mb-4">
            <div class="card border-0 shadow-sm">
                <!-- <div class="card-body text-center">
                    <img src="images/Owner.jpg" class="img-fluid rounded" alt="Owner Dashboard" style="max-width: 100%; height: auto;">
                </div> -->
            </div>
        </div>

        <!-- Sidebar Menu -->
        <div class="col-lg-4">
            <div class="menu-card">
                <h5 class="card-title mb-4">
                    <i class="bi bi-gear-fill me-2"></i>
                    Owner Menu
                </h5>
                <div class="menu-items">
                    <a href="GetCloudCost.jsp" class="menu-item">
                        <i class="bi bi-currency-dollar"></i>Find Cost and Memory
                    </a>
                    <a href="PurchaseVm.jsp" class="menu-item">
                        <i class="bi bi-cart-plus"></i>Purchase VM
                    </a>
                    <a href="Vmdetails.jsp" class="menu-item">
                        <i class="bi bi-hdd-stack"></i>My VM Details
                    </a>
                    <a href="Upload.jsp" class="menu-item">
                        <i class="bi bi-cloud-upload"></i>Upload
                    </a>
                    <a href="Verify.jsp" class="menu-item">
                        <i class="bi bi-shield-check"></i>Data Integrity Proof
                    </a>
                    <a href="Migrate.jsp" class="menu-item">
                        <i class="bi bi-arrow-left-right"></i>Transfer Your Data
                    </a>
                    <a href="VReq.jsp" class="menu-item">
                        <i class="bi bi-envelope"></i>View Request
                    </a>
                    <a href="ViewOwnerDetails.jsp" class="menu-item">
                        <i class="bi bi-folder"></i>View Owner Files
                    </a>
                    <a href="index.html" class="menu-item">
                        <i class="bi bi-box-arrow-right"></i>Log Out
                    </a>
                </div>
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
