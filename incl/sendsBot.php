<?php
require "lib/connection.php";
$query="Select suggestBy,suggestLevelId,suggestStars From suggest WHERE `id` = (SELECT MAX(id) FROM `suggest`)";
$dbdata=$mysqli->query($query);

$row = mysqli_fetch_assoc($dbdata);
    $sugby = $row['suggestBy'];
    $suglvl = $row['suggestLevelId'];
    $suggestStars = $row['suggestStars'];

    $moderName=$mysqli->query("SELECT userName FROM accounts WHERE accountID = '$sugby'");

$levelName = $suglvl;
$row2 = mysqli_fetch_assoc($moderName);

$modenm = $row2['userName'];
echo "$modenm Отослал $levelName На $suggestStars Звёзд.";
?>