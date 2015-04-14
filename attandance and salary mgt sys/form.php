<?php 
	/*error_reporting(0);
	$link = mysqli_connect('localhost', 'unisecbd_bmabir', 'Mass@Effect_32', 'unisecbd_rfid');
		if (mysqli_connect_errno()) {
		    printf("Connect failed: %s\n", mysqli_connect_error());
		    exit();
		}
	*/
	include ("connect.php");
	$link=Connection();
?>


<html>
<head>
<title>Attendance and salary Management system</title>
<link type="text/css" rel="stylesheet" href="style.css">
<style>
.error {color: #FF0000;}
</style>
</head>
<body>
<?php
// define variables and set to empty values
$nameErr = $emailErr = $deptErr = $idErr =$cellPhoneErr=$secretErr=$final=$final1= "";
$name =$email= $dept = $address =$cellPhone= $id =$secret= "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
   if (empty($_POST["name"])) {
     $nameErr = "Name is required";
   } else {
     $name = test_input($_POST["name"]);
     // check if name only contains letters and whitespace
     if (!preg_match("/^[a-zA-Z ]*$/",$name)) {
       $nameErr = "Only letters and white space allowed";
     }
   }
   if (empty($_POST["email"])) {
     $emailErr = "";
   } else {
     $email = test_input($_POST["email"]);
     // check if e-mail address is well-formed
     if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
       $emailErr = "Invalid email format";
     }
   }
    
   if (empty($_POST["id"])) {
     $idErr = "Id is required";
   } else {
     $id = test_input($_POST["id"]);
     // check if ID syntax is valid
     if (!preg_match("/^[0-9 ]*$/", $id) || strlen($id) !=8 ) {
       if(strlen($id) !=8){$idErr = "Invalid ID. Can only be of length 8 digit ";}
       else{$idErr="Invalid ID. Alphabet is not allowed";}
     }
   }
   if (empty($_POST["secret"])) {
     $secretErr = "Card Secret is required";
   } else {
     $secret = test_input($_POST["secret"]);
     // check if Secret syntax is valid
     if (!preg_match("/^[0-9a-zA-Z]*$/", $secret) || strlen($secret) !=12) {
     	if(strlen($secret) !=12){$secretErr = "Invalid Secret.Only Charecter with length 12  ";}
       	else{$secretErr="Invalid Secret. Only AlphaNumeric is allowed";}
     }
       
     
   }
   if (empty($_POST["cellPhone"])) {
     $cellPhoneErr = "Cell Phone No. is required";
   } else {
     $cellPhone = test_input($_POST["cellPhone"]);
     // check if cell Phone no. syntax is valid
     if (!preg_match("/^[0-9]*$/", $cellPhone)) {
     	if(strlen($cellPhone) >15 ){$cellPhoneErr = "Only 15 digit is allowed ";}
       	else if(strlen($cellPhone) <7){$cellPhoneErr = "Cell Number too short";}
       	else{$cellPhoneErr="Only number is allowed";}
     	}
       
    
   }
   if (empty($_POST["address"])) {
     $address = "";
   } else {
     $address = test_input($_POST["address"]);
   }

   if (empty($_POST["dept"])) {
     $deptErr = "Department is required";
   } else {
     $dept =test_input($_POST["dept"]);
   }
}

function test_input($data) {
   $data = trim($data);
   $data = stripslashes($data);
   $data = htmlspecialchars($data);
   $data =mysql_real_escape_string($data);
   return $data;
}
?>
<div style="float:left; width:50%;">
<div style="float:left; width:100%;margin-left:50px;">
<h1> Add New Employee Information </h1>
<p><span class="error">* required field.</span></p>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
   
    Name <input type="text" name="name" size="47" value="<?php echo $name;?>" autofocus><span class="error">* <?php echo $nameErr;?></span><br><br>
    
    ID    :<input type="text" name="id" size="50" value="<?php echo $id;?>"><span class="error">* <?php echo $idErr;?></span><br><br>
   
    Cell Phone No <input type="text" name="cellPhone" size="37" value="<?php echo $cellPhone;?>"><span class="error">* <?php echo $cellPhoneErr;?></span><br><br>
   
    E-mail Address <input type="text" name="email" size="35" value="<?php echo $email;?>"><span class="error">* <?php echo $emailErr;?></span> <br><br>
    
    Card Secret<input type="text" name="secret" size="40" value="<?php echo $secret;?>" placeholder="Select available card secret from Right table"><span class="error">* <?php echo $secretErr;?></span><br><br>
    
    Address<br><br><textarea name="address" rows="2" cols="40"><?php echo $address;?></textarea><br><br>
   
   Department:
   <input type="radio" name="dept" <?php if (isset($dept) && $dept=="CSE") echo "checked";?>  value="CSE">CSE
   <input type="radio" name="dept" <?php if (isset($dept) && $dept=="EEE") echo "checked";?>  value="EEE">EEE
   <input type="radio" name="dept" <?php if (isset($dept) && $dept=="ECE") echo "checked";?>  value="ECE">ECE
   <span class="error">* <?php echo $deptErr;?></span>
   <br><br>
   
   <input type="submit" name="submit" value="Submit">
</form>
<?php
	

echo "<h2>Your Input:</h2>";
echo $name;
echo "<br>";
echo $id;
echo "<br>";
echo $address;
echo "<br>";
echo $dept;
echo "<br>";
echo $secret;
echo "<br>";
echo $cellPhone;
echo "<br>";
echo $email;
echo "<br>";

