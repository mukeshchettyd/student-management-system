<%@ page import="java.util.List" %>
<%@ page import="com.sms.model.Student" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<Student> listStudents = (List<Student>) request.getAttribute("listStudents");
    String searchQuery = (String) request.getAttribute("searchQuery");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Students</title>
    <link href="assets/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark sms-navbar shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-semibold" href="index.jsp">Student Management System</a>
        <div class="d-flex gap-2">
            <a href="students?action=new" class="btn btn-sm btn-light">Add Student</a>
        </div>
    </div>
</nav>

<main class="container py-4">
    <div class="card sms-card p-4">
        <div class="d-flex flex-column flex-lg-row justify-content-between align-items-lg-center gap-3 mb-3">
            <h2 class="h4 mb-0">Student Records</h2>
            <form action="students" method="get" class="d-flex gap-2 w-100 w-lg-auto">
                <input type="hidden" name="action" value="search">
                <input type="text" name="query" class="form-control sms-input" placeholder="Search by USN or Name"
                       value="<%= searchQuery != null ? searchQuery : "" %>">
                <button type="submit" class="btn btn-primary sms-btn">Search</button>
                <a href="students?action=list" class="btn btn-outline-secondary sms-btn">Reset</a>
            </form>
        </div>

        <% if (request.getAttribute("successMessage") != null) { %>
        <div class="alert alert-success"><%= request.getAttribute("successMessage") %></div>
        <% } %>

        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-light">
                <tr>
                    <th>USN</th>
                    <th>Name</th>
                    <th>Date of Birth</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Branch</th>
                    <th class="text-center">Actions</th>
                </tr>
                </thead>
                <tbody>
                <% if (listStudents == null || listStudents.isEmpty()) { %>
                <tr>
                    <td colspan="7" class="text-center text-muted py-4">No student records found.</td>
                </tr>
                <% } else { %>
                <% for (Student student : listStudents) { %>
                <tr>
                    <td><%= student.getUsn() %></td>
                    <td><%= student.getName() %></td>
                    <td><%= student.getDateOfBirth() %></td>
                    <td><%= student.getEmail() %></td>
                    <td><%= student.getPhone() %></td>
                    <td><%= student.getBranch() %></td>
                    <td class="text-center">
                        <a href="students?action=edit&usn=<%= student.getUsn() %>" class="btn btn-sm btn-outline-primary me-1">Edit</a>
                        <a href="students?action=delete&usn=<%= student.getUsn() %>" class="btn btn-sm btn-outline-danger"
                           onclick="return confirm('Are you sure you want to delete this student?');">Delete</a>
                    </td>
                </tr>
                <% } %>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</main>

<script src="assets/vendor/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>
