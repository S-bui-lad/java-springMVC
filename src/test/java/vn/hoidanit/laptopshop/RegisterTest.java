package vn.hoidanit.laptopshop;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;
import java.time.Duration;

public class RegisterTest {
    public static void main(String[] args) {
        // Đặt đường dẫn đến Edge WebDriver
        System.setProperty("webdriver.edge.driver", "C:\\Users\\sonb1\\JavaSpring\\java-springMVC\\edgedriver_win64 (1)\\msedgedriver.exe");

        // Khởi tạo trình duyệt Edge
        WebDriver driver = new EdgeDriver();

        try {
            // Mở trang đăng ký
            driver.get("http://localhost:8080/register");
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));

            // Điền thông tin vào form đăng ký
            WebElement firstName = driver.findElement(By.id("inputFirstName"));
            firstName.sendKeys("Test");

            WebElement lastName = driver.findElement(By.id("inputLastName"));
            lastName.sendKeys("User");

            WebElement email = driver.findElement(By.name("email"));
            email.sendKeys("testuser123@example.com");

            WebElement password = driver.findElement(By.name("password"));
            password.sendKeys("Test@123456");

            WebElement confirmPassword = driver.findElement(By.name("confirmPassword"));
            confirmPassword.sendKeys("Test@123456");

            WebElement registerButton = driver.findElement(By.cssSelector("button.btn.btn-primary.btn-block"));
            registerButton.click();

            // Kiểm tra đăng ký thành công
            WebElement successMessage = driver.findElement(By.id("successMessage"));
            if (successMessage.isDisplayed()) {
                System.out.println("Đăng ký thành công!");
            } else {
                System.out.println("Đăng ký thất bại!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng trình duyệt
            driver.quit();
        }
    }
}

