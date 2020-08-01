<?php
include "../incl/lib/connection.php";
require "../incl/lib/generatePass.php";
require_once "../incl/lib/exploitPatch.php";
require "../incl/lib/mainLib.php";
$ep = new exploitPatch;
$gs = new mainLib;
if( !empty($_POST['username']) AND  !empty($_POST['password']))
{
    $user =   $ep->remove($_POST['username']);
    $pass =   $ep->remove($_POST['password']);

    $result = $gs->isValidUsrname($user,$pass);
    if($result == 1)
    {

    }
    else
    {
        echo"ASADWs";   
     }
}
?>