<?php
header("Content-Type:application/json;charset=utf-8");
require_once("../init.php");
@$uname = $_REQUEST['uname'];
   
@$upwd = $_REQUEST['upwd'];

//$email = $_REQUEST['email'];

@$phone = $_REQUEST['phone'];

$reg = '/^[a-zA-Z0-9_]{6,18}$/';
$rs = preg_match($reg,$uname);
if(!$rs){
    die('{"code":-1,"msg":"用户名格式不正确"}');
} 

$rs = preg_match($reg,$upwd);
if(!$rs){
    die('{"code":-1,"msg":"密码格式不正确"}');
}
// $reg_e = '/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+\.[a-zA-Z0-9_-]+$/';
// $rs = preg_match($reg_e,$email);
// if(!$rs){
//     die('{"code":-1,"msg":"邮箱格式不正确"}');
// }
$reg_p = '/^1[34578]\d{9}$/';
$rs = preg_match($reg_p,$phone);
if(!$rs){
    die('{"code":-1,"msg":"手机号码方式格式不正确}');
}

$sql = "INSERT INTO yuki_user(uid,uname,upwd,phone) VALUES(NULL,'$uname','$upwd','$phone')";
$result = mysqli_query($conn,$sql);
if(mysqli_error($conn)){
    die('{"code":-1,"msg":"注册失败"}');
}else if($result==true){
    echo '{"code":1,"msg":"注册成功"}';
}

?>