echo "<h2>Your Error:</h2>";
echo $nameErr;
echo "<br>";
echo $idErr;
echo "<br>";
echo $deptErr;
echo "<br>";
echo $secretErr;
echo "<br>";
echo $cellPhoneErr;
echo "<br>";



if(!empty($name) && !empty($id) && !empty($cellPhone) && !empty($dept)&& !empty($secret) &&empty($nameErr) && empty($idErr) && empty($cellPhoneErr) && empty($deptErr)&& empty($secretErr)){
	$name="'".$name."'";
	$id="'".$id."'";
	$secret="'".$secret."'";
	$cellPhone="'".$cellPhone."'";
	$dept="'".$dept."'";
	if(empty($address)){
	$address=NULL;
	}
	if(empty($email)){
	$email=NULL;
	}
	$check1="mysql_query(SELECT Count(`Secret`) FROM `Card` WHERE `Secret` =$secret ,$link)";
	//$check2="mysql_query(SELECT Count(`E.ID`) FROM `Employee` WHERE `E.ID` =$id ,$link)";
	if($check1==0){
	
	$sq1=" SELECT `D.ID` FROM `Department` WHERE `D Name`=$dept";
	$res1=mysql_query($sq1,$link) or die("could not execute sq1");
	echo mysql_errno($link) . ": " . mysql_error($link). "\n";
	while($row=mysql_fetch_array($res1)){
	echo mysql_errno($link) . ": " . mysql_error($link). "\n";
	$deptId=$row["D.ID"];
	printf("Result is %s", $deptId);
	}
	$deptId="'".mysql_real_escape_string($deptId)."'";
	$q2 ="INSERT INTO `Employee` (`E.Name`, `E.ID`, `Address`,`Email`, `Hours Worked`, `Salary`, `C.ID`, `D.ID`,`Cell Phone`) VALUES ($name, $id,".var_export($address, true).",".var_export($email, true).",0.00,0.00,NULL,$deptId,$cellPhone)";
	
	if(is_null($email) && is_null($address)){echo "address and email are null";
	}else if( is_null($email)){ echo "email is null";
	}else if( is_null($address)){ echo "address is null"; 
	}else{echo "nothing is null";
	}
	
	mysql_query($q2,$link) ;
	echo mysql_errno($link) . ": " . mysql_error($link). "\n";
	
	$q3 ="INSERT INTO `unisecbd_rfid`.`Card` ( `C.ID`,`E.ID`, `Secret`) VALUES (NULL,$id,$secret)";
	mysql_query($q3,$link) or die("could not execute sq3");
	echo mysql_errno($link) . ": " . mysql_error($link). "\n";
	
	$sq4="UPDATE `unisecbd_rfid`.`Employee` SET `Employee`.`C.ID` = (Select `Card`.`C.ID` FROM `Card` Where `Card`.`E.ID`=$id ) WHERE `Employee`.`E.ID` = $id";
	mysql_query($sq4,$link) or die("could not execute sq4");
	echo mysql_errno($link) . ": " . mysql_error($link). "\n";
	
	$sq5="UPDATE `Log` SET `Log`.`C.ID`=(Select `Card`.`C.ID` FROM `Card` Where `Card`.`E.ID`=$id) WHERE `Log`.`secret`=$secret";
	mysql_query($sq5,$link) or die("could not execute sq5");
	echo mysql_errno($link) . ": " . mysql_error($link). "\n";
	/*
	$result = mysqli_query($link, $sq1) or die(mysqli_error($link));
	echo print_r($result);
	while($row = mysqli_fetch_array($result)){
	echo print_r($row);
	printf("The result is %s" ,$row["D.ID"]);
	
	}*/
	$final= "<h2>Employee Added successfully</h2>";
	}else{
		echo "duplicate key exists";
	}
}else{
	$final1="<h2>Data is not valid, unable to add to the Database</h2>";	
}


/* free result set */
//mysqli_free_result($result);

/* close connection */

?>
</div>
</div>


<div style="float:right; width:50%;">
<h1>Available RFID Card Log</h1>
<table border="1" cellspacing="1" cellpadding="1">
		<tr>
			
			<td>&nbsp;Time of Entry&nbsp;</td>
			<td>&nbsp;Available Card Secret&nbsp;</td>
			
			
		</tr>
		<?php 
			$sq10=" SELECT DISTINCT `Log`.`TimeStamp`,`Log`.`Secret`FROM  `Log` WHERE `Log`.`C.ID`=0 ORDER By `Log`.`TimeStamp` LIMIT 0,10";
			$res10=mysql_query($sq10,$link);
			echo mysql_errno($link) . ": " . mysql_error($link). "\n";
			if($res10!=FALSE){
				while($row=mysql_fetch_array($res10)){
					printf("<tr><td>&nbsp;%s&nbsp;</td><td>&nbsp;%s&nbsp;</td></tr>", 
		           $row["TimeStamp"],$row["Secret"]);
				}
				 
			}
			mysql_close();
		?>
	
	
	</table>
	<br></br>
	<br></br>
	<br></br>
	<?php
	if(!empty($final)){
		echo $final;
	}if(empty($final1)){
		echo $final1;
	}
	?>
</div> 


</body>
</html>



