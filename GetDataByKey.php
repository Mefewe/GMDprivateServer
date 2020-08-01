<?php
include "incl/lib/connection.php";
if(!empty($_POST["KeyName"])){
    
    $keyname = $_POST["KeyName"];
    
    $query = $db->prepare("SELECT count(*) FROM LauncherData WHERE KeyName = :KeyName");
	$query->execute([':KeyName' => $keyname]);	
	$count = $query->fetchColumn();
	
	if($count == 0){
	    echo 'This key was not found';
	}
	else{
	    $keydataqu = $db->prepare("SELECT Data FROM LauncherData WHERE KeyName = :KeyName");
	    $keydataqu->execute([':KeyName' => $keyname]);
	    $keydata = $keydataqu->fetchColumn();
	    echo $keydata;
	}
}
else{
    echo 'This key was not found';
}
?>