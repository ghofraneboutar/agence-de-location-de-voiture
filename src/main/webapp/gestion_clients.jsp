<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Client" %>
<html>
<head>
    <title>Gestion Clients</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">
            Agence Location
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page"
                       href="/">
                        <i class="fas fa-home me-1"></i>Accueil
                    </a>
                </li>
                <li class="nav-item">

                    <a href="/client" class="nav-link active" aria-current="page">
                        <i class="fa-solid fa-people-group"></i> Gestion clients
                    </a>
                </li>
                <li class="nav-item">

                    <a href="/parc" class="nav-link active" aria-current="page">
                        <i class="fa-solid fa-warehouse"></i> Gestion parcs
                    </a>
                </li>
                <li class="nav-item">

                    <a href="/voiture" class="nav-link active" aria-current="page">
                        <i class="fa-solid fa-car"></i> Gestion voitures
                    </a>
                </li>

            </ul>
            <div class="d-flex">
                <ul class="navbar-nav mb-2 mb-lg-0">

                    <li class="nav-item">
                        <a class="nav-link" href="">
                            <i class="fas fa-sign-in-alt me-1"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="">
                            <i class="fas fa-user-plus me-1"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<div class="container mt-5">
    <%
        if (request.getAttribute("deleted") != null && (boolean) request.getAttribute("deleted")) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        Client supprimé avec succès !
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
        if (request.getAttribute("updated") != null && (boolean) request.getAttribute("updated")) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        Client mis à jour avec succès !
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
        if (request.getAttribute("added") != null && (boolean) request.getAttribute("added")) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        Client ajouté avec succès !
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
    %>

    <h2 class="mb-4">Liste des clients</h2>

    <a href="/client/add" class="btn btn-success mb-3">
        <i class="fa fa-plus"></i> Ajouter un client
    </a>

    <%
        List<Client> clients = (List<Client>) request.getAttribute("clients");
    %>

    <table class="table table-striped table-hover">
        <thead class="table-dark">
        <tr>
            <th>#</th>
            <th>CIN</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (clients != null) {


                for (Client c : clients) {
        %>
        <tr>
            <td><%= c.getCode_client() %>
            </td>
            <td><%= c.getNum_cin() %>
            </td>
            <td><%= c.getNom() %>
            </td>
            <td><%= c.getPrenom() %>
            </td>
            <td><%= c.getEmail() %>
            </td>
            <td>
                <a href="/client/updating?id=<%= c.getCode_client() %>" class="btn btn-primary btn-sm">
                    <i class="fa fa-edit"></i> Modifier
                </a>
                <a href="/client/delete?id=<%= c.getCode_client() %>" class="btn btn-danger btn-sm"
                   onclick="return confirm('Supprimer ce client : <%= c.getNum_cin() %> ?')">
                    <i class="fa fa-trash"></i> Supprimer
                </a>
            </td>
        </tr>
        <% }
        } %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
