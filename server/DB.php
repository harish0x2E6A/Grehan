<?php
if(strpos($_SERVER['REQUEST_URI'],"DB.php")){
    require_once 'Utils.php';
    PlainDie();
}

$conn = new mysqli("localhost", "id19214793_grehan77", "z7>VOvuya~gR@Q57", "id19214793_grehan_harish");
if($conn->connect_error != null){
    die($conn->connect_error);
}