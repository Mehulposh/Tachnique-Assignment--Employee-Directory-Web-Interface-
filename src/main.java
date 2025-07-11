import freemarker.template.*;
import java.util.*;
import java.io.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_31);
        cfg.setDirectoryForTemplateLoading(new File("templates"));
        cfg.setDefaultEncoding("UTF-8");

        Template template = cfg.getTemplate("index.ftl");

        Map<String, Object> dataModel = new HashMap<>();
        // Pass extra data if needed
        template.process(dataModel, new OutputStreamWriter(System.out));
    }
}
