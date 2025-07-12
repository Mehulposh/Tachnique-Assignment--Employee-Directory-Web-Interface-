📋 Employee Directory Web App

A responsive Employee Directory web application that allows users to view, search, sort, filter, add, edit, and delete employees.

It combines static JSON data with dynamic updates stored in browser LocalStorage for persistence.

The initial HTML pages are generated using the FreeMarker template engine.

The initial HTML pages are generated using the FreeMarker template engine.

🚀 Setup & Run Instructions

Run locally:

1️⃣ Clone or download the repository.

2️⃣ Make sure you have a valid EmployeeData.json file with employee data.

3️⃣ Run the FreeMarker-based generator to create the index.html and form.html files: 

  <img width="983" height="190" alt="image" src="https://github.com/user-attachments/assets/64c72424-4bbd-467f-b774-a31057557515" />


This reads templates/index.ftl and templates/form.ftl, and generates HTML into the output/ folder.

4️⃣ Open the app in your browser:

Open output/index.html for the dashboard.

Open output/form.html to add/edit employees.

📌 Note: You don’t need a server to run this project — just open the generated .html files in any modern browser.

📁 Project Structure

<img width="444" height="608" alt="Screenshot 2025-07-12 110956" src="https://github.com/user-attachments/assets/f26eaef6-7fb3-4926-bfc2-9a732b9e1e99" />



🖋️ About FreeMarker

This project uses FreeMarker, a Java-based template engine, to generate the initial HTML pages (index.html and form.html) by combining the templates (.ftl files) and the JSON employee data.
This makes it easy to manage a clean separation between your data and your UI.

Why FreeMarker?

✅ No hardcoding of HTML

✅ Reusable templates

✅ Easy to generate dynamic content from JSON data

✅ Fits well in a Java-based build pipeline

FreeMarker is only used at build time — the web app itself is pure HTML/CSS/JS at runtime.

🔍 Reflection
✅ What went well:
Implemented core functionality with clean separation of concerns.

FreeMarker templates made the HTML generation clean and maintainable.

LocalStorage integration allows persistence of newly added or edited employees.

Responsive CSS with media queries provides a good user experience on desktop and mobile.

🚧 Challenges faced:

Ensuring the LocalStorage data merges properly with the JSON data.

Handling edit and delete actions cleanly when data exists in both sources.

Getting FreeMarker paths and output directories right for relative file access.

🌱 What I’d improve if given more time:

Implement proper form validation for email format and required fields.

Add a modal confirmation dialog for deletes rather than a browser confirm.

Improve accessibility with ARIA roles and keyboard navigation.

Add pagination UI controls instead of just showing all employees.

👨‍💻 Author

✍️ Developed by Mehul Poshattiwar

🎯 Assignment: Employee Directory Web App - 2025

