<?php
header("Content-Type:application/json;charset=utf-8");
require_once("../init.php");
$data = [];
$sql = "SELECT plid,fid,plname,pl_ico FROM yuki_product_list";
$result = mysqli_query($conn,$sql);
$data['pl'] = mysqli_fetch_all($result,MYSQLI_ASSOC);

$sql = "SELECT fid,fname,f_ico FROM yuki_product_family";
$result = mysqli_query($conn,$sql);
$data['pf'] = mysqli_fetch_all($result,MYSQLI_ASSOC);
echo json_encode($data);
?>