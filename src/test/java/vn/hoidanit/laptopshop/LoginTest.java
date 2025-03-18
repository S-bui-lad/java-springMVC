package vn.hoidanit.laptopshop;

import org.aspectj.lang.annotation.After;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class LoginTest {
    private WebDriver driver;

    @BeforeEach
    public void setUp() {
        // Khởi tạo trình duyệt Microsoft Edge
        System.setProperty("webdriver.edge.driver", "C:\\Users\\sonb1\\JavaSpring\\java-springMVC\\edgedriver_win64 (1)\\msedgedriver.exe");
        driver = new EdgeDriver();
        driver.manage().window().maximize();
    }

    @Test
    public void testLogin() {
        // Truy cập trang đăng nhập
        driver.get("http://localhost:8080/login");

        // Tìm ô nhập Email bằng name="username"
        WebElement emailField = driver.findElement(By.name("username"));
        emailField.sendKeys("sonb181223@gmail.com");

        // Tìm ô nhập Password bằng name="password"
        WebElement passwordField = driver.findElement(By.name("password"));
        passwordField.sendKeys("123456");

        // Tìm và nhấn nút Login (giả sử nút có class="btn btn-primary btn-block")
        WebElement loginButton = driver.findElement(By.cssSelector(".btn.btn-primary.btn-block"));
        loginButton.click();

        // Kiểm tra đăng nhập thành công (VD: kiểm tra URL hoặc hiển thị của trang sau khi đăng nhập)
        assertTrue(driver.getCurrentUrl().contains("dashboard"));
    }

    @After("")
    public void tearDown() {
        // Đóng trình duyệt sau khi test xong
        if (driver != null) {
            driver.quit();
        }
    }
}
