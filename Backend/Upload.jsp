<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload - Secure Cloud</title>
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
        .upload-icon {
            font-size: 3rem;
            color: #7e22ce;
            margin-bottom: 1rem;
        }
        .form-control {
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            padding: 0.75rem;
        }
        .form-control:focus {
            border-color: #7e22ce;
            box-shadow: 0 0 0 0.2rem rgba(126, 34, 206, 0.25);
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
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        }
        .sidebar-menu .nav-link {
            padding: 0.75rem 1rem;
            margin: 0.25rem 0;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        .sidebar-menu .nav-link:hover {
            background: #f0f3f8;
        }
        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: #ffffff;
            text-align: center;
            font-size: 0.9rem;
            padding: 20px 0;
            margin-top: 3rem;
        }
    </style>
    <script language="javascript" type='text/javascript'>
        function loadFileAsText() {
            var fileToLoad = document.getElementById("file").files[0];
            var fileReader = new FileReader();
            fileReader.onload = function(fileLoadedEvent) {
                var textFromFileLoaded = fileLoadedEvent.target.result;
                document.getElementById("textarea").value = textFromFileLoaded;
            };
            fileReader.readAsText(fileToLoad, "UTF-8");
        }
    </script>
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

    <!-- Main Content -->
    <div class="container py-5">
        <div class="row">
            <!-- Main Content Area -->
            <div class="col-lg-8">
                <div class="custom-card">
                    <div class="text-center mb-4">
                        <i class="bi bi-cloud-upload upload-icon"></i>
                        <h2 class="fw-bold">Upload Data</h2>
                        <p class="text-muted">Securely upload your files to the cloud</p>
                    </div>
                    
                    <form id="form1" name="form1" method="post" action="Upload1.jsp">
                        <div class="mb-4">
                            <label class="form-label fw-semibold">Select File</label>
                            <input required="required" type="file" class="form-control" name="t42" id="file" onchange="loadFileAsText()" />
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label fw-semibold">File Name</label>
                            <input required="required" name="tt" type="text" id="t42" class="form-control" />
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label fw-semibold">File Content</label>
                            <textarea name="text" id="textarea" class="form-control" rows="8"></textarea>
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label fw-semibold">MAC</label>
                            <input name="t4" type="text" id="t4" class="form-control" readonly="readonly" />
                        </div>
                        
                        <div class="text-end">
                            <button type="submit" name="Submit" class="btn btn-primary">
                                <i class="bi bi-lock-fill me-2"></i>Encrypt
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            
            <!-- Sidebar -->
            <div class="col-lg-4">
                <div class="sidebar-menu">
                    <h5 class="fw-bold mb-3">Owner Menu</h5>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center" href="GetCloudCost.jsp">
                                <i class="bi bi-currency-dollar me-2"></i>Find Cost and Memory
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center" href="PurchaseVm.jsp">
                                <i class="bi bi-cart-fill me-2"></i>Purchase VM
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center" href="Vmdetails.jsp">
                                <i class="bi bi-hdd-fill me-2"></i>My VM Details
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active d-flex align-items-center" href="Upload.jsp">
                                <i class="bi bi-cloud-upload-fill me-2"></i>Upload
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center" href="Verify.jsp">
                                <i class="bi bi-shield-check me-2"></i>Verify
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center" href="Migrate.jsp">
                                <i class="bi bi-arrow-left-right me-2"></i>Migrate
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center" href="VReq.jsp">
                                <i class="bi bi-envelope-fill me-2"></i>View Request
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center" href="ViewOwnerDetails.jsp">
                                <i class="bi bi-folder-fill me-2"></i>View Owner Files
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center" href="index.html">
                                <i class="bi bi-box-arrow-right me-2"></i>Log Out
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
