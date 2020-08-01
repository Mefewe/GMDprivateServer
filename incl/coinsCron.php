<?php
require_once "lib/strelokLib.php";
$gs = new strelokLib();

if($gs->protectCoins() == 1)
{
$gs->addingCoins("");
}
else
{
    echo "J-12";
}
?>
