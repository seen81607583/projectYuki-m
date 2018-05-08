<?php
header("Content-Type:application/json;charset=utf-8");
require_once("../init.php");
@$callback = $_GET['callback'];
@$uname = $_REQUEST['uname'];
@$upwd = $_REQUEST['upwd'];
$msg = [];
    if($uname&&$upwd){ 
        $reg = '/^[a-zA-Z0-9_]{6,18}$/';
        $res1 = preg_match($reg,$uname);
        $res2 = preg_match($reg,$upwd);
        if($res1&&$res2){
            $sql = "SELECT uid FROM yuki_user WHERE uname='$uname' AND BINARY upwd='$upwd'";
            $result = mysqli_query($conn,$sql);
            $user = mysqli_fetch_row($result);
            if($user){
                session_start();
                $_SESSION["uid"] = $user[0];
                $msg = ["code"=>1,"msg"=>"登录成功"];
            }else{
                $msg = ["code"=>-1,"msg"=>"登录失败，用户名或密码不正确"];
            }
            $msg =  json_encode($msg);
            echo $callback . '(' . $msg .')';
            
        }else{
            $msg = json_encode(["code"=>-1,"msg"=>"用户名或密码格式不正确"]);
            exit($callback . '(' . $msg .')');
        }
        
    }else if(!$uname){
        $msg = json_encode(["code"=>-1,"msg"=>"uname require"]);
        exit($callback . '(' . $msg .')');
    }else if(!$upwd){
        $msg = json_encode(["code"=>-1,"msg"=>"upwd require"]);
        exit($callback . '(' . $msg .')');
    }

    
?>