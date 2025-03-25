<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop"/>
    <meta name="author" content="Hỏi Dân IT"/>
    <title>Update User - Hỏi Dân IT</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Manage User</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a> </li>
                    <li class="breadcrumb-item active"><a href="/admin/user">User</a></li>
                    <li class="breadcrumb-item active">Update User</li>

                </ol>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h3>Update user</h3>
                            <hr />
                            <form:form method="post" action="/admin/user/update"
                                       modelAttribute="newUser">

                                <div class="mb-3" style="display: none">
                                    <label class="form-label">Id:</label>
                                    <form:input type="text" class="form-control"
                                                path="id" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Email:</label>
                                    <form:input type="email" class="form-control"
                                                path="email" disabled="true" />
                                </div>
                                <div class="mb-3">
                                    <c:set var="errorPhoneNumber">
                                        <form:errors path="phone" cssClass="invalid-feedback"/>
                                    </c:set>

                                    <label class="form-label">Phone number:</label>
                                    <form:input type="text" class="form-control ${not empty errorPhoneNumber ? 'is-invalid' : ''}" pattern="^(0|\+84)[3-9][0-9]{8}$"
                                                path="phone" required ="required"/>${errorPhoneNumber}
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Full Name:</label>
                                     <form:input type="text" class="form-control ${not empty errorFullName ? 'is-invalid' : ''}"
                                                                                  path="fullName"
                                                                                  pattern="^[a-zA-ZÀ-ỹ ]+$"
                                                                                  title="Full Name must contain only letters and spaces, max 50 characters"
                                                                                  oninput="validateFullName(this)" />
                                                                       <span id="fullNameError" class="text-danger">${errorFullName}</span>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Address:</label>
                                   <form:input type="text" class="form-control" path="address" required="required" />

                                </div>

                                <button
                                        type="submit"
                                        class="btn btn-warning">Update</button>
                            </form:form>
                        </div>

                    </div>

                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script>
function validateFullName(input) {
    const maxLength = 50;
    const errorSpan = document.getElementById("fullNameError");

    if (input.value.length > maxLength) {
        errorSpan.textContent = "Full Name không được vượt quá 50 ký tự.";
    } else {
        errorSpan.textContent = "";
    }
}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
</body>

</html>