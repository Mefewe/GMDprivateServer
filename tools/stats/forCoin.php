<?php
//error_reporting(0);
include "../../incl/lib/connection.php";
$starsgain = array();
$time = time() - 86400;
$x = 0;
$query = $db->prepare("SELECT * FROM actions WHERE type = '9' AND timestamp > :time");
$query->execute([':time' => $time]);
$result = $query->fetchAll();
foreach($result as &$gain){
	if(!empty($starsgain[$gain["account"]])){
		$starsgain[$gain["account"]] += $gain["value"];
	}else{
		$starsgain[$gain["account"]] = $gain["value"];
	}
}
arsort($starsgain);
foreach ($starsgain as $userID => $stars){
	$query = $db->prepare("SELECT userName, isBanned FROM users WHERE userID = :userID");
	$query->execute([':userID' => $userID]);
	$userinfo = $query->fetchAll()[0];
	$username = htmlspecialchars($userinfo["userName"], ENT_QUOTES);
	if($userinfo["isBanned"] == 0){
		$x++;
		echo "$x $userID $username $stars<br>";
		
	}
}  
?>