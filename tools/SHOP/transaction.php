<html>
<body>
<a href="../stats/topCoins.php">coins</a>
<form action="transaction.php" method="post">
username you <input type="text" name="username"><br>
username 2 <input type="text" name="user"><br>
password (you)<input type="text" name="password"><br>
coins<input type="text" name="coins"><br>

<input type="submit">
</form>

</body>
</html>
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
$coins2 =   $ep->remove($_POST['coins']);
$user2 =   $ep->remove($_POST['user']);

if( !empty($_POST['username']) AND  !empty($_POST['user']) AND !empty($_POST['password']) AND !empty($_POST['coins']))
{
	$generatePass = new generatePass();
    $passbo = $generatePass->isValidUsrname($user, $pass);
    if($passbo == 1)
    {

       $quer = $db->prepare("SELECT coins FROM accounts WHERE userName = :user");
       $quer->execute([':user' => $user]);
       $raw = $quer->fetch();
        $coins = $raw['coins'];
        if($coins >= $coins2)
          {
            $main = $db->prepare("UPDATE accounts SET coins = coins - :cin WHERE userName = :user");
            $main->execute([':cin' => $coins2,':user' => $user]);
            $buy = $db->prepare("UPDATE accounts SET coins = coins + :cin WHERE userName = :user2");
            $buy->execute([':cin' => $coins2,':user2' => $user2]);
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