<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewFarmerProduct.aspx.cs" Inherits="Agri_Energy_PROG7311_POE.ViewFarmerProduct" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Resource Submission Form</title>

     <link rel="stylesheet" href="~/MyCSS/StyleSheet.css" />
    <style type="text/css">
        body
        {
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
                        <li class="nav-item">
                            <a class="nav-link" href="Default.aspx">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

    
        <header class="bg-success text-white text-center py-5">
            <div class="container">
                <h1>Employee Dashboard</h1>
                <h2>View and Filter Products</h2>
            </div>
        </header>

        <hr />

        <div class="container mt-4">
            <div class="row">
            
                <label for="Filter">Select filtering option:</label>
                <asp:DropDownList ID="ddlFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged" CssClass="container-fluid">
                    <asp:ListItem Value="ProductionDate ASC">Creation Date (Oldest to Newest)</asp:ListItem>
                    <asp:ListItem Value="ProductionDate DESC">Creation Date (Newest to Oldest)</asp:ListItem>
                    <asp:ListItem Value="ProductCategory ASC">Category (A-Z)</asp:ListItem>
                    <asp:ListItem Value="ProductCategory DESC">Category (Z-A)</asp:ListItem>
                </asp:DropDownList>
                <div>
                    <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </div>
        </div>

      
        <div class="container mt-5">
            <h2>Products found:</h2>
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
