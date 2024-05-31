<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GreenEnergyMarketPlace.aspx.cs" Inherits="Agri_Energy_PROG7311_POE.GreenEnergyMarketPlace" %>
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
                <h1>Green Energy Market Place</h1>
                <p>List and sell your green energy products.</p>
            </div>
        </header>

   
        <div class="container my-5 form-container">
           
            <div class="mb-4">
                <h5>List a new product</h5>
                <asp:Label ID="ProductNameLabel" runat="server" Text="Product Name" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="ProductNameTxtBox" runat="server" CssClass="form-control mb-2" placeholder="Enter product name"></asp:TextBox>
                
                <asp:Label ID="ProductDescriptionLabel" runat="server" Text="Product Description" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="ProductDescriptionTxtBox" runat="server" CssClass="form-control mb-2" TextMode="MultiLine" Rows="3" placeholder="Enter product description"></asp:TextBox>
                
                <asp:Label ID="ProductPriceLabel" runat="server" Text="Product Price" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="ProductPriceTxtBox" runat="server" CssClass="form-control mb-2" placeholder="Enter product price"></asp:TextBox>
                
                <asp:Label ID="ProductQuantityLabel" runat="server" Text="Product Quantity" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="ProductQuantityTxtBox" runat="server" CssClass="form-control mb-2" placeholder="Enter product quantity"></asp:TextBox>
                
                <asp:Label ID="AvailableDateLabel" runat="server" Text="Avalaible date" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="DateTxtBox" runat="server" type="date" CssClass="form-control mb-2" placeholder="Enter date available"></asp:TextBox>

                 <label for="ProductCategoryDropDownList" class="form-label">Category:</label>
                        <asp:DropDownList ID="ProductCategoryDropDownList" runat="server" CssClass="form-select" Width="100%">
                            <asp:ListItem Text="Select Category" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Solar energy" Value="Solar energy"></asp:ListItem>
                            <asp:ListItem Text="Wind power" Value="Wind power"></asp:ListItem>
                            <asp:ListItem Text="Biogas" Value="Biogas"></asp:ListItem>
                            <asp:ListItem Text="Biomass" Value="Biomass"></asp:ListItem>
                            <asp:ListItem Text="Hydroelectric power" Value="Hydroelectric power"></asp:ListItem>
                        </asp:DropDownList>

                <asp:Label ID="ProductImageLabel" runat="server" Text="Product Image" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="ProductImageTxtBox" runat="server" CssClass="form-control mb-2" placeholder="Enter image URL link"></asp:TextBox>

                
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
                                            <p class="card-text">Available date: <%# Eval("ProductionDate")%></p>
                                            <p class="card-text">Category: <%# Eval("ProductCategory")%></p>                                    
                                        </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
