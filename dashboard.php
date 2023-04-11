<?php
// Start the session to access the logged in status
session_start();

// Check if the user is logged in
if (!isset($_SESSION['loggedIn']) || !$_SESSION['loggedIn']) {
    // Redirect to the login page
    header('Location: login.php');
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Gaming Dashboard</title>
</head>
<body>
    <h1>Welcome to the Gaming Dashboard!</h1>
    <p>Here are some stats about your gaming activity:</p>
    <ul>
        <li>You've played 10 hours of slot games this week</li>
        <li>Your winning were 10,000EUR</li>
        <li>You won 34 free spins</li>
    </ul>
</body>
</html>
