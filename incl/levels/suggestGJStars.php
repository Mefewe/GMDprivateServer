<?php
//error_reporting(0);
chdir(dirname(__FILE__));
include "../lib/connection.php";
require_once "../lib/GJPCheck.php";
require_once "../lib/exploitPatch.php";
$ep = new exploitPatch();
require_once "../lib/mainLib.php";
$gs = new mainLib();
$gjp = $ep->remove($_POST["gjp"]);
$stars = $ep->remove($_POST["stars"]);
$feature = $ep->remove($_POST["feature"]);
$levelID = $ep->remove($_POST["levelID"]);
$accountID = $ep->remove($_POST["accountID"]);
if($accountID != "" AND $gjp != ""){
	$GJPCheck = new GJPCheck();
	$gjpresult = $GJPCheck->check($gjp,$accountID);
	if($gjpresult == 1){
		$permState = $gs->checkPermission($accountID, "actionRequestMod");
		$permmState = $gs->checkPermission($accountID, "actionRateStars");
		if($permmState >= 1){
			$difficulty = $gs->getDiffFromStars($stars);
			$gs->rateLevel($accountID, $levelID, $stars, $difficulty["diff"], $difficulty["auto"], $difficulty["demon"]);
			$gs->featureLevel($accountID, $levelID, $feature);
			$gs->verifyCoinsLevel($accountID, $levelID, 1);
			$gs->moderLog($levelID,$accountID,$stars,$difficulty["diff"],$difficulty["demon"],$difficulty["auto"]);
			echo 1;
		}else if(!$permmState and $permState >= 1){
			$difficulty = $gs->getDiffFromStars($stars);
			$gs->suggestLevel($accountID, $levelID, $difficulty["diff"], $stars, $feature, $difficulty["auto"], $difficulty["demon"]);
			echo 1;
		}else{
			echo -1;
		}
	}else{echo -1;}
}else{echo -1;}
?>