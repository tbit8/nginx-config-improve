<?php
// Define the hardcoded username and password
$username = 'test@test.com';
$password = 'testing';

// Initialize the error message variable
$error = '';

// Check if the form has been submitted
if (isset($_POST['submit'])) {
    // Get the submitted username and password
    $submittedUsername = $_POST['username'];
    $submittedPassword = $_POST['password'];

    // Validate the username and password
    if ($submittedUsername === $username && $submittedPassword === $password) {
        // Redirect to the dashboard page
        header('Location: dashboard.php');
        exit();
    } else {
        // Display an error message
        $error = 'Invalid username or password';
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
    <h1>Login</h1>
    <?php if ($error !== '') { ?>
        <p style="color: red;"><?php echo $error; ?></p>
    <?php } ?>
    <form method="POST">
        <label>Username:</label>
        <input type="text" name="username" required><br><br>
        <label>Password:</label>
        <input type="password" name="password" required><br><br>
        <button type="submit" name="submit">Login</button>
    </form>
</body>
</html>