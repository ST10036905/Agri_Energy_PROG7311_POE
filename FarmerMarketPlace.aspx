<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FarmerMarketPlace.aspx.cs" Inherits="Agri_Energy_PROG7311_POE.FarmerMarketPlace" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Green Market Place</title>
    
    <link rel="stylesheet" href="~/MyCSS/StyleSheet.css" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-header {
            background: #28a745;
            color: #fff;
            padding: 20px;
            border-radius: 8px 8px 0 0;
            text-align: center;
        }
        .form-container {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 30px auto;
            max-width: 900px;
            padding: 20px;
        }
        .product-container {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            background: #fff;
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
                    </ul>
                </div>
            </div>
        </nav>

    
        <header class="bg-success text-white text-center py-5">
            <div class="container">
                <h1>Farmer Market Place</h1>
                <p>List and sell your farming products.</p>
            </div>
        </header>

        <div class="container my-5">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <h2 class="mb-4">Add New Product</h2>
                    <div class="mb-3">
                        <label for="ProductNameTxtBox" class="form-label">Product Name:</label>
                        <asp:TextBox ID="ProductNameTxtBox" runat="server" CssClass="form-control" placeholder="Enter product name" Width="100%"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="ProductDescriptionTxtBox" class="form-label">Product Description:</label>
                        <asp:TextBox ID="ProductDescriptionTxtBox" runat="server" CssClass="form-control" placeholder="Enter product description" Width="100%" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="ProductPriceTxtBox" class="form-label">Product Price:</label>
                        <asp:TextBox ID="ProductPriceTxtBox" runat="server" CssClass="form-control" placeholder="Enter product price" Width="100%"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="DateTxtBox" class="form-label">Production Date:</label>
                        <asp:TextBox ID="DateTxtBox" type="date" runat="server" CssClass="form-control" placeholder="Enter production date" Width="100%"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="ProductQntyTxtBox" class="form-label">Product Quantity:</label>
                        <asp:TextBox ID="ProductQntyTxtBox" runat="server" CssClass="form-control" placeholder="Enter product quantity" Width="100%"></asp:TextBox>
                    </div>
                     <div class="mb-3">
                        <label for="ProductImageTxtBox" class="form-label">Product Image:</label>
                        <asp:TextBox ID="ProductImageTxtBox" runat="server" CssClass="form-control" placeholder="Enter product image URL" Width="100%"></asp:TextBox>
                    </div>
                      <label for="ProductCategoryDropDownList" class="form-label">Category:</label>
                        <asp:DropDownList ID="ProductCategoryDropDownList" runat="server" CssClass="form-select" Width="100%">
                            <asp:ListItem Text="Select Category" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Fruits" Value="Fruits"></asp:ListItem>
                            <asp:ListItem Text="Vegetables" Value="Vegetables"></asp:ListItem>
                            <asp:ListItem Text="Grains" Value="Grains"></asp:ListItem>
                            <asp:ListItem Text="Poultry" Value="Poultry"></asp:ListItem>
                            <asp:ListItem Text="Fertilizers" Value="Fertilizers"></asp:ListItem>
                            <asp:ListItem Text="Livestock" Value="Livestock"></asp:ListItem>
                            <asp:ListItem Text="Other crops" Value="Other crops"></asp:ListItem>
                        </asp:DropDownList>
                    <div class="mb-3">
                    <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red"></asp:Label>
                    <asp:Label ID="SuccessMessageLabel" runat="server" ForeColor="Green"></asp:Label>
                    </div>
                    <div class="d-flex justify-content-between">
                        <asp:Button ID="AddProductBtn" runat="server" CssClass="btn btn-success" Text="Add product to market" OnClick="AddProductBtn_Click" />
                        <asp:Button ID="CancelBtn" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="CancelBtn_Click" />
                    </div>
             
                </div>  

                <div class="mt-5">
                    <h2>My products</h2> 
                    <asp:Repeater ID="ProductsRepeater" runat="server">
                        <ItemTemplate>
                            <div class="card mb-3">
                                <div class="row no-gutters">
                                    <div class="col-md-5">
                                        <img src='<%#Eval("ProductImage") %>' class="card-img-top" alt="Product Image" />
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
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div> 
        </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        </form>
  </body>
</html>

