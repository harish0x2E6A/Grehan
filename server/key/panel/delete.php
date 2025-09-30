<?php 

include '../auth.php';

//GET POST
$username = $_POST['username'];

$query=mysqli_query($conn,"select * from tmhs where username='$username'");
$cek=mysqli_num_rows($query);

do{

//username validator
if($username == NULL){
	break;
}

//check username
if($cek < 1){
	echo "Username not registered";
	break;
}


//delete process
$delete=mysqli_query($conn,"DELETE FROM tmhs WHERE username = '$username'");
if (!$delete){
    echo "Delete failed";
    break;
 }

echo "Delete success";


}while(0);

/* --------------------------------- ABOUT -------------------------------------
Original Author: UpLUK
Website: https://plexuscheat.my.id
Telegram: https://t.me/bacodluamsu
Telegram Channel: https://t.me/PLEXUSCH
----------------------------------------------------------------------------- */
?>