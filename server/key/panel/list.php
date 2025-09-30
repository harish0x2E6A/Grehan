<?php 
include '../auth.php';

$data1 = mysqli_query($conn,"select * from tmhs");
$data2 = mysqli_query($conn,"select * from tmhs");
$data3 = mysqli_query($conn,"select * from tmhs");
$data4 = mysqli_query($conn,"select * from tmhs");

$jumlah = mysqli_num_rows($data1);
echo "jumlah=";
echo "\"".$jumlah."\"";
echo "\n";
echo "username={";
while($username = mysqli_fetch_array($data1)){
echo "\"".$username['username']."\"";
echo ",";
}
echo "}";
echo "\n";
echo "password={";
while($password = mysqli_fetch_array($data2)){
echo "\"".$password['password']."\"";
echo ",";
}
echo "}";
echo "\n";
echo "uuid={";
while($uuid = mysqli_fetch_array($data3)){
echo "\"".$uuid['uuid']."\"";
echo ",";
}
echo "}";
echo "\n";
echo "expDate={";
while($expDate = mysqli_fetch_array($data4)){
echo "\"".$expDate['expDate']."\"";
echo ",";
}
echo "}";

?>