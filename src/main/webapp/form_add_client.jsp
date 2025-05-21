<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ajout client</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
    <div class="container">
        <a class="navbar-brand" href="/">
            <i class="fas fa-car-side me-2"></i>AutoDrive
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
                    <a href="/client" class="nav-link active d-flex align-items-center">
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

<div class="container py-5 fade-in">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="d-flex justify-content-between align-items-center page-header">
                <h1 class="h2 mb-0">
                    <i class="fa-solid fa-user-plus me-2 text-primary"></i>
                    Ajouter un client
                </h1>
                <a href="/client" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-2"></i>Retour à la liste
                </a>
            </div>

            <div class="card">
                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/client/save" method="post" class="needs-validation" novalidate>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="form-floating mb-3 position-relative">
                                    <i class="fa-solid fa-id-card form-icon"></i>
                                    <input type="text" id="num_cin" class="form-control" placeholder="Entrez votre CIN" name="num_cin" required>
                                    <label for="num_cin">Numéro CIN</label>
                                    <div class="invalid-feedback">
                                        Veuillez saisir un numéro CIN valide.
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating mb-3 position-relative">
                                    <i class="fa-solid fa-id-card form-icon"></i>
                                    <input type="text" id="num_permis" class="form-control" placeholder="Entrez votre numéro permis" name="num_permis" required>
                                    <label for="num_permis">Numéro permis</label>
                                    <div class="invalid-feedback">
                                        Veuillez saisir un numéro de permis valide.
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating mb-3 position-relative">
                                    <i class="fa-solid fa-user form-icon"></i>
                                    <input type="text" id="nom" class="form-control" placeholder="Entrez votre nom" name="nom" required>
                                    <label for="nom">Nom</label>
                                    <div class="invalid-feedback">
                                        Veuillez saisir un nom.
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating mb-3 position-relative">
                                    <i class="fa-solid fa-user form-icon"></i>
                                    <input type="text" id="prenom" class="form-control" placeholder="Entrez votre prénom" name="prenom" required>
                                    <label for="prenom">Prénom</label>
                                    <div class="invalid-feedback">
                                        Veuillez saisir un prénom.
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating mb-3 position-relative">
                                    <i class="fa-solid fa-calendar form-icon"></i>
                                    <input type="number" id="age" class="form-control" placeholder="Entrez votre age" name="age" min="18" max="120" required>
                                    <label for="age">Age</label>
                                    <div class="invalid-feedback">
                                        Veuillez saisir un âge valide (18-120).
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating mb-3 position-relative">
                                    <i class="fa-solid fa-phone form-icon"></i>
                                    <input type="tel" id="tel" class="form-control" placeholder="Entrez votre téléphone" name="tel" pattern="[0-9]{8,}" required>
                                    <label for="tel">Téléphone</label>
                                    <div class="invalid-feedback">
                                        Veuillez saisir un numéro de téléphone valide.
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-floating mb-3 position-relative">
                                    <i class="fas fa-envelope form-icon"></i>
                                    <input type="email" id="email" class="form-control" placeholder="Entrez votre adresse email" name="email" required>
                                    <label for="email">Adresse email</label>
                                    <div class="invalid-feedback">
                                        Veuillez saisir une adresse email valide.
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-floating mb-3 position-relative">
                                    <i class="fa-solid fa-location-dot form-icon"></i>
                                    <input type="text" id="adresse" class="form-control" placeholder="Entrez votre adresse" name="adresse" required>
                                    <label for="adresse">Adresse</label>
                                    <div class="invalid-feedback">
                                        Veuillez saisir une adresse.
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <a href="${pageContext.request.contextPath}/client" class="btn btn-light me-md-2">
                                <i class="fas fa-times me-2"></i>Annuler
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-2"></i>Enregistrer
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="bg-white py-4 mt-5 shadow-sm">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <p class="mb-0 text-muted">&copy; <%= new java.util.Date().getYear() + 1900 %> AutoDrive. Tous droits réservés.</p>
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
</script>
</body>
</html>