<%@ page import="entities.Voiture" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Gestion des Véhicules | AutoDrive</title>
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
                    <a class="nav-link active" href="${pageContext.request.contextPath}/voiture/list">
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
            <i class="fas fa-check-circle me-2"></i> Véhicule supprimé avec succès !
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
            if (request.getAttribute("updated") != null && (boolean) request.getAttribute("updated")) {
        %>
        <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
            <i class="fas fa-check-circle me-2"></i> Véhicule mis à jour avec succès !
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
            if (request.getAttribute("added") != null && (boolean) request.getAttribute("added")) {
        %>
        <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
            <i class="fas fa-check-circle me-2"></i> Véhicule ajouté avec succès !
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
        %>

        <div class="d-flex justify-content-between align-items-center page-header">
            <h1 class="display-6">Gestion des Véhicules</h1>
            <a href="${pageContext.request.contextPath}/voiture/add" class="btn btn-primary">
                <i class="fas fa-plus me-2"></i>Nouveau Véhicule
            </a>
        </div>

        <div class="row mb-4">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Filtrer les véhicules</h5>
                        <div class="row g-3">
                            <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Matricule" id="searchMatricule">
                            </div>
                            <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Marque" id="searchMarque">
                            </div>
                            <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Modèle" id="searchModele">
                            </div>
                            <div class="col-md-3">
                                <select class="form-select" id="searchParc">
                                    <option value="">Tous les parcs</option>
                                    <!-- Options dynamiques ici -->
                                </select>
                            </div>
                            <div class="col-md-12">
                                <button class="btn btn-primary" id="searchBtn">
                                    <i class="fas fa-search me-2"></i>Rechercher
                                </button>
                                <button class="btn btn-outline-secondary ms-2" id="resetBtn">
                                    <i class="fas fa-redo me-2"></i>Réinitialiser
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Affichage des véhicules en cartes au lieu d'un tableau -->
        <%
            List<Voiture> voitures = (List<Voiture>) request.getAttribute("voitures");
            if (voitures != null && !voitures.isEmpty()) {
        %>
        <div class="row" id="vehiclesGrid">
            <% for (Voiture v : voitures) { %>
            <div class="col-md-4 mb-4 vehicle-card">
                <div class="card h-100">
                    <div class="card-header text-center py-3">
                        <h5 class="mb-0"><%= v.getMarque() %> <%= v.getModele() %></h5>
                    </div>
                    <div class="card-body">
                        <div class="text-center mb-4">
                            <div class="vehicle-image-placeholder mb-3">
                                <i class="fas fa-car fa-3x"></i>
                            </div>
                            <h6 class="badge bg-primary mb-2"><%= v.getMatricule() %></h6>
                        </div>

                        <div class="vehicle-details">
                            <div class="detail-item">
                                <i class="fas fa-tachometer-alt text-primary"></i>
                                <span><%= v.getKilometrage() %> km</span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-warehouse text-primary"></i>
                                <span><%= v.getParc().getLibelle() %></span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-map-marker-alt text-primary"></i>
                                <span><%= v.getParc().getLocalisation() %></span>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer bg-white border-0 pt-0">
                        <div class="d-grid gap-2">
                            <a href="${pageContext.request.contextPath}/voiture/updating?id=<%= v.getCode_voiture() %>" class="btn btn-outline-primary">
                                <i class="fas fa-edit me-2"></i>Modifier
                            </a>
                            <a href="${pageContext.request.contextPath}/voiture/delete?id=<%= v.getCode_voiture() %>" class="btn btn-outline-danger"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce véhicule : <%= v.getMarque() %> <%= v.getModele() %> ?')">
                                <i class="fas fa-trash me-2"></i>Supprimer
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <% } else { %>
        <div class="card">
            <div class="card-body text-center py-5">
                <div class="empty-state">
                    <i class="fas fa-car fa-3x mb-3 text-muted"></i>
                    <h5>Aucun véhicule trouvé</h5>
                    <p class="text-muted">Commencez par ajouter un nouveau véhicule</p>
                    <a href="${pageContext.request.contextPath}/voiture/add" class="btn btn-primary mt-2">
                        <i class="fas fa-plus me-2"></i>Ajouter un véhicule
                    </a>
                </div>
            </div>
        </div>
        <% } %>
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
    // Recherche véhicule
    document.getElementById('searchBtn')?.addEventListener('click', function() {
        const matriculeFilter = document.getElementById('searchMatricule').value.toLowerCase();
        const marqueFilter = document.getElementById('searchMarque').value.toLowerCase();
        const modeleFilter = document.getElementById('searchModele').value.toLowerCase();
        const parcFilter = document.getElementById('searchParc').value.toLowerCase();

        const cards = document.getElementsByClassName('vehicle-card');

        for (let i = 0; i < cards.length; i++) {
            const card = cards[i];
            const matricule = card.querySelector('.badge').textContent.toLowerCase();
            const marqueModele = card.querySelector('.card-header h5').textContent.toLowerCase();
            const parc = card.querySelectorAll('.detail-item')[1].textContent.toLowerCase();

            if ((matricule.includes(matriculeFilter) || matriculeFilter === '') &&
                (marqueModele.includes(marqueFilter) || marqueFilter === '') &&
                (marqueModele.includes(modeleFilter) || modeleFilter === '') &&
                (parc.includes(parcFilter) || parcFilter === '')) {
                card.style.display = '';
            } else {
                card.style.display = 'none';
            }
        }
    });

    document.getElementById('resetBtn')?.addEventListener('click', function() {
        document.getElementById('searchMatricule').value = '';
        document.getElementById('searchMarque').value = '';
        document.getElementById('searchModele').value = '';
        document.getElementById('searchParc').value = '';

        const cards = document.getElementsByClassName('vehicle-card');
        for (let i = 0; i < cards.length; i++) {
            cards[i].style.display = '';
        }
    });
</script>

<style>
    /* Styles supplémentaires spécifiques à cette page */
    .vehicle-image-placeholder {
        width: 100px;
        height: 100px;
        background-color: rgba(114, 9, 183, 0.1);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto;
        color: var(--primary);
    }

    .vehicle-details {
        display: flex;
        flex-direction: column;
        gap: 0.75rem;
    }

    .detail-item {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        padding: 0.5rem;
        background-color: rgba(114, 9, 183, 0.05);
        border-radius: 0.5rem;
    }

    .detail-item i {
        width: 20px;
        text-align: center;
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