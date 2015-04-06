<html>
   <head>
      
   </head>
<body>



</body>
</html>

 <!DOCTYPE HTML>
<html>
<head>
<title>Attendance and salary Management system</title>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>

<?php
// define variables and set to empty values
$nameErr = $emailErr = $deptErr = $idErr = "";
$name = $dept = $address = $id = "";

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
  
    
   if (empty($_POST["id"])) {
     $id = "";
   } else {
     $id = test_input($_POST["id"]);
     // check if ID syntax is valid
     if (!preg_match("/^[0-9 ]*$/", $id)) {
       $idErr = "Invalid ID";
     }
   }
   if (empty($_POST["address"])) {
     $address = "";
   } else {
     $address = test_input($_POST["address"]);
   }

   if (empty($_POST["dept"])) {
     $genderErr = "Department is required";
   } else {
     $dept = test_input($_POST["dept"]);
   }
}

function test_input($data) {
   $data = trim($data);
   $data = stripslashes($data);
   $data = htmlspecialchars($data);
   return $data;
}
?>

<h1> Add New Employee Information </h1>
<p><span class="error">* required field.</span></p>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
   Name: <input type="text" name="name" value="<?php echo $name;?>">
   <span class="error">* <?php echo $nameErr;?></span>
   <br><br>
   ID: <input type="text" name="id" value="<?php echo $id;?>">
   <span class="error">* <?php echo $idErr;?></span>
   <br><br>
   Address: <textarea name="address" rows="2" cols="40"><?php echo $address;?></textarea>
   <br><br>
   Department:
   <input type="radio" name="dept" <?php if (isset($dept) && $dept=="CSE") echo "checked";?>  value="CSE">Cse
   <input type="radio" name="dept" <?php if (isset($dept) && $dept=="EEE") echo "checked";?>  value="EEE">Eee
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
?>

</body>
</html>
