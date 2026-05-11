<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <link href="assets/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark sms-navbar shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-semibold" href="index.jsp">Student Management System</a>
    </div>
</nav>

<main class="container py-5">
    <div class="card sms-card p-4 p-md-5">
        <h1 class="h3 mb-3">Dashboard</h1>
        <p class="text-muted mb-4">Manage student records with clean CRUD operations and quick search.</p>

        <div class="row g-3">
            <div class="col-md-4">
                <a href="students?action=new" class="btn btn-primary w-100 sms-btn">Add New Student</a>
            </div>
            <div class="col-md-4">
                <a href="students?action=list" class="btn btn-outline-primary w-100 sms-btn">View All Students</a>
            </div>
            <div class="col-md-4">
                <a href="students?action=search&query=" class="btn btn-outline-secondary w-100 sms-btn">Search Students</a>
            </div>
        </div>
    </div>
</main>

<script src="assets/vendor/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>
