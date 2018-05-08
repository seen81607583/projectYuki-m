<?php
//轮播图数据
header("Content-Type:application/json;charset=utf-8");
require_once("../init.php");

$sql = "SELECT crid,src FROM yuki_carousel";
$result = mysqli_query($conn,$sql);
$data = mysqli_fetch_all($result,MYSQLI_ASSOC);
echo json_encode($data);
?>