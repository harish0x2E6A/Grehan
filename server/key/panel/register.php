<?php 

include '../auth.php';

//GET POST
$username = $_POST['username'];
$password = $_POST['password'];
$expType = $_POST['expType'];
//AUTO TYPE
$userType = "membership";

$query=mysqli_query($conn,"select * from tmhs where username='$username'");
$cek=mysqli_num_rows($query);

do{

if($username == NULL & $password == NULL){
	break;
}

//username validator
if($username == NULL){
    echo "Username invalid";
	break;
}

//password validator
if($password == NULL){
    echo "Password invalid";
	break;
}

//check username
if($cek > 0){
	echo "Already registered";
	break;
}


//register process
$sql_simpan=mysqli_query($conn,"insert into tmhs values('$username','$password','','0000-00-00 00:00:00','$expType','$userType')");
if (!$sql_simpan){
    echo "Register failed";
    break;
 }

echo "Register success";


}while(0);


/* --------------------------------- ABOUT -------------------------------------
Original Author: UpLUK
Website: https://plexuscheat.my.id
Telegram: https://t.me/bacodluamsu
Telegram Channel: https://t.me/PLEXUSCH
----------------------------------------------------------------------------- */
?>