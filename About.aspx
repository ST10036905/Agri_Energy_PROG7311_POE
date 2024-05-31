<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Agri_Energy_PROG7311_POE.About" %>

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

        h1, h2, h3 {
            color: darkolivegreen; 
        }

        main {
            padding: 30px;
            background-color: white; 
            border-radius: 8px;
            margin-top: 20px;
            box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.2);
        }

        main p, main ul {
            color: black;
        }

        main ul {
            list-style-type: none;
            padding: 0;
        }

        main ul li {
            padding: 10px 0;
            border-bottom: 1px solid #ffffff;
        }

        main ul li:last-child {
            border-bottom: none;
        }

        main ul li strong {
            display: block;
            font-size: 1.1rem;
            margin-bottom: 5px;
        }

        .btn-primary {
            background-color: darkolivegreen; 
            border-color: darkolivegreen; 
        }

        .btn-primary:hover, .btn-primary:focus {
            background-color: darkolivegreen; 
            border-color: darkolivegreen; 
        }
    </style>

    <main aria-labelledby="title">
        <h1 id="title">About Agri-Ease</h1>
        <p>Welcome to Agri-Ease, your one-stop shop for eco-friendly energy and sustainable farming solutions. Our platform is committed to providing farmers with the information, resources, and instruments they need to adopt green energy technologies and sustainable practices.</p>
        <h2>Our Mission</h2>
        <p>Our goal at Agri-Ease is to advance renewable energy and sustainable farming practices that benefit the farming community and the environment. Our goal is to establish a platform that enables farmers to exchange knowledge, work together, and get access to cutting-edge technology that promotes productivity and sustainable growth.</p>
        <h3>Key Features</h3>
        <ul>
            <li>
                <strong>Sustainable Farming Hub:</strong>
                A comprehensive resource center offering best practices, articles, and guides on sustainable farming techniques. Engage with fellow farmers in interactive forums to share experiences and advice.
            </li>
            <li>
                <strong>Green Energy Marketplace:</strong>
                Discover a wide range of green energy products tailored to agricultural needs. Compare solutions, read reviews, and connect with green tech providers.
            </li>
            <li>
                <strong>Educational and Training Resources:</strong>
                Access online courses, webinars, and workshops focused on integrating renewable energy technologies into farming practices. Learn about the benefits and practicalities of adopting green energy on your farm.
            </li>
            <li>
                <strong>Project Collaboration and Funding Opportunities:</strong>
                Collaborate with other farmers and energy experts on joint projects. Explore grants, subsidies, and funding opportunities to support your green initiatives.
            </li>
        </ul>
    </main>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</asp:Content>
