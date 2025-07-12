//elements for displaying employee list , search , sort , pagination and add a new employee
const employeeList = document.getElementById('employeeList');
const search = document.getElementById('search');
const employeeSort = document.getElementById('employeeSort');
const employeePagination = document.getElementById('employeePagination');
const addBtn = document.getElementById('addBtn');


//elements for filter form
const filterBtn = document.getElementById('filterBtn');
const filterContainer =  document.getElementById('filterContainer');
const filterForm = document.getElementById('filterForm');
const formContainer = document.getElementById('filter_form');
const resetBtn = document.getElementById('resetFilters');

console.log(document.getElementById('filterContainer'));

let employees = [];//employee data
let currPage = 1;
let pageSize = parseInt(employeePagination.value);
let filteredEmployees = [...employees];//copy of the employees data

//lestener to open filter form
filterBtn.addEventListener('click' , () => {
    //toggle the visibility of the filter form
    filterContainer.style.display = filterContainer.style.display === 'none' ? 'block' : 'none';
});


//function to load employees from jsin file and localstorage
async function loadFullEmployees(){
    //fetch data from json file
    const response = await fetch('../EmployeeData.json');
    const Oldemployees = await response.json();

    //fetch employee data from local storage
    const newEmployees = JSON.parse(localStorage.getItem('newEmployees') || '[]');

    employees = [...Oldemployees, ...newEmployees];
    filteredEmployees = [...employees];

    //rendering the employee list
    EmployeeRender(filteredEmployees);
}


//listener to aplly filter on submit
filterForm.addEventListener('submit' , (e) => {
    e.preventDefault();

    //get filter  value from filter form
    const filters = {
        firstName: document.getElementById('filterFirstName').value.trim().toLowerCase(),
        department: document.getElementById('filterDepartment').value.trim().toLowerCase(),
        role: document.getElementById('filterRole').value.trim().toLowerCase(),
    }

    //filtering employees based on provided filter
    filteredEmployees = employees.filter(emp => {
        return (!filters.firstName || emp.firstName.toLowerCase().includes(filters.firstName)) &&
               (!filters.department || emp.department.toLowerCase().includes(filters.department)) &&
               (!filters.role || emp.role.toLowerCase().includes(filters.role));
    });

    currPage = 1;

    //rendering the employee list
    EmployeeRender(filteredEmployees);
}) ;


//listerner to reset the filters
resetBtn.addEventListener('click' , () => {
    //reseting the folm fields to empty
    document.getElementById('filterFirstName').value = '';
    document.getElementById('filterDepartment').value = '';
    document.getElementById('filterRole').value = '' ;

    //restoring the complete employee data
    filteredEmployees = [...employees];
    currPage = 1 ;

    //rendering the employee list
    EmployeeRender(filteredEmployees);

    //hide the filter form
    filterContainer.style.display = 'none';
})


//Render the employeeList
function EmployeeRender(data){
    employeeList.innerHTML = ' ';

    //start index for pagination
    const startIndex = (currPage -1 ) * pageSize;

    //end index for pagination
    const endIndex = startIndex + pageSize;

    //new data after pagination
    const newData = data.slice(startIndex,endIndex);

    if(newData.length === 0) {
        //message for no data
        employeeList.innerHTML = '<p id="missing"> No Employees Found </p>';

    }

    newData.map(emp => {
        //create a new div for each card
        const card = document.createElement('div');
        card.className = 'employee-card';

        //create html for employee card
        card.innerHTML = `
            <p><strong>ID:</strong> ${emp.id}</p>
            <p><strong>Name:</strong> ${emp.firstName} ${emp.lastName}</p>
            <p><strong>Email:</strong> ${emp.email}</p>
            <p><strong>Department:</strong> ${emp.department}</p>
            <p><strong>Role:</strong> ${emp.role}</p>
            <div class="actions">
                <button class="edit-btn" onclick="editEmployee('${emp.id}')" data-id="${emp.id}">Edit</button>
                <button class="delete-btn" onclick="deleteEmployee('${emp.id}')" data-id="${emp.id}">Delete</button>
            </div> `;

        //append the employee card to the employeeList container
        employeeList.appendChild(card);
    });

}

    //search employee
    search.addEventListener('input', () => {
        //get the search value from search box 
        const value = search.value.trim().toLowerCase();

        //filter the employees based on search value
        filteredEmployees = employees.filter(emp => 
            emp.firstName.toLowerCase().includes(value) ||
            emp.lastName.toLowerCase().includes(value) ||
            emp.email.toLowerCase().includes(value) ||
            emp.department.toLowerCase().includes(value) ||
            emp.role.toLowerCase().includes(value)
        );

        currPage = 1;

        //rendering the employee list
        EmployeeRender(filteredEmployees);
    });


    //sort employees
    employeeSort.addEventListener('change' , () => {
        //get the sort value from select tag
        const value = employeeSort.value;

        if(!value) {
            return;
        }

        //sort the employees based on the sort value
        filteredEmployees.sort((a,b) => a[value].localeCompare(b[value]));
        currPage = 1;

        //rendering the employee list
        EmployeeRender(filteredEmployees);
    });


    //pagination of employees
    employeePagination.addEventListener('change' , () => {
        //get the page size from select tag 
        pageSize = parseInt(employeePagination.value);
        currPage = 1;

        //rendering the employee list
        EmployeeRender(filteredEmployees);
    })


    //add employee
    addBtn.addEventListener('click' , () =>  {
        //route to form 
        window.location.href = 'form.html';
    })


    //edit employee
    window.editEmployee = function(id) {
        //route to form with employee id
        window.location.href = `form.html?id=${id}`
    }


    //delete employee
    window.deleteEmployee = function(id){
        if(confirm('Are you sure you want to delete this employee?')){

            //filter employees agter deleting an employee
            employees = employees.filter(emp => emp.id !== id);

            filteredEmployees = [...employees];

            //update localStorage
            const localEmployees = JSON.parse(localStorage.getItem('newEmployees') || '[]');
            const updatedLocalEmployees = localEmployees.filter(emp => String(emp.id) !== String(id));
            localStorage.setItem('newEmployees', JSON.stringify(updatedLocalEmployees));

            //rendering the employee list
            EmployeeRender(filteredEmployees);
        }
    }



//Initialize
loadFullEmployees();