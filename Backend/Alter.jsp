<!DOCTYPE html>
<%@include file="connect.jsp" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Alter - Secure Cloud</title>
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
    .sidebar {
      background: white;
      border-radius: 16px;
      padding: 20px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.06);
    }
    .sidebar .menu-title {
      color: #4a00e0;
      font-weight: 600;
      margin-bottom: 15px;
    }
    .sb_menu {
      list-style: none;
      padding: 0;
    }
    .sb_menu li {
      margin-bottom: 10px;
    }
    .sb_menu a {
      color: #555;
      text-decoration: none;
      display: block;
      padding: 8px 15px;
      border-radius: 8px;
      transition: all 0.3s;
    }
    .sb_menu a:hover {
      background: #f0f3f8;
      color: #4a00e0;
    }
    .main-content {
      background: white;
      border-radius: 16px;
      padding: 30px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.06);
      margin-bottom: 30px;
    }
    .success-message {
      background: #d1fae5;
      color: #065f46;
      padding: 15px;
      border-radius: 8px;
      margin-bottom: 20px;
    }
    .back-button {
      display: inline-block;
      padding: 8px 20px;
      background: linear-gradient(90deg, #7e22ce, #9333ea);
      color: white;
      text-decoration: none;
      border-radius: 30px;
      transition: 0.3s ease;
    }
    .back-button:hover {
      opacity: 0.9;
      color: white;
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
      <img src="website images/purple png.png " alt="Logo" style="height: 40px;" class="me-2">
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

<div class="container py-5">
  <div class="row">
    <!-- Main Content -->
    <div class="col-lg-8">
      <div class="main-content">
        <%
        String mem = request.getParameter("t42");
        String cost = request.getParameter("t4");
        String cname = request.getParameter("cloud");
        String oper=request.getParameter("oper");
        String tbl="";
            if (cname.equalsIgnoreCase("Rackspace")) {
                tbl = "charm_rvmcost";
            } else if (cname.equalsIgnoreCase("Amazon S3")) {
                tbl = "charm_Avmcost";
            } else if (cname.equalsIgnoreCase("Windows Azure")) {
                tbl = "charm_Wvmcost";
            } else if (cname.equalsIgnoreCase("Aliyun OSS")) {
                tbl = "charm_AOvmcost";
            } 
        int s=(Integer)application.getAttribute("id");
        
        if(oper.equalsIgnoreCase("Update"))
        {
            String query="update "+tbl+" set cost='"+cost+"',memory='"+mem+"' where id='"+s+"' and cname='"+cname+"'";
            Statement st=connection.createStatement();
            st.executeUpdate(query);
            %>
            <div class="success-message">
              <h4 class="mb-0"><i class="bi bi-check-circle-fill me-2"></i>Updated Successfully</h4>
            </div>
            <%
        }
        
        if(oper.equalsIgnoreCase("Delete"))
        {
            String query="Delete from "+tbl+" where id='"+s+"' and memory='"+mem+"' and cname='"+cname+"'";
            Statement st=connection.createStatement();
            st.executeUpdate(query);
            %>
            <div class="success-message">
              <h4 class="mb-0"><i class="bi bi-check-circle-fill me-2"></i>Deleted Successfully</h4>
            </div>
            <%
        }
        %>
        
        <a href="CloudServerMain.jsp" class="back-button">
          <i class="bi bi-arrow-left me-2"></i>Back to Dashboard
        </a>
      </div>
    </div>

    <!-- Sidebar -->
    <div class="col-lg-4">
      <div class="sidebar">
        <h4 class="menu-title"><i class="bi bi-cloud-fill me-2"></i>Cloud Menu</h4>
        <ul class="sb_menu">
          <li><a href="GetThreshold.jsp"><i class="bi bi-speedometer2 me-2"></i>Threshold</a></li>
          <li><a href="GetVMR.jsp"><i class="bi bi-hdd-rack me-2"></i>VM Resources</a></li>
          <li><a href="ViewMigrateDetails.jsp"><i class="bi bi-arrow-left-right me-2"></i>Migrate Cloud</a></li>
          <li><a href="ViewDataOwners.jsp"><i class="bi bi-people me-2"></i>View DataOwners</a></li>
          <li><a href="ViewCloudFiles.jsp"><i class="bi bi-files me-2"></i>View All Files</a></li>
          <li><a href="MemoryUtil.jsp"><i class="bi bi-memory me-2"></i>Memory Utilization</a></li>
          <li><a href="ViewAttackers.jsp"><i class="bi bi-shield-exclamation me-2"></i>View Attackers</a></li>
          <li><a href="UnblockUser.jsp"><i class="bi bi-person-check me-2"></i>Revoke Vendor</a></li>
          <li><a href="index.html"><i class="bi bi-box-arrow-right me-2"></i>Log Out</a></li>
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
