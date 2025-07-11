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
        
        <div class='formName'>
            <label for="firstName">First Name</label>
            <input type="text" id="firstName" name="firstName" value="${employee.firstName!}" required>
        </div>

        <div class='formLastname'>
            <label for="lastName">Last Name</label>
            <input type="text" id="lastName" name="lastName" value="${employee.lastName!}" required>
        </div>

        <div class='email_depart'>
            <div class='formemail'>
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="${employee.email!}" required>
            </div>
            <div class='formdepart'>
                <label for="department">Department</label>
                <input type="text" id="department" name="department" value="${employee.department!}" required>
            </div>
        </div>
        
        <div class='formrole'>
            <label for="role">Role</label>
            <input type="text" id="role" name="role" value="${employee.role!}" required>

        </div>
        <div class="formactions">
            <button type="button" onclick="window.history.back()">Cancel</button>
            <button id='add' type="submit">Add</button>
        </div>
    </form>

    <p id="formError" class="error"></p>
</main>

<script src="../JS/form.js"></script>
</body>
</html>
