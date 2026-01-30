<?php
// 1. จัดการ Headers เพื่อแก้ปัญหา CORS และ ngrok
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, ngrok-skip-browser-warning");
header("Content-Type: application/json; charset=UTF-8");

// 2. ตอบกลับ Pre-flight request
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit;
}

// นำไฟล์เชื่อมต่อฐานข้อมูลมาใช้
include 'db.php';

// 3. รับข้อมูล JSON จาก Flutter
$json = file_get_contents('php://input');
$data = json_decode($json, true);

$email = $data['email'] ?? '';
$password = $data['password'] ?? '';

if (!empty($email) && !empty($password)) {
    // 4. ใช้ Prepared Statement เพื่อความปลอดภัย
    $stmt = $conn->prepare("SELECT * FROM users WHERE email = ? AND password = ?");
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result && $result->num_rows > 0) {
        // ดึงข้อมูลแถวที่พบ (เพื่อเอาค่า role)
        $user = $result->fetch_assoc();
        
        // ✅ แก้ไข: ส่ง status พร้อมกับ role กลับไป
        echo json_encode([
            "status" => "success",
            "role" => $user['role'] // ระบบจะส่งคำว่า 'admin' หรือ 'user' ตามใน DB
        ]);
    } else {
        echo json_encode([
            "status" => "fail", 
            "message" => "อีเมลหรือรหัสผ่านไม่ถูกต้อง"
        ]);
    }
    $stmt->close();
} else {
    echo json_encode([
        "status" => "error", 
        "message" => "กรุณากรอกข้อมูลให้ครบ"
    ]);
}

$conn->close();
?>