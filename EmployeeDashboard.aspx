<%@ Page Title="Home Page" Language="C#" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="Agri_Energy_PROG7311_POE.EmployeeDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="<%= ResolveUrl("~/MyCSS/StyleSheet.css") %>" />
    <style type="text/css">
        body {
            background-color: darkolivegreen;
            font-family: Arial, sans-serif;
            color: white;
        }

        h1, h2 {
            color: white;
        }

        .navbar {
            background-color: #556b2f; 
        }

        .navbar-brand, .nav-link {
            color: white !important;
        }

        .navbar-light .navbar-toggler {
            border-color: rgba(255, 255, 255, 0.1);
        }

        .navbar-light .navbar-toggler-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba%2855, 55, 55, 1%29' stroke-width='2' linecap='round' linejoin='round' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }

        .dropdown-menu {
            background-color: #8fbc8f; 
        }

        .dropdown-item {
            color: black !important;
        }

        .dropdown-item:hover {
            background-color: #6b8e23; 
            color: white !important;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
        }

        .locations-container {
            margin-top: 20px;
        }

        .locations p {
            background-color: rgba(255, 255, 255, 0.2);
            padding: 10px;
            border-radius: 5px;
            margin: 5px 0;
        }

        .footer {
            background-color: #556b2f;
            color: white;
            text-align: center;
            padding: 10px;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="#">Employee Dashboard</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
                    <a class="nav-link" href="Contact.aspx">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Dashboard.aspx">Dashboard</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="employeeDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Manage Farmer
                    </a>
                    <div class="dropdown-menu" aria-labelledby="employeeDropdown">
                        <a class="dropdown-item" href="EmployeeHub.aspx">Add Farmer</a>
                        <a class="dropdown-item" href="ViewFarmerProduct.aspx">View Farmers Products</a>
                    </div>
                </li>
                <li class="nav-item">
                    <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Green"></asp:Label>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-4">
        <h1>Welcome to the Employee Dashboard</h1>
        <p>Use the navigation bar to access different sections of the dashboard.</p>

        <div class="locations-container">
            <section class="locations" aria-labelledby="gettingStartedTitle">
                <h2 id="gettingStartedTitle" class="h4">Our Locations:</h2>
                <p>Western Cape</p>
                <p>Gauteng</p>
                <p>Eastern Cape</p>
                <p>KwaZulu-Natal</p>
                <p>Northern Cape</p>
                <p>Limpopo</p>
                <p>Mpumalanga</p>
            </section>
        </div>
    </div>

    <footer class="footer">
        <p>&copy; 2024 Agri-Energy. All rights reserved.</p>
    </footer>
</body>
</html>
