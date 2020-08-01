<?php
require_once "lib/strelokLib.php";
$cl = new strelokLib();

$eml = $cl->coinsGet("djkijij");
echo "$eml";
?>