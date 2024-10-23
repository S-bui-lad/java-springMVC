package vn.hoidanit.laptopshop.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import vn.hoidanit.laptopshop.service.StatisticsService;

import java.util.ArrayList;
import java.util.List;

@Controller
public class StatisticsController {

    @Autowired
    private StatisticsService statisticsService;

    @GetMapping("/admin/product-sales")
    public String getProductSales(Model model) {
        // Lấy dữ liệu thống kê từ service
        List<Object[]> statistics = statisticsService.getSalesStatistics();

        // Tạo danh sách tên sản phẩm và số lượng đã bán
        List<String> productNames = new ArrayList<>();
        List<Long> quantitiesSold = new ArrayList<>();

        for (Object[] stat : statistics) {
            productNames.add((String) stat[0]);  // Tên sản phẩm
            quantitiesSold.add((Long) stat[1]);  // Số lượng đã bán
        }

        // Sử dụng ObjectMapper để chuyển đổi danh sách thành JSON
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String productNamesJson = objectMapper.writeValueAsString(productNames);
            String quantitiesSoldJson = objectMapper.writeValueAsString(quantitiesSold);

            // Đưa dữ liệu JSON vào model
            model.addAttribute("productNamesJson", productNamesJson);
            model.addAttribute("quantitiesSoldJson", quantitiesSoldJson);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "admin/barchart/statistics";  // Tên của trang JSP
    }
}
