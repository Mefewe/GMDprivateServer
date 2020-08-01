<?php
class strelokLib
{

public function POST($URL,$params)
 {
    if( $curl = curl_init() ) {
        curl_setopt($curl, CURLOPT_URL, $URL);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER,true);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $params);
        $out = curl_exec($curl);     
        curl_close($curl);
        
        return $out;
      }
    else
    {  
        return 1984;
    }
 }

public function lastAuthor()
{
    include __DIR__ . "/connection.php";
   $zapr = $db->query("SELECT userName FROM levels WHERE `levelID` = (SELECT MAX(levelID) FROM `levels`)");
   $str = $zapr->fetch();
   $name = $str['userName'];
      return $name;
}
public function coinsGet($userName)
{
  include __DIR__ . "/connection.php";
  $cl = new strelokLib;
  include __DIR__."/../../config/connection.php";
 
  $lol = $cl->POST("http://".$hostl."/tools/stats/forCoin.php","");
  return $lol;
}

public function coinsLogic()
{
  include __DIR__ . "/connection.php";
  $cl = new strelokLib;
  $get = $cl->coinsGet("0");
  
  $top = explode("<br>", $get, 4);
  $one = $top[0];
  if(!empty($top[1]))
  {
  $two = $top[1];
  }
  if(!empty($top[2]))
  {
$three = $top[2];
  }
if(!empty($top[3]))
{
$fourt = $top[3];
}
if(!empty($top[4]))
{
 $five = $top[4];
}

if(!empty($one))
{
$m1 = explode(" ",$one,4);
global $me1;$me1 = $m1[0];
global $ID1;$ID1 = $m1[1];
global $U1;$U1 = $m1[2];
global $S1;$S1 = $m1[3];
}
if(!empty($two))
{
  $m2 = explode(" ",$two,4);
  global $me2;$me2 = $m2[0];
global $ID2;$ID2 = $m2[1];
global $U2;$U2 = $m2[2];
global $S2;$S2 = $m2[3];
}
if(!empty($three))
{
  $m3 = explode(" ",$three,4);
global $me3;$me3 = $m3[0];
global $ID3;$ID3 = $m3[1];
global $U3;$U3 = $m3[2];
global $S3;$S3 = $m3[3];
}
if(!empty($fourt))
{
  $m4 = explode(" ",$fourt,4);
  global $me4;$me4 = $m4[0];
global $ID4;$ID4 = $m4[1];
global $U4;$U4 = $m4[2];
global $S4;$S4 = $m4[3];
}
if(!empty($five))
{
  $m5 = explode(" ",$five,4);
  global $me5;$me5 = $m5[0];
  global $ID5;$ID5 = $m5[1];
    global $U5;$U5 = $m5[2];
    global $S5;$S5 = $m5[3];
}
file_put_contents("logic.txt", $get);

}
public function addingCoins($userName)
{
  include __DIR__ . "/connection.php";
  $cl = new strelokLib;
  $cl->coinsLogic();
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 global $me5;
 global $ID5;
 global $U5;
 global $S5;
 global $me4;
 global $ID4;
 global $U4;
 global $S4;
 global $me3;
 global $ID3;
 global $U3;
 global $S3;
 global $me2;
 global $ID2;
 global $U2;
 global $S2;
 global $me1;
 global $ID1;
 global $U1;
 global $S1;
 //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if(!empty($S1))
{
if($S1 > 4)
{
  
$wie = $db->prepare("SELECT isRegistered FROM users WHERE userName = :user");
$wie->execute([':user' => $U1]);
$lol1 = $wie->fetch();
if($lol1['isRegistered'] == "0" OR 0)
{
  
}
else{
$wue = $db->prepare("UPDATE accounts SET coins = coins+150 WHERE userName = :id");
$wue->execute([':id' => $U1]);

echo "$S1,$S2,$S3";
}
}

else
{
die();  
}

}//

if(!empty($S2))
{
  if($S2 > 4)
{
  $wie2 = $db->prepare("SELECT isRegistered FROM users WHERE userName = :user");
$wie2->execute([':user' => $U2]);
$lol2 = $wie2->fetch();
if($lol2['isRegistered'] == "0" OR 0)
{
  
}
else{
  $wue2 = $db->prepare("UPDATE accounts SET coins = coins + 120 WHERE userName = :acid");
  $wue2->execute([':acid' => $U2]);
}
}
else
{

}

}

if(!empty($S3))
{
  if($S3 > 2)
  {
    $wie3 = $db->prepare("SELECT isRegistered FROM users WHERE userName = :user");
$wie3->execute([':user' => $U3]);
$lol3 = $wie3->fetch();
if($lol3['isRegistered'] == "0" OR 0)
{
  
}
else{
    $wue3 = $db->prepare("UPDATE accounts SET coins = coins + 100 WHERE userName = :acid");
    $wue3->execute([':acid' => $U3]);
  }
}
  else
  {
  
  }
}

 if(!empty($S4))
{
  if($S4 > 1)
  {
    $wie4 = $db->prepare("SELECT isRegistered FROM users WHERE userName = :user");
    $wie4->execute([':user' => $U4]);
    $lol4 = $wie4->fetch();
if($lol4['isRegistered'] == "0" OR 0)
{
  
}
else{
    $wue4 = $db->prepare("UPDATE accounts SET coins = coins + 50 WHERE userName = :acid");
    $wue4->execute([':acid' => $U4]);
  }
}
  else
  {
  
  }

}

 if(!empty($S5))
{
   if($S5 > 0)
   {
    $wie5 = $db->prepare("SELECT isRegistered FROM users WHERE userName = :user");
$wie5->execute([':user' => $U5]);
$lol5 = $wie5->fetch();
if($lol5['isRegistered'] == "0" OR 0)
{

}
else{
    $wue5 = $db->prepare("UPDATE accounts SET coins = coins + 10 WHERE userName = :acid");
    $wue5->execute([':acid' => $U5]);
   }
  }
else
   {

   }
}


}

public function protectCoins() //anty spam
{
  include __DIR__ . "/connection.php";
  $cl = new strelokLib;
  $query="SELECT date FROM exploit WHERE `id` = (SELECT MAX(id) FROM `exploit`)";
  $lus = $db->query($query);
   $rash = $lus->fetchColumn();
$data = date("o j m");
if($rash != $data)
{
$letov = $db->prepare("INSERT INTO exploit VALUES(0, :tadh )");
$letov->execute([':tadh' => $data]);
return 1;
}
else
{
  echo "LOOOL you spamoin this";
  return 0;
}

}
public function TopCoins()
{
  include __DIR__ . "/connection.php";
  $cl = new strelokLib;

  $qu = $db->query("SELECT coins,userName FROM accounts ORDER BY coins");
  while ($row = $qu->fetch())
{
    if($row['coins'] == 0)
    {
      
    }
    else
    {
      echo "coins".$row['coins']."-user-". $row['userName']."<br>";
    }
}


}

}
?>