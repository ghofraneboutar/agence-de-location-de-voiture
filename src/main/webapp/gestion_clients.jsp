<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Client" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Gestion des Clients | AutoDrive</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&family=Nunito:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/modern-theme.css">
</head>
<body>
<!-- Éléments décoratifs -->
<div class="decorative-bg"></div>
<div class="decorative-circle"></div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light sticky-top">
    <div class="container">
        <a class="navbar-brand" href="/">
            <i class="fas fa-car-side me-2"></i>AutoDrive
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="/">
                        <i class="fas fa-home me-2"></i>Accueil
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/client">
                        <i class="fas fa-users me-2"></i>Clients
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/parc/list">
                        <i class="fas fa-warehouse me-2"></i>Parcs
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/voiture/list">
                        <i class="fas fa-car me-2"></i>Véhicules
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-calendar-check me-2"></i>Réservations
                    </a>
                </li>
            </ul>
            <div class="d-flex">
                <a href="#" class="btn btn-light me-2">
                    <i class="fas fa-user me-1"></i>Admin
                </a>
                <a href="/logout" class="btn btn-outline-light">
                    <i class="fas fa-sign-out-alt me-1"></i>Déconnexion
                </a>
            </div>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="content-wrapper animate-slide-up">
    <div class="container">
        <%-- Alert messages --%>
        <%
            if (request.getAttribute("deleted") != null && (boolean) request.getAttribute("deleted")) {
        %>
        <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
            <i class="fas fa-check-circle me-2"></i> Client supprimé avec succès !
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
            if (request.getAttribute("updated") != null && (boolean) request.getAttribute("updated")) {
        %>
        <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
            <i class="fas fa-check-circle me-2"></i> Client mis à jour avec succès !
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
            if (request.getAttribute("added") != null && (boolean) request.getAttribute("added")) {
        %>
        <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
            <i class="fas fa-check-circle me-2"></i> Client ajouté avec succès !
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
        %>

        <div class="d-flex justify-content-between align-items-center page-header">
            <h1 class="display-6">Gestion des Clients</h1>
            <a href="${pageContext.request.contextPath}/client/add" class="btn btn-primary">
                <i class="fas fa-user-plus me-2"></i>Nouveau Client
            </a>
        </div>

        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <i class="fas fa-users fa-3x mb-3" style="color: var(--primary);"></i>
                        <h3 class="h4 mb-2">Total Clients</h3>
                        <%
                            List<Client> clients = (List<Client>) request.getAttribute("clients");
                            int totalClients = clients != null ? clients.size() : 0;
                        %>
                        <p class="display-5 fw-bold mb-0"><%= totalClients %></p>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Recherche Rapide</h5>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <input type="text" class="form-control" placeholder="Nom ou prénom" id="searchName">
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control" placeholder="Numéro CIN" id="searchCIN">
                            </div>
                            <div class="col-md-2">
                                <button class="btn btn-primary w-100" id="searchBtn">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="table-container">
            <table class="table table-hover" id="clientsTable">
                <thead>
                <tr>
                    <th scope="col" width="5%">#</th>
                    <th scope="col" width="15%">CIN</th>
                    <th scope="col" width="20%">Nom Complet</th>
                    <th scope="col" width="20%">Contact</th>
                    <th scope="col" width="15%">Permis</th>
                    <th scope="col" width="25%">Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (clients != null && !clients.isEmpty()) {
                        for (Client c : clients) {
                %>
                <tr>
                    <td><%= c.getCode_client() %></td>
                    <td><strong><%= c.getNum_cin() %></strong></td>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="avatar-circle me-2" style="background-color: var(--primary-light);">
                                <%= c.getNom().substring(0, 1).toUpperCase() %><%= c.getPrenom().substring(0, 1).toUpperCase() %>
                            </div>
                            <div>
                                <%= c.getNom() %> <%= c.getPrenom() %>
                                <div class="small text-muted"><%= c.getAge() %> ans</div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div><i class="fas fa-envelope me-2 text-primary"></i><%= c.getEmail() %></div>
                        <div><i class="fas fa-phone me-2 text-primary"></i><%= c.getTel() %></div>
                    </td>
                    <td>
                                <span class="badge bg-info">
                                    <i class="fas fa-id-card me-1"></i><%= c.getNum_permis() %>
                                </span>
                    </td>
                    <td>
                        <div class="action-buttons">
                            <a href="${pageContext.request.contextPath}/client/updating?id=<%= c.getCode_client() %>" class="btn btn-sm btn-primary">
                                <i class="fas fa-edit me-1"></i>Modifier
                            </a>
                            <a href="${pageContext.request.contextPath}/client/delete?id=<%= c.getCode_client() %>" class="btn btn-sm btn-danger"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce client : <%= c.getNom() %> <%= c.getPrenom() %> ?')">
                                <i class="fas fa-trash me-1"></i>Supprimer
                            </a>
                        </div>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="text-center py-5">
                        <div class="empty-state">
                            <i class="fas fa-users fa-3x mb-3 text-muted"></i>
                            <h5>Aucun client trouvé</h5>
                            <p class="text-muted">Commencez par ajouter un nouveau client</p>
                            <a href="${pageContext.request.contextPath}/client/add" class="btn btn-primary mt-2">
                                <i class="fas fa-user-plus me-2"></i>Ajouter un client
                            </a>
                        </div>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <p>&copy; <%= new java.util.Date().getYear() + 1900 %> AutoElite. Tous droits réservés.</p>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Recherche client
    document.getElementById('searchBtn').addEventListener('click', function() {
        const nameFilter = document.getElementById('searchName').value.toLowerCase();
        const cinFilter = document.getElementById('searchCIN').value.toLowerCase();
        const table = document.getElementById('clientsTable');
        const rows = table.getElementsByTagName('tr');

        for (let i = 1; i < rows.length; i++) {
            const nameCell = rows[i].cells[2] ? rows[i].cells[2].textContent.toLowerCase() : '';
            const cinCell = rows[i].cells[1] ? rows[i].cells[1].textContent.toLowerCase() : '';

            if ((nameCell.includes(nameFilter) || nameFilter === '') &&
                (cinCell.includes(cinFilter) || cinFilter === '')) {
                rows[i].style.display = '';
            } else {
                rows[i].style.display = 'none';
            }
        }
    });
</script>

<style>
    /* Styles supplémentaires spécifiques à cette page */
    .avatar-circle {
        width: 36px;
        height: 36px;
        border-radius: 50%;
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 600;
        font-size: 0.8rem;
    }

    .empty-state {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 2rem;
        color: var(--gray-600);
    }

    #clientsTable th {
        position: sticky;
        top: 0;
        z-index: 10;
    }
</style>
</body>
</html>