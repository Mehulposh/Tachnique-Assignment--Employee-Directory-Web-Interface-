<div class="employee-list">
<#list employees as emp>
    <div class="employee-card">
        <p><strong>ID:</strong> ${emp.id}</p>
        <p><strong>Name:</strong> ${emp.firstName} ${emp.lastName}</p>
        <p><strong>Email:</strong> ${emp.email}</p>
        <p><strong>Department:</strong> ${emp.department}</p>
        <p><strong>Role:</strong> ${emp.role}</p>
        <div class="actions">
            <button class="edit-btn" data-id="${emp.id}">Edit</button>
            <button class="delete-btn" data-id="${emp.id}">Delete</button>
        </div>
    </div>
</#list>
</div>