<%@ page import="entities.Voiture" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion Voitures</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .table-responsive {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
        }
        .btn-action {
            margin-right: 5px;
            border-radius: 4px;
        }
        .action-column {
            white-space: nowrap;
        }
        .alert {
            border-left: 4px solid #198754;
        }
        .page-header {
            border-bottom: 2px solid #f8f9fa;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/">
            Agence Location
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center" aria-current="page" href="/">
                        <i class="fas fa-home me-2"></i>Accueil
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/client" class="nav-link d-flex align-items-center">
                        <i class="fa-solid fa-people-group me-2"></i>Gestion clients
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/parc" class="nav-link d-flex align-items-center">
                        <i class="fa-solid fa-warehouse me-2"></i>Gestion parcs
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/voiture" class="nav-link active d-flex align-items-center">
                        <i class="fa-solid fa-car me-2"></i>Gestion voitures
                    </a>
                </li>
            </ul>
            <div class="d-flex">
                <ul class="navbar-nav mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="">
                            <i class="fas fa-sign-in-alt me-1"></i>Connexion
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="">
                            <i class="fas fa-user-plus me-1"></i>Inscription
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<div class="container py-5">
    <div class="row">
        <div class="col-12">
            <%-- Alert messages --%>
            <%
                if (request.getAttribute("deleted") != null && (boolean) request.getAttribute("deleted")) {
            %>
            <div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
                <i class="fas fa-check-circle me-2"></i> Voiture supprimée avec succès !
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
                if (request.getAttribute("updated") != null && (boolean) request.getAttribute("updated")) {
            %>
            <div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
                <i class="fas fa-check-circle me-2"></i> Voiture mise à jour avec succès !
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
                if (request.getAttribute("added") != null && (boolean) request.getAttribute("added")) {
            %>
            <div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
                <i class="fas fa-check-circle me-2"></i> Voiture ajoutée avec succès !
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>

            <div class="d-flex justify-content-between align-items-center page-header">
                <h1 class="h2 mb-0">
                    <i class="fa-solid fa-car me-2 text-primary"></i>
                    Gestion des Voitures
                </h1>
                <a href="/voiture/add" class="btn btn-primary">
                    <i class="fa fa-plus me-2"></i> Ajouter une voiture
                </a>
            </div>

            <div class="card border-0 shadow-sm">
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <%
                            List<Voiture> voitures = (List<Voiture>) request.getAttribute("voitures");
                        %>
                        <table class="table table-striped table-hover mb-0">
                            <thead class="table-dark">
                            <tr>
                                <th scope="col" class="ps-3">#</th>
                                <th scope="col">Matricule</th>
                                <th scope="col">Marque</th>
                                <th scope="col">Modèle</th>
                                <th scope="col">Kilométrage</th>
                                <th scope="col">Parc</th>
                                <th scope="col" class="text-center">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if (voitures != null && !voitures.isEmpty()) {
                                    for (Voiture v : voitures) {
                            %>
                            <tr>
                                <td class="ps-3"><%= v.getCode_voiture() %></td>
                                <td><strong><%=v.getMatricule()%></strong></td>
                                <td><%= v.getMarque() %></td>
                                <td><%= v.getModele() %></td>
                                <td><%= v.getKilometrage() %> km</td>
                                <td>
                                    <span class="badge bg-info text-dark">
                                        <%= v.getParc().getLibelle() %>
                                    </span>
                                </td>
                                <td class="text-center action-column">
                                    <a href="/voiture/updating?id=<%= v.getCode_voiture() %>" class="btn btn-sm btn-outline-primary btn-action">
                                        <i class="fa fa-edit me-1"></i> Modifier
                                    </a>
                                    <a href="/voiture/delete?id=<%= v.getCode_voiture() %>" class="btn btn-sm btn-outline-danger btn-action"
                                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer la voiture <%= v.getMatricule() %> ?')">
                                        <i class="fa fa-trash me-1"></i> Supprimer
                                    </a>
                                </td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="7" class="text-center py-4">
                                    <div class="text-muted">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Aucune voiture disponible
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="bg-light py-4 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <p class="mb-0 text-muted">&copy; <%= new java.util.Date().getYear() + 1900 %> Agence Location. Tous droits réservés.</p>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>