package vn.hoidanit.laptopshop;
import org.junit.jupiter.api.*;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.edge.EdgeDriver;

import static org.junit.jupiter.api.Assertions.*;

public class HomePageTest {
    WebDriver driver;

    @BeforeEach
    void setUp() {
        System.setProperty("webdriver.edge.driver", "C:\\Users\\sonb1\\JavaSpring\\java-springMVC\\edgedriver_win64 (1)\\msedgedriver.exe"); // Cập nhật đường dẫn thực tế
        driver = new EdgeDriver();
    }

    @Test
    void testHomePageTitle() {
        driver.get("http://localhost:8080/"); // Thay bằng URL thật của bạn
        String title = driver.getTitle();
        assertTrue(title.contains("Laptop"), "Tiêu đề không chứa từ 'Laptop'");
    }

    @AfterEach
    void tearDown() {
        driver.quit();
    }
}
