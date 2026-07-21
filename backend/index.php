<?php
// Fetching the credentials you defined in your compose.yaml
$host = getenv('DB_HOST');
$user = getenv('DB_USER');
$pass = getenv('DB_PASSWORD');
$db   = getenv('DB_DATABASE');

// Create the connection
$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

echo "<h1>Success!</h1>";
echo "<p>Connected to database: <strong>" . $db . "</strong></p>";

$conn->close();
?>
