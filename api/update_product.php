<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, ngrok-skip-browser-warning");
header("Content-Type: application/json; charset=UTF-8");

// ตอบกลับ OPTIONS request ทันที (แก้ปัญหา Preflight ของ Browser)
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') { 
    http_response_code(200);
    exit; 
} 

require 'db.php';

// อ่านข้อมูล JSON ที่ส่งมาจาก Flutter
$json = file_get_contents("php://input");
$data = json_decode($json);

if($data && isset($data->id)) {
    $id = $conn->real_escape_string($data->id);
    $name = $conn->real_escape_string($data->name);
    $price = $conn->real_escape_string($data->price);
    $qty = $conn->real_escape_string($data->qty);
    $image = $conn->real_escape_string($data->image);
    
    // รับค่า description (ถ้าไม่มีให้เป็นค่าว่าง)
    $description = isset($data->description) ? $conn->real_escape_string($data->description) : "";

    // UPDATE ข้อมูลรวมถึงคอลัมน์ description
    $sql = "UPDATE products SET 
            name='$name', 
            description='$description', 
            price='$price', 
            qty='$qty', 
            image='$image' 
            WHERE id='$id'";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["status" => "success"]);
    } else {
        echo json_encode(["status" => "error", "message" => $conn->error]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid Data or ID missing"]);
}

$conn->close();
?>