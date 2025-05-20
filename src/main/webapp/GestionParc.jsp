<%@ page import="entities.Parc" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Gestion parcs</title>
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

        .btn {
            border-radius: 8px;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            transition: var(--transition);
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
        }

        .btn-danger {
            background-color: var(--danger-color);
            border-color: var(--danger-color);
        }

        .btn-success {
            background-color: var(--success-color);
            border-color: var(--success-color);
        }

        .btn-sm {
            padding: 0.5rem 1rem;
            font-size: 0.875rem;
        }

        .alert {
            border-radius: var(--border-radius);
            padding: 1rem 1.5rem;
            margin-bottom: 1.5rem;
            border: none;
        }

        .alert-success {
            background-color: var(--success-light);
            color: var(--success-color);
        }

        .search-container {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .search-container i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray-text);
        }

        .search-input {
            padding-left: 2.5rem;
            border-radius: var(--border-radius);
            border: 1px solid rgba(0, 0, 0, 0.1);
            height: 3rem;
        }

        .parc-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
        }

        .parc-card {
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            overflow: hidden;
            transition: var(--transition);
        }

        .parc-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }

        .parc-header {
            padding: 1.5rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .parc-icon {
            width: 50px;
            height: 50px;
            background-color: var(--primary-light);
            color: var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
        }

        .parc-info {
            flex: 1;
        }

        .parc-name {
            font-weight: 600;
            font-size: 1.25rem;
            margin-bottom: 0.25rem;
        }

        .parc-location {
            color: var(--gray-text);
            font-size: 0.875rem;
            margin-bottom: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .parc-details {
            padding: 1.5rem;
        }

        .parc-capacity {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .capacity-badge {
            background-color: var(--success-light);
            color: var(--success-color);
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .parc-actions {
            padding: 1rem 1.5rem;
            background-color: rgba(0, 0, 0, 0.02);
            display: flex;
            gap: 0.5rem;
        }

        .action-btn {
            flex: 1;
            text-align: center;
            padding: 0.75rem;
            border-radius: 6px;
            font-weight: 500;
            font-size: 0.875rem;
            transition: var(--transition);
            cursor: pointer;
            text-decoration: none;
        }

        .action-btn.edit {
            background-color: var(--primary-light);
            color: var(--primary-color);
        }

        .action-btn.edit:hover {
            background-color: var(--primary-color);
            color: white;
        }

        .action-btn.delete {
            background-color: var(--danger-light);
            color: var(--danger-color);
        }

        .action-btn.delete:hover {
            background-color: var(--danger-color);
            color: white;
        }

        .table-view-toggle {
            display: flex;
            gap: 0.5rem;
            margin-bottom: 1.5rem;
        }

        .view-btn {
            padding: 0.5rem 1rem;
            border-radius: 6px;
            background-color: white;
            border: 1px solid rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
            transition: var(--transition);
        }

        .view-btn.active {
            background-color: var(--primary-light);
            color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .table-container {
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            overflow: hidden;
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

        .empty-state {
            text-align: center;
            padding: 3rem;
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
            .parc-grid {
                grid-template-columns: 1fr;
            }

            .parc-actions {
                flex-direction: column;
            }

            .table-responsive {
                border-radius: var(--border-radius);
                box-shadow: var(--card-shadow);
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
                        <i class="fas fa-home"></i> Tableau de bord
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/client" class="nav-link">
                        <i class="fa-solid fa-people-group"></i> Clients
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/parc" class="nav-link active">
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
        <h1>Gestion des Parcs</h1>
        <p>Gérez vos parcs de stationnement en toute simplicité</p>
    </div>

    <%
        if (request.getAttribute("deleted") != null && (boolean) request.getAttribute("deleted")) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <i class="fas fa-check-circle me-2"></i> Parc supprimé avec succès !
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
        if (request.getAttribute("updated") != null && (boolean) request.getAttribute("updated")) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <i class="fas fa-check-circle me-2"></i> Parc mis à jour avec succès !
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
        if (request.getAttribute("added") != null && (boolean) request.getAttribute("added")) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <i class="fas fa-check-circle me-2"></i> Parc ajouté avec succès !
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
    %>

    <div class="card mb-4">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0">Liste des parcs</h2>
                <a href="/parc/add" class="btn btn-success">
                    <i class="fa fa-plus me-2"></i> Ajouter un parc
                </a>
            </div>

            <div class="search-container">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" class="form-control search-input" placeholder="Rechercher un parc...">
            </div>

            <div class="table-view-toggle">
                <button class="view-btn" id="gridViewBtn">
                    <i class="fas fa-th-large"></i> Cartes
                </button>
                <button class="view-btn active" id="tableViewBtn">
                    <i class="fas fa-list"></i> Tableau
                </button>
            </div>

            <%
                List<Parc> parcs = (List<Parc>) request.getAttribute("parcs");
            %>

            <div id="tableView">
                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Libellé</th>
                                <th>Localisation</th>
                                <th>Capacité</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if (parcs != null && !parcs.isEmpty()) {
                                    for (Parc p : parcs) {
                            %>
                            <tr>
                                <td><%= p.getNum_parc() %></td>
                                <td><strong><%= p.getLibelle() %></strong></td>
                                <td>
                                    <i class="fas fa-map-marker-alt text-primary me-2"></i>
                                    <%= p.getLocalisation() %>
                                </td>
                                <td>
                                    <span class="badge bg-success">
                                        <i class="fas fa-car me-1"></i> <%= p.getCapacite() %> véhicules
                                    </span>
                                </td>
                                <td>
                                    <a href="/parc/updating?id=<%= p.getNum_parc() %>" class="btn btn-primary btn-sm">
                                        <i class="fa fa-edit"></i> Modifier
                                    </a>
                                    <a href="/parc/delete?id=<%= p.getNum_parc() %>" class="btn btn-danger btn-sm"
                                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer le parc <%= p.getLibelle() %> ?')">
                                        <i class="fa fa-trash"></i> Supprimer
                                    </a>
                                </td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="5">
                                    <div class="empty-state">
                                        <div class="empty-icon">
                                            <i class="fas fa-warehouse"></i>
                                        </div>
                                        <h3 class="empty-title">Aucun parc trouvé</h3>
                                        <p class="empty-desc">Commencez par ajouter un nouveau parc</p>
                                        <a href="/parc/add" class="btn btn-primary">
                                            <i class="fa fa-plus me-2"></i> Ajouter un parc
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div id="gridView" style="display: none;">
                <div class="parc-grid">
                    <%
                        if (parcs != null && !parcs.isEmpty()) {
                            for (Parc p : parcs) {
                    %>
                    <div class="parc-card">
                        <div class="parc-header">
                            <div class="parc-icon">
                                <i class="fas fa-warehouse"></i>
                            </div>
                            <div class="parc-info">
                                <h3 class="parc-name"><%= p.getLibelle() %></h3>
                                <p class="parc-location">
                                    <i class="fas fa-map-marker-alt"></i>
                                    <%= p.getLocalisation() %>
                                </p>
                            </div>
                        </div>
                        <div class="parc-details">
                            <div class="parc-capacity">
                                <span class="capacity-badge">
                                    <i class="fas fa-car"></i>
                                    <%= p.getCapacite() %> véhicules
                                </span>
                            </div>
                            <div class="parc-id">
                                <span class="detail-label">ID Parc:</span>
                                <span class="detail-value">#<%= p.getNum_parc() %></span>
                            </div>
                        </div>
                        <div class="parc-actions">
                            <a href="/parc/updating?id=<%= p.getNum_parc() %>" class="action-btn edit">
                                <i class="fa fa-edit me-2"></i> Modifier
                            </a>
                            <a href="/parc/delete?id=<%= p.getNum_parc() %>" class="action-btn delete"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer le parc <%= p.getLibelle() %> ?')">
                                <i class="fa fa-trash me-2"></i> Supprimer
                            </a>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <div class="col-12">
                        <div class="empty-state">
                            <div class="empty-icon">
                                <i class="fas fa-warehouse"></i>
                            </div>
                            <h3 class="empty-title">Aucun parc trouvé</h3>
                            <p class="empty-desc">Commencez par ajouter un nouveau parc</p>
                            <a href="/parc/add" class="btn btn-primary">
                                <i class="fa fa-plus me-2"></i> Ajouter un parc
                            </a>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    // Toggle between grid and table views
    const gridViewBtn = document.getElementById('gridViewBtn');
    const tableViewBtn = document.getElementById('tableViewBtn');
    const gridView = document.getElementById('gridView');
    const tableView = document.getElementById('tableView');

    gridViewBtn.addEventListener('click', function() {
        gridView.style.display = 'block';
        tableView.style.display = 'none';
        gridViewBtn.classList.add('active');
        tableViewBtn.classList.remove('active');
    });

    tableViewBtn.addEventListener('click', function() {
        gridView.style.display = 'none';
        tableView.style.display = 'block';
        tableViewBtn.classList.add('active');
        gridViewBtn.classList.remove('active');
    });

    // Search functionality
    const searchInput = document.getElementById('searchInput');
    searchInput.addEventListener('keyup', function() {
        const searchValue = this.value.toLowerCase();
        const tableRows = document.querySelectorAll('#tableView tbody tr');
        const parcCards = document.querySelectorAll('.parc-card');

        // Filter table rows
        tableRows.forEach(row => {
            if (!row.querySelector('td[colspan="5"]')) { // Skip empty state row
                const text = row.textContent.toLowerCase();
                if (text.includes(searchValue)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            }
        });

        // Filter parc cards
        parcCards.forEach(card => {
            const text = card.textContent.toLowerCase();
            if (text.includes(searchValue)) {
                card.style.display = '';
            } else {
                card.style.display = 'none';
            }
        });
    });
</script>
</body>
</html>