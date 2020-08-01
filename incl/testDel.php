<?php
require "lib/connection.php";
require "lib/generatePass.php";
require "lib/mainLib.php";

if(!empty($_POST['userName']) AND !empty($_POST['password']))
{
    $usr = $_POST['userName'];
    $pass = $_POST['password'];
    $Pass = new generatePass;
    $valid = $Pass->isValidUsrname($usr,$pass);
    $gs = new mainLib();

       if($valid == 1)
       {
           $id1 = $db->prepare("SELECT accountID FROM accounts WHERE userName = :usr");
           $id1->execute([':usr' => $usr]);
           $id = $id1->fetchColumn(); 
        $lod = $gs->checkPermission($id,"commandRate");
        if($lod == 1)
        {
$ew = $db->query("SELECT userName FROM accounts ORDER BY accountID ");
while($usrname = $ew->fetch())
{
    $userName = $usrname['userName'];
    echo "Циклируется = $userName ";
$slct = $db->prepare("SELECT count(userName) FROM users WHERE userName = :usr");
$slct->execute([':usr' => $userName]);
$cnt = $slct->fetchColumn();

$deb = $cnt;
if($deb == 0)
{
    $lol = "no";
}
else
{
    $lol = "yes";
}
echo "Есть = $lol<br>";
if($deb == 0 OR $deb < 0)
{
$dd =  $db->prepare("DELETE FROM accounts WHERE userName = :ert");
$dd->execute([':ert' => $userName]);
}

    }}
  }
  else
  {
      echo "login incorrect";
  }
}
else
{
echo "jopa";
}

?>