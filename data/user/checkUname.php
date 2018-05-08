<?php
header("Content-Type:application/json;charset=utf-8");
require_once("../init.php");
@$uname = $_REQUEST['uname'];
$reg = '/^[a-zA-Z0-9_]{6,18}$/';
$rs = preg_match($reg,$uname);
if(!$rs){
    die('{"code":-1,"msg":"用户名格式不正确"}');
} 
$sql = "SELECT uname FROM yuki_user WHERE uname='$uname'";
$result = mysqli_query($conn,$sql);
$row = mysqli_fetch_row($result);
if($row!=null){
    echo '{"code":-1,"msg":"用户名已存在"}';
}else{
    echo '{"code":1,"msg":"用户名可用"}';
}
?>