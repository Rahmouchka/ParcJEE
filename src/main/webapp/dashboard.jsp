<%@ page import="entities.Location" %>
<%@ page import="entities.Voiture" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de bord - Agence Location</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        :root {
            --primary-color: #4361ee;
            --primary-light: #eef2ff;
            --primary-dark: #3051d3;
            --danger-color: #ef476f;
            --danger-light: #ffedf2;
            --success-color: #06d6a0;
            --success-light: #e6f9f5;
            --warning-color: #ffd166;
            --warning-light: #fff8e6;
            --info-color: #118ab2;
            --info-light: #e6f7fb;
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

        .card {
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            border: none;
            overflow: hidden;
            margin-bottom: 2rem;
            transition: var(--transition);
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-header {
            background-color: white;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            padding: 1.5rem;
        }

        .card-header h2 {
            margin: 0;
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--dark-text);
        }

        .card-body {
            padding: 1.5rem;
        }

        .stat-card {
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            padding: 1.5rem;
            background-color: white;
            display: flex;
            align-items: center;
            gap: 1.5rem;
            margin-bottom: 2rem;
            transition: var(--transition);
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .stat-icon.clients {
            background-color: var(--primary-light);
            color: var(--primary-color);
        }

        .stat-icon.locations {
            background-color: var(--success-light);
            color: var(--success-color);
        }

        .stat-icon.parcs {
            background-color: var(--warning-light);
            color: var(--warning-color);
        }

        .stat-icon.voitures {
            background-color: var(--info-light);
            color: var(--info-color);
        }

        .stat-info {
            flex: 1;
        }

        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.25rem;
            line-height: 1;
        }

        .stat-label {
            color: var(--gray-text);
            font-size: 0.875rem;
            margin-bottom: 0;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead {
            background-color: var(--primary-light);
        }

        .table thead th {
            color: var(--primary-color);
            font-weight: 600;
            border-bottom: none;
            padding: 1rem 1.5rem;
        }

        .table tbody tr {
            transition: var(--transition);
        }

        .table tbody tr:hover {
            background-color: rgba(0, 0, 0, 0.02);
        }

        .table tbody td {
            padding: 1rem 1.5rem;
            vertical-align: middle;
        }

        .badge-status {
            padding: 0.35rem 0.75rem;
            border-radius: 20px;
            font-weight: 500;
            font-size: 0.75rem;
            display: inline-flex;
            align-items: center;
            gap: 0.35rem;
        }

        .badge-status.active {
            background-color: var(--success-light);
            color: var(--success-color);
        }

        .badge-status.available {
            background-color: var(--success-light);
            color: var(--success-color);
        }

        .badge-status.unavailable {
            background-color: var(--danger-light);
            color: var(--danger-color);
        }

        .chart-container {
            position: relative;
            height: 300px;
            width: 100%;
        }

        .welcome-banner {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            margin-bottom: 2rem;
            position: relative;
            overflow: hidden;
        }

        .welcome-banner::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            transform: translate(50%, -50%);
        }

        .welcome-banner::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            transform: translate(-30%, 30%);
        }

        .welcome-content {
            position: relative;
            z-index: 1;
        }

        .welcome-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .welcome-subtitle {
            font-size: 1.1rem;
            opacity: 0.9;
            margin-bottom: 1.5rem;
        }

        .welcome-date {
            font-size: 0.9rem;
            opacity: 0.8;
        }

        .quick-actions {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .quick-action-btn {
            background-color: rgba(255, 255, 255, 0.2);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 0.75rem 1.25rem;
            font-weight: 500;
            transition: var(--transition);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .quick-action-btn:hover {
            background-color: rgba(255, 255, 255, 0.3);
            color: white;
        }

        .section-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: var(--dark-text);
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .section-title i {
            color: var(--primary-color);
        }

        .empty-state {
            text-align: center;
            padding: 2rem;
        }

        .empty-icon {
            font-size: 3rem;
            color: var(--gray-text);
            margin-bottom: 1rem;
        }

        .empty-title {
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .empty-desc {
            color: var(--gray-text);
            margin-bottom: 1.5rem;
        }

        @media (max-width: 768px) {
            .stat-card {
                flex-direction: column;
                text-align: center;
                padding: 1.5rem 1rem;
            }

            .stat-icon {
                margin-bottom: 1rem;
            }

            .welcome-banner {
                padding: 1.5rem;
            }

            .welcome-title {
                font-size: 1.5rem;
            }

            .quick-actions {
                flex-direction: column;
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
                    <a class="nav-link" href="/">
                        <i class="fas fa-home"></i> Acceuil
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/dashboard">
                        <i class="fas fa-chart-simple"></i>  Tableau de bord
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
                        <i class="fa-solid fa-calendar-check"></i> Locations
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
    <div class="welcome-banner">
        <div class="welcome-content">
            <h1 class="welcome-title">Bienvenue sur votre tableau de bord</h1>
            <p class="welcome-subtitle">Gérez votre agence de location en toute simplicité</p>
            <p class="welcome-date">
                <i class="fas fa-calendar-alt me-2"></i>
                <%= new java.text.SimpleDateFormat("EEEE dd MMMM yyyy", new java.util.Locale("fr", "FR")).format(new java.util.Date()) %>
            </p>
            <div class="quick-actions">
                <a href="/client/add" class="quick-action-btn">
                    <i class="fas fa-user-plus"></i> Nouveau client
                </a>
                <a href="/voiture/add" class="quick-action-btn">
                    <i class="fas fa-car-side"></i> Nouvelle voiture
                </a>
                <a href="/location/add" class="quick-action-btn">
                    <i class="fas fa-calendar-plus"></i> Nouvelle location
                </a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3">
            <div class="stat-card">
                <div class="stat-icon clients">
                    <i class="fas fa-users"></i>
                </div>
                <div class="stat-info">
                    <div class="stat-value">${clients}</div>
                    <div class="stat-label">Clients</div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <div class="stat-icon locations">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <div class="stat-info">
                    <div class="stat-value">${locations}</div>
                    <div class="stat-label">Locations</div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <div class="stat-icon parcs">
                    <i class="fas fa-warehouse"></i>
                </div>
                <div class="stat-info">
                    <div class="stat-value">${parcs}</div>
                    <div class="stat-label">Parcs</div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <div class="stat-icon voitures">
                    <i class="fas fa-car"></i>
                </div>
                <div class="stat-info">
                    <div class="stat-value">${voitures}</div>
                    <div class="stat-label">Véhicules</div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h2>Statistiques</h2>
                </div>
                <div class="card-body">
                    <div class="chart-container">
                        <canvas id="statsChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h2>Disponibilité des véhicules</h2>
                </div>
                <div class="card-body">
                    <div class="chart-container">
                        <canvas id="vehicleChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h2 class="section-title">
                        <i class="fas fa-calendar-alt"></i> Locations en cours
                    </h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Client</th>
                                <th>Véhicule</th>
                                <th>Date début</th>
                                <th>Date fin</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Location> locationsEnCours = (List<Location>) request.getAttribute("locationsEnCours");
                                SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                                if (locationsEnCours != null && !locationsEnCours.isEmpty()) {
                                    for (Location loc : locationsEnCours) {
                            %>
                            <tr>
                                <td><%= loc.getClient().getNom() %> <%= loc.getClient().getPrenom() %></td>
                                <td><%= loc.getVoiture().getMarque() %> <%= loc.getVoiture().getModele() %></td>
                                <td><%= dateFormat.format(loc.getDate_deb()) %></td>
                                <td><%= dateFormat.format(loc.getDate_fin()) %></td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="4">
                                    <div class="empty-state">
                                        <div class="empty-icon">
                                            <i class="fas fa-calendar-times"></i>
                                        </div>
                                        <h3 class="empty-title">Aucune location en cours</h3>
                                        <p class="empty-desc">Toutes les voitures sont disponibles</p>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h2 class="section-title">
                        <i class="fas fa-car"></i> Véhicules disponibles
                    </h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Marque</th>
                                <th>Modèle</th>
                                <th>Matricule</th>
                                <th>Parc</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Voiture> voituresDispo = (List<Voiture>) request.getAttribute("voituresDispo");
                                if (voituresDispo != null && !voituresDispo.isEmpty()) {
                                    for (Voiture v : voituresDispo) {
                            %>
                            <tr>
                                <td><%= v.getMarque() %></td>
                                <td><%= v.getModele() %></td>
                                <td><%= v.getMatricule() %></td>
                                <td><%= v.getParc().getLibelle() %></td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="4">
                                    <div class="empty-state">
                                        <div class="empty-icon">
                                            <i class="fas fa-car-crash"></i>
                                        </div>
                                        <h3 class="empty-title">Aucun véhicule disponible</h3>
                                        <p class="empty-desc">Tous les véhicules sont actuellement en location</p>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    // Statistiques générales
    const statsCtx = document.getElementById('statsChart').getContext('2d');
    const statsChart = new Chart(statsCtx, {
        type: 'bar',
        data: {
            labels: ['Clients', 'Locations', 'Parcs', 'Véhicules'],
            datasets: [{
                label: 'Nombre',
                data: [${clients}, ${locations}, ${parcs}, ${voitures}],
                backgroundColor: [
                    '#4361ee',
                    '#06d6a0',
                    '#ffd166',
                    '#118ab2'
                ],
                borderColor: [
                    '#4361ee',
                    '#06d6a0',
                    '#ffd166',
                    '#118ab2'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        precision: 0
                    }
                }
            }
        }
    });

    // Disponibilité des véhicules
    const vehicleCtx = document.getElementById('vehicleChart').getContext('2d');
    const vehicleChart = new Chart(vehicleCtx, {
        type: 'doughnut',
        data: {
            labels: ['Disponibles', 'En location'],
            datasets: [{
                label: 'Véhicules',
                data: [${voituresDispo.size()}, ${voitures - voituresDispo.size()}],
                backgroundColor: [
                    '#06d6a0',
                    '#ef476f'
                ],
                borderColor: [
                    '#06d6a0',
                    '#ef476f'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });
</script>
</body>
</html>