<?php
header("Content-Type:application/json;charset=utf-8");
require_once("../init.php");

@$fid = $_REQUEST['fid'];
@$plid = $_REQUEST['plid'];

$sql_base = "SELECT yuki_product_family.fid,
        yuki_product_list.plid,
        yuki_good_family.gfid,
        title,f_price,g_pic 
        FROM yuki_good_list 
        INNER JOIN yuki_good_family
        ON yuki_good_list.gfid=yuki_good_family.gfid 
        INNER JOIN yuki_product_list
        ON yuki_good_family.plid=yuki_product_list.plid
        INNER JOIN yuki_product_family
        ON yuki_product_list.fid=yuki_product_family.fid ";
$search = "";
$data = [];
if($fid||$plid){
    
    if($fid&&$plid){
        $sql = "SELECT fid,plid,plname FROM yuki_product_list WHERE fid=$fid";
        $result = mysqli_query($conn,$sql);
        $plnames = mysqli_fetch_all($result,MYSQLI_ASSOC);
        $data['pl_in_family'] = $plnames;

        $sql = "SELECT fname FROM yuki_product_family WHERE fid=$fid";
        $result = mysqli_query($conn,$sql);
        $fname = mysqli_fetch_row($result)[0];
        $data['fname'] = $fname;

        $sql = "SELECT plname FROM yuki_product_list WHERE plid=$plid";
        $result = mysqli_query($conn,$sql);
        $plname = mysqli_fetch_row($result)[0];
        $data['plname'] =$plname;

        $search = " WHERE yuki_product_list.plid=$plid
        GROUP BY gfid ";
        $sql = $sql_base.$search;
    }else if($fid){
        $sql = "SELECT fid,plid,plname FROM yuki_product_list WHERE fid=$fid";
        $result = mysqli_query($conn,$sql);
        $plnames = mysqli_fetch_all($result,MYSQLI_ASSOC);
        $data['pl_in_family'] = $plnames;

        $sql = "SELECT fname FROM yuki_product_family WHERE fid=$fid";
        $result = mysqli_query($conn,$sql);
        $fname = mysqli_fetch_row($result)[0];
        $data['fname'] = $fname;

        $search = " WHERE yuki_product_family.fid=$fid
        GROUP BY gfid ";      
        $sql = $sql_base.$search;
    }
    $result = mysqli_query($conn,$sql);
    $data['data'] = mysqli_fetch_all($result,MYSQLI_ASSOC);
    echo json_encode($data);
}
// else{
//     $search = " GROUP BY gfid ";
//     $sql =$sql_base.$search;
//     $result = mysqli_query($conn,$sql);
//     $data['data'] = mysqli_fetch_all($result,MYSQLI_ASSOC);
//     echo json_encode($data);
// }
?>