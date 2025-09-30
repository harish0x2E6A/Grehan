<?php 

$dbhost = 'localhost';
$dbuser = 'id19214793_grehan_harish';
$dbpass = 'z7>VOvuya~gR@Q57';
$db = 'id19214793_grehan77';
$conn = mysqli_connect($dbhost, $dbuser, $dbpass , $db) or die($conn); 

date_default_timezone_set('Asia/Jakarta');

if (mysqli_connect_error()){
	echo "Koneksi database gagal :". mysqli_connect_error();
}

?>