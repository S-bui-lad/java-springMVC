package vn.hoidanit.laptopshop;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.support.ui.Select;

import java.util.concurrent.TimeUnit;

public class AdminCreateProduct {
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
            driver.findElement(By.xpath("//a[@href='/admin/product']")).click();
            driver.findElement(By.xpath("//a[contains(text(),'Create a product')]")).click();
            // Nhập thông tin sản phẩm
            driver.findElement(By.name("name")).sendKeys("Laptop Gaming XYZ");
            driver.findElement(By.name("price")).sendKeys("1500");
            driver.findElement(By.name("detailDesc")).sendKeys("Laptop gaming mạnh mẽ với GPU RTX 4060");
            driver.findElement(By.name("shortDesc")).sendKeys("Gaming siêu mạnh");
            driver.findElement(By.name("quantity")).sendKeys("10");

            // Chọn Factory
            Select factorySelect = new Select(driver.findElement(By.name("factory")));
            factorySelect.selectByValue("ASUS");

            // Chọn Target
            Select targetSelect = new Select(driver.findElement(By.name("target")));
            targetSelect.selectByValue("GAMING");

            // Upload ảnh
            WebElement uploadFile = driver.findElement(By.name("uploadFile"));
            uploadFile.sendKeys("C:\\Users\\sonb1\\JavaSpring\\java-springMVC\\src\\main\\webapp\\resources\\images\\product\\1711081080930-asus-03.png");

            // Nhấn nút tạo mới sản phẩm
            driver.findElement(By.xpath("//button[@type='submit']")).click();

            // Kiểm tra xem sản phẩm đã được thêm thành công
            String successMessage = driver.findElement(By.id("success-message")).getText();
            if (successMessage.contains("Thêm sản phẩm thành công")) {
                System.out.println("Test Passed: Sản phẩm đã được tạo thành công");
            } else {
                System.out.println("Test Failed: Không tìm thấy thông báo thành công");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng trình duyệt
            driver.quit();
        }
    }
}
