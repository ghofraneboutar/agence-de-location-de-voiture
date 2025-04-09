<%--
  Created by IntelliJ IDEA.
  User: moham
  Date: 3/19/2025
  Time: 9:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Gestion clients</title>
</head>
<body>
<div class="container mt-3">
    <h1>Ajouter Client</h1>
    <form action="ClientServlet/add" method="post">

        <div class="form-floating mb-4">
            <input type="number" id="num_cin" class="form-control" placeholder="Entrez votre CIN" name="num_cin"
                   required>
            <label for="num_cin"><i class="fa-solid fa-id-card"></i>Numéro CIN</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="nom" class="form-control" placeholder="Entrez votre nom" name="nom"
                   required>
            <label for="nom"><i class="fa-solid fa-user"></i>Nom</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="prenom" class="form-control" placeholder="Entrez votre prénom" name="prenom"
                   required>
            <label for="prenom"><i class="fa-solid fa-user"></i>Prénom</label>
        </div>
        <div class="form-floating mb-4">
            <input type="number" id="age" class="form-control" placeholder="Entrez votre age" name="age"
                   required>
            <label for="age"><i class="fa-solid fa-user"></i>Age</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="adresse" class="form-control" placeholder="Entrez votre adresse" name="adresse"
                   required>
            <label for="adresse"><i class="fa-solid fa-location-dot"></i>Adresse</label>
        </div>
        <div class="form-floating mb-4">
            <input type="number" id="num_permis" class="form-control" placeholder="Entrez votre numéro permis"
                   name="num_permis"
                   required>
            <label for="num_permis"><i class="fa-solid fa-id-card"></i></i>Numéro permis</label>
        </div>
        <div class="form-floating mb-4">
            <input type="email" id="email" class="form-control" placeholder="Entrez votre adresse email" name="email"
                   required>
            <label for="email"><i class="fas fa-envelope me-2"></i>Adresse email</label>
        </div>
        <div class="form-floating mb-4">
            <input type="tel" id="tel" class="form-control" placeholder="Entrez votre téléphone" name="tel"
                   required>
            <label for="tel"><i class="fa-solid fa-phone"></i>Téléphone</label>
        </div>
        <div class="d-flex justify-content-between align-items-center mb-3">
            <input type="submit" class="form-control btn btn-primary" value="Ajouter Client">
        </div>
    </form>
    <h1>Supprimer Client</h1>
    <form action="ClientServlet/delete" method="post" name="delete">

        <div class="form-floating mb-4">
            <input type="number" id="num_cin_del" class="form-control" placeholder="Entrez CIN du client à supprimer"
                   name="num_cin2"
                   required>
            <label for="num_cin_del"><i class="fa-solid fa-id-card"></i>Numéro CIN</label>
        </div>


        <div class="d-flex justify-content-between align-items-center mb-3">
            <input type="submit" class="form-control btn btn-danger" value="Supprimer Client">
        </div>
    </form>
    <h1>Modifier Client</h1>
    <form action="ClientServlet/update" method="post">

        <div class="form-floating mb-4">
            <input type="number" id="num_cin_up" class="form-control" placeholder="Entrez votre CIN" name="num_cin"
                   required>
            <label for="num_cin_up"><i class="fa-solid fa-id-card"></i>Numéro CIN</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="nom_up" class="form-control" placeholder="Entrez votre nom" name="nom"
                   required>
            <label for="nom_up"><i class="fa-solid fa-user"></i>Nom</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="prenom_up" class="form-control" placeholder="Entrez votre prénom" name="prenom"
                   required>
            <label for="prenom_up"><i class="fa-solid fa-user"></i>Prénom</label>
        </div>
        <div class="form-floating mb-4">
            <input type="number" id="age_up" class="form-control" placeholder="Entrez votre age" name="age"
                   required>
            <label for="age_up"><i class="fa-solid fa-user"></i>Age</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="adresse_up" class="form-control" placeholder="Entrez votre adresse" name="adresse"
                   required>
            <label for="adresse_up"><i class="fa-solid fa-location-dot"></i>Adresse</label>
        </div>
        <div class="form-floating mb-4">
            <input type="number" id="num_permis_up" class="form-control" placeholder="Entrez votre numéro permis"
                   name="num_permis"
                   required>
            <label for="num_permis_up"><i class="fa-solid fa-id-card"></i></i>Numéro permis</label>
        </div>
        <div class="form-floating mb-4">
            <input type="email" id="email_up" class="form-control" placeholder="Entrez votre adresse email" name="email"
                   required>
            <label for="email_up"><i class="fas fa-envelope me-2"></i>Adresse email</label>
        </div>
        <div class="form-floating mb-4">
            <input type="tel" id="tel_up" class="form-control" placeholder="Entrez votre téléphone" name="tel"
                   required>
            <label for="tel_up"><i class="fa-solid fa-phone"></i>Téléphone</label>
        </div>
        <div class="d-flex justify-content-between align-items-center mb-3">
            <input type="submit" class="form-control btn btn-secondary" value="Modifier Client">
        </div>
    </form>
</div>

</body>
</html>
