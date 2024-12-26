document.getElementById('registrationForm').addEventListener('submit', async function(e) {
    e.preventDefault();
    const data = {
        firstName: document.getElementById('firstName').value,
        lastName: document.getElementById('lastName').value,
        mobileNumber: document.getElementById('mobileNumber').value,
        password: document.getElementById('password').value
    };
    const response = await fetch('http://localhost/EQUIP9/api.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    });
    const result = await response.json();
    alert(result.message);
});
