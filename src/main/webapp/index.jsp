<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Agence Location</title>
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
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--dark-text);
            overflow-x: hidden;
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

        .hero-section {
            background: linear-gradient(135deg, #4361ee 0%, #3a0ca3 100%);
            color: white;
            padding: 6rem 0;
            position: relative;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiB2aWV3Qm94PSIwIDAgMTI4MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGcgZmlsbD0iI2ZmZmZmZiI+PHBhdGggZD0iTTEyODAgMy40QzEwNTAuNTkgMTggMTAxOS40IDg0Ljg5IDczNC40MiA4NC44OWMtMzIwIDAtMzIwLTg0LjMtNjQwLTg0LjNDNTkuNC41OSAyOC4yIDEuNiAwIDMuNFYxNDBoMTI4MHoiIGZpbGwtb3BhY2l0eT0iLjMiLz48cGF0aCBkPSJNMCAyNC4zMWM0My40Ni01LjY5IDk0LjU2LTkuMjUgMTU4LjQyLTkuMjUgMzIwIDAgMzIwIDg5LjI0IDY0MCA4OS4yNCAyNTYuMTMgMCAzMDcuMjgtNTcuMTYgNDgxLjU4LTgwVjE0MEgweiIgZmlsbC1vcGFjaXR5PSIuNSIvPjxwYXRoIGQ9Ik0xMjgwIDUxLjc2Yy0yMDEgMTIuNDktMjQyLjQzIDUzLjQtNTEzLjU4IDUzLjQtMzIwIDAtMzIwLTU3LTY0MC01Ny00OC44NS4wMS05MC4yMSAxLjM1LTEyNi40MiAzLjZWMTQwaDEyODB6Ii8+PC9nPjwvc3ZnPg==');
            background-size: 100% 100%;
            background-position: bottom;
            opacity: 0.1;
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }

        .hero-subtitle {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        .hero-btn {
            padding: 0.75rem 2rem;
            font-weight: 600;
            border-radius: 50px;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: var(--transition);
            margin-right: 1rem;
            margin-bottom: 1rem;
        }

        .hero-btn-primary {
            background-color: white;
            color: var(--primary-color);
            border: none;
        }

        .hero-btn-primary:hover {
            background-color: var(--primary-light);
            color: var(--primary-color);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .hero-btn-outline {
            background-color: transparent;
            color: white;
            border: 2px solid white;
        }

        .hero-btn-outline:hover {
            background-color: white;
            color: var(--primary-color);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .hero-image {
            position: relative;
            z-index: 2;
        }

        .hero-image img {
            max-width: 100%;
            height: auto;
            filter: drop-shadow(0 10px 20px rgba(0, 0, 0, 0.2));
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-20px);
            }
            100% {
                transform: translateY(0px);
            }
        }

        .features-section {
            padding: 5rem 0;
            background-color: var(--light-bg);
        }

        .section-title {
            text-align: center;
            margin-bottom: 3rem;
        }

        .section-title h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }

        .section-title p {
            font-size: 1.1rem;
            color: var(--gray-text);
            max-width: 700px;
            margin: 0 auto;
        }

        .feature-card {
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            padding: 2rem;
            height: 100%;
            transition: var(--transition);
            text-align: center;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 0;
            background-color: var(--primary-light);
            transition: var(--transition);
            z-index: -1;
        }

        .feature-card:hover::before {
            height: 100%;
        }

        .feature-card:hover {
            transform: translateY(-10px);
        }

        .feature-icon {
            width: 80px;
            height: 80px;
            background-color: var(--primary-light);
            color: var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            margin: 0 auto 1.5rem;
            transition: var(--transition);
        }

        .feature-card:hover .feature-icon {
            background-color: var(--primary-color);
            color: white;
            transform: rotateY(360deg);
            transition: transform 1s ease, background-color 0.3s ease, color 0.3s ease;
        }

        .feature-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--dark-text);
        }

        .feature-desc {
            color: var(--gray-text);
            margin-bottom: 1.5rem;
        }

        .feature-link {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            transition: var(--transition);
        }

        .feature-link i {
            margin-left: 0.5rem;
            transition: var(--transition);
        }

        .feature-link:hover {
            color: var(--primary-dark);
        }

        .feature-link:hover i {
            transform: translateX(5px);
        }

        .about-section {
            padding: 5rem 0;
            background-color: white;
        }

        .about-image {
            position: relative;
        }

        .about-image img {
            width: 100%;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
        }

        .about-image::before {
            content: '';
            position: absolute;
            top: -20px;
            left: -20px;
            width: 100%;
            height: 100%;
            border: 2px dashed var(--primary-color);
            border-radius: var(--border-radius);
            z-index: -1;
        }

        .about-content {
            padding: 2rem;
        }

        .about-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
        }

        .about-subtitle {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--gray-text);
            margin-bottom: 1.5rem;
        }

        .about-desc {
            color: var(--gray-text);
            margin-bottom: 2rem;
        }

        .about-list {
            list-style: none;
            padding: 0;
            margin-bottom: 2rem;
        }

        .about-list li {
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }

        .about-list li i {
            color: var(--success-color);
            margin-right: 1rem;
        }

        .stats-section {
            padding: 5rem 0;
            background: linear-gradient(135deg, #4361ee 0%, #3a0ca3 100%);
            color: white;
            position: relative;
            overflow: hidden;
        }

        .stats-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiB2aWV3Qm94PSIwIDAgMTI4MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGcgZmlsbD0iI2ZmZmZmZiI+PHBhdGggZD0iTTEyODAgMy40QzEwNTAuNTkgMTggMTAxOS40IDg0Ljg5IDczNC40MiA4NC44OWMtMzIwIDAtMzIwLTg0LjMtNjQwLTg0LjNDNTkuNC41OSAyOC4yIDEuNiAwIDMuNFYxNDBoMTI4MHoiIGZpbGwtb3BhY2l0eT0iLjMiLz48cGF0aCBkPSJNMCAyNC4zMWM0My40Ni01LjY5IDk0LjU2LTkuMjUgMTU4LjQyLTkuMjUgMzIwIDAgMzIwIDg5LjI0IDY0MCA4OS4yNCAyNTYuMTMgMCAzMDcuMjgtNTcuMTYgNDgxLjU4LTgwVjE0MEgweiIgZmlsbC1vcGFjaXR5PSIuNSIvPjxwYXRoIGQ9Ik0xMjgwIDUxLjc2Yy0yMDEgMTIuNDktMjQyLjQzIDUzLjQtNTEzLjU4IDUzLjQtMzIwIDAtMzIwLTU3LTY0MC01Ny00OC44NS4wMS05MC4yMSAxLjM1LTEyNi40MiAzLjZWMTQwaDEyODB6Ii8+PC9nPjwvc3ZnPg==');
            background-size: 100% 100%;
            background-position: top;
            opacity: 0.1;
            transform: rotate(180deg);
            z-index: 1;
        }

        .stat-item {
            text-align: center;
            position: relative;
            z-index: 2;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .stat-label {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .cta-section {
            padding: 5rem 0;
            background-color: var(--light-bg);
            text-align: center;
        }

        .cta-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
        }

        .cta-desc {
            font-size: 1.1rem;
            color: var(--gray-text);
            max-width: 700px;
            margin: 0 auto 2rem;
        }

        .footer {
            background-color: #212529;
            color: white;
            padding: 4rem 0 2rem;
        }

        .footer-logo {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .footer-logo i {
            font-size: 1.8rem;
        }

        .footer-desc {
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 1.5rem;
        }

        .footer-social {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .social-icon {
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: var(--transition);
        }

        .social-icon:hover {
            background-color: var(--primary-color);
            transform: translateY(-5px);
        }

        .footer-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 0.5rem;
        }

        .footer-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 2px;
            background-color: var(--primary-color);
        }

        .footer-links {
            list-style: none;
            padding: 0;
        }

        .footer-links li {
            margin-bottom: 0.75rem;
        }

        .footer-links a {
            color: rgba(255, 255, 255, 0.7);
            text-decoration: none;
            transition: var(--transition);
            display: flex;
            align-items: center;
        }

        .footer-links a i {
            margin-right: 0.5rem;
            font-size: 0.75rem;
        }

        .footer-links a:hover {
            color: white;
            transform: translateX(5px);
        }

        .footer-contact {
            list-style: none;
            padding: 0;
        }

        .footer-contact li {
            margin-bottom: 1rem;
            display: flex;
            align-items: flex-start;
        }

        .footer-contact li i {
            margin-right: 1rem;
            color: var(--primary-color);
            margin-top: 0.25rem;
        }

        .footer-bottom {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 2rem;
            margin-top: 3rem;
            text-align: center;
            color: rgba(255, 255, 255, 0.7);
        }

        @media (max-width: 992px) {
            .hero-title {
                font-size: 2.5rem;
            }

            .hero-image {
                margin-top: 2rem;
            }

            .about-image {
                margin-bottom: 2rem;
            }

            .about-image::before {
                display: none;
            }
        }

        @media (max-width: 768px) {
            .hero-section {
                padding: 4rem 0;
            }

            .hero-title {
                font-size: 2rem;
            }

            .feature-card {
                margin-bottom: 2rem;
            }

            .stat-item {
                margin-bottom: 2rem;
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
                    <a class="nav-link active" href="/">
                        <i class="fas fa-home"></i> Tableau de bord
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/client" class="nav-link">
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
                    <a href="/location" class="nav-link">
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

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 hero-content">
                <h1 class="hero-title">Tableau de bord Admin</h1>
                <p class="hero-subtitle">Gérez efficacement votre agence de location de voitures avec notre interface d'administration complète.</p>
                <div>
                    <a href="/voiture" class="btn hero-btn hero-btn-primary">Gérer les véhicules</a>
                    <a href="/location" class="btn hero-btn hero-btn-outline">Voir les réservations</a>
                </div>
            </div>
            <div class="col-lg-6 hero-image">
                <img src="https://img.freepik.com/free-vector/business-team-putting-together-jigsaw-puzzle-isolated-flat-vector-illustration-cartoon-partners-working-connection-teamwork-partnership-cooperation-concept_74855-9814.jpg" alt="Gestion admin">
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="features-section">
    <div class="container">
        <div class="section-title">
            <h2>Modules de gestion</h2>
            <p>Accédez à tous les outils nécessaires pour administrer votre agence de location.</p>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fa-solid fa-people-group"></i>
                    </div>
                    <h3 class="feature-title">Clients</h3>
                    <p class="feature-desc">Gérez votre base de clients, consultez leur historique et leurs informations.</p>
                    <a href="/client" class="feature-link">Accéder <i class="fas fa-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fa-solid fa-warehouse"></i>
                    </div>
                    <h3 class="feature-title">Parcs</h3>
                    <p class="feature-desc">Organisez vos véhicules par parc et gérez les emplacements.</p>
                    <a href="/parc" class="feature-link">Accéder <i class="fas fa-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fa-solid fa-car"></i>
                    </div>
                    <h3 class="feature-title">Voitures</h3>
                    <p class="feature-desc">Gérez votre flotte de véhicules, leur disponibilité et leur état.</p>
                    <a href="/voiture" class="feature-link">Accéder <i class="fas fa-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fa-solid fa-calendar-check"></i>
                    </div>
                    <h3 class="feature-title">Réservations</h3>
                    <p class="feature-desc">Suivez et gérez toutes les réservations de vos clients.</p>
                    <a href="/location" class="feature-link">Accéder <i class="fas fa-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- About Section -->
<section class="about-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <div class="about-image">
                    <img src="https://img.freepik.com/free-vector/business-team-planning-working-process-flat-vector-illustration-cartoon-colleagues-meeting-discussing-new-project-company-office-employees-sharing-ideas_74855-9818.jpg" alt="À propos de l'admin">
                </div>
            </div>
            <div class="col-lg-6">
                <div class="about-content">
                    <h2 class="about-title">Interface d'administration</h2>
                    <h4 class="about-subtitle">Tous les outils pour gérer efficacement votre agence</h4>
                    <p class="about-desc">Notre interface d'administration vous permet de contrôler tous les aspects de votre agence de location de voitures depuis un seul endroit.</p>
                    <ul class="about-list">
                        <li><i class="fas fa-check-circle"></i> Gestion complète des clients et des réservations</li>
                        <li><i class="fas fa-check-circle"></i> Suivi en temps réel de la disponibilité des véhicules</li>
                        <li><i class="fas fa-check-circle"></i> Rapports et statistiques détaillés</li>
                        <li><i class="fas fa-check-circle"></i> Interface intuitive et facile à utiliser</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Stats Section -->
<section class="stats-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="stat-item">
                    <div class="stat-number" id="client-count">0</div>
                    <div class="stat-label">Clients actifs</div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="stat-item">
                    <div class="stat-number" id="car-count">0</div>
                    <div class="stat-label">Véhicules disponibles</div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="stat-item">
                    <div class="stat-number" id="reservation-count">0</div>
                    <div class="stat-label">Réservations ce mois</div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="stat-item">
                    <div class="stat-number" id="parc-count">0</div>
                    <div class="stat-label">Parcs gérés</div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="cta-section">
    <div class="container">
        <h2 class="cta-title">Besoin d'aide ?</h2>
        <p class="cta-desc">Notre équipe support est disponible pour vous aider à tirer le meilleur parti de votre interface d'administration.</p>
        <a href="#" class="btn btn-primary btn-lg">Contacter le support</a>
    </div>
</section>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4">
                <div class="footer-logo">
                    <i class="fa-solid fa-car"></i> Admin - Agence Location
                </div>
                <p class="footer-desc">Interface d'administration complète pour gérer votre agence de location de voitures.</p>
                <div class="footer-social">
                    <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 mb-4">
                <h4 class="footer-title">Navigation</h4>
                <ul class="footer-links">
                    <li><a href="/"><i class="fas fa-chevron-right"></i> Tableau de bord</a></li>
                    <li><a href="/client"><i class="fas fa-chevron-right"></i> Clients</a></li>
                    <li><a href="/voiture"><i class="fas fa-chevron-right"></i> Voitures</a></li>
                </ul>
            </div>
            <div class="col-lg-2 col-md-6 mb-4">
                <h4 class="footer-title">Modules</h4>
                <ul class="footer-links">
                    <li><a href="/parc"><i class="fas fa-chevron-right"></i> Parcs</a></li>
                    <li><a href="/location"><i class="fas fa-chevron-right"></i> Réservations</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Rapports</a></li>
                </ul>
            </div>
            <div class="col-lg-4 col-md-6 mb-4">
                <h4 class="footer-title">Contact</h4>
                <ul class="footer-contact">
                    <li>
                        <i class="fas fa-map-marker-alt"></i>
                        <span>123 Avenue de la République, 75011 Paris, France</span>
                    </li>
                    <li>
                        <i class="fas fa-phone-alt"></i>
                        <span>Support: +33 1 23 45 67 89</span>
                    </li>
                    <li>
                        <i class="fas fa-envelope"></i>
                        <span>support@agencelocation.com</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 Agence Location - Interface Admin. Tous droits réservés.</p>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<script>
    // Animation pour les statistiques
    function animateValue(id, start, end, duration) {
        let obj = document.getElementById(id);
        let startTimestamp = null;
        const step = (timestamp) => {
            if (!startTimestamp) startTimestamp = timestamp;
            const progress = Math.min((timestamp - startTimestamp) / duration, 1);
            obj.innerHTML = Math.floor(progress * (end - start) + start);
            if (progress < 1) {
                window.requestAnimationFrame(step);
            }
        };
        window.requestAnimationFrame(step);
    }

    // Démarrer les animations quand la section est visible
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                animateValue("client-count", 0, 1243, 2000);
                animateValue("car-count", 0, 87, 1500);
                animateValue("reservation-count", 0, 156, 1800);
                animateValue("parc-count", 0, 5, 1000);
                observer.unobserve(entry.target);
            }
        });
    }, {threshold: 0.5});

    observer.observe(document.querySelector(".stats-section"));
</script>
</body>
</html>