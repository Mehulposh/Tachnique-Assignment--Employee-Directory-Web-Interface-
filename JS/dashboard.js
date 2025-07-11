const employeeList = document.getElementById('emlpoyeeList');
const search = document.getElementById('search');
const employeeSort = document.getElementById('employeeSort');
const employeePagination = document.getElementById('employeePagination');
const addBtn = document.getElementById('addBtn');

let employees = window.employees || [];
let currPage = 1;
let pageSize = parseInt(employeePagination.value);
let filteredEmployees = [...employees];

//Render the employeeList
function EmployeeRender(data){
    employeeList.innerHTML = ' ';
    const startIndex = (currPage -1 ) * pageSize;
    const endIndex = startIndex + pageSize;
    const newData = data.slice(startIndex,endIndex);

    if(newData.length === 0) {
        employeeList.innerHTML = '<p> No Employees Found </p>';

    }

    newData.map(emp => {
        const card = document.createElement('div');
        card.className = 'employee-card';
        card.innerHTML = `
            <p><strong>ID:</strong> ${emp.id}</p>
            <p><strong>Name:</strong> ${emp.firstName} ${emp.lastName}</p>
            <p><strong>Email:</strong> ${emp.email}</p>
            <p><strong>Department:</strong> ${emp.department}</p>
            <p><strong>Role:</strong> ${emp.role}</p>
            <div class="actions">
                <button class="edit-btn" data-id="${emp.id}">Edit</button>
                <button class="delete-btn" data-id="${emp.id}">Delete</button>
            </div> `;

        employeeList.appendChild(card);
    });

    //search employee
    search.addEventListener('input', () => {
        const value = search.value.trim().toLowerCase();
        filteredEmployees = employees.filter(emp => 
            emp.firstName.toLowerCase().includes(value) ||
            emp.lastName.toLowerCase().includes(value) ||
            emp.email.toLowerCase().includes(value) ||
            emp.department.toLowerCase().includes(value) ||
            emp.role.toLowerCase().includes(value)
        );

        currPage = 1;
        EmployeeRender(filteredEmployees);
    });


    //sort employees
    employeeSort.addEventListener('change' , () => {
        const value = employeeSort.value;

        if(!value) {
            return;
        }

        filteredEmployees.sort((a,b) => a[value].localeCompare(b[value]));
        currPage = 1;
        EmployeeRender(filteredEmployees);
    });


    
}





document.getElementById('addBtn').addEventListener('click', () => {
    document.getElementById('formSection').style.display = 'block';
});