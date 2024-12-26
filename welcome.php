<?php
// Sanitize and set default values for firstName and lastName
$firstName = htmlspecialchars($_GET['firstName'] ?? 'User');
$lastName = htmlspecialchars($_GET['lastName'] ?? '');

// Set your timezone
date_default_timezone_set('Asia/Kolkata');

// Get current hour
$hour = date('H');

// Determine greeting
$greeting = 'Good Morning';
if ($hour >= 12 && $hour < 18) {
    $greeting = 'Good Afternoon';
} elseif ($hour >= 18) {
    $greeting = 'Good Evening';
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .form-container {
            text-align: center;
            padding: 20px;
        }
        .logout-button {
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 10px 15px;
            background-color: #ff4b5c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }
        .logout-button:hover {
            background-color: #ff1f3c;
        }
    </style>
</head>
<body>
    <button class="logout-button" onclick="logout()">Logout</button>
    <div class="form-container">
        <h2><?php echo "$greeting, $firstName $lastName"; ?></h2>
    </div>
    <script>
        function logout() {
            alert('You have been logged out.');
            window.location.href = 'login.html';
        }
    </script>
</body>
</html>
