<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add/Edit Employee</title>
<link rel="stylesheet" href="../styles/styles.css">
</head>
<body>

<nav id="navBar">
        <p>Employee Directory</p>
        <input id="search" type="text" placeholder="Search by name or email"/>
        <button id="filterBtn">Filter</button>
</nav>

<main class='mainContainer'>
<main class="form-container">
    <h2>Add Employee</h2>

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
</main>
<footer>
    <p>
        2025 Employee Directory App. All rights reserved. 
    </p>
</footer>

<script src="../JS/form.js"></script>
</body>
</html>
