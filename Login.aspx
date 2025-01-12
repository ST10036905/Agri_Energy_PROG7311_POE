﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Agri_Energy_PROG7311_POE.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
   
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

        .login-container {
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        h1 {
            color: darkolivegreen;
            margin-bottom: 1rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            text-align: left;
            color: darkolivegreen;
        }

        input[type="text"],
        input[type="password"],
        .asp-button {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
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
        <div class="login-container">
            <h1>Login to your account</h1>
            <label for="UsernameTxtBox">Username:</label>
            <asp:TextBox ID="UsernameTxtBox" runat="server" placeholder="Enter your username"></asp:TextBox>

            <label for="PasswordTxtBox">Password:</label>
            <asp:TextBox ID="PasswordTxtBox" type="password" runat="server" placeholder="Enter your password"></asp:TextBox>

             <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red"></asp:Label>
             <asp:Label ID="SucessMessageLabel" runat="server" ForeColor="Green"></asp:Label>
          

            <div class="button-container">
                <asp:Button ID="LoginBtn" runat="server" Text="Login" CssClass="asp-button" OnClick="LoginBtn_Click" />
                <asp:Button ID="CancelBtn" runat="server" Text="Cancel" CssClass="asp-button" OnClick="CancelBtn_Click" />
            </div>

            <div class="create-account">
                <asp:HyperLink ID="CreateAccountLink" runat="server" NavigateUrl="Register.aspx">Don't have an account? Create one</asp:HyperLink>
            </div>

        </div>
    </form>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

