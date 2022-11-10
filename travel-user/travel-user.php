<?php
require_once("./db-connect.php");
require_once('var_dump_pre.php');

$sqlTrip = "SELECT * FROM trip_event";
$result = $conn->query($sqlTrip);
$rows = $result->fetch_all(MYSQLI_ASSOC);
// var_dump_pre($pictureArr);
// var_dump_pre($banner);
// var_dump($rows);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RWD後台</title>
    <!-- ======= Styles ====== -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" href="./assets/css/style2.css">
    <style>
        .search label ion-icon {
            position: absolute;
            top: 11px;
            left: 10px;
            font-size: 1.2rem;
        }

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


        .details .recentOrders table tbody tr a {
            text-decoration: none;
        }

        .details .recentOrders table tbody tr:hover a {
            background: var(--blue);
            color: var(--white);

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
                        <span class="title">Booking</span>
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
                    <a href="create-trip.php">
                        <span class="icon">
                            <ion-icon name="people-outline"></ion-icon>
                        </span>
                        <span class="title">上架</span>
                    </a>
                </li>

                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="chatbubble-outline"></ion-icon>
                        </span>
                        <span class="title">產品一覽</span>
                    </a>
                </li>

                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="help-outline"></ion-icon>
                        </span>
                        <span class="title">公司資料修改</span>
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

                <!-- <div class="search">
                    <form action="admin.php" method="get">
                        <label>
                            <input type="text" placeholder="Search here" class="form-control" name="search">
                            <ion-icon name="search-outline"></ion-icon>
                            <button type="submit" class="btn btn-info">搜尋</button>
                        </label>
                    </form>
                </div>   -->
                <div class="user">
                    <img src="assets/imgs/customer01.jpg" alt="">
                </div>
            </div>

            <!-- ======================= Cards ================== -->
            <div class="cardBox">
                <div class="card">
                    <div>
                        <div class="numbers">12</div>
                        <div class="cardName">本周團數</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="accessibility-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div class="omote">
                        <div class="numbers">80</div>
                        <div class="cardName">客人評論數</div>
                    </div>

                    <!-- <div class="ura">
                        <div class="numbers">80</div>
                        <div class="cardName">平均評論等級</div>
                    </div> -->

                    <div class="iconBx">
                        <ion-icon name="chatbubbles-outline"></ion-icon>
                    </div>

                </div>

                <div class="card">
                    <div class="omote">
                        <div class="numbers">284</div>
                        <div class="cardName">線上成交量</div>
                    </div>
                    <!-- <div class="ura">
                        <div class="numbers">284</div>
                        <div class="cardName">上個月成交量</div>
                    </div> -->
                    <div class="iconBx">
                        <ion-icon name="cart-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div class="omote">
                        <div class="numbers">$7,842</div>
                        <div class="cardName">成交額</div>
                    </div>
                    <!-- <div class="ura">
                        <div class="numbers">$7,842</div>
                        <div class="cardName">稅後淨利</div>
                    </div> -->

                    <div class="iconBx">
                        <ion-icon name="cash-outline"></ion-icon>
                    </div>
                </div>
            </div>

            <!-- ================ Order Details List ================= -->
            <div class="details">
                <div class="companyDetail">
                    <div class="cardHeader">
                        <h2>公司資料</h2>
                    </div>
                    <div class="data-wrapper w-100">
                        <div class="topic">帳號：</div>
                        <div class="content">Axis0001</div>
                    </div>
                    <div class="data-wrapper w-100">
                        <div class="topic">密碼：</div>
                        <div class="content">Axispassword</div>
                    </div>
                </div>

                <!-- ================= New Customers ================ -->
                <div class="products">
                    <div class="cardHeader">
                        <h2>行程規劃</h2>
                    </div>
                    <?php foreach ($rows as $product) : ?>
                        <?php $pictureArr = explode(',',$product['picture']); ?>
                        <div class="products-items my-2">
                            <div class="titlecard">
                                <div class="products-control">
                                    <h4><?= $product["trip_name"] ?></h4>
                                </div>
                                <img src="./assets/imgs/<?=$pictureArr[0]?>" alt="">
                            </div>
                            <div class="products-summary">
                                <h5 class="start-date">上架日：
                                    <span><?= $product["start_date"] ?></span>
                                </h5>
                                <h5 class="price">價格：
                                    <span>NT$<?= $product["price"] ?></span>
                                </h5>
                                <h5 class="comment-star">評價：
                                    <span>5</span>
                                </h5>
                                <a class="bg-danger" href="javascript:void(0)">刪除</a>
                            </div>
                            <!-- <a class="btn btn-danger" href="javascript:void(0)">刪除</a> -->
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </div>

    <!-- =========== Scripts =========  -->
    <script src="./assets/js/main2.js"></script>


    <!-- ====== ionicons ======= -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>