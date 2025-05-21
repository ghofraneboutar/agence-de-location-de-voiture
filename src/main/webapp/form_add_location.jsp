<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Client" %>
<%@ page import="entities.Voiture" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Ajouter une Location | AutoElite</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&family=Nunito:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/modern-theme.css">
    <style>
        /* Styles spécifiques au formulaire */
        .form-icon {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            color: var(--primary-color);
            z-index: 10;
        }

        .form-floating > .form-control,
        .form-floating > .form-select {
            padding-left: 40px;
        }

        .form-section {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .form-section-title {
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--primary-color);
            display: flex;
            align-items: center;
        }

        .form-section-title i {
            margin-right: 10px;
        }

        .card-header {
            background-color: var(--primary-color);
            color: white;
            font-weight: 600;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            background-color: var(--accent-color);
            border-color: var(--accent-color);
        }

        .btn-outline-secondary {
            color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-outline-secondary:hover {
            background-color: var(--primary-color);
            color: white;
        }

        .page-header {
            margin-bottom: 30px;
            border-bottom: 2px solid var(--primary-color);
            padding-bottom: 15px;
        }

        /* Animation */
        .animate-slide-up {
            animation: slideUp 0.5s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Éléments décoratifs */
        .decorative-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle at 10% 20%, rgba(31, 45, 61, 0.03) 0%, rgba(52, 152, 219, 0.03) 90%);
            z-index: -1;
        }

        .decorative-circle {
            position: fixed;
            bottom: -300px;
            right: -300px;
            width: 600px;
            height: 600px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(31, 45, 61, 0.05) 0%, rgba(52, 152, 219, 0.05) 100%);
            z-index: -1;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .form-section {
                padding: 15px;
            }
        }
    </style>
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
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
                    <i class="fas fa-exclamation-circle me-2"></i> <%= request.getAttribute("error") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <% } %>

                <div class="d-flex justify-content-between align-items-center page-header">
                    <h1 class="display-6">
                        <i class="fas fa-calendar-plus me-3"></i>Nouvelle Location
                    </h1>
                    <a href="${pageContext.request.contextPath}/location/list" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left me-2"></i>Retour à la liste
                    </a>
                </div>

                <div class="card shadow-sm">
                    <div class="card-header py-3">
                        <h5 class="mb-0">
                            <i class="fas fa-info-circle me-2"></i>Informations de la location
                        </h5>
                    </div>
                    <div class="card-body p-4">
                        <form action="${pageContext.request.contextPath}/location/save" method="post" class="needs-validation" novalidate>

                            <!-- Voiture pré-sélectionnée si fournie dans l'URL -->
                            <%
                                String voitureId = request.getParameter("voiture");
                            %>

                            <!-- Section Client -->
                            <div class="form-section">
                                <h5 class="form-section-title">
                                    <i class="fas fa-user-circle"></i>Informations du client
                                </h5>
                                <div class="mb-4">
                                    <div class="form-floating position-relative">
                                        <i class="fas fa-user form-icon"></i>
                                        <select id="client" name="client" class="form-select" required>
                                            <option value="">Sélectionner un client</option>
                                            <%
                                                List<Client> clients = (List<Client>) request.getAttribute("clients");
                                                if (clients != null) {
                                                    for (Client client : clients) {
                                            %>
                                            <option value="<%= client.getCode_client() %>"><%= client.getNom() %> <%= client.getPrenom() %> - <%= client.getNum_cin() %></option>
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
                            </div>

                            <!-- Section Véhicule -->
                            <div class="form-section">
                                <h5 class="form-section-title">
                                    <i class="fas fa-car"></i>Informations du véhicule
                                </h5>
                                <div class="mb-4">
                                    <div class="form-floating position-relative">
                                        <i class="fas fa-car form-icon"></i>
                                        <select id="voiture" name="voiture" class="form-select" required>
                                            <option value="">Sélectionner un véhicule</option>
                                            <%
                                                List<Voiture> voitures = (List<Voiture>) request.getAttribute("voitures");
                                                if (voitures != null) {
                                                    for (Voiture voiture : voitures) {
                                            %>
                                            <option value="<%= voiture.getCode_voiture() %>" <%= (voitureId != null && voitureId.equals(String.valueOf(voiture.getCode_voiture()))) ? "selected" : "" %>>
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
                            </div>

                            <!-- Section Période -->
                            <div class="form-section">
                                <h5 class="form-section-title">
                                    <i class="fas fa-calendar-alt"></i>Période de location
                                </h5>
                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <div class="form-floating position-relative">
                                            <i class="fas fa-calendar-alt form-icon"></i>
                                            <input type="date" id="date_debut" class="form-control" name="date_debut" required>
                                            <label for="date_debut">Date de début</label>
                                            <div class="invalid-feedback">
                                                Veuillez sélectionner une date de début.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-floating position-relative">
                                            <i class="fas fa-calendar-check form-icon"></i>
                                            <input type="date" id="date_fin" class="form-control" name="date_fin" required>
                                            <label for="date_fin">Date de fin</label>
                                            <div class="invalid-feedback">
                                                Veuillez sélectionner une date de fin.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Champs cachés pour le prix et le statut -->
                            <input type="hidden" id="prix_total" name="prix_total" value="0">
                            <input type="hidden" id="statut" name="statut" value="confirmée">

                            <!-- Boutons d'action -->
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                <a href="${pageContext.request.contextPath}/location/list" class="btn btn-outline-secondary me-md-2">
                                    <i class="fas fa-times me-2"></i>Annuler
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save me-2"></i>Confirmer la location
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Aide et informations -->
                <div class="card mt-4">
                    <div class="card-body">
                        <h5 class="card-title">
                            <i class="fas fa-info-circle me-2 text-primary"></i>Informations
                        </h5>
                        <ul class="mb-0">
                            <li>Vérifiez la disponibilité du véhicule pour la période sélectionnée.</li>
                            <li>Sélectionnez les dates de début et de fin de la location.</li>
                            <li>Le prix sera calculé automatiquement en fonction du véhicule et de la durée.</li>
                            <li>Cliquez sur "Confirmer la location" pour finaliser la réservation.</li>
                        </ul>
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
    document.addEventListener('DOMContentLoaded', function() {
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('date_debut').min = today;
        document.getElementById('date_fin').min = today;

        // Assurer que la date de fin est après la date de début
        document.getElementById('date_debut').addEventListener('change', function() {
            const dateDebut = this.value;
            document.getElementById('date_fin').min = dateDebut;

            // Si la date de fin est avant la date de début, la réinitialiser
            const dateFin = document.getElementById('date_fin').value;
            if (dateFin && dateFin < dateDebut) {
                document.getElementById('date_fin').value = dateDebut;
            }

            // Calculer le prix automatiquement (pour le champ caché)
            calculerPrix();
        });

        document.getElementById('date_fin').addEventListener('change', function() {
            calculerPrix();
        });

        document.getElementById('voiture').addEventListener('change', function() {
            calculerPrix();
        });

        // Fonction pour calculer le prix automatiquement
        function calculerPrix() {
            const voitureSelect = document.getElementById('voiture');
            const dateDebut = document.getElementById('date_debut').value;
            const dateFin = document.getElementById('date_fin').value;

            if (voitureSelect.value && dateDebut && dateFin) {
                // Calculer le nombre de jours
                const debut = new Date(dateDebut);
                const fin = new Date(dateFin);
                const diffTime = Math.abs(fin - debut);
                const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1; // +1 pour inclure le jour de début

                // Prix par jour selon la marque (simulation)
                let prixJour = 50; // Prix par défaut

                const voitureText = voitureSelect.options[voitureSelect.selectedIndex].text.toLowerCase();
                if (voitureText.includes('bmw') || voitureText.includes('mercedes') || voitureText.includes('audi')) {
                    prixJour = 80;
                } else if (voitureText.includes('volkswagen') || voitureText.includes('peugeot') || voitureText.includes('renault')) {
                    prixJour = 50;
                } else {
                    prixJour = 30;
                }

                // Calculer le prix total
                const prixTotal = prixJour * diffDays;
                document.getElementById('prix_total').value = prixTotal.toFixed(2);
            }
        }
    });
</script>
</body>
</html>