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
    <title>Create User </title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({"display": "block"});
            });
        });
    </script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Manage Users</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active"><a href="/admin/user">User</a></li>
                    <li class="breadcrumb-item active">Create Users</li>
                </ol>
                <div class="mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h3>Create a user</h3>
                            <hr/>
                            <form:form method="post" id="userForm" action="/admin/user/create"
                                       modelAttribute="newUser" class="row" enctype="multipart/form-data">
                                <div class="mb-3 col-12 col-md-6">
                                    <c:set var="errorEmail">
                                        <form:errors path="email" cssClass="invalid-feedback" />
                                    </c:set>
                                    <label class="form-label">Email:</label>
                                   <form:input type="email" id="email" class="form-control ${not empty errorEmail ? 'is-invalid' : ''}" path="email"/>
                                   <div class="invalid-feedback" id="emailError">
                                       <form:errors path="email"/>
                                   </div>

                                </div>
                                <div class="mb-3 col-12 col-md-6">
                                    <c:set var="errorPassword">
                                        <form:errors path="password" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Password:</label>
                                    <form:input type="password"
                                                class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                path="password"/>
                                        ${errorPassword}
                                </div>
                                <div class="mb-3 col-12 col-md-6">
                                    <c:set var="errorPhone">
                                        <form:errors path="phone" cssClass="invalid-feedback"/>
                                    </c:set>

                                    <label class="form-label">Phone number:</label>
                                    <form:input type="text" class="form-control ${not empty errorPhone ? 'is-invalid' : ''}" pattern="^(0|\+84)[3-9][0-9]{8}$" path="phone"/>
                                    ${errorPhone}
                                </div>
                                <div class="mb-3 col-12 col-md-6">
                                    <c:set var="errorFullName">
                                        <form:errors path="fullName" cssClass="invalid-feedback"/>
                                    </c:set>

                                    <label class="form-label">Full Name:</label>
                                   <form:input type="text" class="form-control ${not empty errorFullName ? 'is-invalid' : ''}"
                                              path="fullName"
                                              pattern="^[a-zA-ZÀ-ỹ ]+$"
                                              title="Full Name must contain only letters and spaces, max 50 characters"
                                              oninput="validateFullName(this)" required="required"/>
                                   <span id="fullNameError" class="text-danger">${errorFullName}</span>
                                </div>
                                <div class="mb-3 col-12">
                                    <label class="form-label">Address:</label>
                                    <form:input type="text" class="form-control" path="address" required="required"/>
                                </div>

                                <div class="mb-3 col-12 col-md-6">
                                    <label class="form-label">Role:</label>
                                    <form:select class="form-select" path="role.name">
                                        <form:option value="ADMIN">ADMIN</form:option>
                                        <form:option value="USER">USER</form:option>
                                    </form:select>
                                </div>
                                <div class="mb-3 col-12 col-md-6">
                                    <label for="avatarFile" class="form-label">Avatar:</label>
                                    <input class="form-control" type="file" id="avatarFile"
                                           accept=".png, .jpg, .jpeg" name="uploadFile"/>
                                </div>
                                <div class="col-12 mb-3">
                                    <img style="max-height: 250px; display: none;" alt="avatar preview"
                                         id="avatarPreview"/>
                                </div>
                                <div class="col-12 mb-5">
                                     <button type="submit" class="btn btn-primary" id="submitButton">Create</button>
                                </div>
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
<script>
document.getElementById("email").addEventListener("blur", function() {
    let email = this.value.trim();
    let emailError = document.getElementById("emailError");

    if (!email.match(/^[A-Za-z0-9+_.-]+@(.+)$/)) {
        emailError.textContent = "Email không hợp lệ";
        this.classList.add("is-invalid");
        return;
    }

    fetch("/check-email?email=" + encodeURIComponent(email))
        .then(response => response.json())
        .then(data => {
            if (data.exists) {
                emailError.textContent = "Email đã tồn tại";
                this.classList.add("is-invalid");
                this.dataset.invalid = "true"; // Đánh dấu email không hợp lệ
            } else {
                emailError.textContent = "";
                this.classList.remove("is-invalid");
                this.dataset.invalid = "false"; // Đánh dấu email hợp lệ
            }
        })
        .catch(error => console.error("Lỗi:", error));
});

// Chặn submit nếu email bị trùng
document.getElementById("userForm").addEventListener("submit", function(event) {
    const emailInput = document.getElementById("email");

    if (emailInput.dataset.invalid === "true") {
        event.preventDefault(); // Chặn submit

    }
});
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>

<script src="/js/scripts.js"></script>

</body>

</html>