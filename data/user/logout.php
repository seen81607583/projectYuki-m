<?php
require_once("../init.php");
    session_start();
    session_unset();
    session_destroy();
?>