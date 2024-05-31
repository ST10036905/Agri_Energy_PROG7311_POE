<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Enroll.aspx.cs" Inherits="Agri_Energy_PROG7311_POE.Enroll" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Education</title>
  
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
                <h1>Agri-Ease Educational Hub</h1>
            </div>
        </header>

        <div class="container my-5">
            <div class="row">
                        <div class="mb-3">
                            <label for="ParticipantNameTxtBox" class="form-label">Participant Name:</label>
                            <asp:TextBox ID="ParticipantNameTxtBox" runat="server" CssClass="form-control" Width="100%" placeholder="Enter your name" ></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="RoleDropDownList" class="form-label">Role:</label>
                            <asp:DropDownList ID="RoleDropDownList" runat="server" CssClass="form-select" Width="100%">
                            <asp:ListItem Text="Farmer" Value="Farmer"></asp:ListItem>
                            <asp:ListItem Text="Employee" Value="Employee"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label for="InformationTxtBox" class="form-label">Additional Information:</label>
                            <asp:TextBox ID="InformationTxtBox" runat="server" CssClass="form-control" Width="100%" placeholder="Enter your aims" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="ContactTxtBox" class="form-label">Contact Information:</label>
                            <asp:TextBox ID="ContactTxtBox" runat="server" CssClass="form-control" Width="100%" placeholder="Enter your email and contact" TextMode="MultiLine"></asp:TextBox>
                        </div>
                         <div class="mb-3">
                         <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red"></asp:Label>
                         <asp:Label ID="SuccessMessageLabel" runat="server" ForeColor="Green"></asp:Label>
                         </div>
                        <div class="d-flex justify-content-between">
                            <asp:Button ID="RegisterBtn" runat="server" CssClass="btn btn-success" Text="Register" OnClick="RegisterBtn_Click" />
                            <asp:Button ID="CancelBtn" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="CancelBtn_Click" />
                        </div>
                    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>