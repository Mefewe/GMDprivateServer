<?php
include "lib/connection.php";
$usr = $db->query("SELECT COUNT(*) FROM users WHERE isRegistered = 1");
$acc = $db->query("SELECT COUNT(*) FROM accounts");

$users = $usr->fetchColumn();
$accounts = $acc->fetchColumn();

$gays = $accounts - $users;
if($gays > 260)
{
  
exit("fdfd");
die();


}



?>