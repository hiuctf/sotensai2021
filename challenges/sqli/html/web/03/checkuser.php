<?php
session_start();

$id = filter_input(INPUT_POST,"userid");
$pwd = filter_input(INPUT_POST,"password");
$db = new PDO("mysql:host=sqli;dbname=test","sqli","sqli");
$sql = "select * from test_user where user_id='$id' and password='$pwd'";
$ps = $db->query($sql);

if($ps->rowCount() > 0){
    $_SESSION["message"] = "ログインに成功しました！　flag : hiuctf{aafrnoe_nelsn}";
    header("Location: login.php");
    exit();
}
else{
    $_SESSION["message"] = "ログイン失敗です...";
    header("Location: login.php");
    exit();
}
?>