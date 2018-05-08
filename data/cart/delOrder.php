<?php
header("Content-Type:application/json;charset=utf-8");
require_once("../init.php");
$cid = $_REQUEST['cid'];
if($cid){
    $sql = " DELETE FROM yuki_cart WHERE cid=$cid ";
    $result = mysqli_query($conn,$sql);
    if(!$result){
        die('{"code":-1,"msg":"取消订单失败"}');
    }
    if(mysqli_affected_rows($conn)>0){
        echo '{"code":1,"msg":"取消订单成功"}';
    }else{
        echo '{"code":-1,"msg":"取消订单失败"}';
    }
}else{
    die('{"code":-1,"msg":"请输入参数"}');
}

?>