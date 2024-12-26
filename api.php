<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "user_registration";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Database connection failed: " . $conn->connect_error]));
}

header("Content-Type: application/json");

$input = json_decode(file_get_contents("php://input"), true);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check if the action is "register"
    if (!isset($input['action']) || $input['action'] === 'register') {
        // Registration logic
        if (!isset($input['firstName'], $input['lastName'], $input['mobileNumber'], $input['password'])) {
            echo json_encode(["success" => false, "message" => "Missing required fields!"]);
            exit;
        }

        $stmt = $conn->prepare("INSERT INTO registration (first_name, last_name, mobile_number, password_hash) VALUES (?, ?, ?, ?)");
        $passwordHash = password_hash($input['password'], PASSWORD_BCRYPT);
        $stmt->bind_param("ssss", $input['firstName'], $input['lastName'], $input['mobileNumber'], $passwordHash);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "User registered successfully!"]);
        } else {
            echo json_encode(["success" => false, "message" => "Registration failed: " . $stmt->error]);
        }
        exit; // Stop further execution
    }

    // Check if the action is "login"
    if (isset($input['action']) && $input['action'] === 'login') {
        // Login logic
        if (!isset($input['mobileNumber'], $input['password'])) {
            echo json_encode(["success" => false, "message" => "Missing required fields!"]);
            exit;
        }

        $mobileNumber = $input['mobileNumber'];
        $password = $input['password'];

        $stmt = $conn->prepare("SELECT * FROM registration WHERE mobile_number = ?");
        $stmt->bind_param("s", $mobileNumber);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();

        if ($user && password_verify($password, $user['password_hash'])) {
            echo json_encode([
                "success" => true,
                "message" => "Login successful!",
                "firstName" => $user['first_name'],
                "lastName" => $user['last_name']
            ]);
        } else {
            echo json_encode(["success" => false, "message" => "Invalid credentials."]);
        }
        exit; // Stop further execution
    }

    // If no valid action is provided
    echo json_encode(["success" => false, "message" => "Invalid action provided."]);
}
?>
