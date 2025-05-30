<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajout client</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        :root {
            --primary-color: #4361ee;
            --primary-light: #eef2ff;
            --primary-dark: #3051d3;
            --danger-color: #ef476f;
            --danger-light: #ffedf2;
            --success-color: #06d6a0;
            --success-light: #e6f9f5;
            --secondary-color: #3a86ff;
            --light-bg: #f8f9fa;
            --dark-text: #212529;
            --gray-text: #6c757d;
            --border-radius: 10px;
            --card-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            --transition: all 0.3s ease;
        }

        body {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            color: var(--dark-text);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }

        .navbar {
            background-color: white !important;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
            padding: 0.8rem 1rem;
        }

        .navbar-brand {
            font-weight: 700;
            color: var(--primary-color) !important;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .navbar-brand i {
            font-size: 1.5rem;
        }

        .nav-link {
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            transition: var(--transition);
            margin: 0 0.2rem;
        }

        .nav-link:hover {
            background-color: var(--primary-light);
            color: var(--primary-color) !important;
        }

        .nav-link.active {
            background-color: var(--primary-light);
            color: var(--primary-color) !important;
        }

        .nav-link i {
            margin-right: 0.5rem;
        }

        .page-header {
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            padding: 2rem;
            margin-bottom: 2rem;
            text-align: center;
        }

        .page-header h1 {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .page-header p {
            color: var(--gray-text);
            margin-bottom: 0;
        }

        .form-card {
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            overflow: hidden;
            transition: var(--transition);
            margin-bottom: 2rem;
        }

        .form-header {
            background-color: var(--primary-light);
            padding: 1.5rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            text-align: center;
        }

        .form-header h2 {
            color: var(--primary-color);
            margin: 0;
            font-size: 1.5rem;
            font-weight: 600;
        }

        .form-body {
            padding: 2rem;
        }

        .form-section {
            margin-bottom: 2rem;
            padding-bottom: 2rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        .form-section:last-child {
            margin-bottom: 0;
            padding-bottom: 0;
            border-bottom: none;
        }

        .section-title {
            color: var(--primary-color);
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }

        .section-title i {
            margin-right: 0.75rem;
            background-color: var(--primary-light);
            color: var(--primary-color);
            width: 32px;
            height: 32px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-floating {
            margin-bottom: 1.5rem;
        }

        .form-floating:last-child {
            margin-bottom: 0;
        }

        .form-floating .form-control {
            border-radius: 8px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            padding-left: 2.5rem;
            height: calc(3.5rem + 2px);
            transition: var(--transition);
        }

        .form-floating .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.25);
        }

        .form-floating label {
            padding-left: 2.5rem;
        }

        .form-floating i {
            position: absolute;
            left: 1rem;
            top: 1.25rem;
            color: var(--primary-color);
            z-index: 5;
        }

        .btn {
            border-radius: 8px;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: var(--transition);
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(67, 97, 238, 0.3);
        }

        .btn-secondary {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
        }

        .btn-outline-primary {
            color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-outline-primary:hover {
            background-color: var(--primary-color);
            color: white;
        }

        .form-actions {
            display: flex;
            gap: 1rem;
        }

        .form-actions .btn {
            flex: 1;
        }

        .client-icon {
            width: 100px;
            height: 100px;
            background-color: var(--primary-light);
            color: var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            margin: 0 auto 1.5rem;
            border: 4px solid white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .form-floating.has-validation .form-control:invalid {
            border-color: var(--danger-color);
        }

        .form-floating.has-validation .form-control:invalid:focus {
            box-shadow: 0 0 0 0.25rem rgba(239, 71, 111, 0.25);
        }

        .form-floating.has-validation .invalid-feedback {
            display: none;
        }

        .form-floating.has-validation .form-control:invalid + .invalid-feedback {
            display: block;
        }

        .breadcrumb {
            margin-bottom: 1.5rem;
            background-color: white;
            padding: 0.75rem 1rem;
            border-radius: var(--border-radius);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .breadcrumb-item a {
            color: var(--primary-color);
            text-decoration: none;
        }

        .breadcrumb-item.active {
            color: var(--gray-text);
        }

        .progress-container {
            margin-bottom: 2rem;
        }

        .progress-steps {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
        }

        .step {
            flex: 1;
            text-align: center;
            position: relative;
        }

        .step:not(:last-child)::after {
            content: '';
            position: absolute;
            top: 15px;
            left: 50%;
            width: 100%;
            height: 2px;
            background-color: var(--light-bg);
            z-index: 1;
        }

        .step-icon {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: var(--light-bg);
            color: var(--gray-text);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 0.5rem;
            position: relative;
            z-index: 2;
        }

        .step.active .step-icon {
            background-color: var(--primary-color);
            color: white;
        }

        .step.completed .step-icon {
            background-color: var(--success-color);
            color: white;
        }

        .step-label {
            font-size: 0.875rem;
            color: var(--gray-text);
        }

        .step.active .step-label {
            color: var(--primary-color);
            font-weight: 600;
        }

        .step.completed .step-label {
            color: var(--success-color);
        }

        .progress {
            height: 6px;
            border-radius: 3px;
        }

        .progress-bar {
            background-color: var(--primary-color);
        }

        .form-tips {
            background-color: var(--primary-light);
            border-radius: var(--border-radius);
            padding: 1rem;
            margin-bottom: 1.5rem;
        }

        .form-tips h5 {
            color: var(--primary-color);
            font-size: 1rem;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
        }

        .form-tips h5 i {
            margin-right: 0.5rem;
        }

        .form-tips ul {
            margin-bottom: 0;
            padding-left: 1.5rem;
        }

        .form-tips li {
            margin-bottom: 0.25rem;
            font-size: 0.875rem;
        }

        @media (max-width: 768px) {
            .form-actions {
                flex-direction: column;
            }

            .client-icon {
                width: 80px;
                height: 80px;
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand" href="/">
            <i class="fa-solid fa-car"></i> Admin - Agence Location
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link " href="/">
                        <i class="fas fa-home"></i> Tableau de bord
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/client" class="nav-link active">
                        <i class="fa-solid fa-people-group"></i> Clients
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/parc" class="nav-link">
                        <i class="fa-solid fa-warehouse"></i> Parcs
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/voiture" class="nav-link">
                        <i class="fa-solid fa-car"></i> Voitures
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/reservation" class="nav-link">
                        <i class="fa-solid fa-calendar-check"></i> Réservations
                    </a>
                </li>
            </ul>
            <div class="d-flex">
                <ul class="navbar-nav mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user-cog"></i> Admin
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#"><i class="fas fa-user"></i> Profil</a></li>
                            <li><a class="dropdown-item" href="#"><i class="fas fa-cog"></i> Paramètres</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt"></i> Déconnexion</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>


<div class="container mt-5">

    <div class="page-header">
        <h1>Ajouter un nouveau client</h1>
        <p>Enregistrez un nouveau client dans votre base de données</p>
    </div>

    <div class="progress-container">
        <div class="progress-steps">
            <div class="step completed">
                <div class="step-icon"><i class="fas fa-check"></i></div>
                <div class="step-label">Début</div>
            </div>
            <div class="step active">
                <div class="step-icon"><i class="fas fa-user-plus"></i></div>
                <div class="step-label">Informations client</div>
            </div>
            <div class="step">
                <div class="step-icon"><i class="fas fa-check"></i></div>
                <div class="step-label">Confirmation</div>
            </div>
        </div>
        <div class="progress">
            <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
    </div>

    <div class="form-card">
        <div class="form-header text-center">
            <div class="client-icon">
                <i class="fas fa-user-plus"></i>
            </div>
            <h2>Nouveau client</h2>
            <p class="text-muted mb-0">Veuillez remplir tous les champs obligatoires</p>
        </div>
        <div class="form-body">
            <div class="form-tips">
                <h5><i class="fas fa-lightbulb"></i> Conseils pour l'ajout d'un client</h5>
                <ul>
                    <li>Assurez-vous que le numéro CIN et le numéro de permis sont corrects</li>
                    <li>L'âge minimum requis est de 18 ans</li>
                    <li>Vérifiez que l'adresse email est valide pour les communications futures</li>
                </ul>
            </div>

            <form action="/client/save" method="post" id="addClientForm">
                <div class="form-section">
                    <div class="section-title">
                        <i class="fas fa-user"></i> Informations personnelles
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating mb-4">
                                <i class="fa-solid fa-id-card"></i>
                                <input type="text" id="num_cin" class="form-control" placeholder="Entrez votre CIN" name="num_cin"
                                       required pattern="[A-Za-z0-9]+" minlength="4">
                                <label for="num_cin">Numéro CIN</label>
                                <div class="invalid-feedback">Veuillez entrer un numéro CIN valide.</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating mb-4">
                                <i class="fa-solid fa-id-card"></i>
                                <input type="text" id="num_permis" class="form-control" placeholder="Entrez votre numéro permis"
                                       name="num_permis" required pattern="[A-Za-z0-9]+" minlength="4">
                                <label for="num_permis">Numéro permis</label>
                                <div class="invalid-feedback">Veuillez entrer un numéro de permis valide.</div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating mb-4">
                                <i class="fa-solid fa-user"></i>
                                <input type="text" id="nom" class="form-control" placeholder="Entrez votre nom" name="nom"
                                       required>
                                <label for="nom">Nom</label>
                                <div class="invalid-feedback">Veuillez entrer un nom.</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating mb-4">
                                <i class="fa-solid fa-user"></i>
                                <input type="text" id="prenom" class="form-control" placeholder="Entrez votre prénom" name="prenom"
                                       required>
                                <label for="prenom">Prénom</label>
                                <div class="invalid-feedback">Veuillez entrer un prénom.</div>
                            </div>
                        </div>
                    </div>
                    <div class="form-floating mb-4">
                        <i class="fa-solid fa-calendar"></i>
                        <input type="number" id="age" class="form-control" placeholder="Entrez votre age" name="age"
                               required min="18" max="120">
                        <label for="age">Age</label>
                        <div class="invalid-feedback">Veuillez entrer un âge valide (18-120).</div>
                    </div>
                </div>

                <div class="form-section">
                    <div class="section-title">
                        <i class="fas fa-address-book"></i> Coordonnées
                    </div>
                    <div class="form-floating mb-4">
                        <i class="fa-solid fa-location-dot"></i>
                        <input type="text" id="adresse" class="form-control" placeholder="Entrez votre adresse" name="adresse"
                               required>
                        <label for="adresse">Adresse</label>
                        <div class="invalid-feedback">Veuillez entrer une adresse.</div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating mb-4">
                                <i class="fas fa-envelope"></i>
                                <input type="email" id="email" class="form-control" placeholder="Entrez votre adresse email" name="email"
                                       required>
                                <label for="email">Adresse email</label>
                                <div class="invalid-feedback">Veuillez entrer une adresse email valide.</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating mb-4">
                                <i class="fa-solid fa-phone"></i>
                                <input type="tel" id="tel" class="form-control" placeholder="Entrez votre téléphone" name="tel"
                                       required pattern="[0-9]{8,12}">
                                <label for="tel">Téléphone</label>
                                <div class="invalid-feedback">Veuillez entrer un numéro de téléphone valide.</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <a href="/client" class="btn btn-outline-primary">
                        <i class="fas fa-arrow-left me-2"></i> Annuler
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save me-2"></i> Ajouter Client
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    // Form validation
    (function() {
        'use strict';

        // Fetch all forms we want to apply validation to
        const forms = document.querySelectorAll('#addClientForm');

        // Loop over them and prevent submission
        Array.from(forms).forEach(function(form) {
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                form.classList.add('was-validated');
            }, false);
        });
    })();
</script>
</body>
</html>