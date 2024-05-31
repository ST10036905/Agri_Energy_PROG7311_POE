<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Agri_Energy_PROG7311_POE.Register" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    
    <link rel="stylesheet" href="~/MyCSS/StyleSheet.css" />

    <style type="text/css">
        body {
            background-color: darkolivegreen;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .register-container {
            background-color: white;
            padding: 1rem;
            margin: 1rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        h1 {
            color: darkolivegreen;
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            text-align: left;
            color: darkolivegreen;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="number"],
        .asp-button,
        select {
            width: calc(100% - 2 * 1rem);
            padding: 0.5rem;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 0.9rem;
        }

        .asp-button {
            background-color: darkolivegreen;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .asp-button:hover {
            background-color: #556b2f;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
        }

        .button-container .asp-button {
            width: 48%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <h1>Register to Agri-Ease</h1>
            <label for="EmailTxtBox">E-mail:</label>
            <asp:TextBox ID="EmailTxtBox" runat="server" placeholder="Enter email" TextMode="Email"></asp:TextBox>

            <label for="UsernameTxtBox">Username:</label>
            <asp:TextBox ID="UsernameTxtBox" runat="server" placeholder="Enter username"></asp:TextBox>

            <label for="NameTxtBox">Name:</label>
            <asp:TextBox ID="NameTxtBox" runat="server" placeholder="Enter name"></asp:TextBox>

            <label for="AgeTxtBox">Age:</label>
            <asp:TextBox ID="AgeTxtBox" runat="server" type="number" placeholder="Enter age"></asp:TextBox>

            <label for="DropDownListRole">Role:</label>
            <asp:DropDownList ID="DropDownListRole" runat="server">
                <asp:ListItem Text="Select Role" Value="" />
                <asp:ListItem Text="Employee" Value="Employee" />
                <asp:ListItem Text="Farmer" Value="Farmer" />
            </asp:DropDownList>

            <label for="PasswordTxtBox">Password:</label>
            <asp:TextBox ID="PasswordTxtBox" runat="server" type="password" placeholder="Enter password"></asp:TextBox>

            <label for="ReEnterPasswordTxtBox">Re-enter Password:</label>
            <asp:TextBox ID="ReEnterPasswordTxtBox" runat="server" type="password" placeholder="Enter password"></asp:TextBox>
            
            <label for="AddressTxtBox">Address:</label>
            <asp:TextBox ID="AddressTxtBox" runat="server" placeholder="Enter address"></asp:TextBox>
            
          
            <asp:Label ID="SucessMessageLabel" runat="server" ForeColor="Green"></asp:Label>
            <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red"></asp:Label>

            <div class="button-container">
                <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="asp-button" OnClick="SaveBtn_Click" />
                <asp:Button ID="CancelBtn" runat="server" Text="Cancel" CssClass="asp-button" OnClick="CancelBtn_Click" />
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
