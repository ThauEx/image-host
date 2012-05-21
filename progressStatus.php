<?php
session_start();
$progress_name = ini_get("session.upload_progress.prefix") . "image";

if(isset($_GET['cancel']) && $_GET['cancel'] == "true")
{
    $_SESSION[$progress_name]['cancel_upload'] = true;
 
    return;
}
 
if(isset($_SESSION[$progress_name]))
{
    echo json_encode($_SESSION[$progress_name]);
}
?>