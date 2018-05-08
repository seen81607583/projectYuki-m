<?php
    header("Content-Type:application/json;charset=utf-8");
    require_once("../init.php");
    session_start();
    @$uid = $_SESSION["uid"];
    if($uid){
        $sql = "SELECT uname FROM yuki_user WHERE uid=$uid";
        $result = mysqli_query($conn,$sql);
        $output = ["code"=>"1","uname"=>mysqli_fetch_row($result)[0],"uid"=>$uid];
        echo json_encode($output);
    }else{
        echo json_encode(["code"=>"-1"]);
    }
?>