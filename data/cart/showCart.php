<?php
header("Content-Type:application/json;charset=utf-8");
require_once("../init.php");

session_start();
@$uid = $_SESSION['uid'];
if($uid){
    $sql = "SELECT cid,uid,yuki_cart.gid,quantity,yuki_good_list.title,yuki_good_list.f_price,yuki_good_list.g_pic,yuki_good_list.g_spec1 AS spec1,spec2,
    yuki_good_family.fid,yuki_good_family.plid,yuki_good_family.gfid FROM yuki_cart 
    INNER JOIN yuki_good_list 
    ON yuki_cart.gid=yuki_good_list.gid 
    INNER JOIN yuki_good_family 
    ON yuki_good_list.gfid=yuki_good_family.gfid
    WHERE uid=$uid AND isChecked=0";
    $result = mysqli_query($conn,$sql);
    $data = mysqli_fetch_all($result,MYSQLI_ASSOC);
    echo json_encode($data);
}else{
    echo '{"code":-1,"msg":"请先登录"}';
}

?>