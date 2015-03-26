<?php
	include ("connect.php");
	$link=connection();
	$Attresult=mysql_query(//your attandance mysql code goes here);
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
			td>&nbsp;Department&nbsp;</td>
			<td>&nbsp;Hours worked&nbsp;</td>
		</tr>
		<?php 
			if($AttResult!=FALSE){
				while($row=mysql_fetch_array($result)){
					
				}
			}
			
		?>
	
	
	</table>
   
</body>
</html>