document.addEventListener("DOMContentLoaded", function () {
    var form = document.getElementById("studentForm");
    if (!form) {
        return;
    }

    form.addEventListener("submit", function (event) {
        var email = form.email.value.trim();
        var phone = form.phone.value.trim();
        var usn = form.usn.value.trim();
        var name = form.name.value.trim();
        var dob = form.dateOfBirth.value.trim();
        var branch = form.branch.value.trim();

        var emailRegex = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/;
        var phoneRegex = /^\d{10}$/;

        if (!usn || !name || !dob || !email || !phone || !branch) {
            event.preventDefault();
            alert("All fields are required.");
            return;
        }

        if (!emailRegex.test(email)) {
            event.preventDefault();
            alert("Please enter a valid email address.");
            return;
        }

        if (!phoneRegex.test(phone)) {
            event.preventDefault();
            alert("Phone number must be exactly 10 digits.");
        }
    });
});
