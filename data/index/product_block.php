<?php
header("Content-Type:application/json;charset=utf-8");
require_once("../init.php");

@$fid = $_REQUEST['fid'];
if($fid){
    $data = [];
    $sql = "SELECT COUNT(*) FROM yuki_product_family";
    $result = mysqli_query($conn,$sql);
    $row = mysqli_fetch_row($result)[0];
    if($fid>$row){
        exit("不存在该类产品");
    };

    $sql = "SELECT fname,f_pic FROM yuki_product_family WHERE fid=$fid LIMIT 1";
    $result = mysqli_query($conn,$sql);
    $data["block"] = mysqli_fetch_all($result,MYSQLI_ASSOC);

    $sql = "SELECT plid,fid,plname from yuki_product_list WHERE fid=$fid LIMIT 6";
    $result = mysqli_query($conn,$sql);
    $data["block_list"] = mysqli_fetch_all($result,MYSQLI_ASSOC);

    $sql = "SELECT yuki_product_family.fid,yuki_product_list.plid,gid,yuki_good_family.gfid,title,f_price,g_pic 
    FROM yuki_good_list 
    INNER JOIN yuki_good_family 
    ON yuki_good_list.gfid=yuki_good_family.gfid 
    INNER JOIN yuki_product_list
    ON yuki_good_family.plid=yuki_product_list.plid
    inner JOIN yuki_product_family
    ON yuki_product_list.fid=yuki_product_family.fid 
    WHERE yuki_product_family.fid=$fid 
    GROUP BY gfid 
    ORDER BY gfid DESC LIMIT 6";
    $result = mysqli_query($conn,$sql);
    $data["product"] = mysqli_fetch_all($result,MYSQLI_ASSOC);
    echo json_encode($data);
}

?>