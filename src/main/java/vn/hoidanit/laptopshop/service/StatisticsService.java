package vn.hoidanit.laptopshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;

import java.util.List;

@Service
public class StatisticsService {
    @Autowired
    private OrderDetailRepository orderDetailRepository;

    public List<Object[]> getSalesStatistics(){
        return orderDetailRepository.getProductSalesStatistics();
    }

}
