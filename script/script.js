function validate()
{
	alert()
	let validInput = true;
	const fullName = document.getElementById("fullName").value;
	const email = document.getElementById("email").value;
	const userName = document.getElementById("username").value;
	const password = document.getElementById("password").value;
	const confirmPassword = document.getElementById("confirmPassword").value;

	let nameError = document.getElementById("nameError");
	let mailError = document.getElementById("mailError");
	let usernameError = document.getElementById("userError");
	let passwordError = document.getElementById("passwordError");
	let passwordMatchError = document.getElementById("passwordMatchError");

	nameError.textContent = "";
	mailError.textContent = "";
	usernameError.textContent = "";
	passwordError.textContent = "";
	passwordMatchError.textContent = "";

	if(fullName.trim() === "")
	{
		nameError.textContent = "Name cannot be Empty";
		validInput = false;
	}

	if(email.trim() === "")
	{
		mailError.textContent = "Email cannot be empty";
		validInput = false;
	}
	else if(!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email))
	{
		mailError.textContent = "Invalid mail";
		validInput = false;
	}

	if(userName.trim() === "")
	{
		usernameError.textContent = "Username cannot be empty";
		validInput = false;
	}
	else if(!/^[a-z0-9_.]+$/.test(userName))
	{
		usernameError.textContent = "Invalid Username";
		validInput = false;
	}

	if(password.trim() === "")
	{
		passwordError.textContent = "Password cannot be empty";
		validInput = false;
	}
	else if( password.search(/[a-z]/) < 0)
	{
		passwordError.textContent = "Password should contain Atleast one lowercase";
		validInput = false;
	}
	else if( password.search(/[A-Z]/) < 0)
	{
		passwordError.textContent = "Password should contain Atleast one Uppercase";
		validInput = false;
	}
	else if(password.search(/[0-9]/) < 0)
	{
		passwordError.textContent = "Password should contain Atleast one Digit";
		validInput = false;
	}
	else if(password.length<6)
	{
		passwordError.textContent = "Password should contain Atleast Six characters";
		validInput = false;
	}

	if(password != confirmPassword)
	{
		passwordMatchError.textContent = "Password does'nt match";
		validInput = false;
	}

	return validInput;
}