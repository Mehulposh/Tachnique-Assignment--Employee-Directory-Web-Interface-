<#assign employees = [
  { "id": 1, "firstName": "John", "lastName": "Doe", "email": "john.doe@example.com", "department": "HR", "role": "Manager" },
  { "id": 2, "firstName": "Jane", "lastName": "Smith", "email": "jane.smith@example.com", "department": "IT", "role": "Developer" },
  { "id": 3, "firstName": "Alice", "lastName": "Brown", "email": "alice.brown@example.com", "department": "Finance", "role": "Analyst" },
  { "id": 4, "firstName": "Michael", "lastName": "Johnson", "email": "michael.johnson@example.com", "department": "Sales", "role": "Executive" },
  { "id": 5, "firstName": "Emily", "lastName": "Davis", "email": "emily.davis@example.com", "department": "Marketing", "role": "Coordinator" },
  { "id": 6, "firstName": "Daniel", "lastName": "Miller", "email": "daniel.miller@example.com", "department": "IT", "role": "Tester" },
  { "id": 7, "firstName": "Sophia", "lastName": "Wilson", "email": "sophia.wilson@example.com", "department": "Finance", "role": "Accountant" },
  { "id": 8, "firstName": "William", "lastName": "Moore", "email": "william.moore@example.com", "department": "HR", "role": "Recruiter" },
  { "id": 9, "firstName": "Olivia", "lastName": "Taylor", "email": "olivia.taylor@example.com", "department": "IT", "role": "Engineer" },
  { "id": 10, "firstName": "James", "lastName": "Anderson", "email": "james.anderson@example.com", "department": "Sales", "role": "Manager" },
  { "id": 11, "firstName": "Ava", "lastName": "Thomas", "email": "ava.thomas@example.com", "department": "Marketing", "role": "Specialist" },
  { "id": 12, "firstName": "Benjamin", "lastName": "Jackson", "email": "benjamin.jackson@example.com", "department": "IT", "role": "Architect" },
  { "id": 13, "firstName": "Isabella", "lastName": "White", "email": "isabella.white@example.com", "department": "Finance", "role": "Clerk" },
  { "id": 14, "firstName": "Logan", "lastName": "Harris", "email": "logan.harris@example.com", "department": "HR", "role": "Assistant" },
  { "id": 15, "firstName": "Mia", "lastName": "Martin", "email": "mia.martin@example.com", "department": "IT", "role": "Developer" },
  { "id": 16, "firstName": "Lucas", "lastName": "Thompson", "email": "lucas.thompson@example.com", "department": "Sales", "role": "Executive" },
  { "id": 17, "firstName": "Charlotte", "lastName": "Garcia", "email": "charlotte.garcia@example.com", "department": "Marketing", "role": "Manager" },
  { "id": 18, "firstName": "Ethan", "lastName": "Martinez", "email": "ethan.martinez@example.com", "department": "Finance", "role": "Analyst" },
  { "id": 19, "firstName": "Amelia", "lastName": "Robinson", "email": "amelia.robinson@example.com", "department": "IT", "role": "Tester" },
  { "id": 20, "firstName": "Henry", "lastName": "Clark", "email": "henry.clark@example.com", "department": "HR", "role": "Recruiter" },
  { "id": 21, "firstName": "Evelyn", "lastName": "Rodriguez", "email": "evelyn.rodriguez@example.com", "department": "Sales", "role": "Coordinator" },
  { "id": 22, "firstName": "Alexander", "lastName": "Lewis", "email": "alexander.lewis@example.com", "department": "Marketing", "role": "Specialist" },
  { "id": 23, "firstName": "Harper", "lastName": "Lee", "email": "harper.lee@example.com", "department": "Finance", "role": "Accountant" },
  { "id": 24, "firstName": "Sebastian", "lastName": "Walker", "email": "sebastian.walker@example.com", "department": "IT", "role": "Engineer" },
  { "id": 25, "firstName": "Ella", "lastName": "Hall", "email": "ella.hall@example.com", "department": "HR", "role": "Manager" },
  { "id": 26, "firstName": "Jack", "lastName": "Allen", "email": "jack.allen@example.com", "department": "Sales", "role": "Executive" },
  { "id": 27, "firstName": "Scarlett", "lastName": "Young", "email": "scarlett.young@example.com", "department": "Marketing", "role": "Coordinator" },
  { "id": 28, "firstName": "Owen", "lastName": "Hernandez", "email": "owen.hernandez@example.com", "department": "IT", "role": "Developer" },
  { "id": 29, "firstName": "Grace", "lastName": "King", "email": "grace.king@example.com", "department": "Finance", "role": "Clerk" },
  { "id": 30, "firstName": "Liam", "lastName": "Wright", "email": "liam.wright@example.com", "department": "HR", "role": "Assistant" },
  { "id": 31, "firstName": "Chloe", "lastName": "Lopez", "email": "chloe.lopez@example.com", "department": "Sales", "role": "Manager" },
  { "id": 32, "firstName": "Matthew", "lastName": "Hill", "email": "matthew.hill@example.com", "department": "IT", "role": "Architect" },
  { "id": 33, "firstName": "Sofia", "lastName": "Scott", "email": "sofia.scott@example.com", "department": "Finance", "role": "Analyst" },
  { "id": 34, "firstName": "David", "lastName": "Green", "email": "david.green@example.com", "department": "HR", "role": "Recruiter" },
  { "id": 35, "firstName": "Victoria", "lastName": "Adams", "email": "victoria.adams@example.com", "department": "Marketing", "role": "Specialist" },
  { "id": 36, "firstName": "Joseph", "lastName": "Baker", "email": "joseph.baker@example.com", "department": "IT", "role": "Engineer" },
  { "id": 37, "firstName": "Aria", "lastName": "Nelson", "email": "aria.nelson@example.com", "department": "Sales", "role": "Coordinator" },
  { "id": 38, "firstName": "Samuel", "lastName": "Carter", "email": "samuel.carter@example.com", "department": "Finance", "role": "Accountant" },
  { "id": 39, "firstName": "Lily", "lastName": "Mitchell", "email": "lily.mitchell@example.com", "department": "HR", "role": "Assistant" },
  { "id": 40, "firstName": "Andrew", "lastName": "Perez", "email": "andrew.perez@example.com", "department": "IT", "role": "Tester" },
  { "id": 41, "firstName": "Hannah", "lastName": "Roberts", "email": "hannah.roberts@example.com", "department": "Marketing", "role": "Manager" },
  { "id": 42, "firstName": "Ryan", "lastName": "Turner", "email": "ryan.turner@example.com", "department": "Sales", "role": "Executive" },
  { "id": 43, "firstName": "Zoe", "lastName": "Phillips", "email": "zoe.phillips@example.com", "department": "Finance", "role": "Analyst" },
  { "id": 44, "firstName": "Nathan", "lastName": "Campbell", "email": "nathan.campbell@example.com", "department": "IT", "role": "Developer" },
  { "id": 45, "firstName": "Leah", "lastName": "Parker", "email": "leah.parker@example.com", "department": "HR", "role": "Recruiter" },
  { "id": 46, "firstName": "Dylan", "lastName": "Evans", "email": "dylan.evans@example.com", "department": "Sales", "role": "Manager" },
  { "id": 47, "firstName": "Nora", "lastName": "Edwards", "email": "nora.edwards@example.com", "department": "Finance", "role": "Clerk" },
  { "id": 48, "firstName": "Elijah", "lastName": "Collins", "email": "elijah.collins@example.com", "department": "IT", "role": "Architect" },
  { "id": 49, "firstName": "Abigail", "lastName": "Stewart", "email": "abigail.stewart@example.com", "department": "Marketing", "role": "Specialist" },
  { "id": 50, "firstName": "Gabriel", "lastName": "Sanchez", "email": "gabriel.sanchez@example.com", "department": "Finance", "role": "Analyst" },
  { "id": 51, "firstName": "Ella", "lastName": "Morris", "email": "ella.morris@example.com", "department": "Sales", "role": "Coordinator" },
  { "id": 52, "firstName": "Carter", "lastName": "Rogers", "email": "carter.rogers@example.com", "department": "IT", "role": "Tester" },
  { "id": 53, "firstName": "Madison", "lastName": "Reed", "email": "madison.reed@example.com", "department": "HR", "role": "Assistant" },
  { "id": 54, "firstName": "Luke", "lastName": "Cook", "email": "luke.cook@example.com", "department": "Finance", "role": "Accountant" },
  { "id": 55, "firstName": "Scarlett", "lastName": "Morgan", "email": "scarlett.morgan@example.com", "department": "Marketing", "role": "Coordinator" },
  { "id": 56, "firstName": "Jayden", "lastName": "Bell", "email": "jayden.bell@example.com", "department": "IT", "role": "Developer" },
  { "id": 57, "firstName": "Layla", "lastName": "Murphy", "email": "layla.murphy@example.com", "department": "Sales", "role": "Executive" },
  { "id": 58, "firstName": "Wyatt", "lastName": "Bailey", "email": "wyatt.bailey@example.com", "department": "Finance", "role": "Analyst" },
  { "id": 59, "firstName": "Avery", "lastName": "Rivera", "email": "avery.rivera@example.com", "department": "HR", "role": "Manager" },
  { "id": 60, "firstName": "Isaac", "lastName": "Cooper", "email": "isaac.cooper@example.com", "department": "IT", "role": "Engineer" }
]>


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