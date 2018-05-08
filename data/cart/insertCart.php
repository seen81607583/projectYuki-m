<?php
header("Content-Type:application/json;charset=utf-8");
require_once("../init.php");
session_start();
//@$cid = $_REQUEST['cid'];
@$uid = $_SESSION['uid'];
@$gid = $_REQUEST['gid'];
@$quantity = $_REQUEST['quantity'];
@$spec1 = $_REQUEST['spec1'];
@$spec2 = $_REQUEST['spec2'];
//@$address = $_REQUEST['address'];
if(!$quantity){
    $quantity = 1;
}
if(!$spec2){
    $spec2 = "默认";
}
if($uid){
    // if($address&&$cid){
    //     $sql = "UPDATE yuki_cart SET address=$address WHERE cid=$cid";
    //     $result = mysqli_query($conn,$sql);
    //     $affectRow = mysqli_affected_rows($conn);
    //     if($affectRow>0){
    //         echo '{"code":1,msg:"更新地址成功"}';
    //     }
    // }else if($gid){
           // if($spec1){
                $sql = "INSERT INTO yuki_cart(cid,uid,gid,quantity,spec1,spec2)
                VALUES(NULL,$uid,$gid,$quantity,'$spec1','$spec2')";
                $result = mysqli_query($conn,$sql);
                $affectRow = mysqli_affected_rows($conn);
                if($affectRow>0){
                    echo '{"code":1,"msg":"加入成功"}';
                }else{
                    echo '{"code":-1,"msg":"加入失败"}';
                }  
            //}else{
                //echo '{"code":-1,msg:"请选择产品款式}';
            //}
    //}
}else{
    echo '{"code":-1,"msg":"请登录"}';
}

?>