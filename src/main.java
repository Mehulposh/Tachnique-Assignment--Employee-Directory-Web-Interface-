import freemarker.template.*;
import java.util.*;
import java.io.*;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Main {
    public static void main(String[] args) throws Exception {
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_34);
        cfg.setDirectoryForTemplateLoading(new File("../templates"));
        cfg.setDefaultEncoding("UTF-8");
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);

        // Create output directory if not exists
        File outputDir = new File("../output");
        if (!outputDir.exists()) {
            outputDir.mkdirs();
        }

        // Prepare mock employees list
        List<Map<String, String>> employees = new ArrayList<>();
        for (int i = 1; i <= 20; i++) {
            Map<String, String> emp = new HashMap<>();
            emp.put("id", String.valueOf(i));
            emp.put("firstName", "First" + i);
            emp.put("lastName", "Last" + i);
            emp.put("email", "user" + i + "@example.com");
            emp.put("department", (i % 2 == 0) ? "IT" : "HR");
            emp.put("role", (i % 2 == 0) ? "Developer" : "Manager");
            employees.add(emp);
        }

        // Dummy employee for add form
        Map<String, String> emptyEmployee = new HashMap<>();
        emptyEmployee.put("id", "");
        emptyEmployee.put("firstName", "");
        emptyEmployee.put("lastName", "");
        emptyEmployee.put("email", "");
        emptyEmployee.put("department", "");
        emptyEmployee.put("role", "");

        // Convert employees list to JSON
        ObjectMapper mapper = new ObjectMapper();
        String employeesJson = mapper.writeValueAsString(employees);

        // Data model for dashboard
        Map<String, Object> dashboardModel = new HashMap<>();
        dashboardModel.put("employees", employees);
        dashboardModel.put("employeesJson", employeesJson); // 🟢 now correct
        dashboardModel.put("employee", emptyEmployee); // To avoid null in form.ftl include

        // Data model for standalone form (add mode)
        Map<String, Object> formModel = new HashMap<>();
        formModel.put("employee", emptyEmployee);

        // Render index.ftl
        Template indexTemplate = cfg.getTemplate("index.ftl");
        try (Writer out = new OutputStreamWriter(
                new FileOutputStream(new File(outputDir, "index.html")), "UTF-8")) {
            indexTemplate.process(dashboardModel, out);
            System.out.println("✅ Generated: output/index.html");
        }

        // Render form.ftl separately
        Template formTemplate = cfg.getTemplate("form.ftl");
        try (Writer out = new OutputStreamWriter(
                new FileOutputStream(new File(outputDir, "form.html")), "UTF-8")) {
            formTemplate.process(formModel, out);
            System.out.println("✅ Generated: output/form.html");
        }
    }
}
