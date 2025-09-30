<?php
 
session_start();
// database connection
include 'auth.php';
// create function for generate random password
function generate_username($len = 20){
 $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
 $username = substr( str_shuffle( $chars ), 0, $len );
 return $username;
}
function generate_password($len = 20){
 $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
 $password = substr( str_shuffle( $chars ), 0, $len );
 return $password;
}

// insert into database
if(isset($_SESSION['signup'])) {
session_destroy();
 $username = generate_username();
 $password = generate_password();

 mysqli_query($conn, "insert into tmhs values('$username','$password','1','0000-00-00 00:00:00','1','1')");
 
 echo '<!DOCTYPE html>

<html>

<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<style>

body {

  font-family: Arial, Helvetica, sans-serif;

  background-color: #FFFFFF;

}



* {

  box-sizing: border-box;

}



/* Add padding to containers */

.container {

  padding: 16px;

  background-color: white;

}



/* Full-width input fields */

input[type=text], input[type=Password] {

  width: 100%;

  padding: 15px;

  margin: 5px 0 22px 0;

  display: inline-block;

  border: none;

  background: #f1f1f1;

}



input[type=text]:focus, input[type=Password]:focus {

  background-color: #ddd;

  outline: none;

}



/* Overwrite default styles of hr */

hr {

  border: 1px solid #f1f1f1;

  margin-bottom: 25px;

}



/* Set a style for the submit button */

.button1 {

  background-color: #0091EA;

  color: white;

  padding: 16px 20px;

  margin: 8px 0;

  border: none;

  cursor: pointer;

  width: 100%;

  opacity: 0.9;

}



.registerbtn:hover {

  opacity: 1;

}



/* Add a blue text color to links */

a {

  color: dodgerblue;

}



/* Set a grey background color and center the text of the "sign in" section */

.signin {

  background-color: #f1f1f1;

  text-align: center;

}

</style>

<script>

function copyUsername() {

  var UsernameText = document.getElementById("Username");

  UsernameText.select();

  UsernameText.setSelectionRange(0, 99999);

  document.execCommand("copy");

}

</script>

</head>

<body>

 <div class="container">

    <center>

    <h2>LieShooter</h2>

    <p>Free keys for five minutes</p>

    </center>

    <hr>



    <label for="Username"><b>Username</b></label>

    <input type="text" id="Username" value= ' . $username . ":" . $password .' required>

    <button type="submit" class="button1" onclick="copyUsername()">Copy Username</button>

    <br>

    <br>

    <br>

  </div>



</body>

</html>

';
}else{
echo "<script>location='index.php';</script>";
}

 
?>