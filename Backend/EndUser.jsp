<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>End User Login - Secure Data Transfer</title>
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

    .login-card {
      background: white;
      border-radius: 16px;
      padding: 40px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.06);
    }

    .form-control {
      border-radius: 8px;
      padding: 12px;
      border: 1px solid #e0e0e0;
      transition: all 0.3s ease;
    }

    .form-control:focus {
      border-color: #7e22ce;
      box-shadow: 0 0 0 0.2rem rgba(126, 34, 206, 0.15);
    }

    .btn-login {
      background: linear-gradient(90deg, #7e22ce, #9333ea);
      border: none;
      border-radius: 30px;
      padding: 12px 30px;
      color: white;
      font-weight: 600;
      transition: 0.3s ease;
    }

    .btn-login:hover {
      opacity: 0.9;
      transform: translateY(-1px);
    }

    .register-link {
      color: #7e22ce;
      text-decoration: none;
      font-weight: 500;
      transition: 0.3s ease;
    }

    .register-link:hover {
      color: #9333ea;
    }

    footer {
      background: linear-gradient(90deg, #4a00e0, #8e2de2);
      color: #ffffff;
      text-align: center;
      font-size: 0.9rem;
      padding: 20px 0;
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
        <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="DataOwner.html">Data Owner</a></li>
        <li class="nav-item"><a class="nav-link" href="ProxyServer.html">Proxy Server</a></li>
        <li class="nav-item"><a class="nav-link" href="CloudServer.html">Cloud Server</a></li>
        <li class="nav-item"><a class="nav-link active" href="EndUser.html">End User</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Login Section -->
<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="login-card">
        <div class="text-center mb-4">
          <h2 class="fw-bold text-dark">End User Login</h2>
          <p class="text-muted">Access your secure cloud storage</p>
        </div>
        
        <form action="userauth.jsp" method="post" class="needs-validation" novalidate>
          <div class="mb-4">
            <label for="userid" class="form-label">Username</label>
            <div class="input-group">
              <span class="input-group-text"><i class="bi bi-person"></i></span>
              <input type="text" class="form-control" id="userid" name="userid" required>
            </div>
          </div>
          
          <div class="mb-4">
            <label for="pass" class="form-label">Password</label>
            <div class="input-group">
              <span class="input-group-text"><i class="bi bi-lock"></i></span>
              <input type="password" class="form-control" id="pass" name="pass" required>
            </div>
          </div>
          
          <div class="mb-4">
            <label for="cname" class="form-label">Select Cloud Server</label>
            <select class="form-select" id="cname" name="cname" required>
              <option value="">Choose a server...</option>
              <option value="Rackspace">Rackspace</option>
              <option value="Amazon S3">Amazon S3</option>
              <option value="Windows Azure">Windows Azure</option>
              <option value="Aliyun OSS">Aliyun OSS</option>
            </select>
          </div>
          
          <div class="d-grid gap-2">
            <button type="submit" class="btn btn-login">
              <i class="bi bi-box-arrow-in-right me-2"></i>Login
            </button>
          </div>
          
          <div class="text-center mt-4">
            <span class="text-muted">Don't have an account?</span>
            <a href="RegisterU.html" class="register-link ms-2">Register Now</a>
          </div>
        </form>
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
(function () {
  'use strict'
  var forms = document.querySelectorAll('.needs-validation')
  Array.prototype.slice.call(forms).forEach(function (form) {
    form.addEventListener('submit', function (event) {
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