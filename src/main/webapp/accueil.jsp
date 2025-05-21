<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Voiture" %>
<%@ page import="dao.ImpIDaoVoiture" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoDrive- Location de Voitures</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&family=Nunito:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-theme.css">
    <style>
        /* Styles spécifiques à la page d'accueil */
        :root {
            --primary-color: #1f2d3d;
            --secondary-color: #2c3e50;
            --accent-color: #3498db;
            --light-bg: #f8f9fa;
            --dark-bg: #343a40;
        }

        body {
            font-family: 'Montserrat', sans-serif;
            background-color: var(--light-bg);
        }

        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://images.unsplash.com/photo-1485291571150-772bcfc10da5?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 120px 0;
            margin-bottom: 50px;
        }

        .navbar {
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-weight: 700;
            color: var(--primary-color);
        }

        .search-form {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
        }

        .car-card {
            border: none;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            height: 100%;
        }

        .car-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }

        .car-img {
            height: 200px;
            object-fit: cover;
        }

        .car-features {
            display: flex;
            justify-content: space-between;
            margin: 15px 0;
        }

        .car-feature {
            display: flex;
            align-items: center;
            font-size: 14px;
            color: #6c757d;
        }

        .car-feature i {
            margin-right: 5px;
            color: var(--accent-color);
        }

        .btn-rent {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .btn-rent:hover {
            background-color: var(--accent-color);
        }

        .section-title {
            position: relative;
            margin-bottom: 40px;
            font-weight: 700;
            color: var(--secondary-color);
        }

        .section-title:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -10px;
            width: 50px;
            height: 3px;
            background-color: var(--accent-color);
        }

        .testimonial {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .testimonial-img {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 20px;
        }

        footer {
            background-color: var(--secondary-color);
            color: white;
            padding: 50px 0 20px;
        }

        .footer-links h5 {
            color: var(--accent-color);
            margin-bottom: 20px;
            font-weight: 600;
        }

        .footer-links ul {
            list-style: none;
            padding-left: 0;
        }

        .footer-links li {
            margin-bottom: 10px;
        }

        .footer-links a {
            color: #ddd;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: var(--accent-color);
        }

        .social-icons a {
            display: inline-block;
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            margin-right: 10px;
            color: white;
            transition: background-color 0.3s ease;
        }

        .social-icons a:hover {
            background-color: var(--accent-color);
        }

        .copyright {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .search-form {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
            position: relative;
            z-index: 10;
        }

        .why-us-item {
            padding: 30px;
            border-radius: 10px;
            background-color: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            height: 100%;
        }

        .why-us-item:hover {
            transform: translateY(-5px);
        }

        .why-us-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: linear-gradient(135deg, #1f2d3d 0%, #3498db 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: white;
        }

        .search-button-group {
            display: flex;
            gap: 10px;
        }

        .search-button {
            flex: 1;
            border-radius: 2rem;
            font-weight: 600;
            padding: 10px 15px;
            transition: all 0.3s ease;
        }

        .search-button:hover {
            transform: translateY(-3px);
        }

        .brand-button {
            background: linear-gradient(to right, #1f2d3d, #3498db);
            color: white;
            border: none;
        }

        .model-button {
            background: linear-gradient(to right, #1f2d3d, #3498db);
            color: white;
            border: none;
        }

        .date-button {
            background: linear-gradient(to right, #1f2d3d, #3498db);
            color: white;
            border: none;
        }

        .car-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: 600;
            font-size: 12px;
        }

        .badge-new {
            background-color: #28a745;
            color: white;
        }

        .badge-popular {
            background-color: #dc3545;
            color: white;
        }

        .car-price {
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--primary-color);
        }

        .car-price-day {
            font-size: 0.875rem;
            color: #6c757d;
        }

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
    </style>
</head>
<body>
<!-- Éléments décoratifs -->
<div class="decorative-bg"></div>
<div class="decorative-circle"></div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-car-side me-2"></i>AutoDrive
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Accueil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/voiture/list">Véhicules</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">À propos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-primary ms-2" href="login.jsp">Connexion</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <h1 class="display-4 fw-bold mb-4">Trouvez la voiture parfaite pour votre voyage</h1>
                <p class="lead mb-5">Des prix compétitifs, une large gamme de véhicules et un service client exceptionnel.</p>
            </div>
            <div class="col-lg-6">
                <div class="search-form">
                    <h4 class="mb-4 text-dark">Rechercher une voiture</h4>
                    <form action="${pageContext.request.contextPath}/voiture/recherche" method="GET">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="marque" class="form-label">Marque</label>
                                <input type="text" class="form-control" id="marque" name="marque" placeholder="Ex: Renault, Peugeot...">
                            </div>
                            <div class="col-md-6">
                                <label for="modele" class="form-label">Modèle</label>
                                <input type="text" class="form-control" id="modele" name="modele" placeholder="Ex: Clio, 308...">
                            </div>
                            <div class="col-md-6">
                                <label for="date_debut" class="form-label">Date de début</label>
                                <input type="date" class="form-control" id="date_debut" name="date_debut" required>
                            </div>
                            <div class="col-md-6">
                                <label for="date_fin" class="form-label">Date de fin</label>
                                <input type="date" class="form-control" id="date_fin" name="date_fin" required>
                            </div>
                            <div class="col-12">
                                <div class="search-button-group">
                                    <button type="submit" name="searchType" value="marque" class="btn search-button brand-button">
                                        <i class="fas fa-car me-2"></i>Par marque
                                    </button>
                                    <button type="submit" name="searchType" value="modele" class="btn search-button model-button">
                                        <i class="fas fa-car-side me-2"></i>Par modèle
                                    </button>
                                    <button type="submit" name="searchType" value="date" class="btn search-button date-button">
                                        <i class="fas fa-calendar-alt me-2"></i>Par date
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Alert pour les erreurs -->
<% if (request.getAttribute("error") != null) { %>
<div class="container mb-4">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <i class="fas fa-exclamation-circle me-2"></i> <%= request.getAttribute("error") %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<% } %>

<!-- Featured Cars Section -->
<section class="container mb-5 animate-slide-up">
    <h2 class="section-title">Nos véhicules disponibles</h2>
    <div class="row" id="featured-cars">
        <%
            ImpIDaoVoiture daoVoiture = new ImpIDaoVoiture();
            List<Voiture> voitures = daoVoiture.getVoitures();
            if (voitures != null && !voitures.isEmpty()) {
                for (Voiture voiture : voitures) {
                    String imageUrl = voiture.getImageUrl();
                    if (imageUrl == null || imageUrl.isEmpty()) {
                        imageUrl = "https://images.unsplash.com/photo-1541899481282-d53bffe3c35d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80";
                    }
                    double prixJour = 30;
                    if ("BMW".equalsIgnoreCase(voiture.getMarque()) || "Mercedes".equalsIgnoreCase(voiture.getMarque()) || "Audi".equalsIgnoreCase(voiture.getMarque())) {
                        prixJour = 80;
                    } else if ("Volkswagen".equalsIgnoreCase(voiture.getMarque()) || "Peugeot".equalsIgnoreCase(voiture.getMarque()) || "Renault".equalsIgnoreCase(voiture.getMarque())) {
                        prixJour = 50;
                    }
        %>
        <div class="col-md-4 mb-4">
            <div class="car-card">
                <div class="position-relative">
                    <img src="<%= imageUrl %>" alt="<%= voiture.getMarque() %> <%= voiture.getModele() %>" class="car-img w-100">
                    <% if (Math.random() > 0.7) { %>
                    <span class="car-badge badge-popular">Populaire</span>
                    <% } else if (Math.random() > 0.8) { %>
                    <span class="car-badge badge-new">Nouveau</span>
                    <% } %>
                </div>
                <div class="card-body p-4">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <h5 class="card-title mb-0"><%= voiture.getMarque() %> <%= voiture.getModele() %></h5>
                    </div>
                    <p class="text-muted small mb-3">Matricule: <%= voiture.getMatricule() %></p>
                    <div class="car-features">
                        <div class="car-feature">
                            <i class="fas fa-car"></i> <%= voiture.getParc() != null ? voiture.getParc().getNum_parc() : "N/A" %>
                        </div>
                        <div class="car-feature">
                            <i class="fas fa-tachometer-alt"></i> <%= String.format("%.0f", voiture.getKilometrage()) %> km
                        </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-center mt-3">
                        <div class="car-price">
                            <%= String.format("%.0f", prixJour) %>TND <span class="car-price-day">/ jour</span>
                        </div>
                        <a href="${pageContext.request.contextPath}/location/add?voiture=<%= voiture.getCode_voiture() %>" class="btn btn-rent">
                            <i class="fas fa-calendar-check me-2"></i>Réserver
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="col-12 text-center py-5">
            <i class="fas fa-car-crash fa-3x mb-3 text-muted"></i>
            <h4>Aucune voiture disponible pour le moment</h4>
            <p class="text-muted">Veuillez réessayer ultérieurement ou modifier vos critères de recherche.</p>
        </div>
        <% } %>
    </div>
</section>

<!-- Why Choose Us Section -->
<section class="py-5 mb-5 animate-slide-up">
    <div class="container">
        <h2 class="section-title text-center mb-5">Pourquoi nous choisir ?</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="why-us-item text-center">
                    <div class="why-us-icon">
                        <i class="fas fa-car-side fa-2x"></i>
                    </div>
                    <h4 class="mb-3">Large gamme de véhicules</h4>
                    <p class="mb-0">Des voitures économiques aux modèles de luxe, nous avons le véhicule parfait pour vos besoins.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="why-us-item text-center">
                    <div class="why-us-icon">
                        <i class="fas fa-money-bill-wave fa-2x"></i>
                    </div>
                    <h4 class="mb-3">Prix compétitifs</h4>
                    <p class="mb-0">Nous offrons les meilleurs tarifs du marché avec des options flexibles pour tous les budgets.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="why-us-item text-center">
                    <div class="why-us-icon">
                        <i class="fas fa-headset fa-2x"></i>
                    </div>
                    <h4 class="mb-3">Service client 24/7</h4>
                    <p class="mb-0">Notre équipe est disponible à tout moment pour répondre à vos questions et vous assister.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials Section -->
<section class="container mb-5 animate-slide-up">
    <h2 class="section-title">Ce que disent nos clients</h2>
    <div class="row">
        <div class="col-md-6">
            <div class="testimonial">
                <div class="d-flex align-items-center mb-3">
                    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Client" class="testimonial-img">
                    <div>
                        <h5 class="mb-0">Thomas Dupont</h5>
                        <small class="text-muted">Paris</small>
                    </div>
                </div>
                <p class="mb-0">Service exceptionnel ! La voiture était impeccable et le processus de location très simple. Je recommande vivement AutoElite pour vos besoins de location.</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="testimonial">
                <div class="d-flex align-items-center mb-3">
                    <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Client" class="testimonial-img">
                    <div>
                        <h5 class="mb-0">Sophie Martin</h5>
                        <small class="text-muted">Lyon</small>
                    </div>
                </div>
                <p class="mb-0">J'ai loué une voiture pour un week-end et tout s'est parfaitement déroulé. Le personnel était très professionnel et le véhicule en excellent état.</p>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-4 footer-links">
                <h5>AutoElite</h5>
                <p>Votre partenaire de confiance pour la location de voitures depuis 2010. Nous offrons un service de qualité à des prix compétitifs.</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="col-md-2 footer-links">
                <h5>Liens rapides</h5>
                <ul>
                    <li><a href="#">Accueil</a></li>
                    <li><a href="#">À propos</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-links">
                <h5>Nos services</h5>
                <ul>
                    <li><a href="#">Location courte durée</a></li>
                    <li><a href="#">Location longue durée</a></li>
                    <li><a href="#">Location avec chauffeur</a></li>
                    <li><a href="#">Transfert aéroport</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-links">
                <h5>Contact</h5>
                <ul>
                    <li><i class="fas fa-map-marker-alt me-2"></i> 123 Avenue des Champs-Élysées, Paris</li>
                    <li><i class="fas fa-phone me-2"></i> +33 1 23 45 67 89</li>
                    <li><i class="fas fa-envelope me-2"></i> contact@autoDrive.fr</li>
                </ul>
            </div>
        </div>
        <div class="text-center copyright">
            <p>&copy; <%= java.time.Year.now() %> AutoElite. Tous droits réservés.</p>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Définir la date minimale pour les champs de date (aujourd'hui)
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
        });
    });
</script>
</body>
</html>