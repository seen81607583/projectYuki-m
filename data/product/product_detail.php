<?php
header("Content-Type:application/json;charset=utf-8");
require_once("../init.php");

@$fid = $_REQUEST['fid'];
@$plid = $_REQUEST['plid'];
@$gfid = $_REQUEST['gfid'];
$data = [];
if($gfid){
    $sql = "SELECT fid,fname FROM yuki_product_family WHERE fid=$fid";
    $result = mysqli_query($conn,$sql);
    $data['pf'] = mysqli_fetch_all($result,MYSQLI_ASSOC);

    $sql = "SELECT plid,plname FROM yuki_product_list WHERE plid=$plid";
    $result = mysqli_query($conn,$sql);
    $data['pl'] = mysqli_fetch_all($result,MYSQLI_ASSOC);

    $sql = "SELECT 
    gfid,gid,title,intro,f_price,d_price,g_pic,g_spec1,g_spec2,promise,salse,isSalse,stock,sold,g_pic,detail
    FROM yuki_good_list WHERE gfid=$gfid";

    $result = mysqli_query($conn,$sql);
    $data['data'] = mysqli_fetch_all($result,MYSQLI_ASSOC);

    $sql = "SELECT src FROM yuki_good_pic WHERE gfid=$gfid";
    $result = mysqli_query($conn,$sql);
    $data['pic'] = mysqli_fetch_all($result,MYSQLI_ASSOC);
    echo json_encode($data);
}

?>