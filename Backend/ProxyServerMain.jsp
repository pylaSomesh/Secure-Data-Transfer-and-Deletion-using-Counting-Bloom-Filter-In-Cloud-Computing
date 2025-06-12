<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Server Main</title>
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
            transition: color 0.3s ease;
        }

        .nav-link:hover, .nav-link.active {
            color: #4a00e0 !important;
        }

        .hero-section {
            background: linear-gradient(to right, #f7f9fc, #e6ecf3);
            padding: 40px 0;
        }

        .custom-card {
            background: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            margin-bottom: 30px;
            transition: transform 0.3s ease;
        }

        .custom-card:hover {
            transform: translateY(-5px);
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
            color: #444;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
            margin-bottom: 8px;
            font-weight: 500;
        }

        .menu-link:hover {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            color: white;
            transform: translateX(5px);
        }

        .menu-link i {
            margin-right: 10px;
        }

        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: #ffffff;
            text-align: center;
            padding: 20px 0;
            margin-top: 40px;
        }

        .carousel-item img {
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="website images\purple png.png" alt="Logo" style="height: 40px;" class="me-2">
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
                <li class="nav-item"><a class="nav-link active" href="ProxyServer.html">Proxy Server</a></li>
                <li class="nav-item"><a class="nav-link" href="CloudServer.html">Cloud Server</a></li>
                <li class="nav-item"><a class="nav-link" href="EndUser.html">End User</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="hero-section py-5">
    <div class="container">
        <div class="row">
            <!-- Main Content Area -->
            <div class="col-lg-8 mb-4">
                <div class="custom-card">
                    <h2 class="mb-4 text-primary">Welcome to Server</h2>
                    <div class="d-flex align-items-center mb-4">
                        <span class="badge bg-success me-2">ProxyServer</span>
                        <span class="text-muted">|</span>
                        <span class="badge bg-primary ms-2">Control Panel</span>
                    </div>
                    
                    <!-- Carousel -->
                    <!-- <div id="serverCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="images/slide1.jpg" class="d-block w-100" alt="Slide 1">
                            </div>
                            <div class="carousel-item">
                                <img src="images/slide2.jpg" class="d-block w-100" alt="Slide 2">
                            </div>
                            <div class="carousel-item">
                                <img src="images/slide3.jpg" class="d-block w-100" alt="Slide 3">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#serverCarousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#serverCarousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                    </div> -->
                </div>
            </div>

            <!-- Sidebar Menu -->
            <div class="col-lg-4">
                <div class="menu-card">
                    <h4 class="mb-4 text-primary">
                        <i class="bi bi-gear-fill me-2"></i>
                        Proxy Menu
                    </h4>
                    <div class="menu-links">
                        <a href="ViewMigration.jsp" class="menu-link">
                            <i class="bi bi-arrow-left-right"></i>
                            View Transfer Details
                        </a>
                        <a href="ViewVMR.jsp" class="menu-link">
                            <i class="bi bi-cpu"></i>
                            View VM Resources
                        </a>
                        <a href="ViewWork.jsp" class="menu-link">
                            <i class="bi bi-graph-up"></i>
                            View Work Load
                        </a>
                        <a href="ViewTransaction.jsp" class="menu-link">
                            <i class="bi bi-currency-exchange"></i>
                            View Transaction
                        </a>
                        <a href="ViewProxy.jsp" class="menu-link">
                            <i class="bi bi-files"></i>
                            View Proxy Files
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
</div>

<!-- Footer -->
<footer>
    <div class="container">
        <p class="mb-0">© 2025 Secure Data Transfer using Counting Bloom Filter</p>
    </div>
</footer>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Enable tooltips
    document.addEventListener('DOMContentLoaded', function() {
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        })
    });
</script>

</body>
</html>
