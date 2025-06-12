<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchase VM - Secure Cloud</title>
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

        .custom-card {
            background: white;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            margin-bottom: 30px;
        }

        .form-label {
            font-weight: 500;
            color: #444;
        }

        .form-control, .form-select {
            border-radius: 8px;
            padding: 10px 15px;
            border: 1px solid #e0e0e0;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: #7e22ce;
            box-shadow: 0 0 0 0.25rem rgba(126, 34, 206, 0.1);
        }

        .btn-primary {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            border: none;
            border-radius: 30px;
            padding: 10px 30px;
            font-weight: 500;
            transition: 0.3s ease;
        }

        .btn-primary:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }

        .sidebar-menu {
            background: white;
            border-radius: 16px;
            padding: 20px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        }

        .sidebar-menu .nav-link {
            padding: 10px 15px;
            margin: 5px 0;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .sidebar-menu .nav-link:hover {
            background: #f8f9fa;
        }

        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: #ffffff;
            text-align: center;
            font-size: 0.9rem;
            padding: 20px 0;
            margin-top: 40px;
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
        <button class="navbar-toggler" type="button" data-bs-toggle=    "collapse" data-bs-target="#navbarNav">
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
        <!-- Main Content Area -->
        <div class="col-lg-8">
            <div class="custom-card">
                <h2 class="mb-4 text-primary">
                    <i class="bi bi-cloud-plus-fill me-2"></i>
                    Create Virtual Machine
                </h2>
                <form id="form1" name="form1" method="post" action="Virtual.jsp">
                    <div class="mb-4">
                        <label class="form-label">Cloud Server</label>
                        <select class="form-select" id="s1" name="cloudn" required>
                            <option value="">--Select Cloud Server--</option>
                            <option>Rackspace</option>
                            <option>Amazon S3</option>
                            <option>Windows Azure</option>
                            <option>Aliyun OSS</option>
                        </select>
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label">Virtual Machine Name</label>
                        <input type="text" name="vm" class="form-control" value="VM1" required>
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label">Virtual Machine Memory</label>
                        <select class="form-select" id="s1" name="vmm" required>
                            <option value="">--Select Virtual Memory--</option>
                            <option>10000</option>
                            <option>20000</option>
                            <option>40000</option>
                            <option>60000</option>
                            <option>80000</option>
                            <option>100000</option>
                        </select>
                    </div>
                    
                    <div class="text-end">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-plus-circle me-2"></i>
                            Create VM
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Sidebar -->
        <div class="col-lg-4">
            <div class="sidebar-menu">
                <h5 class="mb-3 text-primary">Owner Menu</h5>
                <nav class="nav flex-column">
                    <a class="nav-link" href="GetCloudCost.jsp">
                        <i class="bi bi-currency-dollar me-2"></i>
                        Find Cost and Memory
                    </a>
                    <a class="nav-link active" href="PurchaseVm.jsp">
                        <i class="bi bi-cart-plus me-2"></i>
                        Purchase VM
                    </a>
                    <a class="nav-link" href="Vmdetails.jsp">
                        <i class="bi bi-info-circle me-2"></i>
                        My VM Details
                    </a>
                    <a class="nav-link" href="Upload.jsp">
                        <i class="bi bi-cloud-upload me-2"></i>
                        Upload
                    </a>
                    <a class="nav-link" href="Verify.jsp">
                        <i class="bi bi-shield-check me-2"></i>
                        Verify
                    </a>
                    <a class="nav-link" href="Migrate.jsp">
                        <i class="bi bi-arrow-left-right me-2"></i>
                        Migrate
                    </a>
                    <a class="nav-link" href="VReq.jsp">
                        <i class="bi bi-envelope me-2"></i>
                        View Request
                    </a>
                    <a class="nav-link" href="ViewOwnerDetails.jsp">
                        <i class="bi bi-folder me-2"></i>
                        View Owner Files
                    </a>
                    <a class="nav-link text-danger" href="index.html">
                        <i class="bi bi-box-arrow-right me-2"></i>
                        Log Out
                    </a>
                </nav>
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
