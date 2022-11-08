<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Admin Dashboard | Korsat X Parmaga</title>
    <!-- ======= Styles ====== -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/create-trip.css">
    <style>
        .main.active {
            width: calc(100% - 110px);
            left: 110px;
        }

        .navigation.active {
            width: 110px;
        }

        .details {
            grid-template-columns: 1fr 1fr;
        }

        @media (max-width: 768px) {
            .details {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>
    <!-- =============== Navigation ================ -->
    <div class="crud-container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="logo-apple"></ion-icon>
                        </span>
                        <span class="title">Brand Name</span>
                    </a>
                </li>

                <li>
                    <a href="admin.php">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">概要</span>
                    </a>
                </li>

                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="people-outline"></ion-icon>
                        </span>
                        <span class="title">會員</span>
                    </a>
                </li>

                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="chatbubble-outline"></ion-icon>
                        </span>
                        <span class="title">HOTEL</span>
                    </a>
                </li>

                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="help-outline"></ion-icon>
                        </span>
                        <span class="title">TRAVEL</span>
                    </a>
                </li>

                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="settings-outline"></ion-icon>
                        </span>
                        <span class="title">優惠卷</span>
                    </a>
                </li>

                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                        </span>
                        <span class="title">Password</span>
                    </a>
                </li>

                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                        <span class="title">Sign Out</span>
                    </a>
                </li>
            </ul>
        </div>

        <!-- ========================= Main ==================== -->
        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <div class="user">
                    <img src="assets/imgs/customer01.jpg" alt="">
                </div>
            </div>
            <!-- ================ Form ================= -->
            <div class="details">
            <div class="trip-event-form">
                  <fieldset class="name-price">
                    <legend class="h2">基本資料</legend>
                      <label for="trip_name">行程名稱</label>
                      <input type="text" name="trip_name" id="trip_name">
                      
                      <label for="price">價格<span>*</span></label>
                      <input type="text" name="price" id="price">
                  </fieldset>
                  <fieldset class="sell-date">
                    <legend>開放購買日期</legend>
                      <label for="start_date">開放日期<span>*</span></label>
                      <input type="date" name="start_date" id="start_date">
                    
                      <label for="end_date">截止日期<span>*</span></label>
                      <input type="date" name="end_date" id="end_date">
                  </fieldset>
                  <fieldset class="description">
                    <legend>行程介紹文案</legend>
                    <label for="description">文案內容<span>*</span></label>
                    <textarea  name="description" id="description" row="40" cols="40">
                    </textarea>
                  </fieldset>

                  <!--radio name屬性值得相同-->

                    <fieldset class="guide">
                        <legend>自助旅遊/團體旅遊</legend>
                          <label for="guideless">自助</label>
                          <input type="radio" name="guide" id="guideless" value="0">
                          <label for="guide">導遊帶隊</label>
                          <input type="radio" name="guide" id="guide" value="1">
                    </fieldset>


                    <fieldset class="location">
                      <legend>行程地點</legend>
                        <label for="northern">北部</label>
                        <input type="checkbox" id="northern" name="northern" value="1">
                        <label for="central">中部</label>
                        <input type="checkbox" id="central" name="central" value="1">
                        <label for="southern">南部</label>
                        <input type="checkbox" id="southern" name="southern" value="1">
                        <label for="eastern">東部</label>
                        <input type="checkbox" id="eastern" name="eastern" value="1">
                        <label for="oversea">海外</label>
                        <input type="checkbox" id="oversea" name="oversea" value="1">
                    </fieldset>

                    <fieldset class="picture">
                      <legend>宣傳照上傳</legend>
                      <input type="file" name="picture" id="picture">
                    </fieldset>
    </div>
    <!--行程特色表單-->
    <div class="trip-service-list-form">
                    <!--說明-->
                    <h2>行程特色設定<small>※設定屬性以供使用者篩選；至少選填一項</small></h2>
                    <fieldset class="major-tag">
                      <legend>熱門屬性</legend>
                        <label for="mountain">登山踏青</label>
                        <input type="checkbox" name="mountain" id="mountain" value="1">
                        <label for="in_water">水上活動</label>
                        <input type="checkbox" name="in_water" id="in_water" value="1">
                        <label for="snow">雪上活動</label>
                        <input type="checkbox" name="snow" id="snow" value="1">
                    </fieldset>
                    <fieldset class="normal-tag">
                      <legend>行程內容</legend>
                        <label for="natural_attraction">大自然</label>
                        <input type="checkbox" name="natural_attraction" id="natural_attraction" value="1">
                        <label for="culture_history">歷史人文</label>
                        <input type="checkbox" name="culture_history" id="culture_history" value="1">
                        <label for="workshop">工作坊/活動體驗</label>
                        <input type="checkbox" name="workshop" id="workshop" value="1">
                        <label for="amusement">遊樂園、特殊節慶</label>
                        <input type="checkbox" name="amusement" id="amusement" value="1">
                    </fieldset>
                    <fieldset class="other-tag">
                      <legend>其他屬性</legend>
                      <label for="meal">包餐</label>
                      <input type="checkbox" name="meal" id="meal" value="1">
                      <label for="no_shopping">無購物行程</label>
                      <input type="checkbox" name="no_shopping" id="no_shopping" value="1">
                      <label for="family-friendly">適合全家出遊</label>
                      <input type="checkbox" name="family-friendly" id="family-friendly" value="1">
                      <label for="pet">寵物ok</label>
                      <input type="checkbox" name="pet" id="pet" value="1">
                      <div class="indoor-outdoor">
                      <label for="indoor">室內</label>
                      <input type="checkbox" name="indoor_outdoor[]" id="indoor" value="0">
                      <label for="outdoor">室外</label>
                      <input type="checkbox" name="indoor_outdoor[]" id="outdoor" value="1">
                      <label for="both">遊樂園、特殊節慶</label>
                      <input type="checkbox" name="indoor_outdoor[]" id="both" value="2">
                      </div>
                    </fieldset>
                    <fieldset class="custom-tag">
                      <legend>自定義屬性</legend>
                      <p>顯示在介紹文中、可用於關鍵字搜尋<small>※最多五個，以半形comma(,)隔開</small></p>
                      <label for="custom_tag">請輸入</label>
                      <input type="text" name="custom_tag[]" id="custom_tag" placeholder="A,B,C,D,E">
                    </fieldset>
                    <button type="submit">送出</button>
      </div>
      </form>
    <!--表單結束-->
            </div>
        </div>
    </div>

    <!-- =========== Scripts =========  -->
    <script src="assets/js/main.js"></script>

    <!-- ====== ionicons ======= -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>