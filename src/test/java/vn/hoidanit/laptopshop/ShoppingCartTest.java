package vn.hoidanit.laptopshop;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;
import java.time.Duration;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
public class ShoppingCartTest {
    public static void main(String[] args) throws InterruptedException {
        // Đặt đường dẫn đến Edge WebDriver
        System.setProperty("webdriver.edge.driver", "C:\\Users\\sonb1\\JavaSpring\\java-springMVC\\edgedriver_win64 (1)\\msedgedriver.exe");

        // Khởi tạo trình duyệt Edge
        WebDriver driver = new EdgeDriver();
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        driver.manage().window().maximize();

        // Mở trang web
        driver.get("http://localhost:8080/");

        // Kiểm tra nếu đã đăng nhập hay chưa bằng cách tìm nút đăng nhập
        if(driver.findElements(By.xpath("//a[contains(@class, 'a-login')]")).size() > 0) {
            driver.findElement(By.xpath("//a[contains(@class, 'a-login')]")).click();
            // Tìm ô nhập Email bằng name="username"
            WebElement emailField = driver.findElement(By.name("username"));
            emailField.sendKeys("sonb181223@gmail.com");

            // Tìm ô nhập Password bằng name="password"
            WebElement passwordField = driver.findElement(By.name("password"));
            passwordField.sendKeys("123456");

            // Tìm và nhấn nút Login (giả sử nút có class="btn btn-primary btn-block")
            WebElement loginButton = driver.findElement(By.cssSelector(".btn.btn-primary.btn-block"));
            loginButton.click();

            Thread.sleep(2000); // Chờ đăng nhập hoàn tất
        }
        try {
            // Mở trang danh sách sản phẩm
            driver.get("http://localhost:8080/products");
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));

            // Tìm và click vào sản phẩm đầu tiên
            WebElement product = driver.findElement(By.xpath("//div[contains(@class, 'fruite-item')][1]//a"));
            product.click();

            // Click vào nút 'Thêm vào giỏ hàng'
            WebElement addToCartButton = driver.findElement(By.xpath("//button[contains(text(), 'Add to cart')]"));
            addToCartButton.click();

            Thread.sleep(2000); // Chờ để giỏ hàng cập nhật

            // Chuyển đến giỏ hàng
            driver.get("http://localhost:8080/cart");

            // Chờ phần tử giỏ hàng xuất hiện
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
            WebElement cartItem = wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".cart-item")));

            if (cartItem.isDisplayed()) {
                System.out.println("Thêm sản phẩm vào giỏ hàng thành công!");
            } else {
                System.out.println("Thêm sản phẩm vào giỏ hàng thất bại!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng trình duyệt
            driver.quit();
        }
    }
}

