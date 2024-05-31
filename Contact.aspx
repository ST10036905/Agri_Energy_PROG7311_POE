<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Agri_Energy_PROG7311_POE.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%= ResolveUrl("~/CssSheet/StyleSheet.css") %>" />
    <style type="text/css">
        body {
            background-color: darkolivegreen; 
            font-family: Arial, sans-serif;
            color: white; 
        }

        main {
            padding: 30px;
            background-color: white; 
            border-radius: 8px;
            margin-top: 20px;
            box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.2);
        }

        h2, h3 {
            color: darkolivegreen; 
        }

        address {
            font-style: normal;
            line-height: 1.6;
            color: black;
        }

    </style>

    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>
        <h3>Agri-Ease Contact Page</h3>
        <address>
            24 Main Road<br />
            Redmond, Gauteng 8897 <br />
            <abbr title="Phone">Phone</abbr> 069 564 7862
        </address>

        <address>
            <strong>Support:</strong> <a href="mailto:agrisupport@gmail.com">agrisupport@gmail.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:agrimarketing@gmail.com">agrimarketing@gmail.com</a>
        </address>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</asp:Content>
