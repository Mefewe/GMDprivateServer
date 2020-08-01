<?php
include "../../incl/lib/connection.php";
require "../../incl/lib/generatePass.php";
require_once "../../incl/lib/exploitPatch.php";
require "../../incl/lib/mainLib.php";

$gs = new mainLib();
$ep = new exploitPatch();
$user =   $ep->remove($_POST['username']);
$prefix = $ep->remove($_POST['prefix']);
$pass =   $ep->remove($_POST['password']);
if( !empty($_POST['username']) AND  !empty($_POST['prefix']) AND !empty($_POST['password']))
{





	$generatePass = new generatePass();
    $passbo = $generatePass->isValidUsrname($user, $pass);
    if($passbo == 1)
    {

       $quer = $db->prepare("SELECT coins FROM accounts WHERE userName = :user");
       $quer->execute([':user' => $user]);
       $raw = $quer->fetch();
        $coins = $raw['coins'];
        if($coins >= 300)
          {
            $main = $db->prepare("UPDATE accounts SET coins = coins - 300 WHERE userName = :user");
            $main->execute([':user' => $user]);
            $buy = $db->prepare("UPDATE users SET UserPrefix = :prefix WHERE userName = :user");
            $buy->execute([':prefix' => $prefix,':user' => $user]);
            echo "succ";
          }
          else
          {
              echo "small coins!";
          }

    }
else

{
    echo"incorrect1";
}

}
else
{
    echo "AAAAAAAAAAAAA";
}

?>