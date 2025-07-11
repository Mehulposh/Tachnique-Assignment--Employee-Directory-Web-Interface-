import freemarker.template.*;
import java.util.*;
import java.io.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_29);
        cfg.setDirectoryForTemplateLoading(new File("../templates"));
        cfg.setDefaultEncoding("UTF-8");

        Template template = cfg.getTemplate("index.ftl");

        Map<String, Object> dataModel = new HashMap<>();
        // Pass extra data if needed
        // When rendering the form for adding, pass an empty employee map
        Map<String, String> employee = new HashMap<>();
        employee.put("firstName", "");
        employee.put("lastName", "");
        employee.put("email", "");
        employee.put("department", "");
        employee.put("role", "");

        dataModel.put("employee", employee);
        template.process(dataModel, new OutputStreamWriter(System.out));
    }
}
