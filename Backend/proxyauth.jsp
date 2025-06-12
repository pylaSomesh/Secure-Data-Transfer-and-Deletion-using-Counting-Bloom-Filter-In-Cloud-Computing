<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Authentication Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
        }
        .auth-container {
            max-width: 500px;
            margin: 80px auto;
        }
        .auth-card {
            background: white;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        }
        .auth-icon {
            font-size: 2rem;
            color: #7e22ce;
            margin-bottom: 1rem;
        }
        .result-message {
            text-align: center;
            margin-top: 2rem;
        }
        .result-message.success {
            color: #10b981;
        }
        .result-message.error {
            color: #ef4444;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="auth-container">
            <div class="auth-card">
                <div class="text-center mb-4">
                    <i class="bi bi-shield-lock auth-icon"></i>
                    <h2 class="fw-bold">Authentication Result</h2>
                </div>
                
                <%
                String name=request.getParameter("userid");      
                String pass=request.getParameter("pass");
   
                try {
                    String sql="SELECT * FROM charm_proxy where username='"+name+"' and password='"+pass+"' ";
                    Statement stmt = connection.createStatement();
                    ResultSet rs =stmt.executeQuery(sql);
                    String utype="";
                    
                    if(rs.next()) {
                        response.sendRedirect("ProxyServerMain.jsp");
                    } else {
                        response.sendRedirect("wronglogin.html");
                    }
                } catch(Exception e) {
                    %>
                    <div class="result-message error">
                        <i class="bi bi-exclamation-circle me-2"></i>
                        <%= e.getMessage() %>
                    </div>
                    <%
                    e.printStackTrace();
                }
                %>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>