<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container mt-5">
    <h1 class="mt-4">Manager Bar Chart</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
        <li class="breadcrumb-item">Bar Chart</li>
    </ol>

    <!-- Responsive Canvas -->
    <div class="row justify-content-center">
        <div class="col-md-8">
            <canvas id="salesChart"></canvas>
        </div>
    </div>
</div>

<!-- Script to load chart -->
<script>
    // Dữ liệu được truyền từ controller dưới dạng JSON
    var productNames = ${productNamesJson};
    var quantitiesSold = ${quantitiesSoldJson};

    var ctx = document.getElementById('salesChart').getContext('2d');
    var chart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: productNames,  // Tên sản phẩm
            datasets: [{
                label: 'Quantity Sold',
                data: quantitiesSold,  // Số lượng đã bán
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
