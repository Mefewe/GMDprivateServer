<?php
require "lib/connection.php";
$query="SELECT moder,lvl,diff,isNormal,isDemon,isAuto FROM moder WHERE `id` = (SELECT MAX(id) FROM `moder`)";
$dbdata=$mysqli->query($query);

$row = mysqli_fetch_assoc($dbdata);
    $moderName = $row['moder'];
    $lvl = $row['lvl'];
    $Stars = $row['diff'];
    $Normal = $row['isNormal'];
    $Demon = $row['isDemon'];
    $Auto = $row['isAuto'];

     if(!empty($Normal) AND empty($Demon) AND empty($Auto))
     {
         $norm = "да";
     }
     else
     {
        $norm = "нет";
     }
     if(!empty($Normal) AND !empty($Demon) AND empty($Auto))
     {
         $demont = "да";         
     }
     else
     {
        $demont = "нет";
     }
     if(!empty($Normal) AND empty($Demon) AND !empty($Auto))
     {
         $autot = "да";
     }
    else
    {
        $autot = "нет";
    }

$eru = $db->prepare("SELECT starFeatured, starEpic FROM levels WHERE levelID = :lvlid");
$eru->execute([':lvlid' => $lvl]);
    $row2 = $eru->fetch();

$feat = $row2['starFeatured'];
$epic = $row2['starEpic'];

if(!empty($feat) AND empty($epic))
{
$isfeat = "да";
}
else
{
$isfeat = "нет";
}
if(empty($feat) AND !empty($epic))
{
$isepic = "да";
}
else
{
$isepic = "нет";
}
if(empty($feat) AND empty($epic))
{
$israte = "да";
}
else
{
$israte = "нет";
}
echo "$moderName Рейтнул  $lvl На $Stars Звёзд . <br><br> Это просто лвл = $norm , это демон = $demont , это авто = $autot . Это обычный рейт без ГМО - $israte , это фючер = $isfeat , это эпик = $isepic <br><br>";
if($demont == "да")
{
  $mainf = $db->prepare("SELECT moder, demonType,levelID FROM demon WHERE `id` = (SELECT MAX(id) FROM `demon`) AND moder = :mod AND levelID = :lvl");
         $mainf->execute([':mod' => $moderName, ':lvl' => $lvl]);
         $raf = $mainf->fetch();
         
         $demo = $raf['demonType'];
          if($demo = '3')
          {
           $tupe = "изи демон";
          }
          elseif($demo = '4')
          {
            $tupe = "медиум демон";
          }
          elseif($demo = '0')
          {
            $tupe = "хард демон";
          }
          elseif($demo = '5')
          {
            $tupe = "инсейн демон";
          }
          elseif($demo = '6')
          {
            $tupe = "экстрим демон";
          }
         echo "Тип демона: $tupe ";
}
?>