<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Agri_Energy_PROG7311_POE.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <title>Resource Submission Form</title>
    <!-- My CSS -->
     <link rel="stylesheet" href="~/MyCSS/StyleSheet.css" />
    <style type="text/css">
        body {
            background-color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
                            <a class="nav-link" href="Contact.aspx">Contact</a>
                        </li>

                         <li class="nav-item dropdown">
                         <a class="nav-link dropdown-toggle" href="#" id="farmerDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           Farmer
                         </a>
                         <div class="dropdown-menu" aria-labelledby="farmerDropdown">
                         <a class="dropdown-item" href="FarmerMarketPlace.aspx">Add farming product</a>
                         <a class="dropdown-item" href="GreenEnergyMarketPlace.aspx">Add green-energy product</a>
                         <a class="dropdown-item" href="FarmerHub.aspx">Discussion board</a>
                        </div>

                         <li class="nav-item dropdown">
                         <a class="nav-link dropdown-toggle" href="#" id="educationDropDown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           Education
                         </a>
                         <div class="dropdown-menu" aria-labelledby="educationDropDown">
                         <a class="dropdown-item" href="EducationalResources.aspx">Apply now</a>
                        </div>

                         <li class="nav-item dropdown">
                         <a class="nav-link dropdown-toggle" href="#" id="projectDropDown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           Project
                         </a>
                         <div class="dropdown-menu" aria-labelledby="projectDropDown">
                         <a class="dropdown-item" href="ProjectFunding.aspx">Fund project</a>
                         <a class="dropdown-item" href="ProjectFunding.aspx">Join project</a>
                        </div>
                         
                        <li class="nav-item">
                            <a class="nav-link" href="Default.aspx">Logout</a>
                        </li>
                        <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Green"></asp:Label>
                    </ul>
                </div>
            </div>
        </nav>

        <header class="bg-success text-white text-center py-5">
            <div class="container">
                <h1>Common dashboard</h1>
                <h2>Buy products from our website in one-click!</h2>
            </div>
        </header>                                                                                                     

            <hr />
        
                <div class="mt-5">
                    <h2>Our products</h2> 
                    <asp:Repeater ID="ProductsRepeater" runat="server">
                        <ItemTemplate>
                            <div class="card mb-3">
                                <div class="row no-gutters">
                                    <div class="col-md-5">
                                        <img src='<%#Eval("ProductImage") %>' class="card-img-top" alt="Product Image" style="width: 300px; margin-right: 10px;" />
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title">Product name:<%#Eval("Name") %></h5>
                                            <p class="card-text">Description: <%# Eval("Description")%></p>
                                            <p class="card-text">Price R<%# Eval("ProductPrice")%></p>
                                            <p class="card-text">Available stock: <%# Eval("Quantity")%></p>
                                            <p class="card-text">Production date: <%# Eval("ProductionDate")%></p>
                                            <p class="card-text">Category: <%# Eval("ProductCategory")%></p>
                                            <!-- Button to allow user to buy product-->
                                            <asp:Button ID="BuyProductBtn" runat="server" Text="Buy Product" OnClick ="BuyProductBtn_Click"  CommandName="Buy" CssClass="btn btn-primary" />
                                            <asp:Button ID="EnquireSupplierBtn" runat="server" Text="Enquire Supplier" OnClick ="EnquireSupplierBtn_Click" CommandName="Enquire" CssClass="btn btn-secondary" />                                       
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>       
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

