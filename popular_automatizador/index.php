<?php 
ini_set('error_reporting', E_ALL); // mesmo resultado de: error_reporting(E_ALL);
ini_set('display_errors', 1);
include('classes/DB.class.php');
include('classes/Insert.class.php');

echo '<pre>';
print_r(Insert::getTasks()); exit;


?>