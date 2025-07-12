<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Directory Web Interface</title>
    <link rel="stylesheet" href="../styles/styles.css ">
</head>
<body>
    <nav id="navBar">
        <p>Employee Directory</p>
        <input id="search" type="text" placeholder="Search by name or email"/>
        <button id="filterBtn">Filter</button>
    </nav>
    <main>
        <section id="lowerBar">
            <div id="filterbar">
                <div class="sort">
                    <p>Sort:</p>
                    <select id='employeeSort'>
                        <option value="" selected >--Select--</option>
                        <option value="firstname">First Name</option>
                        <option value="department">Department</option>
                    </select>
                </div>
                <div class="sort">
                    <p>Show:</p>
                    <select id='employeePagination'>
                        <option value="10" selected >10</option>
                        <option value="25">25</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                    </select>
                </div>
            </div>

            <button id="addBtn">
                Add Employee
            </button>
        </section>
        <section id="employeeList">
             
        </section>
        
        
    </main>
    <main class='filterContainer'>
        <div id="filter_form" style="display: none;" class="filter-container">
            <h3>Filter Employees</h3>
            <form id="filterForm">
            <div>
                <label for="filterFirstName">First Name:</label>
                <input type="text" id="filterFirstName" name="firstName">
            </div>

            <div>
                <label for="filterDepartment">Department:</label>
                <input type="text" id="filterDepartment" name="department">
            </div>

            <div>
                <label for="filterRole">Role:</label>
                <input type="text" id="filterRole" name="role">
            </div>

            <div>
                <button type="submit">Apply</button>
                <button type="button" id="resetFilters">Reset</button>
            </div>
            </form>
        </div>

    </main>

    <footer>
        <p>
            2025 Employee Directory App. All rights reserved. 
        </p>
    </footer>

   
    <script src="../JS/dashboard.js"></script>
</body>
</html>