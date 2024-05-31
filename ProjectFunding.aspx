<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectFunding.aspx.cs" Inherits="Agri_Energy_PROG7311_POE.ProjectFunding" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Collaborate or join a project.</title>
  
    <link rel="stylesheet" href="~/MyCSS/StyleSheet.css" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .course-card {
            border: 1px solid #dee2e6;
            border-radius: 8px;
            margin-bottom: 20px;
            overflow: hidden;
            transition: box-shadow 0.3s ease-in-out;
           
            width: 350px;
            height: 500px;
        }
        .course-card:hover {
            box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.1);
        }
        .course-card img {
            width: 100%;
            height: 150px; 
            object-fit: cover; 
        }
        .course-card-body {
            padding: 20px;
        }
        .course-card .btn {
            width: 100%;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Agri-Ease</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Default.aspx">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="About.aspx">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Support.aspx">Contact</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <header class="bg-success text-white text-center py-5">
            <div class="container">
                <h1>Project and funding</h1>
                <p>Explore and enroll in our once-off funding opportunities.</p>
            </div>
        </header>
        <div class="container my-5">
            <div class="row">
             
                <asp:Repeater ID="ProjectsRepeater" runat="server" OnItemCommand="ProjectsRepeater_ItemCommand">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="course-card">
                                <img src='<%# Eval("ImagePath") %>' alt="Project Image"/>
                                <div class="course-card-body">
                                    <h5 class="card-title"><%# Eval("Title") %></h5>
                                    <p class="card-text"><%# Eval("Description") %></p>
                                    <p class="card-text"><%# Eval("FundingNeeded") %></p>
                                    <asp:Button ID="FundBtn" runat="server" CssClass="btn btn-primary" Text="Fund Now" OnClick="FundBtn_Click" /> 
                                    <asp:Button ID="JoinBtn" runat="server" CssClass="btn btn-primary" Text="Join Now" OnClick="JoinBtn_Click" /> 
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0"></script>
</body>
</html>
