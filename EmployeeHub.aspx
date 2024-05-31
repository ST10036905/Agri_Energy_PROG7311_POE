<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeHub.aspx.cs" Inherits="Agri_Energy_PROG7311_POE.EmployeeHub" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register New Farmer</title>
   
   <link rel="stylesheet" href="~/MyCSS/StyleSheet.css" />
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
                <h1>Register New Farmer</h1>
            </div>
        </header>

        <div class="container my-5">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <h2 class="mb-4">Farmer Registration Form</h2>
                    <div class="mb-3">
                        <label for="NameTxtBox" class="form-label">Name:</label>
                        <asp:TextBox ID="NameTxtBox" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="SurnameTxtBox" class="form-label">Surname:</label>
                        <asp:TextBox ID="SurnameTxtBox" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="UsernameTxtBox" class="form-label">Username:</label>
                        <asp:TextBox ID="UsernameTxtBox" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="PasswordTxtBox" class="form-label">Password:</label>
                        <asp:TextBox ID="PasswordTxtBox" type="password" runat="server" CssClass="form-control" Width="100%" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="ConfirmPasswordTxtBox" class="form-label">Confirm Password:</label>
                        <asp:TextBox ID="ConfirmPasswordTxtBox" type="password" runat="server" CssClass="form-control" Width="100%" TextMode="Password"></asp:TextBox>
                    </div>
                     
                     <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red"></asp:Label>
                     <asp:Label ID="SucessMessageLabel" runat="server" ForeColor="Green"></asp:Label>
          

                    <div class="mb-3">
                        <label for="ContactTxtBox" class="form-label">Contact:</label>
                        <asp:TextBox ID="ContactTxtBox" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="EmailTxtBox" class="form-label">Email:</label>
                        <asp:TextBox ID="EmailTxtBox" runat="server" CssClass="form-control" Width="100%" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="AddressTxtBox" class="form-label">Address:</label>
                        <asp:TextBox ID="AddressTxtBox" runat="server" CssClass="form-control" Width="100%" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="d-flex justify-content-between">
                        <asp:Button ID="RegisterBtn" runat="server" CssClass="btn btn-success" Text="Register" OnClick="RegisterBtn_Click" />
                        <asp:Button ID="CancelBtn" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="CancelBtn_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
