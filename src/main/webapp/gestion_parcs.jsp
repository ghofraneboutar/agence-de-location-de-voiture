<%@ page import="entities.Parc" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: moham
  Date: 4/22/2025
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gestion Parcs</title>
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
        Parc supprimé avec succès !
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
        if (request.getAttribute("updated") != null && (boolean) request.getAttribute("updated")) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        Parc mis à jour avec succès !
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
        if (request.getAttribute("added") != null && (boolean) request.getAttribute("added")) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        Parc ajouté avec succès !
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
    %>

    <h2 class="mb-4">Liste des Parcs</h2>

    <a href="/parc/add" class="btn btn-success mb-3">
        <i class="fa fa-plus"></i> Ajouter un parc
    </a>

    <%
        List<Parc> parcs = (List<Parc>) request.getAttribute("parcs");
    %>

    <table class="table table-striped table-hover">
        <thead class="table-dark">
        <tr>
            <th>#</th>
            <th>Libellé</th>
            <th>Localisation</th>
            <th>Capacité</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (parcs != null) {


                for (Parc p : parcs) {
        %>
        <tr>
            <td><%= p.getNum_parc() %>
            </td>
            <td><%=p.getLibelle() %>
            </td>
            <td><%= p.getLocalisation() %>
            </td>
            <td><%= p.getCapacite() %>
            </td>

            <td>
                <a href="/parc/updating?id=<%= p.getNum_parc() %>" class="btn btn-primary btn-sm">
                    <i class="fa fa-edit"></i> Modifier
                </a>
                <a href="/parc/delete?id=<%= p.getNum_parc() %>" class="btn btn-danger btn-sm"
                   onclick="return confirm('Supprimer ce parc : <%= p.getLibelle() %> ?')">
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
