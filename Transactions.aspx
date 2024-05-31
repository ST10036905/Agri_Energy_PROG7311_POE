<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="Agri_Energy_PROG7311_POE.Transactions" %>

<!DOCTYPE html>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transactions</title>
 
    <link rel="stylesheet" href="~/MyCSS/StyleSheet.css" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .form-container {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 30px auto;
            max-width: 500px;
            padding: 20px;
        }
        .form-container h2 {
            margin-bottom: 20px;
        }
        .form-container label {
            font-weight: bold;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .btn-group button {
            flex: 1;
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

        <div class="container">
            <div class="form-container">
                <h2 class="text-center">Enter Payment Details</h2>
                <div class="map">
               <label>Payment Method</label>
               <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/MasterCard_Logo.svg/1200px-MasterCard_Logo.svg.png" alt="Mastercard" style="width: 50px; margin-right: 10px;"/>
               <img src="https://km.visamiddleeast.com/content/dam/VCOM/blogs/visa-blue-gradient-800x450.jpg" alt="Visa" style="width: 50px;"/>
               </div>
                <div class="mb-3">
                    <label for="cardType" class="form-label">Card Type:</label>
                    <select id="cardType" class="form-select">
                        <option value="mastercard">Mastercard</option>
                        <option value="visa">Visa</option> 
                    </select>
                </div>
                <div class="mb-3">
                    <label for="CardNumber" class="form-label">Card Number:</label>
                    <asp:TextBox ID="CardNumber" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="CardholderName" class="form-label">Cardholder Name:</label>
                    <asp:TextBox ID="CardholderName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="ExpiryDate" class="form-label">Expiry Date:</label>
                    <asp:TextBox ID="ExpiryDate" runat="server" type="month" CssClass="form-control"/>
                </div>
                <div class="mb-3">
                    <label for="Cvv" class="form-label">CVV:</label>
                    <asp:TextBox ID="Cvv" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
               <div class="btn-group" >
                <asp:Button ID="ConfirmPaymentBtn" runat="server" Text="Confirm Payment" CssClass="btn btn-primary" OnClick="ConfirmPayment_Click" />
                <asp:Button ID="AbortPaymentBtn" runat="server" Text="Abort Payment" CssClass="btn btn-danger" OnClick="AbortPayment_Click" />
               </div>
                <div>
                <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="SuccessMessageLabel" runat="server" ForeColor="Green"></asp:Label>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

