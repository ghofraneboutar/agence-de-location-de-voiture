<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoDrive - Connexion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --accent-color: #e74c3c;
            --light-bg: #f8f9fa;
            --dark-bg: #343a40;
            --text-light: #f8f9fa;
            --text-dark: #343a40;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light-bg);
            transition: background-color 0.3s ease;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        body.dark-mode {
            background: linear-gradient(135deg, #1f2d3d 0%, #3b4a5a 100%);
            color: var(--text-light);
        }

        .login-container {
            max-width: 900px;
            width: 100%;
            display: flex;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .login-image {
            flex: 1;
            background: url('https://images.unsplash.com/photo-1485291571150-772bcfc10da5?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            position: relative;
            display: none;
        }

        @media (min-width: 768px) {
            .login-image {
                display: block;
            }
        }

        .login-image::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(52, 152, 219, 0.8) 0%, rgba(44, 62, 80, 0.8) 100%);
        }

        .login-image-content {
            position: absolute;
            bottom: 40px;
            left: 40px;
            color: white;
            z-index: 1;
        }

        .login-form-container {
            flex: 1;
            padding: 40px;
            background-color: white;
            transition: background-color 0.3s ease;
        }

        body.dark-mode .login-form-container {
            background-color: #2c3e50;
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h1 {
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        body.dark-mode .login-header h1 {
            color: var(--text-light);
        }

        .login-header p {
            color: #6c757d;
        }

        body.dark-mode .login-header p {
            color: #adb5bd;
        }

        .form-floating {
            margin-bottom: 20px;
        }

        .form-floating label {
            color: #6c757d;
        }

        body.dark-mode .form-floating label {
            color: #adb5bd;
        }

        .form-control {
            border-radius: 5px;
            padding: 12px 15px;
            height: auto;
            border: 1px solid #ced4da;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        body.dark-mode .form-control {
            background-color: #3b4a5a;
            border-color: #4b5a6a;
            color: var(--text-light);
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
        }

        .btn-login {
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px 15px;
            font-weight: 600;
            width: 100%;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .btn-login:hover {
            background-color: #2980b9;
        }

        .login-footer {
            text-align: center;
            margin-top: 30px;
        }

        .login-footer a {
            color: var(--primary-color);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .login-footer a:hover {
            color: #2980b9;
            text-decoration: underline;
        }

        body.dark-mode .login-footer a {
            color: #3498db;
        }

        .password-toggle {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #6c757d;
            cursor: pointer;
            z-index: 10;
        }

        body.dark-mode .password-toggle {
            color: #adb5bd;
        }

        .theme-toggle {
            position: absolute;
            top: 20px;
            right: 20px;
            background: none;
            border: none;
            color: #6c757d;
            font-size: 1.5rem;
            cursor: pointer;
            z-index: 100;
            transition: color 0.3s ease;
        }

        .theme-toggle:hover {
            color: var(--primary-color);
        }

        body.dark-mode .theme-toggle {
            color: var(--text-light);
        }

        .car-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        body.dark-mode .car-icon {
            color: var(--text-light);
        }

        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .remember-me input {
            margin-right: 10px;
        }

        body.dark-mode .remember-me {
            color: var(--text-light);
        }

        .social-login {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }

        .social-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .social-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .social-btn.facebook {
            background-color: #3b5998;
        }

        .social-btn.google {
            background-color: #db4437;
        }

        .social-btn.twitter {
            background-color: #1da1f2;
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 30px 0;
        }

        .divider::before, .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background-color: #ced4da;
        }

        body.dark-mode .divider::before, body.dark-mode .divider::after {
            background-color: #4b5a6a;
        }

        .divider span {
            padding: 0 15px;
            color: #6c757d;
        }

        body.dark-mode .divider span {
            color: #adb5bd;
        }
    </style>
</head>
<body>
<button id="themeToggle" class="theme-toggle">
    <i class="fas fa-moon"></i>
</button>

<div class="login-container">
    <div class="login-image">
        <div class="login-image-content">
            <h2>Bienvenue sur AutoDrive</h2>
            <p>Le meilleur service de location de voitures pour tous vos besoins.</p>
        </div>
    </div>
    <div class="login-form-container">
        <div class="login-header">
            <div class="car-icon">
                <i class="fas fa-car"></i>
            </div>
            <h1>Connexion</h1>
            <p>Entrez vos identifiants pour accéder à votre compte</p>
        </div>

        <form action="LoginServlet" method="POST">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="username" name="login" placeholder="Nom d'utilisateur" required>
                <label for="username"><i class="fas fa-user me-2"></i>Nom d'utilisateur</label>
            </div>

            <div class="form-floating mb-3 position-relative">
                <input type="password" class="form-control" id="password" name="password" placeholder="Mot de passe" required>
                <label for="password"><i class="fas fa-lock me-2"></i>Mot de passe</label>
                <button type="button" class="password-toggle" id="togglePassword">
                    <i class="fas fa-eye"></i>
                </button>
            </div>

            <div class="remember-me">
                <input type="checkbox" id="remember" name="remember">
                <label for="remember">Se souvenir de moi</label>
            </div>

            <button type="submit" class="btn btn-login">Se connecter</button>

            <div class="login-footer">
                <a href="#">Mot de passe oublié ?</a>
            </div>

            <div class="divider">
                <span>ou</span>
            </div>

            <div class="social-login">
                <a href="#" class="social-btn facebook">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="#" class="social-btn google">
                    <i class="fab fa-google"></i>
                </a>
                <a href="#" class="social-btn twitter">
                    <i class="fab fa-twitter"></i>
                </a>
            </div>

            <div class="login-footer mt-4">
                <p>Vous n'avez pas de compte ? <a href="#">S'inscrire</a></p>
            </div>
        </form>
    </div>
</div>

<script>
    // Toggle password visibility
    const togglePassword = document.getElementById('togglePassword');
    const password = document.getElementById('password');

    togglePassword.addEventListener('click', function() {
        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
        password.setAttribute('type', type);
        this.querySelector('i').classList.toggle('fa-eye');
        this.querySelector('i').classList.toggle('fa-eye-slash');
    });

    // Toggle theme
    const themeToggle = document.getElementById('themeToggle');
    const body = document.body;

    // Check for saved theme preference or use preferred color scheme
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'dark' || (!savedTheme && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        body.classList.add('dark-mode');
        themeToggle.querySelector('i').classList.remove('fa-moon');
        themeToggle.querySelector('i').classList.add('fa-sun');
    }

    themeToggle.addEventListener('click', function() {
        body.classList.toggle('dark-mode');
        const isDark = body.classList.contains('dark-mode');

        // Toggle icon
        this.querySelector('i').classList.toggle('fa-moon', !isDark);
        this.querySelector('i').classList.toggle('fa-sun', isDark);

        // Save preference
        localStorage.setItem('theme', isDark ? 'dark' : 'light');
    });
</script>
</body>
</html>