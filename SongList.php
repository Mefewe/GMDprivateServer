<?php
include "incl/lib/connection.php";

$query = $db->prepare("SELECT ID,name FROM songs WHERE ID >= 5000000 ORDER BY ID DESC");
$query->execute();
$result = $query->fetchAll();
$first = true;

foreach($result as &$song){
    if($first == true){
        echo $song["ID"].":".$song["name"];
        $first = false;
    }
    else{
    echo '|'.$song["ID"].":".$song["name"];
    }
}
?>