<?php
//首页热销推荐数据
header("Content-Type:application/json;charset=utf-8");
require_once("../init.php");

$sql = "SELECT yuki_product_family.fid,yuki_product_list.plid,gid,yuki_good_family.gfid,title,f_price,g_pic 
FROM yuki_good_list 
INNER JOIN yuki_good_family 
ON yuki_good_list.gfid=yuki_good_family.gfid 
INNER JOIN yuki_product_list
ON yuki_good_family.plid=yuki_product_list.plid
inner JOIN yuki_product_family
ON yuki_product_list.fid=yuki_product_family.fid 
WHERE yuki_good_list.isSalse=1 
GROUP BY gfid 
ORDER BY gfid DESC LIMIT 4";
$result = mysqli_query($conn,$sql);
$data = mysqli_fetch_all($result,MYSQLI_ASSOC);
echo json_encode($data);
?>