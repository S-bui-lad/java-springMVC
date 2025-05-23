<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Register - Laptopshop</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-4">Create Account</h3>
                            </div>
                            <div class="card-body">
                                <form:form method="post" action="/register" modelAttribute="registerUser"
                                           >
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input class="form-control" type="text" path="firstName"
                                                            id="inputFirstName" placeholder="Enter your first name"/>
                                                <label for="inputFirstName">First name</label>
                                                <span class="invalid-feedback d-inline-block"
                                                      id="errorFirstName"></span>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <form:input class="form-control" type="text" path="lastName"
                                                            id="inputLastName" placeholder="Enter your last name"/>
                                                <label for="inputLastName">Last name</label>
                                                <span class="invalid-feedback d-inline-block"
                                                      id="errorLastName"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <form:input class="form-control" type="email" path="email" id="inputEmail"
                                                    placeholder="name@example.com"/>
                                        <label>Email address</label>
                                        <span class="invalid-feedback d-inline-block" id="errorEmail"></span>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input class="form-control" type="password" path="password"
                                                            id="inputPassword" placeholder="Create a password"/>
                                                <label>Password</label>
                                                <span class="invalid-feedback d-inline-block" id="errorPassword"></span>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input class="form-control" type="password" path="confirmPassword"
                                                            id="inputConfirmPassword" placeholder="Confirm password"/>
                                                <label>Confirm Password</label>
                                                <span class="invalid-feedback d-inline-block"
                                                      id="errorConfirmPassword"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mt-4 mb-0">
                                        <div class="d-grid">
                                            <button type="submit" class="btn btn-primary btn-block">Create Account
                                            </button>
                                        </div>
                                    </div>
                                </form:form>

                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small"><a href="/login">Have an account? Go to login</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
</body>

</html>