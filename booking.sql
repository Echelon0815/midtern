-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-11-11 15:28:37
-- 伺服器版本： 10.4.25-MariaDB
-- PHP 版本： 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `booking`
--

-- --------------------------------------------------------

--
-- 資料表結構 `coupon`
--

CREATE TABLE `coupon` (
  `id` int(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '優惠券名稱',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '優惠券序號',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '優惠券描述',
  `expire_date` datetime NOT NULL COMMENT '優惠券期限',
  `discount` int(20) NOT NULL COMMENT '優惠券折數',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `hotel_account`
--

CREATE TABLE `hotel_account` (
  `id` int(20) UNSIGNED NOT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '飯店帳號',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '飯店密碼',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '負責人',
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司名',
  `company_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司電話',
  `stars` int(20) NOT NULL COMMENT '星級',
  `company_banner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司橫幅圖',
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地區',
  `created_at` datetime NOT NULL COMMENT '建立帳號日期',
  `bank_account` int(20) NOT NULL COMMENT '銀行帳戶',
  `start_date` datetime NOT NULL COMMENT '開業日期',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司信箱',
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '官網',
  `introduction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司簡介',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `hotel_comment`
--

CREATE TABLE `hotel_comment` (
  `id` int(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'user.account',
  `hotel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'hotel_account.id',
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '評論',
  `comment_stars` int(20) NOT NULL COMMENT '評論星數',
  `created_at` datetime NOT NULL COMMENT '留言時間',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `hotel_room_list`
--

CREATE TABLE `hotel_room_list` (
  `id` int(20) NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'hotel_account.account',
  `room_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '房間名稱',
  `price` int(20) NOT NULL COMMENT '價格',
  `service` int(20) NOT NULL,
  `amount` int(20) NOT NULL COMMENT '賣多少份',
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '宣傳照片',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '房間說明',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `room_service_list`
--

CREATE TABLE `room_service_list` (
  `id` int(20) NOT NULL,
  `room` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'hotel_room_list.room_name',
  `pet` int(20) NOT NULL COMMENT '寵物',
  `tv` int(20) NOT NULL COMMENT '電視',
  `tub` int(20) NOT NULL COMMENT '浴缸',
  `meal` int(20) NOT NULL COMMENT '供餐',
  `mini_bar` int(20) NOT NULL COMMENT 'mini Bar',
  `window` int(20) NOT NULL COMMENT '有窗戶',
  `corner` int(20) NOT NULL COMMENT '邊間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `total_order_list`
--

CREATE TABLE `total_order_list` (
  `id` int(20) UNSIGNED NOT NULL,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'users.account',
  `product_id` int(255) NOT NULL COMMENT 'hotel_room_list.room_name / trip_event.trip_name',
  `status` int(20) NOT NULL COMMENT '是否付費',
  `order_date` datetime(6) NOT NULL COMMENT '訂購日期',
  `amount` int(20) NOT NULL COMMENT '訂單數'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `total_order_list_detail`
--

CREATE TABLE `total_order_list_detail` (
  `id` int(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'total_order_list.product_id',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
  `price` int(20) NOT NULL COMMENT '價格',
  `date` datetime NOT NULL COMMENT '行程日期',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '行程描述',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `travel_account`
--

CREATE TABLE `travel_account` (
  `id` int(20) UNSIGNED NOT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '飯店帳號',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '飯店密碼',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '負責人',
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司名',
  `company_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司電話',
  `company_banner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司橫幅圖',
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地區',
  `created_at` datetime NOT NULL COMMENT '建立帳號日期',
  `bank_account` int(20) NOT NULL COMMENT '銀行帳戶',
  `start_date` datetime NOT NULL COMMENT '開業日期',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司信箱',
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '官網',
  `introduction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司簡介',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `travel_account`
--

INSERT INTO `travel_account` (`id`, `account`, `password`, `name`, `company_name`, `company_phone`, `company_banner`, `area`, `created_at`, `bank_account`, `start_date`, `email`, `website`, `introduction`, `valid`) VALUES
(1, 'Axis0093', '123', 'Char', '紅色三倍速旅行社', '933333384', 'http://www.gundam-cca.net/img_top/mv.jpg', '新竹縣', '2022-11-04 09:43:13', 0, '2022-11-04 09:43:13', 'char@gmail.com', 'www.google.com', '提供登陸小行星的服務', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `trip_comment`
--

CREATE TABLE `trip_comment` (
  `id` int(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'user.account',
  `trip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'trip_event.id',
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '評論',
  `comment_stars` int(20) NOT NULL COMMENT '評論星數',
  `created_at` datetime NOT NULL COMMENT '留言時間',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `trip_event`
--

CREATE TABLE `trip_event` (
  `id` int(20) NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'travel_account.account',
  `trip_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '行程名稱',
  `price` int(20) NOT NULL COMMENT '價格',
  `start_date` date NOT NULL COMMENT '上架日期',
  `end_date` date NOT NULL COMMENT '下架日期',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '行程說明',
  `guide` int(20) NOT NULL COMMENT '有無導遊',
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '北中南、海外 (可複選)',
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '宣傳照片',
  `created_at` datetime NOT NULL,
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `trip_event`
--

INSERT INTO `trip_event` (`id`, `owner`, `trip_name`, `price`, `start_date`, `end_date`, `description`, `guide`, `location`, `picture`, `created_at`, `valid`) VALUES
(1, 'Axis0093', '舊金山賞鯨', 55555, '2022-11-12', '2022-11-26', '測試二', 0, 'northern,central,southern,eastern,oversea', 'dohpins_hotel.jpg,dolphins.webp', '2022-11-10 11:31:06', 0),
(2, 'Axis0093', 'TEST', 1000, '2022-11-05', '2022-11-26', '1234', 1, 'central,southern,eastern,oversea', 'frost.jpg', '2022-11-10 12:36:14', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `trip_service_list`
--

CREATE TABLE `trip_service_list` (
  `id` int(20) NOT NULL,
  `trip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'trip_event.trip_name',
  `mountain` int(20) NOT NULL COMMENT '登山踏青',
  `in_water` int(20) NOT NULL COMMENT '海邊、溪邊...',
  `snow` int(20) NOT NULL COMMENT '滑雪、雪上運動',
  `natural_attraction` int(20) NOT NULL COMMENT '自然景點:\r\n山，峽谷、瀑布..自然景觀',
  `culture_history` int(20) NOT NULL COMMENT '文化、歷史景點',
  `workshop` int(20) NOT NULL COMMENT '工作訪、手作體驗...',
  `amusement` int(20) NOT NULL COMMENT '遊樂園、童玩節...',
  `meal` int(20) NOT NULL COMMENT '包餐',
  `no_shopping` int(20) NOT NULL COMMENT '有無購物行程',
  `family_friendly` int(20) NOT NULL COMMENT '家庭活動',
  `pet` int(20) NOT NULL COMMENT '能帶寵物嗎',
  `indoor_outdoor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0:室內\r\n1:室外\r\n2:both',
  `custom_tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '以 comma (,)\r\n分隔，自定義的標籤'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `trip_service_list`
--

INSERT INTO `trip_service_list` (`id`, `trip`, `mountain`, `in_water`, `snow`, `natural_attraction`, `culture_history`, `workshop`, `amusement`, `meal`, `no_shopping`, `family_friendly`, `pet`, `indoor_outdoor`, `custom_tag`) VALUES
(1, '舊金山賞鯨', 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, '1,2', '123/123'),
(2, 'TEST', 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, '0', '123/123');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int(20) UNSIGNED NOT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳戶',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密碼',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `phone` int(20) NOT NULL COMMENT '電話',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '信箱',
  `identification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '身分證',
  `birthday` datetime NOT NULL COMMENT '生日',
  `gender` int(20) NOT NULL COMMENT '性別',
  `created_at` datetime NOT NULL COMMENT '創建時間',
  `points` int(20) NOT NULL COMMENT '點數',
  `level` int(20) NOT NULL COMMENT '等級',
  `coupon` int(20) NOT NULL COMMENT '優惠券',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `account`, `password`, `name`, `phone`, `email`, `identification`, `birthday`, `gender`, `created_at`, `points`, `level`, `coupon`, `valid`) VALUES
(1, 'admin', '12345', 'Tom', 123456789, 'god@777', '', '0000-00-00 00:00:00', 0, '2022-11-03 16:00:26', 0, 0, 0, 1),
(2, 'admin2', '1234', 'Jerry', 90454646, 'godd@77', '', '0000-00-00 00:00:00', 0, '2022-11-03 16:06:34', 0, 0, 0, 1),
(3, '', '', '', 0, '', '', '0000-00-00 00:00:00', 0, '2022-11-04 10:41:30', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `user_coupon`
--

CREATE TABLE `user_coupon` (
  `id` int(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'users.account',
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'coupon.name',
  `amount` int(20) NOT NULL COMMENT '優惠券數量',
  `expire_date` datetime NOT NULL COMMENT 'coupon.expire_date',
  `discount` int(20) NOT NULL COMMENT 'coupon.discount',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `user_order`
--

CREATE TABLE `user_order` (
  `id` int(6) UNSIGNED NOT NULL,
  `product_hotel_id` int(6) UNSIGNED NOT NULL COMMENT '對應product-hotel的id',
  `product-travel-id` int(6) NOT NULL COMMENT '對應product-travel的id',
  `amount` int(4) UNSIGNED NOT NULL,
  `buyer_id` int(3) NOT NULL COMMENT '對應一般使用者的id',
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `hotel_account`
--
ALTER TABLE `hotel_account`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `hotel_comment`
--
ALTER TABLE `hotel_comment`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `hotel_room_list`
--
ALTER TABLE `hotel_room_list`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `room_service_list`
--
ALTER TABLE `room_service_list`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `total_order_list`
--
ALTER TABLE `total_order_list`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `total_order_list_detail`
--
ALTER TABLE `total_order_list_detail`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `travel_account`
--
ALTER TABLE `travel_account`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `trip_comment`
--
ALTER TABLE `trip_comment`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `trip_event`
--
ALTER TABLE `trip_event`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `trip_service_list`
--
ALTER TABLE `trip_service_list`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_coupon`
--
ALTER TABLE `user_coupon`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `hotel_account`
--
ALTER TABLE `hotel_account`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `hotel_comment`
--
ALTER TABLE `hotel_comment`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `hotel_room_list`
--
ALTER TABLE `hotel_room_list`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `room_service_list`
--
ALTER TABLE `room_service_list`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `total_order_list`
--
ALTER TABLE `total_order_list`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `total_order_list_detail`
--
ALTER TABLE `total_order_list_detail`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `travel_account`
--
ALTER TABLE `travel_account`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `trip_comment`
--
ALTER TABLE `trip_comment`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `trip_event`
--
ALTER TABLE `trip_event`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `trip_service_list`
--
ALTER TABLE `trip_service_list`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_coupon`
--
ALTER TABLE `user_coupon`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_order`
--
ALTER TABLE `user_order`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
