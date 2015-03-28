<?php

	include("connect.php"); 	
	
	$link=Connection();

	
?>

<html>
<body>
<h1>Employee Search<h1>
<table style="width:100%">
<?php
printf($_POST["Name"]);
$IDEntry=$_POST["ID"];
$result=mysql_query("SELECT * FROM `Employee` JOIN `Card` ON `Employee`.`C.ID`=`Card`.`C.ID` JOIN `Department` ON `Employee`.`D.ID`=`Department`.`D.ID`  WHERE `Employee`.`E.ID`=$IDEntry",$link);
if($AttResult!=FALSE){
				while($row=mysql_fetch_array($AttResult)){
					printf("<tr>
    <th>&nbsp;Name:&nbsp;</th>
    <td>&nbsp;%s&nbsp;</td>
  </tr>
  <tr>
    <th>Employee ID:</th>
    <td>&nbsp;%s&nbsp;</td>
  </tr>
  <tr>
    <th>&nbsp;Department:&nbsp;</th>
    <td>&nbsp;%s&nbsp;</td>
  </tr><tr>
    <th>&nbsp;Address:&nbsp;</th>
    <td>&nbsp;%s&nbsp;</td>
  </tr><tr>
    <th>&nbsp;Card No:&nbsp;</th>
    <td>&nbsp;%s&nbsp;</td>
  </tr><tr>
    <th>&nbsp;Salary:&nbsp;</th>
    <td>&nbsp;%s&nbsp;</td>
  </tr><tr>
    <th>&nbsp;Total Hours worked:&nbsp;</th>
    <td>&nbsp;%s&nbsp;</td>
  </tr><tr>
    <th>&nbsp;Card Secret:&nbsp;</th>
    <td>&nbsp;%s&nbsp;</td>
  </tr>", 
		            $row["E.Name"], $row["E.ID"], $row["D Name"],$row["Address"],$row["C.ID"],$row["Salary"], $row["Hour"],$row["Secret"]);
				}
				 mysql_free_result($AttResult);
				 mysql_close();
			}
?>

 
 
</table>


</body>
</html>