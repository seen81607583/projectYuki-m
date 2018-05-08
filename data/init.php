<?php
    $conn = mysqli_connect("127.0.0.1","root","","yuki",3306);

    $sql = "SET NAMES UTF8";

    mysqli_query($conn,$sql);

    header("Access-Control-Allow-Origin:http://127.0.0.1:8100");
    header("Access-Control-Allow-Credentials:true");
?>