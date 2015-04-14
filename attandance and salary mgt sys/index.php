<?php
	include ("connect.php");
	$link=Connection();
	$AttResult=mysql_query("SELECT `O.ID`,`Hour` , `Date` , `E.Name` , `Office`.`E.ID` , `D Name` FROM `Office` JOIN `Employee` ON `Office`.`E.ID` = `Employee`.`E.ID` JOIN `Department` ON `Employee`.`D.ID` = `Department`.`D.ID` ORDER BY `Date` ",$link );
?>

<html>
   <head>
      <title>Attendance and salary Management system</title>
      <link type="text/css" rel="stylesheet" href="style.css">
   </head>
<body>
<div id="pencil-container">
	<div  style="position: relative; float:right; width:60%;">
		<div style="float:left; width:50%;">

		<h1>Find an Employee </h1>
		   <form action="employee.php" method="post">
			Employee ID: <input type="text" name="ID"><br>
			<input type="submit">
		   </form>
		<h1>ADD New Log</h1>
		  <form action="log.php" method="post">
		  	Card Secret: <input type="text" name="secret1" size="17"><br>
		   	<input type="submit" value="Add new Log">
		  </form>
   		</div>
		<div style="float:right; width:50%;">
		   <h1>New Employee</h1>
			<form action="form.php" method="link">
			<input type="submit" value="Add new Employee">
			</form>
		</div>
		
	</div>
	<div style="float:left; width:40%;">
	<p>
		
		<h1>All Employee Information</h1>
		<table border="1" cellspacing="1" cellpadding="1">
				<tr>
					
					<td>&nbsp;Employee Name&nbsp;</td>
					<td>&nbsp;Employee ID&nbsp;</td>
					<td>&nbsp;Department&nbsp;</td>
					<td>&nbsp;Total Hours worked&nbsp;</td>
				</tr>
				<?php 
					$res1=mysql_query("SELECT `Employee`.`Email`,`Employee`.`Cell Phone`, `Employee`.`Address`, `Employee`.`E.Name`, `Employee`.`E.ID`,`Employee`.`Salary`,`Department`.`D Name` ,`Employee`.`Hours Worked` FROM `Employee`,`Card`,`Department` WHERE `Employee`.`C.ID`=`Card`.`C.ID` AND `Employee`.`D.ID`=`Department`.`D.ID`");
					
					if($res1!=FALSE){
						while($row=mysql_fetch_array($res1)){
							printf("<tr><td> &nbsp;%s&nbsp; </td><td> &nbsp;%s&nbsp; </td><td> &nbsp;%s&nbsp</td><td>&nbsp;%s&nbsp; </td></tr>", 
				           		$row["E.Name"], $row["E.ID"], $row["D Name"], $row["Hours Worked"]);
						}	 
					}
					mysql_free_result($res1);
				?>	
		</table>
	</p>
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
			           $row["Date"], $row["E.Name"], $row["E.ID"], $row["D Name"], $row["Hour"]);
					}
					 mysql_free_result($AttResult);
					 mysql_close();
				}	
			?>
		</table>
	</div>
</div>   
</body>
</html>