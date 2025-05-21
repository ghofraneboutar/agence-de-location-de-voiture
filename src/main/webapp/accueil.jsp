<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoElite - Location de Voitures</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&family=Nunito:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        /* Styles spécifiques à la page d'accueil */

        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --accent-color: #e74c3c;
            --light-bg: #f8f9fa;
            --dark-bg: #343a40;
        }
        body {
            font-family: 'Poppins', sans-serif;
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
            color: var(--primary-color);
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
            background-color: var(--primary-color);
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
            color: var(--primary-color);
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
            color: var(--primary-color);
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
            background-color: var(--primary-color);
        }
        .copyright {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }


        .search-form {
            background-color: white;
            border-radius: var(--border-radius);
            padding: 30px;
            box-shadow: var(--box-shadow);
            position: relative;
            z-index: 10;
        }


        .car-features {
            display: flex;
            justify-content: space-between;
            margin: 15px 0;
        }

        .why-us-item {
            padding: 30px;
            border-radius: var(--border-radius);
            background-color: white;
            box-shadow: var(--box-shadow);
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
            background: linear-gradient(135deg, var(--primary-light) 0%, var(--primary) 100%);
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
            background: linear-gradient(to right, #4cc9f0, #4361ee);
            color: white;
            border: none;
        }

        .model-button {
            background: linear-gradient(to right, #f72585, #b5179e);
            color: white;
            border: none;
        }

        .date-button {
            background: linear-gradient(to right, #38b000, #70e000);
            color: white;
            border: none;
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
        <a class="navbar-brand" href="#">AutoElite</a>
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
                    <a class="btn btn-light ms-2" href="login.jsp">Connexion</a>
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

<!-- Featured Cars Section -->
<section class="container mb-5 animate-slide-up">
    <h2 class="section-title">Nos véhicules populaires</h2>
    <div class="row" id="featured-cars">
        <!-- Les voitures seront chargées dynamiquement ici -->
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
                    <li><i class="fas fa-envelope me-2"></i> contact@autoelite.fr</li>
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
    // Fonction pour charger les voitures depuis l'API
    function loadCars() {
        // Simuler des données de voitures (à remplacer par un appel API réel)
        const cars = [
            {
                id: 1,
                marque: "Renault",
                modele: "Clio",
                image: "https://images.unsplash.com/photo-1541899481282-d53bffe3c35d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
                prix: 35,
                places: 5,
                transmission: "Manuelle",
                carburant: "Essence"
            },
            {
                id: 2,
                marque: "Peugeot",
                modele: "3008",
                image: "https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
                prix: 65,
                places: 5,
                transmission: "Automatique",
                carburant: "Diesel"
            },
            {
                id: 3,
                marque: "BMW",
                modele: "Série 5",
                image: "https://images.unsplash.com/photo-1555215695-3004980ad54e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
                prix: 120,
                places: 5,
                transmission: "Automatique",
                carburant: "Essence"
            },
            {
                id: 4,
                marque: "Volkswagen",
                modele: "Golf",
                image: "https://images.unsplash.com/photo-1471444928139-48c5bf5173f8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
                prix: 45,
                places: 5,
                transmission: "Manuelle",
                carburant: "Diesel"
            },
            {
                id: 5,
                marque: "Mercedes",
                modele: "Classe C",
                image: "https://images.unsplash.com/photo-1553440569-bcc63803a83d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
                prix: 95,
                places: 5,
                transmission: "Automatique",
                carburant: "Essence"
            },
            {
                id: 6,
                marque: "Toyota",
                modele: "Yaris",
                image: "https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
                prix: 30,
                places: 5,
                transmission: "Manuelle",
                carburant: "Hybride"
            }
        ];

        const carsContainer = document.getElementById('featured-cars');

        cars.forEach(car => {
            const carCard = document.createElement('div');
            carCard.className = 'col-md-4 mb-4';
            carCard.innerHTML = `
                <div class="car-card">
                    <img src="${car.image}" alt="${car.marque} ${car.modele}" class="car-img w-100">
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h5 class="card-title mb-0">${car.marque} ${car.modele}</h5>
                        </div>
                        <div class="car-features">
                            <div class="car-feature">
                                <i class="fas fa-user"></i> ${car.places} places
                            </div>
                            <div class="car-feature">
                                <i class="fas fa-gas-pump"></i> ${car.carburant}
                            </div>
                            <div class="car-feature">
                                <i class="fas fa-cog"></i> ${car.transmission}
                            </div>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="price">
                                <span class="fs-4 fw-bold">${car.prix}€</span> / jour
                            </div>
                            <a href="reservation?id=${car.id}" class="btn btn-rent">Réserver</a>
                        </div>
                    </div>
                </div>
            `;
            carsContainer.appendChild(carCard);
        });
    }

    // Charger les voitures au chargement de la page
    document.addEventListener('DOMContentLoaded', loadCars);
</script>
</body>
</html>