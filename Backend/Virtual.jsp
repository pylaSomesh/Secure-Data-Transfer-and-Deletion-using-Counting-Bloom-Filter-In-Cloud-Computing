<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Virtual Machine Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
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
            transition: color 0.3s ease;
        }

        .nav-link:hover, .nav-link.active {
            color: #4a00e0 !important;
        }

        .sidebar {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            padding: 25px;
            height: calc(100vh - 100px);
            position: sticky;
            top: 20px;
        }

        .sidebar .nav-link {
            margin: 8px 0;
            padding: 12px 20px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .sidebar .nav-link:hover {
            background: #f0f3f8;
        }

        .sidebar .nav-link.active {
            background: linear-gradient(90deg, #7e22ce, #9333ea);
            color: white !important;
        }

        .main-content {
            padding: 20px;
        }

        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .header-banner {
            background: linear-gradient(135deg, #7e22ce, #9333ea);
            color: white;
            padding: 2rem;
            border-radius: 16px;
            margin-bottom: 2rem;
        }

        .alert {
            border-radius: 12px;
            border: none;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }

        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: #ffffff;
            text-align: center;
            font-size: 0.9rem;
            padding: 20px 0;
            margin-top: 16rem;
        }

        @media (max-width: 768px) {
            .sidebar {
                height: auto;
                margin-bottom: 20px;
            }
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
                <li class="nav-item"><a class="nav-link active" href="DataOwner.html">Data Owner</a></li>
                <li class="nav-item"><a class="nav-link" href="ProxyServer.html">Proxy Server</a></li>
                <li class="nav-item"><a class="nav-link" href="CloudServer.html">Cloud Server</a></li>
                <li class="nav-item"><a class="nav-link" href="EndUser.html">End User</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid py-4">
    <div class="row g-4">
        <!-- Sidebar -->
        <div class="col-md-3">
            <div class="sidebar">
                <h4 class="mb-4 fw-bold text-primary">Owner Menu</h4>
                <div class="nav flex-column">
                    <a href="GetCloudCost.jsp" class="nav-link d-flex align-items-center">
                        <i class="bi bi-currency-dollar me-2"></i>Find Cost and Memory
                    </a>
                    <a href="PurchaseVm.jsp" class="nav-link d-flex align-items-center">
                        <i class="bi bi-cart-plus me-2"></i>Purchase VM
                    </a>
                    <a href="Vmdetails.jsp" class="nav-link d-flex align-items-center">
                        <i class="bi bi-hdd-stack me-2"></i>My VM Details
                    </a>
                    <a href="Upload.jsp" class="nav-link d-flex align-items-center">
                        <i class="bi bi-cloud-upload me-2"></i>Upload
                    </a>
                    <a href="Verify.jsp" class="nav-link d-flex align-items-center">
                        <i class="bi bi-shield-check me-2"></i>Verify
                    </a>
                    <a href="Migrate.jsp" class="nav-link d-flex align-items-center">
                        <i class="bi bi-arrow-left-right me-2"></i>Migrate
                    </a>
                    <a href="VReq.jsp" class="nav-link d-flex align-items-center">
                        <i class="bi bi-envelope me-2"></i>View Request
                    </a>
                    <a href="ViewOwnerDetails.jsp" class="nav-link d-flex align-items-center">
                        <i class="bi bi-file-text me-2"></i>View Owner Files
                    </a>
                    <a href="index.html" class="nav-link d-flex align-items-center">
                        <i class="bi bi-box-arrow-right me-2"></i>Log Out
                    </a>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-9">
            <div class="main-content">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title mb-4 fw-bold text-primary">
                            <i class="bi bi-hdd-rack me-2"></i>VM Allocation Details
                        </h2>
                        
                        <%
                        	try {
                        		String cn = request.getParameter("cloudn");
                        		String vm = request.getParameter("vm");
                        		String vmm = request.getParameter("vmm");//ch
                        		String price = "";
                        		int threshold=0;
                        		String tbl = "";
                        		String oname=(String)application.getAttribute("onname");
                        %>
                        <div class="alert alert-info border-0 shadow-sm">
                            <h4 class="alert-heading mb-2">
                                <i class="bi bi-cloud me-2"></i>Cloud Provider: <%=cn %>
                            </h4>
                        </div>
                        <%
                        		if (cn.equalsIgnoreCase("Rackspace")) {
                        			tbl = "charm_Rvmcost";
                        		} else if (cn.equalsIgnoreCase("Amazon S3")) {
                        			tbl = "charm_Avmcost";
                        		} else if (cn.equalsIgnoreCase("Windows Azure")) {
                        			tbl = "charm_Wvmcost";
                        		} else if (cn.equalsIgnoreCase("Aliyun OSS")) {
                        			tbl = "charm_AOvmcost";
                        		}
                        %>
                        <div class="alert alert-secondary border-0 shadow-sm">
                            <p class="mb-0">
                                <i class="bi bi-table me-2"></i>Selected Table: <%=tbl %>
                            </p>
                        </div>
                        <%
                        		String query9 = "SELECT * FROM " + tbl + " where memory='"+vmm+"'";

                        		Statement st15 = connection.createStatement();
                        		ResultSet rs15 = st15.executeQuery(query9);

                        		Date date1 = null, date2 = null;
                        		Date nowor = null;

                        		while (rs15.next()) {

                        			String d1 = rs15.getString(2);
                        			String d2 = rs15.getString(3);
                        			String clouname = rs15.getString(4);

                        			if (clouname.equalsIgnoreCase(cn)
                        					&& d1.equalsIgnoreCase(vmm)) {
                        				int v = vmm.length();
                        				if (v > 0 && v <=20000 ) {
                        					threshold = 500;
                        				}else
                        				if (v > 20001 && v <=40000 ) {
                        					threshold = 1000;
                        				}else
                          				if (v > 40001 && v <=60000 ) {
                        					threshold = 1500;
                        				}else
                          				if (v > 60001 && v <=80000 ) {
                        					threshold = 2000;
                        				}else
                          				if (v > 80001 && v <=100000 ) {
                        					threshold = 2500;
                        				}
                          				
                        				price = d2;

                        				SimpleDateFormat sdfDate = new SimpleDateFormat(
                        						"dd/MM/yyyy");
                        				SimpleDateFormat sdfTime = new SimpleDateFormat(
                        						"HH:mm:ss");

                        				Date now = new Date();

                        				String strDate = sdfDate.format(now);
                        				String strTime = sdfTime.format(now);
                        				String dt = strDate + "   " + strTime;
                        				int a=0;
                        				String strQuery4 = "insert into charm_memcons(ownername,cloudname,vmused,remvm,dt) values('"+oname+"','"
                        				+ cn
                        				+ "','"
                        				+ a
                        				+ "','"
                        				+ vmm
                        				+ "','" + dt + "')";
                        				connection.createStatement().executeUpdate(strQuery4);

                        				if (cn.equalsIgnoreCase("Rackspace")) {
                        					String strQuery25 = "insert into charm_RackspaceVm(ownername,cloudname,vm,vmmem,cost,dt) values('"+oname+"','"
                        							+ cn
                        							+ "','"
                        							+ vm
                        							+ "','"
                        							+ vmm
                        							+ "','"
                        							+ price + "','" + dt + "')";
                        					connection.createStatement().executeUpdate(strQuery25);
                        					
                        					String strQueryT = "insert into charm_RackspaceTresh(ownername,cloudname,vm,vmmem,cost,threshold,dt) values('"+oname+"','"
                        							+ cn
                        							+ "','"
                        							+ vm
                        							+ "','"
                        							+ vmm
                        							+ "','"
                        							+ price + "','"+threshold+"','" + dt + "')";
                        					connection.createStatement().executeUpdate(strQueryT);
                        %>
                        <div class="alert alert-success border-0 shadow-sm">
                            <h4 class="alert-heading mb-3">
                                <i class="bi bi-check-circle-fill me-2"></i>VM Created Successfully
                            </h4>
                            <p class="mb-2"><strong>Virtual Machine:</strong> <%=vm%> of <%=vmm%> in <%=cn%></p>
                            <p class="mb-2"><strong>Cost:</strong> Rs.<%=price%></p>
                            <p class="mb-0"><strong>Threshold:</strong> <%=threshold %></p>
                        </div>
                        <%
                        	}
                        				if (cn.equalsIgnoreCase("Amazon S3")) {
                        					String strQuery25 = "insert into charm_AmazonS3Vm(ownername,cloudname,vm,vmmem,cost,dt) values('"+oname+"','"
                        							+ cn
                        							+ "','"
                        							+ vm
                        							+ "','"
                        							+ vmm
                        							+ "','"
                        							+ price + "','" + dt + "')";
                        					connection.createStatement().executeUpdate(strQuery25);
                        					
                        					String strQueryT = "insert into charm_AmazonS3Tresh(ownername,cloudname,vm,vmmem,cost,threshold,dt) values('"+oname+"','"
                        							+ cn
                        							+ "','"
                        							+ vm
                        							+ "','"
                        							+ vmm
                        							+ "','"
                        							+ price + "','"+threshold+"','" + dt + "')";
                        					connection.createStatement().executeUpdate(strQueryT);
                        %>
                        <div class="alert alert-success border-0 shadow-sm">
                            <h4 class="alert-heading mb-3">
                                <i class="bi bi-check-circle-fill me-2"></i>VM Created Successfully
                            </h4>
                            <p class="mb-2"><strong>Virtual Machine:</strong> <%=vm%> of <%=vmm%> in <%=cn%></p>
                            <p class="mb-2"><strong>Cost:</strong> Rs.<%=price%></p>
                            <p class="mb-0"><strong>Threshold:</strong> <%=threshold %></p>
                        </div>
                        <%
                        	}

                        				if (cn.equalsIgnoreCase("Windows Azure")) {
                        					String strQuery25 = "insert into charm_WindowsAzureVm(ownername,cloudname,vm,vmmem,cost,dt) values('"+oname+"','"
                        							+ cn
                        							+ "','"
                        							+ vm
                        							+ "','"
                        							+ vmm
                        							+ "','"
                        							+ price + "','" + dt + "')";
                        					connection.createStatement().executeUpdate(strQuery25);
                        					
                        					String strQueryT = "insert into charm_WindowsAzureTresh(ownername,cloudname,vm,vmmem,cost,threshold,dt) values('"+oname+"','"
                        							+ cn
                        							+ "','"
                        							+ vm
                        							+ "','"
                        							+ vmm
                        							+ "','"
                        							+ price + "','"+threshold+"','" + dt + "')";
                        					connection.createStatement().executeUpdate(strQueryT);
                        %>
                        <div class="alert alert-success border-0 shadow-sm">
                            <h4 class="alert-heading mb-3">
                                <i class="bi bi-check-circle-fill me-2"></i>VM Created Successfully
                            </h4>
                            <p class="mb-2"><strong>Virtual Machine:</strong> <%=vm%> of <%=vmm%> in <%=cn%></p>
                            <p class="mb-2"><strong>Cost:</strong> Rs.<%=price%></p>
                            <p class="mb-0"><strong>Threshold:</strong> <%=threshold %></p>
                        </div>
                        <%
                        	}

                        				if (cn.equalsIgnoreCase("Aliyun OSS")) {
                        					String strQuery25 = "insert into charm_AliyunOSSVm(ownername,cloudname,vm,vmmem,cost,dt) values('"+oname+"','"
                        							+ cn
                        							+ "','"
                        							+ vm
                        							+ "','"
                        							+ vmm
                        							+ "','"
                        							+ price + "','" + dt + "')";
                        					connection.createStatement().executeUpdate(strQuery25);
                        					
                        					String strQueryT = "insert into charm_AliyunOSSTresh(ownername,cloudname,vm,vmmem,cost,threshold,dt) values('"+oname+"','"
                        							+ cn
                        							+ "','"
                        							+ vm
                        							+ "','"
                        							+ vmm
                        							+ "','"
                        							+ price + "','"+threshold+"','" + dt + "')";
                        					connection.createStatement().executeUpdate(strQueryT);
                        %>
                        <div class="alert alert-success border-0 shadow-sm">
                            <h4 class="alert-heading mb-3">
                                <i class="bi bi-check-circle-fill me-2"></i>VM Created Successfully
                            </h4>
                            <p class="mb-2"><strong>Virtual Machine:</strong> <%=vm%> of <%=vmm%> in <%=cn%></p>
                            <p class="mb-2"><strong>Cost:</strong> Rs.<%=price%></p>
                            <p class="mb-0"><strong>Threshold:</strong> <%=threshold %></p>
                        </div>
                        <%
                        	}
                        			}
                        		}
                        	} catch (Exception e) {
                        		e.printStackTrace();
                        %>
                        <div class="alert alert-danger border-0 shadow-sm">
                            <h4 class="alert-heading mb-2">
                                <i class="bi bi-exclamation-triangle-fill me-2"></i>Error
                            </h4>
                            <p class="mb-0">An error occurred while processing your request.</p>
                        </div>
                        <%
                        	}
                        %>
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

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

</body>
</html>
