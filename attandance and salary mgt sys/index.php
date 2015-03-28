<?php
	include ("connect.php");
	$link=Connection();
	$AttResult=mysql_query("SELECT `O.ID`,`Hour` , `Date` , `E.Name` , `Office`.`E.ID` , `D Name` FROM `Office` JOIN `Employee` ON `Office`.`E.ID` = `Employee`.`E.ID` JOIN `Department` ON `Employee`.`D.ID` = `Department`.`D.ID` ORDER BY `Date` ",$link );
?>

<html>
   <head>
      <title>Attendance and salary Management system</title>
   </head>
<body>
   <h1>Attendance Log</h1>
	<table border="1" cellspacing="1" cellpadding="1">
		<tr>
			<td>&nbsp;Date&nbsp;</td>
			<td>&nbsp;Employee Name&nbsp;</td>
			<td>&nbsp;Employee ID&nbsp;</td>
			<td>&nbsp;Department&nbsp;</td>
			<td>&nbsp;Hours worked&nbsp;</td>
		</tr>
		<?php 
			if($AttResult!=FALSE){
				while($row=mysql_fetch_array($AttResult)){
					printf("<tr><td> &nbsp;%s </td><td> &nbsp;%s&nbsp; </td><td> &nbsp;%s&nbsp; </td><td> &nbsp;%s&nbsp</td><td>&nbsp;%s&nbsp; </td></tr>", 
		           $row["Date"], $row["E.ID"], $row["E.Name"], $row["D Name"], $row["Hour"]);
				}
				 mysql_free_result($AttResult);
				 mysql_close();
			}
			
		?>
	
	
	</table>
   <h1>Search for an Employee </h1>
   <form action="EmployeeFind.php" method="post">
	Employee Name: <input type="text" name="Name"><br>
	Employee ID: <input type="text" name="ID"><br>
	<input type="submit">
	</form>
</body>
</html>