package vn.hoidanit.laptopshop;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class FilterProductsTest {
    public static void main(String[] args) {
        System.setProperty("webdriver.edge.driver", "C:\\Users\\sonb1\\JavaSpring\\java-springMVC\\edgedriver_win64 (1)\\msedgedriver.exe");
        WebDriver driver = new EdgeDriver();

        try {
            driver.get("http://localhost:8080/products");
            driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);

            // Chọn hãng Dell theo value
            WebElement dellCheckbox = driver.findElement(By.cssSelector("input.form-check-input[value='DELL']"));
            if (!dellCheckbox.isSelected()) {
                dellCheckbox.click();
            }

            // Chọn mục đích Gaming theo value
            WebElement gamingCheckbox = driver.findElement(By.cssSelector("input.form-check-input[value='GAMING']"));
            if (!gamingCheckbox.isSelected()) {
                gamingCheckbox.click();
            }

            // Chọn giá từ 10 - 15 triệu theo value
            WebElement priceCheckbox1 = driver.findElement(By.cssSelector("input.form-check-input[value='10-15-trieu']"));
            if (!priceCheckbox1.isSelected()) {
                priceCheckbox1.click();
            }

            // Chọn giá từ 15 - 20 triệu theo value
            WebElement priceCheckbox2 = driver.findElement(By.cssSelector("input.form-check-input[value='15-20-trieu']"));
            if (!priceCheckbox2.isSelected()) {
                priceCheckbox2.click();
            }

            // Chọn sắp xếp giá tăng dần theo value
            WebElement sortPrice = driver.findElement(By.cssSelector("input.form-check-input[value='gia-tang-dan']"));
            if (!sortPrice.isSelected()) {
                sortPrice.click();
            }

            // Nhấn nút "Lọc Sản Phẩm"
            WebElement filterButton = driver.findElement(By.id("btnFilter"));
            filterButton.click();

            TimeUnit.SECONDS.sleep(3);

            // Lấy danh sách sản phẩm sau khi lọc
            List<WebElement> products = driver.findElements(By.cssSelector(".product-item"));

            // In kết quả ra console
            System.out.println("Danh sách sản phẩm lọc được:");
            for (WebElement product : products) {
                System.out.println(product.getText());
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }
}

