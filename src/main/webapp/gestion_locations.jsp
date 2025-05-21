<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Location" %>
<%@ page import="entities.Client" %>
<%@ page import="entities.Voiture" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Gestion des Locations | AutoDrive</title>
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/client">
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
                    <a class="nav-link active" href="${pageContext.request.contextPath}/location/list">
                        <i class="fas fa-calendar-check me-2"></i>Locations
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
        <% if (request.getParameter("deleted") != null) { %>
        <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
            <i class="fas fa-check-circle me-2"></i> Location supprimée avec succès !
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <% } %>
        <% if (request.getParameter("updated") != null) { %>
        <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
            <i class="fas fa-check-circle me-2"></i> Location mise à jour avec succès !
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <% } %>
        <% if (request.getParameter("added") != null) { %>
        <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
            <i class="fas fa-check-circle me-2"></i> Location ajoutée avec succès !
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i> <%= request.getAttribute("error") %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <% } %>

        <div class="d-flex justify-content-between align-items-center page-header">
            <h1 class="display-6">Gestion des Locations</h1>
        </div>

        <!-- Filtres -->
        <div class="card mb-4">
            <div class="card-body">
                <h5 class="card-title mb-3">Filtrer les locations</h5>
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <form action="${pageContext.request.contextPath}/location/filter" method="get" class="d-flex">
                            <input type="hidden" name="filterType" value="client">
                            <select name="clientId" class="form-select me-2">
                                <option value="">Sélectionner un client</option>
                                <%
                                    List<Client> clients = (List<Client>) request.getAttribute("clients");
                                    if (clients != null) {
                                        for (Client client : clients) {
                                %>
                                <option value="<%= client.getCode_client() %>"><%= client.getNom() %> <%= client.getPrenom() %></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-filter"></i>
                            </button>
                        </form>
                    </div>
                    <div class="col-md-4 mb-3">
                        <form action="${pageContext.request.contextPath}/location/filter" method="get" class="d-flex">
                            <input type="hidden" name="filterType" value="voiture">
                            <select name="voitureId" class="form-select me-2">
                                <option value="">Sélectionner une voiture</option>
                                <%
                                    List<Voiture> voitures = (List<Voiture>) request.getAttribute("voitures");
                                    if (voitures != null) {
                                        for (Voiture voiture : voitures) {
                                %>
                                <option value="<%= voiture.getCode_voiture() %>"><%= voiture.getMarque() %> <%= voiture.getModele() %> - <%= voiture.getMatricule() %></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-filter"></i>
                            </button>
                        </form>
                    </div>
                    <div class="col-md-4 mb-3">
                        <form action="${pageContext.request.contextPath}/location/filter" method="get" class="d-flex">
                            <input type="hidden" name="filterType" value="periode">
                            <input type="date" name="dateDebut" class="form-control me-2" required>
                            <input type="date" name="dateFin" class="form-control me-2" required>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-filter"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <div class="text-end mt-2">
                    <a href="${pageContext.request.contextPath}/location/list" class="btn btn-outline-secondary">
                        <i class="fas fa-redo me-2"></i>Réinitialiser les filtres
                    </a>
                </div>
            </div>
        </div>

        <!-- Statistiques -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-calendar-check fa-3x mb-3" style="color: var(--primary);"></i>
                        <h3 class="h5 mb-2">Total Locations</h3>
                        <%
                            List<Location> locations = (List<Location>) request.getAttribute("locations");
                            int totalLocations = locations != null ? locations.size() : 0;
                        %>
                        <p class="display-6 fw-bold mb-0"><%= totalLocations %></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-hourglass-half fa-3x mb-3" style="color: var(--warning);"></i>
                        <h3 class="h5 mb-2">En cours</h3>
                        <%
                            int enCours = 0;
                            if (locations != null) {
                                Date now = new Date();
                                for (Location loc : locations) {
                                    if (loc.getDate_debut().before(now) && loc.getDate_fin().after(now)) {
                                        enCours++;
                                    }
                                }
                            }
                        %>
                        <p class="display-6 fw-bold mb-0"><%= enCours %></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-check-circle fa-3x mb-3" style="color: var(--success);"></i>
                        <h3 class="h5 mb-2">Terminées</h3>
                        <%
                            int terminees = 0;
                            if (locations != null) {
                                Date now = new Date();
                                for (Location loc : locations) {
                                    if (loc.getDate_fin().before(now)) {
                                        terminees++;
                                    }
                                }
                            }
                        %>
                        <p class="display-6 fw-bold mb-0"><%= terminees %></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-clock fa-3x mb-3" style="color: var(--info);"></i>
                        <h3 class="h5 mb-2">À venir</h3>
                        <%
                            int aVenir = 0;
                            if (locations != null) {
                                Date now = new Date();
                                for (Location loc : locations) {
                                    if (loc.getDate_debut().after(now)) {
                                        aVenir++;
                                    }
                                }
                            }
                        %>
                        <p class="display-6 fw-bold mb-0"><%= aVenir %></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tableau des locations -->
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                        <tr>
                            <th scope="col" width="5%">#</th>
                            <th scope="col" width="15%">Client</th>
                            <th scope="col" width="15%">Véhicule</th>
                            <th scope="col" width="15%">Période</th>
                            <th scope="col" width="10%">Statut</th>
                            <th scope="col" width="15%">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if (locations != null && !locations.isEmpty()) {
                                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                for (Location location : locations) {
                        %>
                        <tr>
                            <td><%= location.getCode_location() %></td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <div class="avatar-circle me-2" style="background-color: var(--primary-light);">
                                        <%= location.getClient().getNom().substring(0, 1).toUpperCase() %><%= location.getClient().getPrenom().substring(0, 1).toUpperCase() %>
                                    </div>
                                    <div>
                                        <%= location.getClient().getNom() %> <%= location.getClient().getPrenom() %>
                                        <div class="small text-muted"><%= location.getClient().getEmail() %></div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <strong><%= location.getVoiture().getMarque() %> <%= location.getVoiture().getModele() %></strong>
                                <div class="small text-muted"><%= location.getVoiture().getMatricule() %></div>
                            </td>
                            <td>
                                <div><i class="fas fa-calendar-alt me-1 text-primary"></i> <%= sdf.format(location.getDate_debut()) %></div>
                                <div><i class="fas fa-calendar-check me-1 text-primary"></i> <%= sdf.format(location.getDate_fin()) %></div>
                            </td>
                            <td>
                                <%
                                    String badgeClass = "bg-secondary";
                                    String statusIcon = "fa-question-circle";

                                    if (location.getStatut() != null) {
                                        if (location.getStatut().equalsIgnoreCase("confirmée")) {
                                            badgeClass = "bg-success";
                                            statusIcon = "fa-check-circle";
                                        } else if (location.getStatut().equalsIgnoreCase("en cours")) {
                                            badgeClass = "bg-primary";
                                            statusIcon = "fa-hourglass-half";
                                        } else if (location.getStatut().equalsIgnoreCase("terminée")) {
                                            badgeClass = "bg-info";
                                            statusIcon = "fa-flag-checkered";
                                        } else if (location.getStatut().equalsIgnoreCase("annulée")) {
                                            badgeClass = "bg-danger";
                                            statusIcon = "fa-times-circle";
                                        }
                                    }
                                %>
                                <span class="badge <%= badgeClass %>">
                                            <i class="fas <%= statusIcon %> me-1"></i><%= location.getStatut() %>
                                        </span>
                            </td>
                            <td>
                                <div class="d-flex gap-2">
                                    <a href="${pageContext.request.contextPath}/location/updating?id=<%= location.getCode_location() %>" class="btn btn-sm btn-primary">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button type="button" class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#detailsModal<%= location.getCode_location() %>">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                    <a href="${pageContext.request.contextPath}/location/delete?id=<%= location.getCode_location() %>" class="btn btn-sm btn-danger"
                                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette location ?')">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>

                                <!-- Modal de détails -->
                                <div class="modal fade" id="detailsModal<%= location.getCode_location() %>" tabindex="-1" aria-labelledby="detailsModalLabel<%= location.getCode_location() %>" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="detailsModalLabel<%= location.getCode_location() %>">
                                                    Détails de la Location #<%= location.getCode_location() %>
                                                </h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <h6 class="fw-bold mb-3">Informations Client</h6>
                                                        <p><strong>Nom:</strong> <%= location.getClient().getNom() %> <%= location.getClient().getPrenom() %></p>
                                                        <p><strong>CIN:</strong> <%= location.getClient().getNum_cin() %></p>
                                                        <p><strong>Email:</strong> <%= location.getClient().getEmail() %></p>
                                                        <p><strong>Téléphone:</strong> <%= location.getClient().getTel() %></p>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <h6 class="fw-bold mb-3">Informations Véhicule</h6>
                                                        <p><strong>Marque/Modèle:</strong> <%= location.getVoiture().getMarque() %> <%= location.getVoiture().getModele() %></p>
                                                        <p><strong>Matricule:</strong> <%= location.getVoiture().getMatricule() %></p>
                                                        <p><strong>Kilométrage:</strong> <%= location.getVoiture().getKilometrage() %> km</p>
                                                        <p><strong>Parc:</strong> <%= location.getVoiture().getParc().getNum_parc()%></p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <h6 class="fw-bold mb-3">Détails de la Location</h6>
                                                        <p><strong>Date de début:</strong> <%= sdf.format(location.getDate_debut()) %></p>
                                                        <p><strong>Date de fin:</strong> <%= sdf.format(location.getDate_fin()) %></p>
                                                        <p><strong>Durée:</strong>
                                                            <%
                                                                long diff = location.getDate_fin().getTime() - location.getDate_debut().getTime();
                                                                int jours = (int) (diff / (1000 * 60 * 60 * 24)) + 1;
                                                            %>
                                                            <%= jours %> jour<%= jours > 1 ? "s" : "" %>
                                                        </p>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                                                <a href="${pageContext.request.contextPath}/location/updating?id=<%= location.getCode_location() %>" class="btn btn-primary">
                                                    <i class="fas fa-edit me-2"></i>Modifier
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="7" class="text-center py-5">
                                <div class="empty-state">
                                    <i class="fas fa-calendar-times fa-3x mb-3 text-muted"></i>
                                    <h5>Aucune location trouvée</h5>

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
    // Mettre en surbrillance les filtres actifs
    document.addEventListener('DOMContentLoaded', function() {
        <% if (request.getAttribute("filterType") != null) { %>
        const filterType = "<%= request.getAttribute("filterType") %>";

        if (filterType === "client") {
            const clientId = "<%= request.getAttribute("clientId") %>";
            document.querySelector('select[name="clientId"]').value = clientId;
        } else if (filterType === "voiture") {
            const voitureId = "<%= request.getAttribute("voitureId") %>";
            document.querySelector('select[name="voitureId"]').value = voitureId;
        } else if (filterType === "periode") {
            const dateDebut = "<%= request.getAttribute("dateDebut") %>";
            const dateFin = "<%= request.getAttribute("dateFin") %>";
            document.querySelector('input[name="dateDebut"]').value = dateDebut;
            document.querySelector('input[name="dateFin"]').value = dateFin;
        }
        <% } %>
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
</style>
</body>
</html>