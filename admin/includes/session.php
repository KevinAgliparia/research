<?php
session_start();

// Check if user is not logged in
if (!isset($_SESSION['admin_id'])) {
    header("Location: auth/login.php");
    exit();
}
?> 