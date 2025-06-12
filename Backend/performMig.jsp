<!DOCTYPE html>
<html lang="en">
<%@ include file="connect.jsp"%>
<%@page import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Migration</title>
    
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

        .page-header {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }

        .alert {
            border-radius: 10px;
            margin-bottom: 1.5rem;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
            margin-bottom: 2rem;
        }

        .card-header {
            background: transparent;
            border-bottom: 1px solid rgba(0,0,0,0.05);
            padding: 1.5rem;
        }

        .card-body {
            padding: 1.5rem;
        }

        footer {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            color: white;
            padding: 1.5rem 0;
            margin-top: 3rem;
        }

        .btn-primary {
            background: linear-gradient(90deg, #4a00e0, #8e2de2);
            border: none;
            padding: 0.75rem 2rem;
            border-radius: 50px;
        }

        .btn-primary:hover {
            opacity: 0.9;
        }
    </style>
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

    <div class="container py-5">
        <div class="row">
            <!-- Main Content -->
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-center mb-4">
                            <i class="bi bi-cloud-arrow-up-fill text-primary me-2 fs-4"></i>
                            <h4 class="mb-0">Migration Status</h4>
                        </div>

                        <% String email = request.getParameter("email");
                        String urn = request.getParameter("name");
                            String cloud = request.getParameter("cloud");
                            String mcloud = request.getParameter("mcloud");
                            String oname=(String)application.getAttribute("onname");
                            
                            String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13,s14,s15="",s16,s17="",s18,s22,s23,s24,s25,s26="",s27;
                            int i=0,j=0,k=0,i12,i2;
                            String query="select * from charm_owner where name='"+urn+"' and email='"+email+"' and cloudname='"+mcloud+"'";
                            Statement st=connection.createStatement();
                            ResultSet rs= st.executeQuery(query);
                            if(rs.next()){

                                
                                try{
                                    String query2="select * from charm_cloudserver where ownername='"+oname+"' "; 
                                   Statement st2=connection.createStatement();
                                   ResultSet rs2=st.executeQuery(query2);
                            
                                   
                                   if ( rs2.next() )
                                   {
                        
                                    i=rs2.getInt(1);
                                    s2=rs2.getString(2);
                                    s3=rs2.getString(3);
                                    s4=rs2.getString(4);
                                    s5=rs2.getString(5);
                                    s6=rs2.getString(6);
                                    s7=rs2.getString(7);
                                    s8=rs2.getString(8);
                                    s9=rs2.getString(9);
                                    s10=rs2.getString(10);
                                    
                                    String tbl="";
                                    if (mcloud.equalsIgnoreCase("Rackspace")) {
                                        tbl = "charm_rackspacetresh";
                                    } else if (mcloud.equalsIgnoreCase("Amazon S3")) {
                                        tbl = "charm_amazons3tresh";
                                    } else if (mcloud.equalsIgnoreCase("Aliyun OSS")) {
                                        tbl = "charm_aliyunosstresh";
                                    } else if (mcloud.equalsIgnoreCase("Windows Azure")) {
                                        tbl = "charm_windowsazuretresh";
                                    } 
                                    
                                    if(oname.equalsIgnoreCase(s4)){
                                    String mc="insert into charm_cloudserver (fname,ct,ownername,cname,vm,mac,sk,rank,dt) values ('"+s2+"','"+s3+"','"+urn+"','"+mcloud+"','"+s6+"','"+s7+"','"+s8+"','"+s9+"','"+s10+"')";
                                    connection.createStatement().executeUpdate(mc);
                                
                                    
                                    
                                    
                                    }
                                        String ownernam=(String) application.getAttribute("onname");
                                        String query4="select * from charm_memcons where ownername='"+urn+"' and cloudname='"+mcloud+"' "; 
                                   Statement st4=connection.createStatement();
                                   ResultSet rs5=st4.executeQuery(query4);
                                   //charm_rackspacetresh
                                   String query12="select * from "+tbl+" where ownername='"+urn+"' and cloudname='"+mcloud+"' "; 
                                   Statement st12=connection.createStatement();
                                   ResultSet rs12=st12.executeQuery(query12);
                        
                                   while ( rs5.next() )
                                   {
                          
                                           
                                    i2=rs5.getInt(1);
                                    s22=rs5.getString(2);
                                    s23=rs5.getString(3);
                                    s24=rs5.getString(4);
                                    s25=rs5.getString(5);
                                    s26=rs5.getString(6);//
                                    s27=rs5.getString(7);
                                    while ( rs12.next() )
                                           {
                                            
                        
                                            i12=rs12.getInt(1);
                                            s12=rs12.getString(2);//on
                                            s13=rs12.getString(3);//cn
                                            s14=rs12.getString(4);//vm
                                            s15=rs12.getString(5);//mem
                                            s16=rs12.getString(6);//cost
                                            s17=rs12.getString(7);//thre
                                            s18=rs12.getString(8);//dt
                                           }
                        
                                   }
                        
                                SimpleDateFormat sdfDate = new SimpleDateFormat(
                                    "dd/MM/yyyy");
                        SimpleDateFormat sdfTime = new SimpleDateFormat(
                                    "HH:mm:ss");

                        Date now = new Date();
                        
                        String strDate = sdfDate.format(now);
                        String strTime = sdfTime.format(now);
                        String dt = strDate + "   " + strTime;
                        
                                   int rem=Integer.parseInt(s26);
                        
                                   int thre=Integer.parseInt(s17);
                                   int r=rem-thre;
                         
                                   if(rem>thre)
                                   {
                               
                                  
                                
                                  // insert to resource
                                 int re=Integer.parseInt(s15);
                                    int length=s3.length();
                                  
                                  int rm=rem-length;
                                  %>
                                  <div class="alert alert-info">
                                      <h5 class="mb-0">Migration Details:</h5>
                                      <p class="mb-0">Length: <%=length%> | Resource: <%=re%> | Remaining: <%=rm%> | Difference: <%=r%></p>
                                  </div>
                                  <%
                        
                        String mig="insert into charm_mig (ownername,fname,cloudname,email,migcloud,newn,dt) values('"+oname+"','"+s2+"','"+cloud+"','"+email+"','"+mcloud+"','"+urn+"','"+dt+"')";
                                    connection.createStatement().executeUpdate(mig);
                                    
                                    String memc="insert into charm_memcons (ownername,fname,cloudname,vmused,remvm,dt) values('"+urn+"','"+s2+"','"+mcloud+"','"+length+"','"+rm+"','"+dt+"')";
                                    connection.createStatement().executeUpdate(memc);//s4,urn
                                    
                                    String task="Migrated"; 
                                    
                                    String strQueryMT = "insert into charm_transaction(user,fname,cname,sk,task,dt) values('"+urn+"','"+s2+"','"+mcloud+"','"+s8+"','"+task+"','"+dt+"')";
                                    connection.createStatement().executeUpdate(strQueryMT);
                                    
                                
                                      
                                    
                                   }else{
                                       %>
                                       <div class="alert alert-danger">
                                           <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                           The Upload limit is reached
                                       </div>
                                       <%
                                   }
                                    
                                    String dc="delete from charm_cloudserver where id='"+i+"'";
                                    connection.createStatement().executeUpdate(dc);
                                    
                                    if (cloud.equalsIgnoreCase("Rackspace")) {
                                        tbl = "charm_rackspacevm";
                                    } else if (cloud.equalsIgnoreCase("Amazon S3")) {
                                        tbl = "charm_amazons3vm";
                                    } else if (cloud.equalsIgnoreCase("Aliyun OSS")) {
                                        tbl = "charm_aliyunossvm";
                                    } else if (cloud.equalsIgnoreCase("Windows Azure")) {
                                        tbl = "charm_windowsazurevm";
                                    } 
                                    
                                    String dv="delete from "+tbl+" where ownername='"+oname+"' and cloudname='"+cloud+"'";
                                    connection.createStatement().executeUpdate(dv);
                                    
                                     %>
                                     <div class="alert alert-success">
                                         <i class="bi bi-check-circle-fill me-2"></i>
                                         Successfully transferred to <%=mcloud%> and deleted your existing VM in <%=cloud%>
                                     </div>
                                     <%
                                    
                                   }else {
                                       %>
                                       <div class="alert alert-warning">
                                           <i class="bi bi-exclamation-circle-fill me-2"></i>
                                           You don't have any files in <%=cloud%> cloud
                                       </div>
                                       <%
                                   }
                                }catch(Exception e){
                                    e.printStackTrace();
                                    out.print(e.getMessage());
                                }
                                
                                
                                String del="delete * from charm_owner where email='"+email+"' and cloudname='"+mcloud+"'";
                                connection.createStatement().executeQuery(query);
                                
                                
                                
                            }else{
                                %>
                                <div class="alert alert-danger">
                                    <i class="bi bi-x-circle-fill me-2"></i>
                                    You are not registered to <%=mcloud%> cloud
                                </div>
                                <%
                            }
                        %>

                        <div class="text-center mt-4">
                            <a href="Migrate.jsp" class="btn btn-primary">
                                <i class="bi bi-arrow-left me-2"></i>Back to Migration
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sidebar -->
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <i class="bi bi-person-circle me-2"></i>
                            Owner Menu
                        </h5>
                    </div>
                    <div class="card-body">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link d-flex align-items-center" href="GetCloudCost.jsp">
                                    <i class="bi bi-currency-dollar me-2"></i>
                                    Find Cost and Memory
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link d-flex align-items-center" href="PurchaseVm.jsp">
                                    <i class="bi bi-cart-plus me-2"></i>
                                    Purchase VM
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link d-flex align-items-center" href="Vmdetails.jsp">
                                    <i class="bi bi-hdd-stack me-2"></i>
                                    My VM Details
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link d-flex align-items-center" href="Upload.jsp">
                                    <i class="bi bi-cloud-upload me-2"></i>
                                    Upload
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link d-flex align-items-center" href="Verify.jsp">
                                    <i class="bi bi-shield-check me-2"></i>
                                    Verify
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link d-flex align-items-center" href="Migrate.jsp">
                                    <i class="bi bi-arrow-left-right me-2"></i>
                                    Migrate
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link d-flex align-items-center" href="ViewOwnerDetails.jsp">
                                    <i class="bi bi-file-earmark-text me-2"></i>
                                    View Owner Files
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link d-flex align-items-center" href="index.html">
                                    <i class="bi bi-box-arrow-right me-2"></i>
                                    Log Out
                                </a>
                            </li>
                        </ul>
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

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
