<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Cloud Server Dashboard</title>
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
      transition: color 0.3s;
    }

    .nav-link:hover, .nav-link.active {
      color: #4a00e0 !important;
    }

    .dashboard-card {
      background: white;
      border-radius: 16px;
      padding: 25px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.06);
      margin-bottom: 30px;
      transition: transform 0.3s;
    }

    .dashboard-card:hover {
      transform: translateY(-5px);
    }

    .menu-card {
      background: linear-gradient(145deg, #ffffff, #f5f7fa);
      border-radius: 16px;
      padding: 20px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.05);
    }

    .menu-link {
      display: block;
      padding: 12px 20px;
      color: #555;
      text-decoration: none;
      border-radius: 8px;
      transition: all 0.3s;
      margin-bottom: 8px;
    }

    .menu-link:hover {
      background: linear-gradient(90deg, #7e22ce, #9333ea);
      color: white;
      transform: translateX(5px);
    }

    .welcome-title {
      background: linear-gradient(90deg, #7e22ce, #9333ea);
      -webkit-background-clip: text;
      background-clip: text;
      -webkit-text-fill-color: transparent;
      font-weight: 700;
    }

    footer {
      background: linear-gradient(90deg, #4a00e0, #8e2de2);
      color: white;
      padding: 20px 0;
      margin-top: 20rem;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="#">
      <i class="bi bi-cloud-fill me-2 text-primary"></i>
      <span class="fw-bold">
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

<div class="container py-5">
  <div class="row">
    <!-- Main Content -->
    <div class="col-lg-8">
      <div class="dashboard-card">
        <%
        String name = null;
        String a = (String) application.getAttribute("cloudName");
        String s = a, usr2 = "";
        
        if (!(a.equalsIgnoreCase("Amazon S3") || a.equalsIgnoreCase("Windows Azure") || a
                .equalsIgnoreCase("Aliyun OSS"))) {
            usr2 = a;
            application.setAttribute("ocn", usr2);
        %>
            <h2 class="welcome-title mb-4">Welcome To <%=usr2%> Cloud Server Control Panel</h2>
        <%
        }

        if (!(a.equalsIgnoreCase("Rackspace") || a.equalsIgnoreCase("Windows Azure") || a
                .equalsIgnoreCase("Aliyun OSS"))) {
            String b=(String)application.getAttribute("cnames2");
            usr2 = b;
            application.setAttribute("ocn", usr2);
        %>
            <h2 class="welcome-title mb-4">Welcome To <%=usr2%> Control Panel</h2>
        <%
        }
        if (!(a.equalsIgnoreCase("Rackspace") || a.equalsIgnoreCase("Amazon S3") || a
                .equalsIgnoreCase("Aliyun OSS"))) {
            String c=(String)application.getAttribute("cnames3");
            usr2 = c;
            application.setAttribute("ocn", usr2);
        %>
            <h2 class="welcome-title mb-4">Welcome To <%=usr2%> Control Panel</h2>
        <%
        }
        if (!(a.equalsIgnoreCase("Rackspace") || a.equalsIgnoreCase("Amazon S3") || a
                .equalsIgnoreCase("Windows Azure"))) {
            String d=(String)application.getAttribute("cnames4");
            usr2 = d;
            application.setAttribute("ocn", usr2);
        %>
            <h2 class="welcome-title mb-4">Welcome To <%=usr2%> Control Panel</h2>
        <%
        }
        %>

        <!-- <div class="text-center">
          <img src="images/gal6.jpg" class="img-fluid rounded-4 shadow" alt="Cloud Server" style="max-width: 400px;" />
        </div> -->
      </div>
    </div>

    <!-- Sidebar Menu -->
    <div class="col-lg-4">
      <div class="menu-card">
        <h5 class="mb-4 text-primary"><i class="bi bi-list-check me-2"></i>Cloud Menu</h5>
        <div class="d-flex flex-column">
          <a href="ViewDataOwners.jsp" class="menu-link"><i class="bi bi-person-lines-fill me-2"></i>View Data Owners</a>
          <a href="ViewUsers.jsp" class="menu-link"><i class="bi bi-people-fill me-2"></i>View Users</a>
          <a href="GetThreshold.jsp" class="menu-link"><i class="bi bi-speedometer2 me-2"></i>View Threshold Details</a>
          <a href="GetVMR.jsp" class="menu-link"><i class="bi bi-hdd-rack-fill me-2"></i>VM Resources</a>
          <a href="ViewMigrateDetails.jsp" class="menu-link"><i class="bi bi-arrow-left-right me-2"></i>View Transfer Cloud</a>
          <a href="ViewCloudFiles.jsp" class="menu-link"><i class="bi bi-folder-fill me-2"></i>View All Files</a>
          <a href="MemoryUtil.jsp" class="menu-link"><i class="bi bi-memory me-2"></i>View Memory Utilization</a>
          <a href="ViewAttackers.jsp" class="menu-link"><i class="bi bi-shield-exclamation me-2"></i>View All Attackers</a>
          <a href="UnblockUser.jsp" class="menu-link"><i class="bi bi-unlock-fill me-2"></i>UnRevoke Vendor</a>
          <a href="index.html" class="menu-link"><i class="bi bi-box-arrow-right me-2"></i>Log Out</a>
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
