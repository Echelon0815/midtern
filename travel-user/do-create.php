<?php
require_once('var_dump_pre.php');

//我找來的var_dump函式
require_once('db-connect.php');
// $testArr = [];
// $testArr = $_POST;
// var_dump_pre($testArr);

//暫時先用一個假的account名帶進去，還沒寫session
$account = 'Axis0093';

//上傳資料到 trip_event 的語法
$trip_name = $_POST['trip_name'];
$price = $_POST['price'];
$start_date = $_POST['start_date'];
$end_date = $_POST['end_date'];
$description = $_POST['description'];
$guide = $_POST['guide'];
$location = $_POST['location'];
$location_str = implode(',', $location);
$picture = $_FILES['picture']['name'];
$created_at = date('Y-m-d H:i:s');
$valid = $_POST['valid'];
var_dump_pre($location);
var_dump_pre($location_str);
var_dump_pre($picture);
var_dump_pre($_FILES);
$sql = "INSERT INTO 'trip_event' ('owner','trip_name','price','start_date','end_date','description','guide','location','picture','created_at') VALUE ($account,$trip_name,$price,$start_date,$end_date,$description,$guide,$location_str,$picture,$created_at)";

//上傳資料到trip_service_list 的語法
$mountain = $_POST['mountain'];
$in_water = $_POST['in_water'];
$snow = $_POST['snow'];
$natural_attraction = $_POST['natural_attraction'];
$culture_history = $_POST['culture_history'];
$workshop = $_POST['workshop'];
$amusement = $_POST['amusement'];
$meal = $_POST['meal'];
$no_shopping = $_POST['no_shopping'];
$family_friendly = $_POST['family_friendly'];
$pet = $_POST['pet'];
$indoor_outdoor = $_POST['indoor_outdoor'];
$indoor_outdoor_str = implode(',', $indoor_outdoor);
$custom_tag = $_POST['custom_tag'];
$custom_tag_str = implode(',', $custom_tag);
var_dump_pre($trip_name);
var_dump_pre($mountain);
var_dump_pre($in_water);
var_dump_pre($snow);
var_dump_pre($natural_attraction);
var_dump_pre($culture_history);
var_dump_pre($workshop);
var_dump_pre($amusement);
var_dump_pre($meal);
var_dump_pre($no_shopping);
var_dump_pre($family_friendly);
var_dump_pre($pet);
var_dump_pre($indoor_outdoor);
var_dump_pre($indoor_outdoor_str);
var_dump_pre($custom_tag);
var_dump_pre($custom_tag_str);
// .= 內容添加到上一個sql 下方
$sql .= "INSERT INTO 'trip_service_list' ('trip','mountain','in_water','snow','natural_attraction','culture_history','workshop','amusement','meal','no_shopping','family_friendly','pet','indoor_outdoor','custom_tag') VALUE ($trip_name,$mountain,$in_water,$snow,$natural_attraction,$culture_history,$workshop,$amusement,$meal,$no_shopping,$family_friendly,$pet,$indoor_outdoor_str,$custom_tag_str)";

//上傳一或多張圖片


//確認連線 執行多個query上傳資料
if ($conn->query($sql) === TRUE) {
    echo "新增資料完成";
} else {
    echo "新增資料錯誤: " . $conn->error;
}

$conn->close();

// header("location:create-trip.php");
