<?php
$margin = 1000;
$local_stars = 230; // From Stereo Madness to Fingerdash (187 stars) + The challenge (3 stars)
$local_coins = 70; //66 = (21 levels * 3 coins) + 1 (from the menu) + 2 (glubfub and sparky from the vault)
$local_demons = 20; // Clubstep, ToE II and Deadlocked

$_s = array(
    "anticheat" => array(
        "stars" => array(
            "margin" => $margin,
            "local" => $local_stars
        ),

        "coins" => array(
            "margin" => $margin,
            "local" => $local_coins 
        ),

        "usercoins" => array(
            "margin" => $margin
        ),

        "demons" => array(
            "margin" => $margin,
            "local" => $local_demons
        )
    )
);

?>
