<?php

	function Connection(){
		$server="localhost";
		$user="unisecbd_bmabir";
		$pass="Mass@Effect_32";
		$db="unisecbd_rfid";
	   	
		$connection = mysql_connect($server, $user, $pass);

		if (!$connection) {
	    	die('MySQL ERROR: ' . mysql_error());
		}
		
		mysql_select_db($db) or die( 'MySQL ERROR: '. mysql_error() );

		return $connection;
	}
?>
