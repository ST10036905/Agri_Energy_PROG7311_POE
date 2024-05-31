<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Agri_Energy_PROG7311_POE._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">

    <link rel="stylesheet" href="<%= ResolveUrl("~/MyCSS/StyleSheet.css") %>" />
    <style type="text/css">
        body {
            background-color: darkolivegreen; 
            font-family: Arial, sans-serif;
            color: white; 
        }

        h1{
            color: white; 
        }
        h2 {
            color: black;
        }
        .main-container {
            padding: 30px;
        }

        .locations-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-top: 20px;
        }

        .locations {
            flex: 1;
            margin-right: 20px;
            background-color: white; 
            padding: 20px;
            border-radius: 8px;
            color: black; 
        }

        .locations h2 {
            margin-bottom: 20px;
            font-size: 1.5rem;
        }

        .locations p {
            margin: 10px 0;
            font-size: 1.1rem;
        }

        .map {
            flex: 1;
            text-align: center;
        }

        .map img {
            max-width: 100%;
            height: auto;
        }

        .btn-primary {
            background-color: darkgreen; 
            border-color: darkgreen;
        }

        .btn-primary:hover, .btn-primary:focus {
            background-color: green; 
            border-color: green;
        }

        .dropdown-menu a {
            color: darkolivegreen; 
        }

        .dropdown-menu a:hover {
            background-color: darkgreen; 
            color: white; 
        }
    </style>

    <main class="main-container">
        <section aria-labelledby="aspnetTitle" class="text-center">
            <h1 id="aspnetTitle" class="display-4">Agri-Ease Application</h1>
            <p class="lead">Our robust application designed for farmers to engage with their stakeholders.</p>
            <p><a href="About.aspx" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
        </section>

        <div class="locations-container">
            <section class="locations" aria-labelledby="gettingStartedTitle">
                <h2 id="gettingStartedTitle" class="h4">Our Locations:</h2>
                <p>Western Cape</p>
                <p>Gauteng</p>
                <p>Eastern Cape</p>
                <p>Kwazulu-Natal</p>
                <p>Northern Cape</p>
                <p>Limpopo</p>
                <p>Mpumalanga</p>
            </section>
            <div class="map">
                <img src="https://i.pinimg.com/originals/58/fe/22/58fe228a9afaa8f283161caa558d49f8.png" alt="South Africa Map - High Resolution Provinces" />
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</asp:Content>
