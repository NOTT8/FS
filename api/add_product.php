<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, ngrok-skip-browser-warning");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') { exit; }

require 'db.php';
$data = json_decode(file_get_contents("php://input"));

if($data) {
    $name = $conn->real_escape_string($data->name);
    $price = $conn->real_escape_string($data->price);
    $qty = $conn->real_escape_string($data->qty);
    $image = $conn->real_escape_string($data->image);
    // ✅ รับค่ารายละเอียด
    $description = isset($data->description) ? $conn->real_escape_string($data->description) : "";

    // ✅ เพิ่มคอลัมน์ description ในคำสั่ง INSERT
    $sql = "INSERT INTO products (name, description, price, qty, image) 
            VALUES ('$name', '$description', '$price', '$qty', '$image')";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["status" => "success"]);
    } else {
        echo json_encode(["status" => "error", "message" => $conn->error]);
    }
}
$conn->close();
?>