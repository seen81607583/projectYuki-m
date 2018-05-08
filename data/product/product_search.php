<?php
header("Content-Type:application/json;charset=utf-8");
require_once("../init.php");

@$kw = $_REQUEST['kw'];

if($kw){
    $kws = explode(" ",$kw);
    
    for($i=0;$i<count($kws);$i++){
        $kws[$i] = " title LIKE '%".$kws[$i]."%'";
    }
    $search = implode(" AND ",$kws);
    $sql = "SELECT yuki_product_family.fid,
    yuki_product_list.plid,
    yuki_good_family.gfid,
    title,f_price,g_pic 
    FROM yuki_good_list 
    INNER JOIN yuki_good_family
    ON yuki_good_list.gfid=yuki_good_family.gfid 
    INNER JOIN yuki_product_list
    ON yuki_good_family.plid=yuki_product_list.plid
    INNER JOIN yuki_product_family
    ON yuki_product_list.fid=yuki_product_family.fid
    WHERE ".$search." GROUP BY gfid ";
    
}else{
    $sql = "SELECT yuki_product_family.fid,
    yuki_product_list.plid,
    yuki_good_family.gfid,
    title,f_price,g_pic 
    FROM yuki_good_list 
    INNER JOIN yuki_good_family
    ON yuki_good_list.gfid=yuki_good_family.gfid 
    INNER JOIN yuki_product_list
    ON yuki_good_family.plid=yuki_product_list.plid
    INNER JOIN yuki_product_family
    ON yuki_product_list.fid=yuki_product_family.fid
    GROUP BY gfid";
}

$result = mysqli_query($conn,$sql);
$data = mysqli_fetch_all($result,MYSQLI_ASSOC);
echo json_encode($data);
?>