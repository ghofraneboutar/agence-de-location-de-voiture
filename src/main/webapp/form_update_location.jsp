<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Client" %>
<%@ page import="entities.Voiture" %>
<%@ page import="entities.Location" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Modifier une Location | AutoElite</title>
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
            <i class="fas fa-car-side me-2"></i>AutoElite
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
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
                    <i class="fas fa-exclamation-circle me-2"></i> <%= request.getAttribute("error") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <% } %>

                <div class="d-flex justify-content-between align-items-center page-header">
                    <h1 class="display-6">Modifier une Location</h1>
                    <a href="${pageContext.request.contextPath}/location/list" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left me-2"></i>Retour
                    </a>
                </div>

                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-calendar-edit me-2"></i>Informations de la location
                    </div>
                    <div class="card-body">
                        <%
                            Location location = (Location) request.getAttribute("location");
                            if (location != null) {
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                String dateDebut = sdf.format(location.getDate_debut());
                                String dateFin = sdf.format(location.getDate_fin());
                        %>
                        <form action="${pageContext.request.contextPath}/location/update" method="post" class="needs-validation" novalidate>
                            <input type="hidden" name="id" value="<%= location.getCode_location() %>">

                            <div class="row g-4">
                                <div class="col-md-12">
                                    <div class="form-floating position-relative">
                                        <i class="fas fa-user form-icon"></i>
                                        <select id="client" name="client" class="form-select" required>
                                            <option value="">Sélectionner un client</option>
                                            <%
                                                List<Client> clients = (List<Client>) request.getAttribute("clients");
                                                if (clients != null) {
                                                    for (Client client : clients) {
                                            %>
                                            <option value="<%= client.getCode_client() %>" <%= (location.getClient().getCode_client() == client.getCode_client()) ? "selected" : "" %>>
                                                <%= client.getNom() %> <%= client.getPrenom() %> - <%= client.getNum_cin() %>
                                            </option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select>
                                        <label for="client">Client</label>
                                        <div class="invalid-feedback">
                                            Veuillez sélectionner un client.
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-floating position-relative">
                                        <i class="fas fa-car form-icon"></i>
                                        <select id="voiture" name="voiture" class="form-select" required>
                                            <option value="">Sélectionner une voiture</option>
                                            <%
                                                List<Voiture> voitures = (List<Voiture>) request.getAttribute("voitures");
                                                if (voitures != null) {
                                                    for (Voiture voiture : voitures) {
                                            %>
                                            <option value="<%= voiture.getCode_voiture() %>" <%= (location.getVoiture().getCode_voiture() == voiture.getCode_voiture()) ? "selected" : "" %>>
                                                <%= voiture.getMarque() %> <%= voiture.getModele() %> - <%= voiture.getMatricule() %>
                                            </option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select>
                                        <label for="voiture">Véhicule</label>
                                        <div class="invalid-feedback">
                                            Veuillez sélectionner un véhicule.
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-floating position-relative">
                                        <i class="fas fa-calendar-alt form-icon"></i>
                                        <input type="date" id="date_debut" class="form-control" name="date_debut" value="<%= dateDebut %>" required>
                                        <label for="date_debut">Date de début</label>
                                        <div class="invalid-feedback">
                                            Veuillez sélectionner une date de début.
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-floating position-relative">
                                        <i class="fas fa-calendar-check form-icon"></i>
                                        <input type="date" id="date_fin" class="form-control" name="date_fin" value="<%= dateFin %>" required>
                                        <label for="date_fin">Date de fin</label>
                                        <div class="invalid-feedback">
                                            Veuillez sélectionner une date de fin.
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-floating position-relative">
                                        <i class="fas fa-euro-sign form-icon"></i>
                                        <input type="number" id="prix_total" class="form-control" name="prix_total" step="0.01" min="0" value="<%= location.getPrix_total() %>" required>
                                        <label for="prix_total">Prix total (€)</label>
                                        <div class="invalid-feedback">
                                            Veuillez saisir un prix valide.
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-floating position-relative">
                                        <i class="fas fa-tag form-icon"></i>
                                        <select id="statut" name="statut" class="form-select" required>
                                            <option value="">Sélectionner un statut</option>
                                            <option value="confirmée" <%= "confirmée".equalsIgnoreCase(location.getStatut()) ? "selected" : "" %>>Confirmée</option>
                                            <option value="en cours" <%= "en cours".equalsIgnoreCase(location.getStatut()) ? "selected" : "" %>>En cours</option>
                                            <option value="terminée" <%= "terminée".equalsIgnoreCase(location.getStatut()) ? "selected" : "" %>>Terminée</option>
                                            <option value="annulée" <%= "annulée".equalsIgnoreCase(location.getStatut()) ? "selected" : "" %>>Annulée</option>
                                        </select>
                                        <label for="statut">Statut</label>
                                        <div class="invalid-feedback">
                                            Veuillez sélectionner un statut.
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                <a href="${pageContext.request.contextPath}/location/list" class="btn btn-outline-secondary me-md-2">
                                    <i class="fas fa-times me-2"></i>Annuler
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save me-2"></i>Enregistrer les modifications
                                </button>
                            </div>
                        </form>
                        <% } else { %>
                        <div class="alert alert-danger">
                            <i class="fas fa-exclamation-triangle me-2"></i>Location introuvable.
                        </div>
                        <div class="text-center mt-3">
                            <a href="${pageContext.request.contextPath}/location/list" class="btn btn-primary">
                                <i class="fas fa-arrow-left me-2"></i>Retour à la liste
                            </a>
                        </div>
                        <% } %>
                    </div>
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
    // Form validation script
    (function () {
        'use strict'

        // Fetch all forms that need validation
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })
    })()

    // Date validation
    document.getElementById('date_debut').addEventListener('change', function() {
        const dateDebut = new Date(this.value);
        const dateFin = document.getElementById('date_fin');

        // If end date is before start date, reset it
        if (dateFin.value && new Date(dateFin.value) < dateDebut) {
            dateFin.value = this.value;
        }
    });
</script>
</body>
</html>