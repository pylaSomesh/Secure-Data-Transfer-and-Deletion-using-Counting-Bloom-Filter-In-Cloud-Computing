<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>End User Main</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
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
    .welcome-card {
      background: white;
      border-radius: 16px;
      padding: 40px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.06);
      margin-bottom: 30px;
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
      color: #555;
      text-decoration: none;
      border-radius: 8px;
      transition: all 0.3s ease;
      margin-bottom: 8px;
    }
    .menu-link:hover {
      background: #f0f3f8;
      color: #4a00e0;
      transform: translateX(5px);
    }
    .menu-link i {
      margin-right: 10px;
    }
    footer {
      background: linear-gradient(90deg, #4a00e0, #8e2de2);
      color: #ffffff;
      text-align: center;
      font-size: 0.9rem;
      padding: 20px 0;
      margin-top: 50px;
    }
    .welcome-title {
      background: linear-gradient(90deg, #7e22ce, #9333ea);
      -webkit-background-clip: text;
      background-clip: text;
      -webkit-text-fill-color: transparent;
      font-weight: 700;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="#">
      <img src="website images/blue png.png" alt="Logo" style="height: 40px;" class="me-2">
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

<div class="container py-5">
  <div class="row">
    <div class="col-lg-8">
      <div class="welcome-card">
        <%String uname=(String) application.getAttribute("ename");%>
        <h2 class="welcome-title mb-4">Welcome, <%=uname%>!</h2>
        <p class="text-muted mb-4">End User Control Panel</p>
            <!-- <img src="images/EndUser.jpg" class="img-fluid rounded-4 shadow-sm" alt="End User Dashboard"/> -->
      </div>
    </div>
    
    <div class="col-lg-4">
      <div class="menu-card">
        <h5 class="mb-4 text-dark fw-bold">
          <i class="bi bi-grid-fill me-2"></i>
          Menu Options
        </h5>
        <div class="menu-links">
          <a href="FileSearch.jsp" class="menu-link">
            <i class="bi bi-search"></i>
            Search Files
          </a>
          <a href="Reqsk.jsp" class="menu-link">
            <i class="bi bi-key-fill"></i>
            Request Secret Key
          </a>
          <a href="ViewResponse.jsp" class="menu-link">
            <i class="bi bi-file-earmark-text"></i>
            View File Response
          </a>
          <a href="Download.jsp" class="menu-link">
            <i class="bi bi-cloud-download"></i>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
