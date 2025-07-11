document.addEventListener('DOMContentLoaded' , () => {
    const params = new URLSearchParams(window.location.search);
    const id = params.get('id');

    if(id){
        fetch('../EmployeeData.json')
            .then(res => res.json())
            .then(data => {
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

        const employee = {
            id: form.elements['id'].value || Date.now(),  
            firstName: form.elements['firstName'].value.trim(),
            lastName: form.elements['lastName'].value.trim(),
            email: form.elements['email'].value.trim(),
            department: form.elements['department'].value.trim(),
            role: form.elements['role'].value.trim()
        }

        alert('Employee data submitted');
        window.location.href = 'index.html';//redirect to index page 
    })
})