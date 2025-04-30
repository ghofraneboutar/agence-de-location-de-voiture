<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agence Location</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .feature-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .icon-circle {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
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
                    <a class="nav-link active d-flex align-items-center" aria-current="page" href="/">
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
                    <a href="/voiture" class="nav-link d-flex align-items-center">
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
    <div class="row mb-5">
        <div class="col-12 text-center">
            <h1 class="display-4 fw-bold mb-3"><%= "Bienvenue sur notre site" %>
            </h1>
            <p class="lead text-muted">Système de gestion pour agence de location de voitures</p>
        </div>
    </div>

    <div class="row g-4">
        <div class="col-md-4">
            <div class="card h-100 border-0 shadow-sm feature-card">
                <div class="card-body text-center p-4">
                    <div class="icon-circle bg-primary bg-opacity-10">
                        <i class="fa-solid fa-people-group fa-2x text-primary"></i>
                    </div>
                    <h5 class="card-title fw-bold mb-3">Gestion clients</h5>
                    <p class="card-text text-muted mb-4">Gérez vos clients et leurs informations personnelles</p>
                    <a href="client" class="btn btn-primary">Accéder</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card h-100 border-0 shadow-sm feature-card">
                <div class="card-body text-center p-4">
                    <div class="icon-circle bg-success bg-opacity-10">
                        <i class="fa-solid fa-warehouse fa-2x text-success"></i>
                    </div>
                    <h5 class="card-title fw-bold mb-3">Gestion parcs</h5>
                    <p class="card-text text-muted mb-4">Gérez vos différents parcs de véhicules</p>
                    <a href="parc" class="btn btn-success">Accéder</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card h-100 border-0 shadow-sm feature-card">
                <div class="card-body text-center p-4">
                    <div class="icon-circle bg-danger bg-opacity-10">
                        <i class="fa-solid fa-car fa-2x text-danger"></i>
                    </div>
                    <h5 class="card-title fw-bold mb-3">Gestion voitures</h5>
                    <p class="card-text text-muted mb-4">Gérez votre flotte de véhicules disponibles</p>
                    <a href="voiture" class="btn btn-danger">Accéder</a>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="bg-light py-4 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <p class="mb-0 text-muted">&copy; <%= new java.util.Date().getYear() + 1900 %> Agence Location. Tous
                    droits réservés.</p>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>