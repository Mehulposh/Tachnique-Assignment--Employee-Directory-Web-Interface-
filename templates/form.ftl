<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add/Edit Employee</title>
<link rel="stylesheet" href="../styles/styles.css">
</head>
<body>

<main class="form-container">
    <h2>${employee?has_content?then("Edit Employee", "Add Employee")}</h2>

    <form id="employeeForm">
        <input type="hidden" id="id" name="id" value="${employee.id!}">
        
        <label for="firstName">First Name</label>
        <input type="text" id="firstName" name="firstName" value="${employee.firstName!}" required>

        <label for="lastName">Last Name</label>
        <input type="text" id="lastName" name="lastName" value="${employee.lastName!}" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="${employee.email!}" required>

        <label for="department">Department</label>
        <input type="text" id="department" name="department" value="${employee.department!}" required>

        <label for="role">Role</label>
        <input type="text" id="role" name="role" value="${employee.role!}" required>

        <button type="submit">Save</button>
        <button type="button" onclick="window.history.back()">Cancel</button>
    </form>

    <p id="formError" class="error"></p>
</main>

<script src="../JS/form.js"></script>
</body>
</html>
