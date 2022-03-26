<?php 
ini_set('error_reporting', E_ALL); // mesmo resultado de: error_reporting(E_ALL);
ini_set('display_errors', 1);
include('classes/DB.class.php');
include('classes/Insert.class.php');

print_r(Insert::getTaskGorups()); exit;


?>