<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Migrate</title>
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
        .main-content {
            padding: 2rem 0;
        }
        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        }
        .form-control, .form-select {
            border-radius: 8px;
            padding: 0.75rem 1rem;
            border: 1px solid #e0e0e0;
        }
        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 0 3px rgba(74, 0, 224, 0.1);
            border-color: #4a00e0;
        }
        .btn-primary {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            border: none;
            border-radius: 8px;
            padding: 0.75rem 2rem;
            font-weight: 600;
        }
        .btn-primary:hover {
            opacity: 0.9;
        }
        .sidebar-menu {
            background: white;
            border-radius: 16px;
            padding: 1.5rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        }
        .sidebar-menu .nav-link {
            padding: 0.75rem 1rem;
            margin: 0.25rem 0;
            border-radius: 8px;
            transition: all 0.3s;
        }
        .sidebar-menu .nav-link:hover {
            background: rgba(74, 0, 224, 0.1);
        }
        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: white;
            padding: 1.5rem 0;
            margin-top: 3rem;
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

<div class="main-content">
    <div class="container">
        <div class="row">
            <!-- Main Content Area -->
            <div class="col-lg-8">
                <div class="card mb-4">
                    <div class="card-body">
                        <h2 class="card-title mb-4 text-primary">
                            Welcome To Migration :: <%=application.getAttribute("onname") %>
                        </h2>
                        
                        <form action="performMig.jsp" method="post" class="needs-validation" novalidate>
                            <div class="mb-4">
                                <label class="form-label fw-semibold">Email Address</label>
                                <input type="email" name="email" class="form-control" required>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label fw-semibold">Username</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label fw-semibold">Migrating From</label>
                                <select class="form-select" name="cloud" required>
                                    <option value="<%=application.getAttribute("ocl") %>"><%=application.getAttribute("ocl") %></option>
                                </select>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label fw-semibold">Migration to</label>
                                <select class="form-select" name="mcloud" required>
                                    <option value="">--Select Cloud Server--</option>
                                    <option value="Rackspace">Rackspace</option>
                                    <option value="Amazon S3">Amazon S3</option>
                                    <option value="Windows Azure">Windows Azure</option>
                                    <option value="Aliyun OSS">Aliyun OSS</option>
                                </select>
                            </div>
                            
                            <div class="text-end">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-cloud-arrow-up-fill me-2"></i>Migrate
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
            <!-- Sidebar -->
            <div class="col-lg-4">
                <div class="sidebar-menu">
                    <h5 class="mb-4 fw-bold">Owner Menu</h5>
                    <nav class="nav flex-column">
                        <a class="nav-link" href="GetCloudCost.jsp">
                            <i class="bi bi-currency-dollar me-2"></i>Find Cost and Memory
                        </a>
                        <a class="nav-link" href="PurchaseVm.jsp">
                            <i class="bi bi-cart-plus me-2"></i>Purchase VM
                        </a>
                        <a class="nav-link" href="Vmdetails.jsp">
                            <i class="bi bi-hdd-stack me-2"></i>My VM Details
                        </a>
                        <a class="nav-link" href="Upload.jsp">
                            <i class="bi bi-cloud-upload me-2"></i>Upload
                        </a>
                        <a class="nav-link" href="Verify.jsp">
                            <i class="bi bi-shield-check me-2"></i>Verify
                        </a>
                        <a class="nav-link active" href="Migrate.jsp">
                            <i class="bi bi-arrow-left-right me-2"></i>Migrate
                        </a>
                        <a class="nav-link" href="VReq.jsp">
                            <i class="bi bi-envelope me-2"></i>View Request
                        </a>
                        <a class="nav-link" href="ViewOwnerDetails.jsp">
                            <i class="bi bi-folder me-2"></i>View Owner Files
                        </a>
                        <a class="nav-link text-danger" href="index.html">
                            <i class="bi bi-box-arrow-right me-2"></i>Log Out
                        </a>
                    </nav>
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
<script>
    // Form validation
    (() => {
        'use strict'
        const forms = document.querySelectorAll('.needs-validation')
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
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
