<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Get Threshold</title>
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

    .form-select {
      border-radius: 8px;
      padding: 12px;
      border: 1px solid #e0e0e0;
      transition: all 0.3s ease;
    }

    .form-select:focus {
      border-color: #7e22ce;
      box-shadow: 0 0 0 0.25rem rgba(126, 34, 206, 0.25);
    }

    .btn-primary {
      background: linear-gradient(90deg, #7e22ce, #9333ea);
      border: none;
      border-radius: 30px;
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

    .page-title {
      color: #2d3748;
      font-weight: 700;
      margin-bottom: 1.5rem;
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
      transition: all 0.3s ease;
    }

    .sidebar-menu .nav-link:hover {
      background: #f8f9fa;
    }

    .sidebar-menu .nav-link.active {
      background: linear-gradient(90deg, #7e22ce, #9333ea);
      color: white !important;
    }
  </style>
</head>
<body class="d-flex flex-column min-vh-100">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
      <a class="navbar-brand d-flex align-items-center" href="#">
        <img src="website images/purple png.png"  alt="Logo" style="height: 40px;" class="me-2">
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
    <div class="row">
      <!-- Main Content Area -->
      <div class="col-lg-8">
        <div class="custom-card">
          <h2 class="page-title text-center mb-4">
            <i class="bi bi-cloud-check me-2"></i>
            Get Threshold Details
          </h2>
          <form id="form1" name="form1" method="post" action="ViewThreshold.jsp" class="needs-validation" novalidate>
            <div class="row justify-content-center">
              <div class="col-md-8">
                <div class="mb-4">
                  <label for="s1" class="form-label fw-semibold">Select Cloud Server</label>
                  <select id="s1" name="cloudn" class="form-select" required>
                    <option value="">--Select Cloud Server--</option>
                    <option value="Rackspace">Rackspace</option>
                    <option value="Amazon S3">Amazon S3</option>
                    <option value="Windows Azure">Windows Azure</option>
                    <option value="Aliyun OSS">Aliyun OSS</option>
                  </select>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">
                    <i class="bi bi-cloud-arrow-down me-2"></i>
                    Get Threshold Details
                  </button>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>

      <!-- Sidebar -->
      <div class="col-lg-4">
        <div class="sidebar-menu">
          <h5 class="mb-3 fw-bold">Cloud Menu</h5>
          <div class="nav flex-column">
            <a href="GetThreshold.jsp" class="nav-link active">
              <i class="bi bi-speedometer2 me-2"></i>Threshold
            </a>
            <a href="GetVMR.jsp" class="nav-link">
              <i class="bi bi-hdd-rack me-2"></i>VM Resources
            </a>
            <a href="ViewMigrateDetails.jsp" class="nav-link">
              <i class="bi bi-arrow-left-right me-2"></i>Migrate Cloud
            </a>
            <a href="ViewDataOwners.jsp" class="nav-link">
              <i class="bi bi-people me-2"></i>View DataOwners
            </a>
            <a href="ViewCloudFiles.jsp" class="nav-link">
              <i class="bi bi-files me-2"></i>View All Files
            </a>
            <a href="MemoryUtil.jsp" class="nav-link">
              <i class="bi bi-memory me-2"></i>Memory Utilization
            </a>
            <a href="ViewAttackers.jsp" class="nav-link">
              <i class="bi bi-shield-exclamation me-2"></i>View Attackers
            </a>
            <a href="UnblockUser.jsp" class="nav-link">
              <i class="bi bi-person-check me-2"></i>Revoke Vendor
            </a>
            <a href="index.html" class="nav-link">
              <i class="bi bi-box-arrow-right me-2"></i>Log Out
            </a>
          </div>
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
