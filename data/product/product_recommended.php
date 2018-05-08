<?php
header("Content-Type:application/json;charset=utf-8");
require_once("../init.php");

@$fid = $_REQUEST['fid'];
@$gfid = $_REQUEST['gfid'];
if($fid&&$gfid){
    $sql = "SELECT fid,plid,yuki_good_family.gfid,title,f_price,sold,g_pic FROM yuki_good_list 
    INNER JOIN yuki_good_family 
    ON yuki_good_list.gfid=yuki_good_family.gfid
    WHERE fid=$fid AND yuki_good_list.gfid!=$gfid AND shelves=1
    GROUP BY gfid";

    $result = mysqli_query($conn,$sql);
    $data = mysqli_fetch_all($result,MYSQLI_ASSOC);
    echo json_encode($data);
}else{
    exit();
}
// $sql = "SELECT yuki_good_family.fid,
// gfid,gid,title,f_price,d_price,g_pic,sold
// FROM yuki_good_list 
// INNER JOIN yuki_good_family
// ON yuki_good_list.gfid=yuki_good_family.gfid 
// WHERE yuki_good_family.fid=$fid AND yuki_good_list.isSalse=1 AND yuki_good_list.gfid!=$gfid
// GROUP BY yuki_good_list.gfid
// LIMIT 6 ";
?>