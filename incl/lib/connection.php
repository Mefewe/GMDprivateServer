<?php
//error_reporting(0);
include dirname(__FILE__)."/../../config/connection.php";
@header('Content-Type: text/html; charset=utf-8');
if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
	$ms = $_SERVER['HTTP_CLIENT_IP'];
} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
	$ms = $_SERVER['HTTP_X_FORWARDED_FOR'];
} else {
	$ms = $_SERVER['REMOTE_ADDR'];
}
$mysqli = new mysqli($servername, $username, $password, $dbname);
try {
    $db = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password, array(
    PDO::ATTR_PERSISTENT => true
));
    // set the PDO error mode to exception
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $ban = $db->prepare("SELECT count(DISTINCT IP) FROM bannedips WHERE IP = :ip");
    $ban->execute([':ip' => $ms]);
    $count = $ban->fetchColumn();
    if($count > 0)
    {
   echo "Вы забанены по IP!You banned IP!";
   exit('403');
    }
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }
?>