/*!
    * Start Bootstrap - SB Admin v7.0.7 (https://startbootstrap.com/template/sb-admin)
    * Copyright 2013-2023 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
    */
//
// Scripts
//

window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});

document.addEventListener("DOMContentLoaded", function () {
    document.querySelector("form").addEventListener("submit", validateForm);
});

async function validateForm(event) {
    event.preventDefault();
    let isValid = true;

    let firstName = document.getElementById("inputFirstName").value.trim();
    let lastName = document.getElementById("inputLastName").value.trim();
    let email = document.getElementById("inputEmail").value.trim();
    let password = document.getElementById("inputPassword").value.trim();
    let confirmPassword = document.getElementById("inputConfirmPassword").value.trim();

    // Reset error messages
    document.getElementById("errorFirstName").textContent = "";
    document.getElementById("errorLastName").textContent = "";
    document.getElementById("errorEmail").textContent = "";
    document.getElementById("errorPassword").textContent = "";
    document.getElementById("errorConfirmPassword").textContent = "";

    const nameRegex = /^[a-zA-Z]+$/;

    // Validate First Name
    if (!nameRegex.test(firstName)) {
        document.getElementById("errorFirstName").textContent = "First Name must contain only letters";
        isValid = false;
    } else if (firstName.length > 50) {
        document.getElementById("errorFirstName").textContent = "First Name must not exceed 50 characters";
        isValid = false;
    }

    // Validate Last Name
    if (!nameRegex.test(lastName)) {
        document.getElementById("errorLastName").textContent = "Last Name must contain only letters";
        isValid = false;
    } else if (lastName.length > 50) {
        document.getElementById("errorLastName").textContent = "Last Name must not exceed 50 characters";
        isValid = false;
    }

    // Validate Email
    let emailRegex = /^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$/;
    if (email === "") {
        document.getElementById("errorEmail").textContent = "Email is required";
        isValid = false;
    } else if (!emailRegex.test(email)) {
        document.getElementById("errorEmail").textContent = "Invalid Email";
        isValid = false;
    } else {
        await checkEmailExists(email).then(emailExists => {
            if (emailExists) {
                document.getElementById("errorEmail").textContent = "Email already exists";
                isValid = false;
            }
        }).catch(error => {
            console.error("Error checking email:", error);
            document.getElementById("errorEmail").textContent = "Error checking email";
            isValid = false;
        });
    }

    // Validate Password Strength
    let passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,50}$/;
    if (!passwordRegex.test(password)) {
        document.getElementById("errorPassword").textContent = "Password must be between 6 - 50 characters, include 1 letter, 1 number & 1 special character";
        isValid = false;
    }

    // Validate Confirm Password
    if (password !== confirmPassword) {
        document.getElementById("errorConfirmPassword").textContent = "Passwords do not match";
        isValid = false;
    }

    if (isValid) {
        event.target.submit();
    }
}

async function checkEmailExists(email) {
    try {
        let response = await fetch(`/check-email?email=${encodeURIComponent(email)}`);
        if (!response.ok) throw new Error("Network response was not ok");

        let data = await response.json();
        return data.exists; // Giả sử API trả về { exists: true/false }
    } catch (error) {
        console.error("Error checking email:", error);
        return false;
    }
}

