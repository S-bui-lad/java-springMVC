package vn.hoidanit.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.OrderDetail;

import java.util.List;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    @Query("SELECT p.name, SUM(od.quantity) " +
            "FROM OrderDetail od " +
            "JOIN od.product p " +
            "GROUP BY p.name")
    List<Object[]> getProductSalesStatistics();

}

