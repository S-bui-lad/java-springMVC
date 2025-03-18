package vn.hoidanit.laptopshop;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.time.Duration;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class PaymentTest {
    public static void main(String[] args) throws InterruptedException {
        System.setProperty("webdriver.edge.driver", "C:\\Users\\sonb1\\JavaSpring\\java-springMVC\\edgedriver_win64 (1)\\msedgedriver.exe");
        WebDriver driver = new EdgeDriver();
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
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
            driver.get("http://localhost:8080/");

            // Điều hướng đến giỏ hàng
            driver.findElement(By.cssSelector("a[href='/cart']")).click();

            List<WebElement> cartItems = driver.findElements(By.xpath("//tbody/tr/th[@scope='row']"));
            if (cartItems.isEmpty()) {
                System.out.println("Giỏ hàng trống, tiến hành thêm sản phẩm.");
                driver.get("http://localhost:8080/products");
                driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));

                // Tìm và click vào sản phẩm đầu tiên
                WebElement product = driver.findElement(By.xpath("//div[contains(@class, 'fruite-item')][1]//a"));
                product.click();

                // Click vào nút 'Thêm vào giỏ hàng'
                WebElement addToCartButton = driver.findElement(By.xpath("//button[contains(text(), 'Add to cart')]"));
                addToCartButton.click();

                Thread.sleep(2000); // Chờ để giỏ hàng cập nhật

                // Quay lại giỏ hàng
                driver.findElement(By.cssSelector("a[href='/cart']")).click();
            }
            // Nhấn nút xác nhận thanh toán
            WebElement checkoutButton = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//button[contains(text(), 'Xác nhận thanh toán')]")));
            checkoutButton.click();

            // Chờ trang thanh toán tải xong
            wait.until(ExpectedConditions.urlContains("http://localhost:8080/checkout"));

            // Điền thông tin giao hàng
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.name("receiverName"))).sendKeys("Nguyen Van A");
            driver.findElement(By.name("receiverAddress")).sendKeys("123 Đường ABC, Quận 1, TP.HCM");
            driver.findElement(By.name("receiverPhone")).sendKeys("0123456789");

            WebElement checkoutButton1 = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//button[contains(text(), 'Xác nhận thanh toán')]")));
            checkoutButton1.click();

            System.out.println("Thanh toán thành công.");
        } catch (Exception e) {
            System.out.println("Đã xảy ra lỗi: " + e.getMessage());
        } finally {
            driver.quit();
        }
    }
}

