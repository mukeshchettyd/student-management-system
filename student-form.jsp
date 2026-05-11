<%@ page import="com.sms.model.Student" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Student student = (Student) request.getAttribute("student");
    boolean isEdit = student != null && student.getUsn() != null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= isEdit ? "Update Student" : "Add Student" %></title>
    <link href="assets/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark sms-navbar shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-semibold" href="index.jsp">Student Management System</a>
        <a href="students?action=list" class="btn btn-sm btn-outline-light">View Students</a>
    </div>
</nav>

<main class="container py-4">
    <div class="card sms-card p-4 p-md-5">
        <h2 class="h4 mb-4"><%= isEdit ? "Update Student Details" : "Add New Student" %></h2>

        <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="alert alert-danger"><%= request.getAttribute("errorMessage") %></div>
        <% } %>

        <form action="students" method="post" id="studentForm" novalidate>
            <input type="hidden" name="action" value="<%= isEdit ? "update" : "insert" %>">

            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">USN</label>
                    <input type="text" class="form-control sms-input" name="usn" required maxlength="20"
                           value="<%= student != null ? student.getUsn() : "" %>" <%= isEdit ? "readonly" : "" %>>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Name</label>
                    <input type="text" class="form-control sms-input" name="name" required maxlength="100"
                           value="<%= student != null ? student.getName() : "" %>">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Date of Birth</label>
                    <input type="date" class="form-control sms-input" name="dateOfBirth" required
                           value="<%= (student != null && student.getDateOfBirth() != null) ? student.getDateOfBirth().toString() : "" %>">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control sms-input" name="email" required maxlength="120"
                           value="<%= student != null ? student.getEmail() : "" %>">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Phone</label>
                    <input type="text" class="form-control sms-input" name="phone" required maxlength="10"
                           value="<%= student != null ? student.getPhone() : "" %>">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Branch</label>
                    <input type="text" class="form-control sms-input" name="branch" required maxlength="100"
                           value="<%= student != null ? student.getBranch() : "" %>">
                </div>
            </div>

            <div class="d-flex gap-2 mt-4">
                <button type="submit" class="btn btn-primary sms-btn"><%= isEdit ? "Update Student" : "Add Student" %></button>
                <a href="students?action=list" class="btn btn-outline-secondary sms-btn">Cancel</a>
            </div>
        </form>
    </div>
</main>

<script src="assets/js/validation.js"></script>
<script src="assets/vendor/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>
