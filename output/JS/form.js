const form = document.getElementById('employeeForm');//accessing the  dom element


document.addEventListener('DOMContentLoaded' , () => {
    //method to get id from url
    const params = new URLSearchParams(window.location.search);
    const id = params.get('id');
    console.log(id);

    if(id){
        //promise array for resolving the multiple promises
        Promise.all([
            fetch('../EmployeeData.json').then(res => res.json()),
            Promise.resolve(JSON.parse(localStorage.getItem('newEmployees') || '[]'))
        ])
            
            .then(([Oldemployees,newEmployees]) => {

                const fullData = [...Oldemployees, ...newEmployees];

                const employee = fullData.find(emp => emp.id === id);

                //auto completeing the form with existing data 
                if(employee){
                    form.elements['id'].value = employee.id;
                    form.elements['firstName'].value = employee.firstName;
                    form.elements['lastName'].value = employee.lastName;
                    form.elements['email'].value = employee.email;
                    form.elements['department'].value = employee.department;
                    form.elements['role'].value = employee.role;
                }else{
                    alert('Employee Not Found');
                    window.location.href = 'index.html';
                }
            })
            .catch(err => {
                console.error(err);
                alert('Filed to load employee data');
            });
    }


    //form submit event
    form.addEventListener('submit' , (e) => {
        e.preventDefault();

        //creating an employee object with data from form
        const employee = {
            id: form.elements['id'].value || Date.now(),  
            firstName: form.elements['firstName'].value.trim(),
            lastName: form.elements['lastName'].value.trim(),
            email: form.elements['email'].value.trim(),
            department: form.elements['department'].value.trim(),
            role: form.elements['role'].value.trim()
        }

        //retrieving from local storage
        const newEmployees = JSON.parse(localStorage.getItem('newEmployees') || '[]');
        
        // check if exists in newEmployees
        const idx = newEmployees.findIndex(emp => String(emp.id) === String(employee.id));

        if (idx !== -1) {
            newEmployees[idx] = employee; // update existing data
        } else {
            newEmployees.push(employee); // add new data
        }

        //storing the new employees data in local storage
        localStorage.setItem('newEmployees', JSON.stringify(newEmployees));


        alert('Employee data submitted');
        window.location.href = 'index.html';//redirect to index page 
    })
})