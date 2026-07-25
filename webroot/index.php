<?php
$php_version = phpversion();
$server = $_SERVER['SERVER_SOFTWARE'] ?? 'Nginx';
$hostname = gethostname();
$date = date("Y-m-d H:i:s");
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>ArixByte Web Hosting</title>

<style>
* {
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Inter,Arial,sans-serif;
}

body {
    min-height:100vh;
    background:
    radial-gradient(circle at top,#2563eb55,transparent 40%),
    #020617;
    color:white;
    display:flex;
    justify-content:center;
    align-items:center;
}

.container {
    width:90%;
    max-width:900px;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(15px);
    border-radius:25px;
    padding:50px;
    box-shadow:0 0 50px #000;
    text-align:center;
}

.logo {
    font-size:45px;
    font-weight:800;
    color:#60a5fa;
}

.subtitle {
    margin-top:10px;
    color:#cbd5e1;
    font-size:18px;
}

.status {
    margin:35px 0;
    padding:20px;
    background:#16a34a22;
    border:1px solid #22c55e;
    border-radius:15px;
    color:#86efac;
    font-size:20px;
}

.cards {
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(200px,1fr));
    gap:20px;
    margin-top:30px;
}

.card {
    background:#ffffff10;
    padding:25px;
    border-radius:15px;
}

.card h3 {
    color:#93c5fd;
    margin-bottom:10px;
}

.buttons {
    margin-top:35px;
}

.btn {
    display:inline-block;
    padding:14px 25px;
    margin:8px;
    border-radius:10px;
    text-decoration:none;
    color:white;
    background:#2563eb;
    transition:.3s;
}

.btn:hover {
    background:#1d4ed8;
}

.footer {
    margin-top:35px;
    color:#94a3b8;
    font-size:14px;
}

</style>

</head>

<body>

<div class="container">

<div class="logo">
🚀 ArixByte
</div>

<div class="subtitle">
Premium Web Hosting Infrastructure
</div>


<div class="status">
✓ Your website server is online
</div>


<div class="cards">

<div class="card">
<h3>PHP Version</h3>
<p><?= $php_version ?></p>
</div>


<div class="card">
<h3>Server</h3>
<p><?= $server ?></p>
</div>


<div class="card">
<h3>Hostname</h3>
<p><?= $hostname ?></p>
</div>


<div class="card">
<h3>Deployed</h3>
<p><?= $date ?></p>
</div>

</div>


<div class="buttons">

<a class="btn" href="https://arixbyte.com">
Website
</a>

<a class="btn" href="https://discord.gg/">
Discord
</a>

<a class="btn" href="#">
Documentation
</a>

</div>


<div class="footer">

Powered by <b>ArixByte</b><br>
Your application is ready. Upload your files to the webroot folder.

</div>


</div>

</body>
</html>
