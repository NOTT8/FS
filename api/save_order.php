<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, ngrok-skip-browser-warning");
include 'db.php'; 

$json = file_get_contents('php://input');
$data = json_decode($json, true);

if (!empty($data['product_name'])) {
    $name = mysqli_real_escape_string($conn, $data['product_name']);
    $qty = (int)$data['qty'];
    $total = (float)$data['total_price'];
    
    // ✅ เพิ่มการรับค่า payment_method และป้องกัน SQL Injection
    // หากไม่มีค่าส่งมา ให้บันทึกเป็น 'ไม่ได้ระบุ'
    $payment = isset($data['payment_method']) ? mysqli_real_escape_string($conn, $data['payment_method']) : 'ไม่ได้ระบุ';

    // ✅ อัปเดตคำสั่ง SQL เพิ่มคอลัมน์ payment_method
    $sql = "INSERT INTO orders (product_name, qty, total_price, payment_method) 
            VALUES ('$name', $qty, $total, '$payment')";
    
    if(mysqli_query($conn, $sql)) {
        echo json_encode(["status" => "success"]);
    } else {
        echo json_encode(["status" => "error", "message" => mysqli_error($conn)]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "ข้อมูลไม่ครบถ้วน"]);
}
?>