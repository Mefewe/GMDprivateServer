<body>
<html>
<?php

  $mysqli = mysql_connect('localhost', 'u0831230_default', '1F5r8K1v');
mysql_select_db("u0831230_default",$mysqli);
  if (mysqli_connect_errno()) {
    echo "Подключение невозможно: ".mysqli_connect_error();
  }
mysql_query("SET CHARSET utf8");
  $result_set = mysql_query('SELECT levelName,levelID,userName FROM levels',$mysqli);
$num = mysql_num_rows($result_set);


echo "<table>";
echo "<tr>";
while($num--) {
      if(! mysql_data_seek($result_set, $num))
           break;
  $row = mysql_fetch_assoc($result_set); 
if($row)
{
    $datae = $row['levelName'];
    $texte = $row['levelID'];
    $texte4 = $row['userName'];
echo "<td>";
echo "Имя <div>$datae</div>";
echo "         "
;
echo "Айди <div>$texte</div>";
echo "         "
;
echo "Аффтар <div>$texte4</div>";
echo "<br><br> ";
echo "</td>";


}
  }
echo "</tr>";
echo "</table>";



$res = mysql_query("SELECT COUNT(*) FROM levels");
$row6 = mysql_fetch_row($res);
$total = $row6[0]; // всего записей
echo "<br><br>Всего лвлов: $total <br><br>";
?>

<form action="../" method="get">
<input type="submit" name="перейти к доске." value="Обратно в главную страницу." />
</form>

</body>
</html>