<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Admin - Agence Location</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.min.css">

    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', sans-serif;
        }

        .sidebar {
            width: 240px;
            height: 100vh;
            position: fixed;
            background-color: #1f2d3d;
            color: white;
            padding-top: 20px;
            z-index: 100;
        }

        .sidebar .nav-link {
            color: #bdc3c7;
            padding: 12px 20px;
            transition: 0.2s;
        }

        .sidebar .nav-link:hover,
        .sidebar .nav-link.active {
            background-color: #2c3e50;
            color: #3399ff;
        }

        .main-content {
            margin-left: 240px;
            padding: 30px;
        }

        .card {
            background-color: white;
            border: none;
            border-left: 5px solid #3399ff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            transition: 0.2s ease-in-out;
            margin-bottom: 20px;
        }

        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.1);
        }

        .card-icon {
            font-size: 2.5rem;
            color: #3399ff;
        }

        footer {
            margin-left: 240px;
            padding: 20px 30px;
            color: #6c757d;
            border-top: 1px solid #dee2e6;
            background-color: #f8f9fa;
        }

        .stats-card {
            border-left: 5px solid;
            border-radius: 4px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        .stats-card.primary {
            border-color: #3399ff;
        }

        .stats-card.success {
            border-color: #28a745;
        }

        .stats-card.warning {
            border-color: #ffc107;
        }

        .stats-card.danger {
            border-color: #dc3545;
        }

        .stats-icon {
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            font-size: 24px;
        }

        .stats-icon.primary {
            background-color: rgba(51, 153, 255, 0.1);
            color: #3399ff;
        }

        .stats-icon.success {
            background-color: rgba(40, 167, 69, 0.1);
            color: #28a745;
        }

        .stats-icon.warning {
            background-color: rgba(255, 193, 7, 0.1);
            color: #ffc107;
        }

        .stats-icon.danger {
            background-color: rgba(220, 53, 69, 0.1);
            color: #dc3545;
        }

        .recent-activity {
            max-height: 400px;
            overflow-y: auto;
        }

        .activity-item {
            padding: 15px;
            border-left: 3px solid transparent;
            margin-bottom: 10px;
            background-color: #f8f9fa;
            border-radius: 4px;
            transition: all 0.2s ease;
        }

        .activity-item:hover {
            background-color: #e9ecef;
            border-left-color: #3399ff;
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            font-size: 16px;
            margin-right: 15px;
        }

        .activity-icon.blue {
            background-color: rgba(51, 153, 255, 0.1);
            color: #3399ff;
        }

        .activity-icon.green {
            background-color: rgba(40, 167, 69, 0.1);
            color: #28a745;
        }

        .activity-icon.orange {
            background-color: rgba(255, 193, 7, 0.1);
            color: #ffc107;
        }

        .activity-icon.red {
            background-color: rgba(220, 53, 69, 0.1);
            color: #dc3545;
        }

        .activity-content {
            flex: 1;
        }

        .activity-time {
            font-size: 12px;
            color: #6c757d;
        }

        .table-responsive {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
        }

        .table th {
            background-color: #f8f9fa;
            font-weight: 600;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-badge.available {
            background-color: rgba(40, 167, 69, 0.1);
            color: #28a745;
        }

        .status-badge.rented {
            background-color: rgba(220, 53, 69, 0.1);
            color: #dc3545;
        }

        .status-badge.maintenance {
            background-color: rgba(255, 193, 7, 0.1);
            color: #ffc107;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar d-flex flex-column">
    <h4 class="text-center text-white mb-4">Espace Admin</h4>
    <nav class="nav flex-column">
        <a class="nav-link active" href="/"><i class="fas fa-home me-2"></i>Tableau de bord</a>
        <a class="nav-link" href="${pageContext.request.contextPath}/client"><i class="fas fa-users me-2"></i>Gestion clients</a>
        <a class="nav-link" href="${pageContext.request.contextPath}/parc/list"><i class="fas fa-warehouse me-2"></i>Gestion parcs</a>
        <a class="nav-link" href="${pageContext.request.contextPath}/voiture/list"><i class="fas fa-car me-2"></i>Gestion voitures</a>
        <a class="nav-link" href="${pageContext.request.contextPath}/reservation/list"><i class="fas fa-calendar-check me-2"></i>Réservations</a>
        <a class="nav-link" href="/logout"><i class="fas fa-sign-out-alt me-2"></i>Déconnexion</a>
    </nav>
</div>

<!-- Main content -->
<div class="main-content">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">Tableau de bord</h2>
        <div class="d-flex align-items-center">
            <div class="dropdown me-3">
                <button class="btn btn-light dropdown-toggle" type="button" id="notificationsDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-bell"></i>
                    <span class="badge bg-danger rounded-pill">3</span>
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="notificationsDropdown">
                    <li><h6 class="dropdown-header">Notifications</h6></li>
                    <li><a class="dropdown-item" href="#">Nouvelle réservation (#12345)</a></li>
                    <li><a class="dropdown-item" href="#">Retour de véhicule en retard</a></li>
                    <li><a class="dropdown-item" href="#">Maintenance requise (Peugeot 3008)</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item text-center" href="#">Voir toutes les notifications</a></li>
                </ul>
            </div>
            <div class="dropdown">
                <button class="btn btn-light dropdown-toggle d-flex align-items-center" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="https://randomuser.me/api/portraits/men/1.jpg" alt="Admin" class="rounded-circle me-2" width="32" height="32">
                    <span>Admin</span>
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                    <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i>Profil</a></li>
                    <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Paramètres</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="/logout"><i class="fas fa-sign-out-alt me-2"></i>Déconnexion</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Stats Cards -->
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="card stats-card primary">
                <div class="card-body d-flex align-items-center">
                    <div class="stats-icon primary me-3">
                        <i class="fas fa-car"></i>
                    </div>
                    <div>
                        <h6 class="card-subtitle mb-1 text-muted">Total Véhicules</h6>
                        <h3 class="card-title mb-0">42</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stats-card success">
                <div class="card-body d-flex align-items-center">
                    <div class="stats-icon success me-3">
                        <i class="fas fa-users"></i>
                    </div>
                    <div>
                        <h6 class="card-subtitle mb-1 text-muted">Clients</h6>
                        <h3 class="card-title mb-0">156</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stats-card warning">
                <div class="card-body d-flex align-items-center">
                    <div class="stats-icon warning me-3">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <div>
                        <h6 class="card-subtitle mb-1 text-muted">Réservations</h6>
                        <h3 class="card-title mb-0">28</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stats-card danger">
                <div class="card-body d-flex align-items-center">
                    <div class="stats-icon danger me-3">
                        <i class="fas fa-euro-sign"></i>
                    </div>
                    <div>
                        <h6 class="card-subtitle mb-1 text-muted">Revenus (mois)</h6>
                        <h3 class="card-title mb-0">12 450 €</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row mb-4">
        <!-- Charts -->
        <div class="col-md-8">
            <div class="card h-100">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h5 class="card-title mb-0">Statistiques de location</h5>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-sm btn-outline-secondary active">Semaine</button>
                        <button type="button" class="btn btn-sm btn-outline-secondary">Mois</button>
                        <button type="button" class="btn btn-sm btn-outline-secondary">Année</button>
                    </div>
                </div>
                <div class="card-body">
                    <canvas id="revenueChart" height="250"></canvas>
                </div>
            </div>
        </div>

        <!-- Recent Activity -->
        <div class="col-md-4">
            <div class="card h-100">
                <div class="card-header bg-white">
                    <h5 class="card-title mb-0">Activités récentes</h5>
                </div>
                <div class="card-body p-0">
                    <div class="recent-activity p-3">
                        <div class="activity-item d-flex">
                            <div class="activity-icon blue">
                                <i class="fas fa-car"></i>
                            </div>
                            <div class="activity-content">
                                <p class="mb-1">Nouvelle réservation - Renault Clio</p>
                                <p class="mb-0 activity-time">Il y a 10 minutes</p>
                            </div>
                        </div>
                        <div class="activity-item d-flex">
                            <div class="activity-icon green">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <div class="activity-content">
                                <p class="mb-1">Retour de véhicule - Peugeot 308</p>
                                <p class="mb-0 activity-time">Il y a 1 heure</p>
                            </div>
                        </div>
                        <div class="activity-item d-flex">
                            <div class="activity-icon orange">
                                <i class="fas fa-user-plus"></i>
                            </div>
                            <div class="activity-content">
                                <p class="mb-1">Nouveau client enregistré</p>
                                <p class="mb-0 activity-time">Il y a 3 heures</p>
                            </div>
                        </div>
                        <div class="activity-item d-flex">
                            <div class="activity-icon red">
                                <i class="fas fa-exclamation-triangle"></i>
                            </div>
                            <div class="activity-content">
                                <p class="mb-1">Maintenance requise - BMW Série 3</p>
                                <p class="mb-0 activity-time">Il y a 5 heures</p>
                            </div>
                        </div>
                        <div class="activity-item d-flex">
                            <div class="activity-icon blue">
                                <i class="fas fa-car"></i>
                            </div>
                            <div class="activity-content">
                                <p class="mb-1">Nouvelle réservation - Mercedes Classe C</p>
                                <p class="mb-0 activity-time">Il y a 8 heures</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Reservations -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h5 class="card-title mb-0">Réservations récentes</h5>
                    <a href="${pageContext.request.contextPath}/reservation/list" class="btn btn-sm btn-primary">Voir tout</a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Client</th>
                                <th>Véhicule</th>
                                <th>Date début</th>
                                <th>Date fin</th>
                                <th>Statut</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>#12345</td>
                                <td>Martin Dupont</td>
                                <td>Renault Clio</td>
                                <td>20/05/2025</td>
                                <td>25/05/2025</td>
                                <td><span class="status-badge available">Confirmée</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary"><i class="fas fa-eye"></i></button>
                                    <button class="btn btn-sm btn-outline-danger"><i class="fas fa-times"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>#12344</td>
                                <td>Sophie Martin</td>
                                <td>Peugeot 3008</td>
                                <td>19/05/2025</td>
                                <td>22/05/2025</td>
                                <td><span class="status-badge rented">En cours</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary"><i class="fas fa-eye"></i></button>
                                    <button class="btn btn-sm btn-outline-success"><i class="fas fa-check"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>#12343</td>
                                <td>Thomas Petit</td>
                                <td>BMW Série 5</td>
                                <td>18/05/2025</td>
                                <td>21/05/2025</td>
                                <td><span class="status-badge maintenance">Annulée</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary"><i class="fas fa-eye"></i></button>
                                    <button class="btn btn-sm btn-outline-secondary"><i class="fas fa-redo"></i></button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Vehicle Status -->
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-white">
                    <h5 class="card-title mb-0">Statut des véhicules</h5>
                </div>
                <div class="card-body">
                    <canvas id="vehicleStatusChart" height="250"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-white">
                    <h5 class="card-title mb-0">Répartition par catégorie</h5>
                </div>
                <div class="card-body">
                    <canvas id="vehicleCategoryChart" height="250"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="text-center">
    &copy; <%= java.time.Year.now() %> Agence Location - Interface Admin
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
<script>
    // Revenue Chart
    const revenueCtx = document.getElementById('revenueChart').getContext('2d');
    const revenueChart = new Chart(revenueCtx, {
        type: 'line',
        data: {
            labels: ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'],
            datasets: [{
                label: 'Réservations',
                data: [5, 8, 6, 9, 12, 15, 10],
                borderColor: '#3399ff',
                backgroundColor: 'rgba(51, 153, 255, 0.1)',
                tension: 0.4,
                fill: true
            }, {
                label: 'Revenus (€)',
                data: [1200, 1800, 1500, 2000, 2500, 3000, 2200],
                borderColor: '#28a745',
                backgroundColor: 'rgba(40, 167, 69, 0.1)',
                tension: 0.4,
                fill: true,
                yAxisID: 'y1'
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Nombre de réservations'
                    }
                },
                y1: {
                    beginAtZero: true,
                    position: 'right',
                    title: {
                        display: true,
                        text: 'Revenus (€)'
                    },
                    grid: {
                        drawOnChartArea: false
                    }
                }
            }
        }
    });

    // Vehicle Status Chart
    const vehicleStatusCtx = document.getElementById('vehicleStatusChart').getContext('2d');
    const vehicleStatusChart = new Chart(vehicleStatusCtx, {
        type: 'doughnut',
        data: {
            labels: ['Disponible', 'En location', 'En maintenance'],
            datasets: [{
                data: [25, 12, 5],
                backgroundColor: ['#28a745', '#3399ff', '#ffc107'],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });

    // Vehicle Category Chart
    const vehicleCategoryCtx = document.getElementById('vehicleCategoryChart').getContext('2d');
    const vehicleCategoryChart = new Chart(vehicleCategoryCtx, {
        type: 'bar',
        data: {
            labels: ['Économique', 'Compact', 'SUV', 'Luxe', 'Utilitaire'],
            datasets: [{
                label: 'Nombre de véhicules',
                data: [15, 10, 8, 5, 4],
                backgroundColor: [
                    'rgba(51, 153, 255, 0.7)',
                    'rgba(40, 167, 69, 0.7)',
                    'rgba(255, 193, 7, 0.7)',
                    'rgba(220, 53, 69, 0.7)',
                    'rgba(108, 117, 125, 0.7)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
</body>
</html>