package vn.hoidanit.laptopshop;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;

import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class AdminCreateUser {

    public static void main(String[] args) {
        // Thiết lập đường dẫn đến EdgeDriver
        System.setProperty("webdriver.edge.driver", "C:\\Users\\sonb1\\JavaSpring\\java-springMVC\\edgedriver_win64 (1)\\msedgedriver.exe");

        // Khởi tạo WebDriver
        WebDriver driver = new EdgeDriver();
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        driver.manage().window().maximize();

        try {
            // Mở trang đăng nhập admin
            driver.get("http://localhost:8080/login");

            WebElement emailField = driver.findElement(By.name("username"));
            emailField.sendKeys("sonb181223@gmail.com");

            // Tìm ô nhập Password bằng name="password"
            WebElement passwordField = driver.findElement(By.name("password"));
            passwordField.sendKeys("123456");

            // Tìm và nhấn nút Login (giả sử nút có class="btn btn-primary btn-block")
            WebElement loginButton = driver.findElement(By.cssSelector(".btn.btn-primary.btn-block"));
            loginButton.click();

            // Điều hướng đến trang quản lý người dùng
            driver.findElement(By.xpath("//a[@href='/admin/user']")).click();
            driver.findElement(By.xpath("//a[contains(text(),'Create a user')]")).click();

            // Nhập thông tin người dùng mới
            driver.findElement(By.name("email")).sendKeys("nguyenvana@example.com");
            driver.findElement(By.name("password")).sendKeys("password123");
            driver.findElement(By.name("phone")).sendKeys("0987654321");
            driver.findElement(By.name("fullName")).sendKeys("Nguyen Van A");
            driver.findElement(By.name("address")).sendKeys("123 ABC Street");

            // Chọn vai trò (ADMIN hoặc USER)
            WebElement roleDropdown = driver.findElement(By.name("role.name"));
            roleDropdown.findElement(By.xpath("//option[@value='USER']")).click();

            // Lưu người dùng mới
            driver.findElement(By.xpath("//button[contains(text(),'Create')]")).click();

            // Kiểm tra kết quả
            WebElement successMessage = driver.findElement(By.className("alert-success"));
            if (successMessage.isDisplayed()) {
                System.out.println("Tạo mới người dùng thành công!");
            } else {
                System.out.println("Tạo mới người dùng thất bại!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng trình duyệt
            driver.quit();
        }
    }
}
