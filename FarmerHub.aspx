<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FarmerHub.aspx.cs" Inherits="Agri_Energy_PROG7311_POE.FarmerHub" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Farmers Hub</title>
   
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
        .post-container {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            background: #fff;
        }
        .comment-container {
            margin-top: 10px;
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
                            <a class="nav-link" href="Home.aspx">Home</a>
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
                <h1>Farmers Hub</h1>
                <p>Share and discuss farming techniques</p>
            </div>
        </header>

        <div class="container my-5 form-container">
          
            <div class="mb-4">
                <h5>Share your ideas</h5>
                <asp:TextBox ID="IdeaTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter your idea here..." OnTextChanged="IdeaTextBox_TextChanged"></asp:TextBox>
                <div class="d-flex justify-content-end mt-2">
                    <asp:Button ID="ShareBtn" runat="server" CssClass="btn btn-success" Text="Share" OnClick="ShareBtn_Click" />
                </div>
                <div class="mb-4"> 
                 <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red"></asp:Label>
                 <asp:Label ID="SuccessMessageLabel" runat="server" ForeColor="Green"></asp:Label>
                </div>
            </div>
           
            <div>
                <asp:Repeater ID="PostsRepeater" runat="server" OnItemCommand="PostsRepeater_ItemCommand">
                    <ItemTemplate>
                        <div class="post-container">
                            <p><%# Eval("Text") %></p>
                            <div class="d-flex justify-content-between mt-2">
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

