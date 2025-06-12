<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Registration | Secure Cloud</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles/common.css" rel="stylesheet">
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

<div class="page-container">
    <div class="custom-card fade-in">
        <div class="text-center mb-4">
            <h2 class="fw-bold text-primary">
                <i class="bi bi-person-plus-fill me-2"></i>
                Registration Status
            </h2>
        </div>
        
        <div class="form-container slide-up">
            <%
            ArrayList list = new ArrayList();
            ServletContext context = getServletContext();
            String dirName =context.getRealPath("Gallery/");
            String paramname=null;
            String file=null;
            String a=null,b=null,c=null,d=null,image=null;
            String ee[]=null;
            String checkBok=" ";
            int ff=0;
            String bin = "";
            String uname=null;     
            String pass=null;	
            String email=null;
            String mno=null;
            String addr=null;
            String dob=null;
            String cloud=null;
            String location=null;
            String service=null;
            String sk="Rejected";
            
            FileInputStream fs=null;
            File file1 = null;	
            try {
                MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024);
                Enumeration params = multi.getParameterNames();
                while (params.hasMoreElements()) 
                {
                    paramname = (String) params.nextElement();
                    if(paramname.equalsIgnoreCase("userid"))
                    {
                        uname=multi.getParameter(paramname);
                    }
                    if(paramname.equalsIgnoreCase("pass"))
                    {
                        pass=multi.getParameter(paramname);
                    }
                    if(paramname.equalsIgnoreCase("email"))
                    {
                        email=multi.getParameter(paramname);
                    }
                    if(paramname.equalsIgnoreCase("mobile"))
                    {
                        mno=multi.getParameter(paramname);
                    }
                    if(paramname.equalsIgnoreCase("address"))
                    {
                        addr=multi.getParameter(paramname);
                    }
                    if(paramname.equalsIgnoreCase("dob"))
                    {
                        dob=multi.getParameter(paramname);
                    } 
                    if(paramname.equalsIgnoreCase("location"))
                    {
                        location=multi.getParameter(paramname);
                    }
                    if(paramname.equalsIgnoreCase("cname"))
                    {
                        cloud=multi.getParameter(paramname);
                    }
                    if(paramname.equalsIgnoreCase("pic"))
                    {
                        image=multi.getParameter(paramname);
                    }
                }
                    
                int f = 0;
                Enumeration files = multi.getFileNames();	
                while (files.hasMoreElements()) 
                {
                    paramname = (String) files.nextElement();
                    if(paramname.equals("d1"))
                    {
                        paramname = null;
                    }
                    
                    if(paramname != null)
                    {
                        f = 1;
                        image = multi.getFilesystemName(paramname);
                        String fPath = context.getRealPath("Gallery\\"+image);
                        file1 = new File(fPath);
                        fs = new FileInputStream(file1);
                        list.add(fs);
                    
                        String ss=fPath;
                        FileInputStream fis = new FileInputStream(ss);
                        StringBuffer sb1=new StringBuffer();
                        int i = 0;
                        while ((i = fis.read()) != -1) {
                            if (i != -1) {
                                String hex = Integer.toHexString(i);
                                sb1.append(hex);
                                String binFragment = "";
                                int iHex;
     
                                for(int i1= 0; i1 < hex.length(); i1++){
                                    iHex = Integer.parseInt(""+hex.charAt(i1),16);
                                    binFragment = Integer.toBinaryString(iHex);
    
                                    while(binFragment.length() < 4){
                                        binFragment = "0" + binFragment;
                                    }
                                    bin += binFragment;
                                }
                            }	
                        }
                    }		
                }
                FileInputStream fs1 = null;
                String query1="select * from charm_owner where name='"+uname+"'"; 
                Statement st1=connection.createStatement();
                ResultSet rs1=st1.executeQuery(query1);
                
                if (rs1.next()) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        User Name Already Exists
                    </div>
                    <div class="text-center mt-4">
                        <a href="Register.html" class="btn btn-outline-primary me-2">Back</a>
                        <a href="index.html" class="btn btn-primary">Home</a>
                    </div>
                    <%
                } else {
                    PreparedStatement ps=connection.prepareStatement("insert into charm_owner(name,pass,email,mobile,addr,dob,location,cloudname,imagess) values(?,?,?,?,?,?,?,?,?)");
                    ps.setString(1,uname);
                    ps.setString(2,pass);
                    ps.setString(3,email);	
                    ps.setString(4,mno);
                    ps.setString(5,addr);
                    ps.setString(6,dob);
                    ps.setString(7,location);
                    ps.setString(8,cloud);
                    ps.setBinaryStream(9, (InputStream)fs, (int)(file1.length()));	
                    
                    if(f == 0)
                        ps.setObject(9,null);
                    else if(f == 12)
                    {
                        fs1 = (FileInputStream)list.get(0);
                        ps.setBinaryStream(9,fs1,fs1.available());
                    }	
                    
                    int x=ps.executeUpdate();
                    if(x>0) {
                        request.setAttribute("msg","successfull");
                        %>
                        <div class="alert alert-success" role="alert">
                            <i class="bi bi-check-circle-fill me-2"></i>
                            Registration Successful
                        </div>
                        <div class="text-center mt-4">
                            <a href="Register.html" class="btn btn-outline-primary me-2">Back</a>
                            <a href="index.html" class="btn btn-primary">Home</a>
                        </div>
                        <%
                    }
                }
            } catch (Exception e) {
                %>
                <div class="alert alert-danger" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    Error: <%= e.getMessage() %>
                </div>
                <div class="text-center mt-4">
                    <a href="Register.html" class="btn btn-outline-primary me-2">Back</a>
                    <a href="index.html" class="btn btn-primary">Home</a>
                </div>
                <%
                e.printStackTrace();
            }
            %>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="container" style="margin-top: 13rem;">
        <p class="mb-0">© 2025 Secure Data Transfer using Counting Bloom Filter</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
