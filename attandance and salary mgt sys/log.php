<html>
<body>
<?php
   	include("connect.php");
   	
   	$link=Connection();
	$cardId =$res1="";

	$secret1=mysql_real_escape_string($_POST["secret1"]);
	//echo $secret1;
	$sq1="Select `Card`.`C.ID` FROM `Card` WHERE `Card`.`Secret`='$secret1'";
	$res1=mysql_query($sq1,$link) or die("could not execute sq1");
	echo mysql_errno($link) . ": " . mysql_error($link). "\n";
	
	while($row=mysql_fetch_array($res1)){
	echo mysql_errno($link) . ": " . mysql_error($link). "\n";
	$cardId=$row["C.ID"];
	printf("Result is %s", $cardId);
	}
	$secret1="'".$secret1."'";
	$cardId="'".$cardId."'";
	if(!empty($cardId)){ // input the C.ID of card with the log
		echo "card is found";
		$sq2 = "INSERT INTO `Log` (`Secret`, `C.ID`) 
		VALUES ($secret1,$cardId)"; 
		
	}else{ // input null as the C.ID
		echo "card is not found";
		$sq2 = "INSERT INTO `Log` (`Secret`, `C.ID`) 
		VALUES ($secret1,NULL)"; 
		
	}


	
   	
   	mysql_query($sq2,$link);
   	echo mysql_errno($link) . ": " . mysql_error($link). "\n";
	mysql_close($link);

   	
?>
</body>
</html>