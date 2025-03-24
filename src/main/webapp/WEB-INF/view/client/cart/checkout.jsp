<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title> Đặt hàng - Laptopshop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Cart Page Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <div class="mb-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Thông tin đặt hàng</li>
                                    </ol>
                                </nav>
                            </div>

                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Sản phẩm</th>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Giá cả</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Thành tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${ empty cartDetails}">
                                            <tr>
                                                <td colspan="6">
                                                    Không có sản phẩm trong giỏ hàng
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="cartDetail" items="${cartDetails}">

                                            <tr>
                                                <th scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <img src="/images/product/${cartDetail.product.image}"
                                                            class="img-fluid me-5 rounded-circle"
                                                            style="width: 80px; height: 80px;" alt="">
                                                    </div>
                                                </th>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <a href="/product/${cartDetail.product.id}" target="_blank">
                                                            ${cartDetail.product.name}
                                                        </a>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <fmt:formatNumber type="number" value="${cartDetail.price}" /> đ
                                                    </p>
                                                </td>
                                                <td>
                                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                                        <input type="text"
                                                            class="form-control form-control-sm text-center border-0"
                                                            value="${cartDetail.quantity}">
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                        <fmt:formatNumber type="number"
                                                            value="${cartDetail.price * cartDetail.quantity}" /> đ
                                                    </p>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <c:if test="${not empty cartDetails}">
                                <form:form action="/place-order" method="post" modelAttribute="cart">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="mt-5 row g-4 justify-content-start">
                                        <div class="col-12 col-md-6">
                                            <div class="p-4 ">
                                                <h5>Thông Tin Người Nhận
                                                </h5>
                                                <div class="row">
                                                        <div class="col-12 form-group mb-3">
                                                            <label>Tên người nhận</label>
                                                            <input class="form-control" name="receiverName" id="receiverName" required oninput="validateName()" />
                                                            <small id="nameError" style="color: red; display: none;">Tên không hợp lệ! Chỉ được chứa chữ cái và khoảng trắng không quá 50 ký tự.</small>
                                                        </div>
                                                    <div class="col-12 form-group mb-3">
                                                        <label>Địa chỉ</label>
                                                        <input class="form-control" name="receiverAddress" id="receiverAddress" required oninput="validateForm()" />
                                                        <small id="addressError" style="color: red; display: none;"></small>
                                                    </div>

                                                    <div class="col-12 form-group mb-3">
                                                        <label>Số điện thoại</label>
                                                        <input class="form-control" name="receiverPhone" id="receiverPhone" required oninput="validateForm()" />
                                                        <small id="phoneError" style="color: red; display: none;">Số điện thoại không hợp lệ!</small>
                                                    </div>
                                                    <div class="mt-4">
                                                        <i class="fas fa-arrow-left"></i>
                                                        <a href="/cart">Quay lại giỏ hàng</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <div class="bg-light rounded">
                                                <div class="p-4">
                                                    <h1 class="display-6 mb-4">Thông Tin <span class="fw-normal">Đặt
                                                            Hàng</span>
                                                    </h1>

                                                    <div class="d-flex justify-content-between">
                                                        <h5 class="mb-0 me-4">Phí vận chuyển</h5>
                                                        <div class="">
                                                            <p class="mb-0">0 đ</p>
                                                        </div>
                                                    </div>
                                                    <div class="mt-3 d-flex justify-content-between">
                                                        <h5 class="mb-0 me-4">Hình thức</h5>
                                                        <div class="">
                                                            <p class="mb-0">Thanh toán khi nhận hàng (COD)</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div
                                                    class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                    <h5 class="mb-0 ps-4 me-4">Tổng số tiền</h5>
                                                    <p class="mb-0 pe-4" data-cart-total-price="${totalPrice}">
                                                        <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                    </p>
                                                </div>

                                                <button id="confirmOrderBtn" disabled
                                                        class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4">
                                                    Xác nhận đặt hàng
                                                </button>

                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                            </c:if>

                        </div>
                    </div>
                    <!-- Cart Page End -->


                    <jsp:include page="../layout/footer.jsp" />


                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
                    <script>
                        function validateForm() {
                            let nameInput = document.getElementById("receiverName");
                            let nameError = document.getElementById("nameError");
                            let phoneInput = document.getElementById("receiverPhone");
                            let phoneError = document.getElementById("phoneError");
                            let addressInput = document.getElementById("receiverAddress");
                            let addressError = document.getElementById("addressError");
                            let confirmBtn = document.getElementById("confirmOrderBtn");

                            if (!nameInput || !nameError || !phoneInput || !phoneError || !addressInput || !addressError || !confirmBtn) return;

                            let nameRegex = /^[a-zA-ZÀ-Ỹà-ỹ\s]+$/; // Chỉ cho phép chữ cái và khoảng trắng
                            let phoneRegex = /^(0|\+84)[3-9][0-9]{8}$/; // Kiểm tra số điện thoại Việt Nam

                            let nameValue = nameInput.value.trim();
                            let phoneValue = phoneInput.value.trim();
                            let addressValue = addressInput.value.trim();

                            let isNameValid = nameValue !== "" && nameRegex.test(nameValue) && nameValue.length <= 50;
                            let isPhoneValid = phoneValue !== "" && phoneRegex.test(phoneValue);
                            let isAddressValid = addressValue !== ""; // Chỉ cần kiểm tra không được bỏ trống

                            // Kiểm tra tên
                            if (!isNameValid) {
                                nameError.style.display = "block";
                                if (nameValue === "") {
                                    nameError.innerText = "Vui lòng nhập tên người nhận!";
                                } else if (nameValue.length > 50) {
                                    nameError.innerText = "Tên không được dài quá 50 ký tự.";
                                } else {
                                    nameError.innerText = "Tên không hợp lệ! Chỉ được chứa chữ cái và khoảng trắng.";
                                }
                                nameInput.classList.add("is-invalid");
                            } else {
                                nameError.style.display = "none";
                                nameInput.classList.remove("is-invalid");
                            }

                            // Kiểm tra số điện thoại
                            if (!isPhoneValid) {
                                phoneError.style.display = "block";
                                phoneError.innerText = phoneValue === ""
                                    ? "Vui lòng nhập số điện thoại!"
                                    : "Số điện thoại không hợp lệ!";
                                phoneInput.classList.add("is-invalid");
                            } else {
                                phoneError.style.display = "none";
                                phoneInput.classList.remove("is-invalid");
                            }

                            // Kiểm tra địa chỉ
                            if (!isAddressValid) {
                                addressError.style.display = "block";
                                addressError.innerText = "Vui lòng nhập địa chỉ!";
                                addressInput.classList.add("is-invalid");
                            } else {
                                addressError.style.display = "none";
                                addressInput.classList.remove("is-invalid");
                            }

                            // Bật/tắt nút xác nhận
                            confirmBtn.disabled = !(isNameValid && isPhoneValid && isAddressValid);
                        }

                        // Kiểm tra khi submit form
                        document.addEventListener("DOMContentLoaded", function () {
                            let form = document.querySelector("form");
                            if (form) {
                                form.addEventListener("submit", function (event) {
                                    validateForm();
                                    if (document.getElementById("confirmOrderBtn").disabled) {
                                        event.preventDefault(); // Ngăn không cho submit form nếu lỗi
                                    }
                                });
                            }
                        });
                    </script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>