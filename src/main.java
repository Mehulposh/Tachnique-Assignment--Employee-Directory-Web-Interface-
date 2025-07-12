import freemarker.template.*;
import java.util.*;
import java.io.*;
import java.nio.file.*;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Main {
    public static void main(String[] args) throws Exception {
        // FreeMarker configuration
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_34);
        cfg.setDirectoryForTemplateLoading(new File("../templates"));
        cfg.setDefaultEncoding("UTF-8");
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);

        // Read employees.json
        ObjectMapper mapper = new ObjectMapper();
        List<Map<String, String>> employees =
                mapper.readValue(new File("../EmployeeData.json"),
                        new TypeReference<List<Map<String, String>>>() {});

        String employeesJsonStr = mapper.writeValueAsString(employees);
        System.out.println("✅ Loaded employees: " + employees.size());

        // Prepare empty employee for the add form
        Map<String, String> emptyEmployee = new HashMap<>();
        emptyEmployee.put("id", "");
        emptyEmployee.put("firstName", "");
        emptyEmployee.put("lastName", "");
        emptyEmployee.put("email", "");
        emptyEmployee.put("department", "");
        emptyEmployee.put("role", "");

        // Data model for dashboard
        Map<String, Object> dashboardModel = new HashMap<>();
        dashboardModel.put("employees", employees);
        dashboardModel.put("employeesJsonString", employeesJsonStr);
        dashboardModel.put("employee", emptyEmployee);

        // Data model for standalone form
        Map<String, Object> formModel = new HashMap<>();
        formModel.put("employee", emptyEmployee);

        // Create output directory if it doesn't exist
        File outputDir = new File("../output");
        if (!outputDir.exists()) {
            outputDir.mkdirs();
        }

        // Render index.html
        Template indexTemplate = cfg.getTemplate("index.ftl");
        try (Writer out = new OutputStreamWriter(
                new FileOutputStream(new File(outputDir, "index.html")), "UTF-8")) {
            indexTemplate.process(dashboardModel, out);
            System.out.println("✅ Generated: output/index.html");
        }

        // Render form.html
        Template formTemplate = cfg.getTemplate("form.ftl");
        try (Writer out = new OutputStreamWriter(
                new FileOutputStream(new File(outputDir, "form.html")), "UTF-8")) {
            formTemplate.process(formModel, out);
            System.out.println("✅ Generated: output/form.html");
        }

        // Copy employees.json to output folder
        Files.copy(
            new File("../EmployeeData.json").toPath(),
            new File(outputDir, "EmployeeData.json").toPath(),
            StandardCopyOption.REPLACE_EXISTING
        );
        System.out.println("✅ Copied: output/EmployeeData.json");
    }
}
