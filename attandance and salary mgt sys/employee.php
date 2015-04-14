<?php
	include ("connect.php");
	$link=Connection();
	if(isset($_POST["ID"])) {
	$IDNum = mysql_real_escape_string($_POST["ID"]);
	$sql = "SELECT `Employee`.`Email`,`Employee`.`Cell Phone`, `Employee`.`Address`, `Employee`.`E.Name`, `Employee`.`E.ID`,`Employee`.`Salary`,`Department`.`D Name` ,`Employee`.`Hours Worked` FROM `Employee`,`Card`,`Department` WHERE `Employee`.`C.ID`=`Card`.`C.ID` AND `Employee`.`D.ID`=`Department`.`D.ID` AND `Employee`.`E.ID`=$IDNum"
    . "";
	$AttResult=mysql_query($sql,$link );
	}else{
	printf("no input found");
	}
?>

<html>
   <head>
   
      <title>Attendance and salary Management system</title>
      <link type="text/css" rel="stylesheet" href="style.css">
   </head>
<body>
<div id="pencil-container">
   <div style="float:center;margin-left:150px; ">
   <h1>Empolyee Information</h1>
	<table border="1" cellspacing="1" cellpadding="1">
		<tr>
			<td>&nbsp;Employee Name&nbsp;</td>
			<td>&nbsp;Employee ID&nbsp;</td>
			<td>&nbsp;Department&nbsp;</td>
			<td>&nbsp;Salary&nbsp;</td>
			<td>&nbsp;Hours worked&nbsp;</td><td>&nbsp;Cell Phone No.&nbsp;</td>
			<td>&nbsp;Address&nbsp;</td><td>&nbsp;Email&nbsp;</td>
		</tr>
		<?php 
			if($AttResult!=FALSE){
				while($row=mysql_fetch_array($AttResult)){
					printf("<tr><td> &nbsp;%s </td><td> &nbsp;%s&nbsp; </td><td> &nbsp;%s&nbsp; </td><td> &nbsp;%s&nbsp</td><td>&nbsp;%s&nbsp; </td><td>&nbsp;%s&nbsp; </td><td> &nbsp;%s&nbsp; </td><td> &nbsp;%s&nbsp; </td></tr>", 
		           $row["E.Name"], $row["E.ID"],  $row["D Name"],$row["Salary"],$row["Hours Worked"],$row["Cell Phone"],$row["Address"],$row["Email"]);
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