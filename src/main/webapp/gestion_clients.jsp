<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Client" %>
<html>
<head>
    <title>Gestion clients</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
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
        <% } %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
