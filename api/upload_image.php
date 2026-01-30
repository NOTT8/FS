<?php
// 1. ตั้งค่า CORS ให้ยอมรับทุกอย่าง (สำคัญมากสำหรับ Flutter Web)
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, ngrok-skip-browser-warning");

// 2. ดักจับคำขอตรวจสอบความปลอดภัย (Preflight Options)
// ถ้า Browser ถามมาว่า "ส่งไฟล์ได้ไหม?" ให้ตอบกลับทันทีว่า "ได้" (HTTP 200)
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

header("Content-Type: application/json");

// 3. เริ่มกระบวนการอัปโหลด
$target_dir = "uploads/";

// เช็กว่ามีการส่งรูปมาจริงไหม
if (isset($_FILES['image'])) {
    $file_ext = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
    $new_name = uniqid() . "." . $file_ext;
    $target_file = $target_dir . $new_name;

    // ย้ายไฟล์
    if (move_uploaded_file($_FILES['image']['tmp_name'], $target_file)) {
        // ✅ เปลี่ยน URL นี้ให้เป็น Ngrok ของคุณ ณ ปัจจุบัน
        $server_url = "https://misleading-unexpeditiously-exie.ngrok-free.dev/api/"; 
        
        echo json_encode([
            "status" => "success",
            "url" => $server_url . $target_file
        ]);
    } else {
        echo json_encode([
            "status" => "error",
            "message" => "Upload failed. Check folder permissions."
        ]);
    }
} else {
    // กรณีเปิดลิงก์ผ่าน Browser ตรงๆ จะขึ้นข้อความนี้แทนหน้าจอขาว
    echo json_encode([
        "status" => "active",
        "message" => "Server is ready to receive images."
    ]);
}
?>