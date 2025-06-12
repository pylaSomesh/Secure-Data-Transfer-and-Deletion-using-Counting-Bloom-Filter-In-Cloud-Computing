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
    <title>Upload</title>
    
    <!-- Bootstrap CSS -->
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
        .result-message {
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
        }
        .result-message.success {
            background-color: #d1e7dd;
            color: #0f5132;
            border: 1px solid #badbcc;
        }
        .result-message.error {
            background-color: #f8d7da;
            color: #842029;
            border: 1px solid #f5c2c7;
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
                <li class="nav-item"><a class="nav-link" href="index.html">Home Page</a></li>
                <li class="nav-item"><a class="nav-link active" href="DataOwner.html">Data Owner</a></li>
                <li class="nav-item"><a class="nav-link" href="ProxyServer.html">Proxy Server</a></li>
                <li class="nav-item"><a class="nav-link" href="CloudServer.html">Cloud Server</a></li>
                <li class="nav-item"><a class="nav-link" href="EndUser.html">End User</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="custom-card">
                <%
                String ownerName=(String)application.getAttribute("onname");
                String oCName=(String)application.getAttribute("ocl");
                %>

                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="mb-0">Upload Data</h2>
                    <small class="text-muted"><%=new java.util.Date()%></small>
                </div>

                <%
                try {
                    String file=request.getParameter("t42");
                    String cont=request.getParameter("text2");
                    String mac =request.getParameter("t4");
                    String cloud=request.getParameter("cloud");
                    
                    SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
                    SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

                    Date now = new Date();

                    String strDate = sdfDate.format(now);
                    String strTime = sdfTime.format(now);
                    String dt = strDate + "   " + strTime;
                    
                    KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
                    Cipher encoder = Cipher.getInstance("RSA");
                    KeyPair kp = kg.generateKeyPair();

                    Key pubKey = kp.getPublic();

                    byte[] pub = pubKey.getEncoded();
                    String pk = String.valueOf(pub);
                    String rank="0";
                    Statement st=connection.createStatement();

                    String user="Data Owner";
                    String task="Upload";
                    
                    String ownernam=(String) application.getAttribute("onname");
                    
                    String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13,s14,s15="",s16,s17="",s18;
                    int i=0,j=0,k=0,i12;

                    String query4="select * from charm_memcons where ownername='"+ownernam+"' and cloudname='"+cloud+"' "; 
                    Statement st4=connection.createStatement();
                    ResultSet rs=st4.executeQuery(query4);
                    
                    String tbl="";
                    if (cloud.equalsIgnoreCase("Rackspace")) {
                        tbl = "charm_rackspacetresh";
                    } else if (cloud.equalsIgnoreCase("Amazon S3")) {
                        tbl = "charm_amazons3tresh";
                    } else if (cloud.equalsIgnoreCase("Aliyun OSS")) {
                        tbl = "charm_aliyunosstresh";
                    } else if (cloud.equalsIgnoreCase("Windows Azure")) {
                        tbl = "charm_windowsazuretresh";
                    } 
                    
                    String query12="select * from "+tbl+" where ownername='"+ownernam+"' and cloudname='"+cloud+"' "; 
                    Statement st12=connection.createStatement();
                    ResultSet rs12=st12.executeQuery(query12);

                    while ( rs.next() ) {
                        i=rs.getInt(1);
                        s2=rs.getString(2);
                        s3=rs.getString(3);
                        s4=rs.getString(4);
                        s5=rs.getString(5);
                        s6=rs.getString(6);
                        s7=rs.getString(7);
                        while ( rs12.next() ) {
                            i12=rs12.getInt(1);
                            s12=rs12.getString(2);
                            s13=rs12.getString(3);
                            s14=rs12.getString(4);
                            s15=rs12.getString(5);
                            s16=rs12.getString(6);
                            s17=rs12.getString(7);
                            s18=rs12.getString(8);
                        }
                    }
                    
                    out.print(s17+" , "+s6 );
                    int rem=Integer.parseInt(s6);
                    
                    int thre=Integer.parseInt(s17);
                    int r=rem-thre;
                    if(rem>thre) {
                        int length=cont.length();
                        int re=Integer.parseInt(s15);
                        int rm=rem-length;
                        %>
                        <div class="alert alert-info">
                            <h5>Processing Details:</h5>
                            <p>Length: <%=length%></p>
                            <p>RE: <%=re%></p>
                            <p>RM: <%=rm%></p>
                            <p>R: <%=r%></p>
                        </div>
                        <%
                        String strQuery = "insert into charm_memcons(ownername,fname,cloudname,vmused,remvm,dt) values('"+ownernam+"','"+file+"','"+oCName+"','"+length+"','"+rm+"','"+dt+"')";
                        connection.createStatement().executeUpdate(strQuery);
                        
                        String strQuery2 = "insert into charm_transaction(user,fname,cname,sk,task,dt) values('"+user+"','"+file+"','"+oCName+"','"+pk+"','"+task+"','"+dt+"')";
                        connection.createStatement().executeUpdate(strQuery2);
                        
                        Statement stss=connection.createStatement();
                        String status="waiting";
                        stss.executeUpdate("insert into charm_ownerdetails(fname,ownername,mac,sk,dt) values ('"+file+"','"+ownernam+"','"+mac+"','"+pk+"','"+dt+"')"); 
                    
                        String vm="VM1";
                        Statement st2=connection.createStatement();
                        st2.executeUpdate("insert into  charm_cloudserver(fname,ct,ownername,cname,vm,mac,sk,rank,dt) values ('"+file+"','"+cont+"','"+ownernam+"','"+oCName+"','"+vm+"','"+mac+"','"+pk+"','"+rank+"','"+dt+"')"); 
                        
                        Statement st5=connection.createStatement();
                        st5.executeUpdate("insert into  charm_proxyserver(fname,ownername,cname,vm,mac,sk,mem,dt) values ('"+file+"','"+ownernam+"','"+oCName+"','"+vm+"','"+mac+"','"+pk+"','"+length+"','"+dt+"')"); 
                        %>
                        <div class="result-message success">
                            <h4><i class="bi bi-check-circle-fill me-2"></i>Success!</h4>
                            <p>Data Uploaded Successfully</p>
                        </div>
                        <%
                    } else {
                        %>
                        <div class="result-message error">
                            <h4><i class="bi bi-exclamation-triangle-fill me-2"></i>Error</h4>
                            <p>The Upload limit is reached</p>
                        </div>
                        <%
                    }
                    connection.close();
                } catch(Exception e) {
                    %>
                    <div class="result-message error">
                        <h4><i class="bi bi-exclamation-triangle-fill me-2"></i>Error</h4>
                        <p><%=e.getMessage()%></p>
                    </div>
                    <%
                    e.printStackTrace();
                }
                %>

                <div class="text-center mt-4">
                    <a href="DataOwnerMain.jsp" class="btn btn-primary">
                        <i class="bi bi-arrow-left me-2"></i>Back to Dashboard
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
