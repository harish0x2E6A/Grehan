<?php 

include '../auth.php';

//GET POST
$username = $_POST['username'];
$password = $_POST['password'];
$uuid = $_POST['uuid'];
$expType = $_POST['expType'];

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
if($cek < 1){
	echo "Username not registered";
	break;
}

//data login fetch
$login = mysqli_query($conn,"select * from tmhs where username='$username'");
$data = mysqli_fetch_assoc($login);

//expired validator
$timenow = time();
if($expType == NULL){
$EXPIREDDAYS = ($data["expDate"]);
}else{
$EXPIREDDAYS = date("Y-m-d H:i:s", strtotime($expType, $timenow));
}

//update process
$sql_update=mysqli_query($conn,"UPDATE tmhs SET password='$password',uuid='$uuid',expDate='$EXPIREDDAYS' WHERE username='$username'");
if (!$sql_update){
    echo "Update failed";
    break;
 }

echo "Update success";


}while(0);

/* --------------------------------- ABOUT -------------------------------------
Original Author: UpLUK
Website: https://plexuscheat.my.id
Telegram: https://t.me/bacodluamsu
Telegram Channel: https://t.me/PLEXUSCH
----------------------------------------------------------------------------- */
?>