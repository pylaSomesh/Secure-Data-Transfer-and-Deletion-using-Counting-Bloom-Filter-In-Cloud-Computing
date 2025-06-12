<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Search Files - Secure Data Transfer</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
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

    .search-form {
      max-width: 600px;
      margin: 0 auto;
    }

    .search-input {
      border-radius: 30px;
      padding: 12px 25px;
      border: 2px solid #e0e0e0;
      transition: all 0.3s ease;
    }

    .search-input:focus {
      border-color: #7e22ce;
      box-shadow: 0 0 0 0.25rem rgba(126, 34, 206, 0.25);
    }

    .search-btn {
      background: linear-gradient(90deg, #7e22ce, #9333ea);
      border: none;
      border-radius: 30px;
      padding: 12px 35px;
      color: white;
      font-weight: 600;
      transition: 0.3s ease;
    }

    .search-btn:hover {
      opacity: 0.9;
      transform: translateY(-1px);
    }

    footer {
      background: linear-gradient(90deg, #4a00e0, #8e2de2);
      color: #ffffff;
      text-align: center;
      font-size: 0.9rem;
      padding: 20px 0;
      margin-top: 8rem;
      box-shadow: 0 -2px 8px rgba(0,0,0,0.04);
    }

    .sidebar-menu {
      background: white;
      border-radius: 16px;
      padding: 20px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.06);
    }

    .sidebar-menu .nav-link {
      padding: 12px 20px;
      margin: 5px 0;
      border-radius: 8px;
      transition: all 0.3s ease;
    }

    .sidebar-menu .nav-link:hover {
      background: #f0f3f8;
    }

    .sidebar-menu .nav-link.active {
      background: linear-gradient(90deg, #7e22ce, #9333ea);
      color: white !important;
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
        <h2 class="text-center mb-4">
          <i class="bi bi-search me-2"></i>
          Search Files
        </h2>
        <form id="form1" name="form1" method="post" action="Search.jsp" class="search-form">
          <div class="mb-4">
            <label for="t42" class="form-label fw-semibold">
              File Name or Keyword
              <small class="text-primary">(Use any keyword from file description)</small>
            </label>
            <input 
              required="required" 
              name="fn" 
              type="text" 
              id="t42" 
              class="form-control search-input"
              placeholder="Enter your search term..."
            />
          </div>
          <div class="text-center">
            <button type="submit" name="Submit" class="search-btn">
              <i class="bi bi-search me-2"></i>
              Search
            </button>
          </div>
        </form>
      </div>
    </div>

    <!-- Sidebar -->
    <div class="col-lg-4">
      <div class="sidebar-menu">
        <h5 class="mb-3 fw-bold">Menu</h5>
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="FileSearch.jsp">
              <i class="bi bi-search me-2"></i>
              Search Files
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Reqsk.jsp">
              <i class="bi bi-key-fill me-2"></i>
              Request Secret Key
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="ViewResponse.jsp">
              <i class="bi bi-eye-fill me-2"></i>
              View File Response
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Download.jsp">
              <i class="bi bi-download me-2"></i>
              Download
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="index.html">
              <i class="bi bi-box-arrow-right me-2"></i>
              Log Out
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
