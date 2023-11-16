-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 16, 2023 lúc 09:35 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laravel_phananhtaiapi`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_brand`
--

CREATE TABLE `db_brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `metakey` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `trash` varchar(255) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_brand`
--

INSERT INTO `db_brand` (`id`, `name`, `slug`, `image`, `sort_order`, `metakey`, `metadesc`, `description`, `trash`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(24, 'CALVIN KLEIN', 'calvin-klein', 'calvin-klein.png', 0, 'CALVIN KLEIN', 'CALVIN KLEIN', NULL, '0', 1, NULL, 1, '2023-06-09 17:39:50', '2023-06-09 17:39:50'),
(25, 'ROTARY', 'rotary', 'rotary.jpeg', 0, 'ROTARY', 'ROTARY', NULL, '0', 1, NULL, 1, '2023-06-09 17:39:38', '2023-06-09 17:39:38'),
(26, 'TISSOT', 'tissot', 'tissot.png', 0, 'TISSOT', 'TISSOT', NULL, '0', 1, NULL, 1, '2023-06-09 17:39:24', '2023-06-09 17:39:24'),
(27, 'MIDO', 'mido', 'mido.png', 0, 'MIDO', 'MIDO', NULL, '0', 1, NULL, 1, '2023-06-09 17:39:12', '2023-06-09 17:39:12'),
(28, 'CHARRIOL', 'charriol', 'charriol.jpg', 0, 'CHARRIOL', 'CHARRIOL', NULL, '0', 1, NULL, 1, '2023-06-09 17:54:51', '2023-11-16 01:20:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_category`
--

CREATE TABLE `db_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `metakey` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `trash` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_category`
--

INSERT INTO `db_category` (`id`, `name`, `slug`, `image`, `parent_id`, `sort_order`, `metakey`, `metadesc`, `description`, `trash`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(16, 'ĐỒNG HỒ NAM', 'dong-ho-nam', 'dong-ho-nam.jpg', 0, 0, 'ĐỒNG HỒ NAM', 'ĐỒNG HỒ NAM', NULL, '0', '2023-06-29 21:23:50', '2023-06-29 21:23:50', 1, NULL, 1),
(17, 'ĐỒNG HỒ NỮ', 'dong-ho-nu', 'dong-ho-nu.jpg', 0, 0, 'ĐỒNG HỒ NỮ', 'ĐỒNG HỒ NỮ', NULL, '0', '2023-06-29 21:23:58', '2023-06-29 21:23:58', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_config`
--

CREATE TABLE `db_config` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zalo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) UNSIGNED DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_contact`
--

CREATE TABLE `db_contact` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `content` mediumtext NOT NULL,
  `trash` varchar(255) NOT NULL DEFAULT '0',
  `replay_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_contact`
--

INSERT INTO `db_contact` (`id`, `user_id`, `name`, `email`, `phone`, `title`, `content`, `trash`, `replay_id`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(21, 0, 'Anh Tài', 'phananhtai@gmail.com', '0397901748', 'Anh Tài', 'Anh Tài', '0', NULL, 1, NULL, 1, '2023-06-27 09:49:23', '2023-11-14 17:11:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_customer`
--

CREATE TABLE `db_customer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `trash` varchar(255) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_menu`
--

CREATE TABLE `db_menu` (
  `id` int(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort_order` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(1000) DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `position` varchar(255) NOT NULL,
  `trash` varchar(255) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_menu`
--

INSERT INTO `db_menu` (`id`, `name`, `link`, `sort_order`, `type`, `table_id`, `parent_id`, `position`, `trash`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Trang Chủ', '/', NULL, NULL, NULL, 0, 'mainmenu', '0', 1, NULL, 1, '2023-06-11 06:50:44', '2023-06-11 06:50:44'),
(2, 'Sản Phẩm', 'san-pham', NULL, NULL, NULL, 0, 'mainmenu', '0', 1, NULL, 1, '2023-06-11 06:50:50', '2023-06-11 06:50:50'),
(3, 'Liên Hệ', 'lien-he', NULL, NULL, NULL, 0, 'mainmenu', '0', 1, NULL, 1, '2023-06-11 06:50:57', '2023-06-11 06:50:57'),
(4, 'Bài Viết', 'bai-viet', NULL, NULL, NULL, 0, 'mainmenu', '0', 1, NULL, 1, '2023-06-11 06:50:50', '2023-06-11 06:50:50'),
(5, 'Danh Mục Sản Phẩm ', '', NULL, NULL, NULL, 0, 'mainmenu', '0', 1, NULL, 1, '2023-06-11 06:50:57', '2023-06-11 06:50:57'),
(6, 'Đồng Hồ Nữ', 'danh-muc-san-pham/dong-ho-nu', NULL, NULL, NULL, 5, 'mainmenu', '0', 1, NULL, 1, '2023-06-11 06:55:59', '2023-06-11 06:55:59'),
(7, 'Đồng Hồ Nam', 'danh-muc-san-pham/dong-ho-nam', NULL, NULL, NULL, 5, 'mainmenu', '0', 1, NULL, 1, '2023-06-11 06:51:39', '2023-06-11 06:51:40'),
(8, 'Chủ Đề', '', NULL, NULL, NULL, 0, 'mainmenu', '0', 1, NULL, 1, '2023-06-11 06:50:57', '2023-06-11 06:50:57'),
(9, 'Cấu Tạo Đồng Hồ', 'chu-de-bai-viet/cau-tao-dong-ho', NULL, NULL, NULL, 8, 'mainmenu', '0', 1, NULL, 1, '2023-06-27 07:55:39', '2023-06-27 07:55:39'),
(31, 'Giá Trị Của Đồng Hồ', 'chu-de-bai-viet/gia-tri-cua-dong-ho', NULL, NULL, NULL, 8, 'mainmenu', '0', 1, NULL, 1, '2023-06-27 09:44:00', '2023-06-27 09:44:00'),
(33, 'Chính sách vận chuyển', '/chinh-sach-van-chuyen', NULL, NULL, NULL, 1, 'footermenu', '0', 1, NULL, 1, '2023-06-29 23:48:57', '2023-06-29 23:48:57'),
(34, 'Chính sách mua hàng', '/chinh-sach-mua-hang', NULL, NULL, NULL, 1, 'footermenu', '0', 1, NULL, 1, '2023-06-29 23:48:57', '2023-06-29 23:48:57'),
(35, 'Chính sách bảo hành', '/chinh-sach-bao-hanh', NULL, NULL, NULL, 1, 'footermenu', '0', 1, NULL, 1, '2023-06-29 23:48:57', '2023-06-29 23:48:57'),
(36, 'Chính sách đổi trả', '/chinh-sach-doi-tra', NULL, NULL, NULL, 1, 'footermenu', '0', 1, NULL, 1, '2023-06-29 23:48:57', '2023-06-29 23:48:57'),
(37, 'Trang Chủ', '/', NULL, NULL, NULL, 0, 'footermenu', '0', 1, NULL, 1, '2023-06-11 06:50:44', '2023-06-11 06:50:44'),
(38, 'Sản Phẩm', 'san-pham', NULL, NULL, NULL, 0, 'footermenu', '0', 1, NULL, 1, '2023-06-11 06:50:50', '2023-06-11 06:50:50'),
(39, 'Liên Hệ', 'lien-he', NULL, NULL, NULL, 0, 'footermenu', '0', 1, NULL, 1, '2023-06-11 06:50:57', '2023-06-11 06:50:57'),
(40, 'Giới thiệu', 'gioi-thieu', NULL, NULL, NULL, 0, 'footermenu', '0', 1, NULL, 1, '2023-06-11 06:50:57', '2023-06-11 06:50:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_order`
--

CREATE TABLE `db_order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `trash` varchar(255) NOT NULL DEFAULT '0',
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_order`
--

INSERT INTO `db_order` (`id`, `user_id`, `name`, `gender`, `email`, `phone`, `address`, `note`, `trash`, `updated_by`, `created_by`, `status`, `created_at`, `updated_at`) VALUES
(25, 19, 'ĐỒNG HỒ NAM CALVIN KLEIN INFINITE K5S341C6', NULL, 'khanhduy@gmail.com', '0123698745', '12 Quang Trung, Hồ Chí Minh', 'Giao hàng vào buổi sáng', '0', NULL, 1, 1, '2023-06-29 21:21:11', '2023-11-14 17:04:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_orderdetail`
--

CREATE TABLE `db_orderdetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `discount` double UNSIGNED DEFAULT NULL,
  `amount` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_policy`
--

CREATE TABLE `db_policy` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `detail` mediumtext NOT NULL,
  `metakey` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `trash` varchar(255) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_policy`
--

INSERT INTO `db_policy` (`id`, `title`, `slug`, `detail`, `metakey`, `metadesc`, `trash`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giới Thiệu', 'sd', 'WATCHSTORE là một thương hiệu đồng hồ mới được thành lập tại Việt Nam,\n                    nhưng đã nhanh chóng thu hút sự quan tâm của người tiêu dùng bởi sự độc đáo và chất lượng của sản phẩm.\n                    Với cam kết cung cấp những sản phẩm đồng hồ và trang sức cao cấp,\n                    WATCHSTORE đã trở thành một trong những thương hiệu được đánh giá cao tại thị trường đồng hồ hiện nay.\n                Tầm nhìn của công ty WATCHSTORE là trở thành thương hiệu đồng hồ và trang sức cao cấp hàng đầu tại Việt Nam,\n                    với khách hàng tin tưởng và hài lòng. Sứ mệnh của chúng tôi là mang đến cho khách hàng những sản phẩm\n                    đồng hồ và trang sức chất lượng cao, thiết kế đẹp mắt, đa dạng về mẫu mã và phong cách, đáp ứng nhu cầu\n                    và gu thẩm mỹ của từng khách hàng.\n                Lịch sử của công ty WATCHSTORE được khởi đầu từ năm 2022, khi công ty chính thức ra mắt thị trường đồng hồ và trang sức.\n                    Với tầm nhìn và sứ mệnh đã đề ra, WATCHSTORE không ngừng nỗ lực để nâng cao chất lượng sản phẩm,\n                    tăng cường dịch vụ chăm sóc khách hàng và mở rộng thị trường phục vụ đa dạng khách hàng từ các thành phố lớn đến vùng sâu vùng xa.\n               Giá trị cốt lõi của công ty WATCHSTORE là cam kết mang đến cho khách hàng những sản phẩm chính hãng, đúng giá trị với chất lượng và thiết kế đẹp mắt.\n                    Chúng tôi luôn lắng nghe và đáp ứng nhu cầu của khách hàng,\n                    xây dựng niềm tin và sự hài lòng của khách hàng là mục tiêu hàng đầu trong mọi hoạt động của công ty.\n                 Với đội ngũ nhân viên tận tâm và chuyên nghiệp, công ty WATCHSTORE đã và đang ngày càng khẳng định vị thế của mình trên thị trường đồng hồ và trang sức tại Việt Nam.\n                    Chúng tôi mong muốn trở thành đối tác đáng tin cậy của khách hàng trong lĩnh vực này và tiếp tục phát triển bền vững trong tương lai.\n                Ngoài những thông tin về lịch sử, tầm nhìn, sứ mệnh và giá trị cốt lõi của công ty đồng hồ WATCHSTORE, chúng tôi cũng rất mong muốn được đem đến\n                    cho khách hàng những sản phẩm chất lượng và dịch vụ hoàn hảo.\n                Nếu quý khách quan tâm đến các sản phẩm của chúng tôi hoặc muốn biết thêm thông tin, xin vui lòng liên hệ theo địa chỉ sau:\n                Địa chỉ: 103 Phường Tăng Nhơn Phú B, Quận 9, TP. Hồ Chí Minh\n                    Số điện thoại: 0397 901 748\n                    Email: WATCHSTORE@gmail.com\n                    Chúng tôi sẽ nhanh chóng phản hồi và giải đáp mọi thắc mắc của quý khách. Cảm ơn quý khách đã quan tâm và lựa chọn sản phẩm của WATCHSTORE.', 'ds', 'sd', '0', 1, NULL, 2, NULL, NULL),
(2, 'Chính Sách Đổi Trả', '1', 'Tại WATCHSTORE, chúng tôi cam kết mang đến trải nghiệm mua sắm đồng hồ tốt nhất cho khách hàng. Chúng tôi hiểu rằng \n                đôi khi sản phẩm không đáp ứng được mong đợi của khách hàng, do đó chúng tôi cung cấp chính sách đổi hàng miễn phí trong vòng 7 ngày kể từ ngày mua sản phẩm.\n  Chính sách đổi hàng của WATCHSTORE áp dụng cho khách hàng mua sắm trực tuyến hoặc tại các cửa hàng của chúng tôi trên toàn quốc. \n                Nếu Quý khách mua hàng trực tuyến, bạn có thể đổi sản phẩm trực tiếp tại các cửa hàng của WATCHSTORE hoặc đổi qua đường bưu điện. Nếu Quý khách mua hàng trực tiếp tại cửa hàng, \n                vui lòng đổi sản phẩm tại cửa hàng mua ban đầu.\n                Điều kiện đổi sản phẩm của WATCHSTORE bao gồm:\n              Yêu cầu đổi hàng được thực hiện trong vòng 7 ngày kể từ ngày Quý khách nhận được sản phẩm.\n               Sản phẩm chưa qua sử dụng và còn lớp keo bọc bên ngoài.\n                Sản phẩm không trầy xước, không bị ngấn dây, dây da chưa đeo và các bộ phận, linh kiện, phụ kiện, tài liệu hướng dẫn sử dụng,\n                 tài liệu kỹ thuật, quà tặng kèm theo (nếu có) phải còn đầy đủ và không có dấu hiệu đã qua sử dụng.\n                 Hộp đựng, bao bì đóng gói sản phẩm còn nguyên vẹn, không bị móp, rách, ố vàng,…\n                 Quý khách chỉ được đổi sản phẩm 1 lần duy nhất (bằng giá hoặc cao hơn) và sản phẩm mới phải là sản phẩm mới 100%. \n                 Điều này chỉ áp dụng nếu sản phẩm đã có dấu hiệu lỗi từ nhà sản xuất. Chúng tôi mong muốn Quý khách đọc kỹ chính sách đổi hàng để đảm bảo sản phẩm đổi được\n                  đáp ứng các điều kiện nêu trên và giúp chúng tôi đáp ứng tốt hơn nhu cầu của Quý khách.\n                  WATCHSTORE luôn tôn trọng quyền lợi của khách hàng và cam kết cung cấp sản phẩm và dịch vụ chất lượng nhất. Nếu quý khách hàng có \n                  bất kỳ thắc mắc, góp ý hay khiếu nại \n                  nào về sản phẩm hoặc dịch vụ của WATCHSTORE, vui lòng liên hệ với chúng tôi qua hotline hoặc email được hiển thị trên trang web của chúng tôi.\n                  Chúng tôi sẽ nhanh chóng xem xét và giải quyết các vấn đề của quý khách hàng trong thời gian sớm nhất. Chúng tôi \n                  mong muốn mang lại sự hài lòng và tin tưởng tuyệt đối từ khách hàng và sẽ luôn cố gắng để nâng cao chất lượng sản phẩm và dịch vụ của mình.\n                  Ngoài ra, WATCHSTORE cũng cung cấp hệ thống bảo hành chuyên nghiệp để đảm bảo quyền lợi của khách hàng. Chúng tôi cam kết \n                  sẽ đáp ứng mọi yêu cầu bảo hành của khách hàng với tinh thần trách nhiệm cao nhất và đảm bảo sự tiện lợi và nhanh chóng cho khách hàng.', '1', '1', '0', 1, NULL, 2, NULL, NULL),
(3, 'Chính Sách Mua Hàng', '1', '1: Thanh toán chuyển khoản\n               QUÝ KHÁCH VUI LÒNG CK QUA TÀI KHOẢN MBBANK CỦA CTY CHÚNG TÔI QUA SỐ TÀI KHOẢN:\n                Chủ tài khoản: Phan Anh Tài\n               Số tài khoản: 0397901748\n             Lưu ý: Chỉ nên chuyển khoản sau khi đội ngũ nhân viên viên của WATCHSTORE gọi điện xác nhận.\n                    Sau khi chúng tôi nhận tiền, WATCHSTORE sẽ tiến hành xử lý đơn hàng cho bạn, trường hợp bạn không nhận hàng với bất cứ lý do gì chúng tôi\n                    sẽ tiến hành hoàn tiền lại cho bạn (bạn chỉ phải trả cho chúng tôi 1 khoản phí nho nhỏ cho bên vận chuyển thu).\n\n              2: Thanh toán khi nhận hàng\n               Đây là hình thức thuận tiện nhất dành cho khách hàng ở khắp mọi nơi trên lãnh thổ Việt Nam.\n             Bước 1: Quý khách gọi điện tới số Hotline của công ty chúng tôi hoặc đặt hàng online ngay trên website watchstore.vn\n            Bước 2: WATCHSTORE.vn sẽ tiến hành gọi điện để xác nhận đơn hàng sau đó sẽ tiến hành điền thông tin vào phiếu bảo hành và giao hàng.\n              Bước 3:Quý khách kiểm tra hàng thật kỹ, kiểm tra đúng seri trên phiếu bảo hành và trên hộp đồng hồ, nếu thấy tem niêm phong\n                    của WATCHSTORE có dấu hiệu bị rách vui lòng gọi điện ngay cho chúng tôi để đối chiếu. Nếu kiểm tra hàng đúng chất lượng thì quý khách mới phải thanh toán tiền. Nếu bạn không\n                    hài lòng có thể từ chối nhận hàng.\n                Đặc biệt khi nhận hàng, Quý khách được phép mở hàng ra và thử hàng ngay trên tay.\n                Nếu phát hiện ra lỗi của nhà sản xuất, trong vòng 30 ngày kể từ ngày mua sản phẩm, khách hàng được phép đổi sang sản phẩm khác mới 100% với đầy đủ giấy tờ và phụ kiện đi kèm.', '1', '1', '0', 1, NULL, 2, NULL, NULL),
(4, 'Chính Sách Vận Chuyển', '1', 'PHƯƠNG THỨC VẬN CHUYỂN VÀ GIAO HÀNG\nĐối tượng và phạm vi vận chuyển\nWATCHSTORE cung cấp phương thức vận chuyển trên toàn quốc và áp dụng cho tất cả các kênh mua sắm Online và tại cửa hàng của WATCHSTORE.\nPhí giao hàng\nMIỄN PHÍ: Áp dụng với các sản phẩm đồng hồ cao cấp.\nĐỒNG GIÁ: Áp dụng với các sản phẩm khác với mức phí vận chuyển nhẹ nhàng và hợp lý.\nThời gian giao hàng\n1. Dịch vụ giao hàng tiết kiệm:\nThời gian giao hàng trung bình là 2-3 ngày đối với khu vực trung tâm thành phố và 3-7 ngày đối với khu vực ngoại thành, huyện, xã, thị trấn.\nThời gian xử lý đơn hàng sẽ bắt đầu tính từ khi WATCHSTORE xác nhận đã nhận được thanh toán từ quý khách.\nWATCHSTORE có thể thay đổi thời gian giao hàng tùy theo yêu cầu của khách hàng hoặc trong trường hợp thiên tai hoặc sự kiện đặc biệt.\n2. Dịch vụ giao hàng nhanh:\nWATCHSTORE cung cấp dịch vụ giao hàng nhanh trong vòng 24 giờ với phí dịch vụ hợp lý và tùy theo từng thời điểm trong ngày. Để biết thêm thông tin và được hỗ trợ, khách hàng có thể gọi đến số Hotline của WATCHSTORE.\n3. Cách kiểm tra đơn hàng:\nĐể kiểm tra thông tin hoặc tình trạng đơn hàng, quý khách hàng vui lòng liên hệ trực tiếp với WATCHSTORE qua số điện thoại Hotline hoặc truy cập vào trang web để kiểm tra thông tin. WATCHSTORE đảm bảo khách hàng sẽ được kiểm tra hàng trước khi thanh toán và giữ lại biên lai vận chuyển trong trường hợp cần đối chiếu.\nWATCHSTORE luôn cam kết cung cấp dịch vụ vận chuyển và giao hàng tốt nhất để đồng hành cùng khách hàng trên hành trình chinh phục phong cách sống đẳng cấp.\nĐồng thời, WATCHSTORE cũng cam kết đem đến cho khách hàng những trải nghiệm mua sắm online tuyệt vời nhất với phương thức vận chuyển và giao hàng thuận tiện, đảm bảo an toàn và nhanh chóng.\nVới đội ngũ nhân viên giàu kinh nghiệm và tay nghề cao, WATCHSTORE sẽ đảm bảo rằng mọi đơn hàng đều được xử lý và vận chuyển một cách nhanh chóng và chính xác. Khách hàng có thể yên tâm đặt hàng trên website của chúng tôi hoặc tại cửa hàng trực tiếp, vì WATCHSTORE sẽ đáp ứng mọi yêu cầu vận chuyển từ khách hàng.\nĐối với sản phẩm đồng hồ, WATCHSTORE áp dụng chính sách miễn phí giao hàng trên toàn quốc. Đối với các sản phẩm khác, WATCHSTORE áp dụng phí giao hàng đồng giá 30k trên toàn quốc.\nThời gian giao hàng của WATCHSTORE cũng được cam kết rất nhanh chóng và đảm bảo. Với dịch vụ giao hàng tiết kiệm, thời gian là 2-3 ngày đối với khu vực trung tâm tỉnh thành phố và 3-7 ngày đối với khu vực ngoại thành, huyện, xã, thị trấn. Đối với dịch vụ giao hàng siêu tốc, WATCHSTORE cung cấp dịch vụ giao hàng trong 2 giờ đối với khách hàng tại khu vự c Hồ Chí Minh, Biên Hòa, Thủ Dầu Một, Vũng Tàu và Cần Thơ.\nNếu khách hàng có bất kỳ thắc mắc nào liên quan đến đơn hàng, hãy inbox trực tiếp Fanpage của chúng tôi hoặc gọi đến số Hotline (0938102101) để được hỗ trợ tận tình và chuyên nghiệp. WATCHSTORE xin cam kết sẽ luôn cung cấp dịch vụ vận chuyển và giao hàng tốt nhất để đồng hành cùng khách hàng trên hành trình chinh phục phong cách sống đẳng cấp.', '1', '1', '0', 1, NULL, 2, NULL, NULL),
(5, 'Chính Sách Bảo Hành', '1', 'Chào mừng bạn đến với WATCHSTORE!\n              Hãy đọc kỹ chính sách bảo hành của chúng tôi để chúng ta có tiếng nói chung\n                    trong khâu bảo hành và tránh tình trạng tranh chấp giữa WATCHSTORE.vn với khách hàng. Tiêu chí của chúng tôi là:\n                    \"Tạo điều kiện hết sức cho mọi khách hàng\".\n                THẺ hoặc SỔ BẢO HÀNH chính thức này được WATCHSTORE ghi đầy đủ và chính xác\n                    các thông tin của đồng hồ như: Thông tin khách hàng, mã sản phẩm, thời gian bảo hành, cơ sở bảo hành.\n               DUY NHẤT TẠI WATCHSTORE.VN\n                1: Bạn sẽ được bảo hành trọn gói 5 nămtính từ ngày mua tại WATCHSTORE.\n                2: Ngoài ra, riêng đối với dòng đồng hồ Casio, Pin\n                    của đồng hồ bạn mua tại hệ thống của WATCHSTORE.vn sẽ được thay thế miễn phí trọn đời (không áp dụng pin năng lượng từ ánh sáng,\n                    loại pin này sẽ áp dụng theo các chính sách bảo hành kèm theo của hãng) và lau dầu cũng miễn phí trong suốt thời gian bảo hành đối với các sản phẩm đồng hồ cơ</h5>\n                3: WATCHSTORE.vn chấp nhận bảo hành ngay cả khi bạn MẤT THẺ hoặc SỔ BẢO HÀNH liên quan tới chiếc đồng hồ của bạn,\n                    toàn bộ thông tin khách hàng WATCHSTORE.vn đã lưu trên hệ thống và có kích hoạt BẢO HÀNH ĐIỆN TỬ thông qua số điện thoại.\n                    \n                    \nĐịa điểm bảo hành\n                    Bảo hành tại Trung tâm bảo hành\n                Nếu đồng hồ của bạn có bảo hành quốc tế và vẫn còn trong thời gian bảo hành, bạn có thể mang qua bất \n                cứ trung tâm bảo hành chính thức của các hãng đặt tại Việt Nam hoặc nước ngoài đều được.\n                Để tìm Trung tâm sửa chữa và bảo hành chính thức của hãng, bạn có thể vào website của hãng,\n                 tìm phần Service Center hay Service Center Locator hay World Wide Service Center, nhập quốc gia và vị trí bạn đang sống, những địa chỉ của \n                 Trung tâm bảo hành của hãng sẽ được hiển thị toàn bộ.\n               Một số địa chỉ bảo hành quốc tế tại Việt Nam\n                Địa chỉ: 103 Phường Tăng Nhơn Phú B, Quận 9, TP. Hồ Chí Minh\n               Thời gian hoạt động: \n               Sáng 8h – 12h\n                Sáng 13h – 17h\n                Thứ 7 làm việc từ 8h đến 12h\n                \n                \n\n               Bảo hành tại WATCHSTORE\n                Đối với các vấn đề của đồng hồ, thông thường, nếu bạn mang qua trung \n                tâm bảo hành vẫn sẽ phát sinh 1 số khoản chi phí (bất kể lỗi do nhà sản xuất hay người dùng). Vì thế, WATCHSTORE khuyên bạn, trong \n                trường hợp đồng hồ gặp vấn đề cần bảo hành, hãy mang tới các cửa hàng của WATCHSTORE để được trợ giúp.\n              ĐChúng tôi sẽ giúp bạn an tâm và tiết kiệm thời gian, cũng như cam kết không \n                phát sinh bất kỳ chi phí nào khác (đối với các trường hợp lỗi do nhà sản xuất). Mọi trường hợp bảo hành, WATCHSTORE trực tiếp liên hệ với hãng để được xử\n                 lý nhanh nhất và đảm bảo đồng hồ của bạn vẫn hoạt động bình thường và ổn định sau quá trình sửa chữa.\n               Thời gian tiếp nhận bảo hành từ 8h30 - 12h, 13h - 20h các ngày từ thứ 2 tới chủ nhật.', '1', '1', '0', 1, NULL, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_post`
--

CREATE TABLE `db_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `detail` mediumtext NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `metakey` varchar(1000) NOT NULL,
  `metadesc` varchar(1000) NOT NULL,
  `trash` varchar(255) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_post`
--

INSERT INTO `db_post` (`id`, `topic_id`, `title`, `slug`, `detail`, `image`, `type`, `description`, `metakey`, `metadesc`, `trash`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(20, 13, 'NÚM CHỈNH GIỜ', 'num-chinh-gio', 'Ở phần cạnh của khung viền đồng hồ thường thiết kế một núm điều chỉnh, nó không chỉ có tác dụng chỉnh ngày, giờ mà còn có thể sử dụng để lên dây cót cho đồng hồ.\r\n\r\nThao tác rất đơn giản, bạn chỉ cần xoay núm theo chiều thuận hoặc ngược kim đồng hồ, hệ thống bên trong sẽ tạo ra năng lượng đảm bảo cho hoạt động của đồng hồ hiệu quả.', 'num-chinh-gio.jpg', 'post', NULL, 'NÚM CHỈNH GIỜ', 'NÚM CHỈNH GIỜ', '0', 1, NULL, 1, '2023-06-27 08:04:52', '2023-06-27 08:04:52'),
(21, 13, 'BÁNH LẮC', 'banh-lac', 'Bộ phận bánh lắc vận hành dựa vào cơ cấu hồi, tạo ra năng lượng từ chuyển động của bánh răng để điều khiển tốc độ chạy đồng hồ. Trường hợp, muốn chỉnh tốc độ này, bạn cần thao tác với con ốc hoặc cần gạt lắp trên bánh lắc và dây tóc.', 'banh-lac.jpg', 'post', NULL, 'BÁNH LẮC', 'BÁNH LẮC', '0', 1, NULL, 1, '2023-06-27 08:14:05', '2023-06-27 08:14:05'),
(23, 13, 'CHÂN KÍNH', 'chan-kinh', 'Hay còn gọi là Jewel, như tên gọi này thì bộ phận chân kính thường được làm từ các loại đá quý có màu sắc đẹp như kim cương, thạch anh, ruby,... giúp tăng tính thẩm mỹ cho thiết bị đồng thời có tác dụng làm giảm ma sát giữa các chi tiết khi chuyển động. Mỗi hãng sản phẩm, mỗi dòng sản phẩm sẽ có số lượng chân kính khác nhau.', 'chan-kinh.jpg', 'post', NULL, 'CHÂN KÍNH', 'CHÂN KÍNH', '0', 1, NULL, 1, '2023-06-27 09:08:52', '2023-06-27 09:08:52'),
(24, 13, 'DÂY CÓT', 'day-cot', 'Bộ phận quan trọng của đồng hồ cơ, là một loại lò xo xoắn làm bằng lá thép cực dài, mỏng, có tính đàn hồi cao. Dây thép được nghệ nhân cuộn tròn, bảo vệ vững chắc trong hộp tang trống.\r\n\r\nKhi đồng hồ được lên dây cót, dây cót sẽ thu lại và từ từ trở về vị trí ban đầu từ đó các bánh răng trong hộp tang trống hoạt động, truyền năng lượng cho hệ thống bánh răng.', 'day-cot.jpg', 'post', NULL, 'DÂY CÓT', 'DÂY CÓT', '0', 1, NULL, 1, '2023-06-27 09:09:51', '2023-06-27 09:09:51'),
(25, 13, 'BÁNH RĂNG TRUNG TÂM', 'banh-rang-trung-tam', 'Đây là chiếc bánh răng nằm trung tâm tiếp xúc với hộp tang trống đầu tiên. Khi hoạt động, sẽ mất tới 12 giờ để bánh răng quay hết một vòng nên bộ phận này được gắn với kim giờ trực tiếp và được liên kết với bánh xe giờ và phút.', 'banh-rang-trung-tam.jpg', 'post', NULL, 'BÁNH RĂNG TRUNG TÂM', 'BÁNH RĂNG TRUNG TÂM', '0', 1, NULL, 1, '2023-06-27 09:12:19', '2023-06-27 09:12:19'),
(26, 13, 'BÁNH RĂNG TRUNG GIAN', 'banh-rang-trung-gian', 'Hay còn gọi là bánh răng thứ 3, nó là bánh răng tiếp theo nằm trong hệ thống.', 'banh-rang-trung-gian.jpg', 'post', NULL, 'BÁNH RĂNG TRUNG GIAN', 'BÁNH RĂNG TRUNG GIAN', '0', 1, NULL, 1, '2023-06-27 09:11:58', '2023-06-27 09:11:58'),
(27, 13, 'ROTOR', 'rotor', 'Một bộ phận không thể thiếu của loại đồng hồ cơ tự động là rotor gắn liền với trung tâm bộ máy, có dạng hình bán nguyệt, làm bằng một miếng kim loại có thể xoay 360 độ tự động khi cổ tay của bạn chuyển động.\r\n\r\nBánh đà liên kết với dây cót thông qua bánh răng, mỗi khi chuyển động, rotor sẽ tự cuộn lại dây cót và tạo ra năng lượng cho đồng hồ chạy, khi dây cót đã cuộn lại đủ, bánh đà tách ra nhờ bộ ly hợp được hỗ trợ trên thiết bị.', 'rotor.jpg', 'post', NULL, 'ROTOR', 'ROTOR', '0', 1, NULL, 1, '2023-06-27 09:13:13', '2023-06-27 09:13:13'),
(28, 13, 'DÂY TÓC', 'day-toc', 'Có dạng lò xo cân bằng làm từ chất liệu có độ đàn hồi cao, dẻo dai, chuyên dùng để điều khiển tốc độ đồng hồ. Có 3 loại dây tóc tương ứng với 4 tần số dao động phổ biến trên đồng hồ là 18.000, 21.000, 28.800, 36.000, tần số dao động càng cao thì đồng hồ vận hành càng chuẩn xác.', 'day-toc.jpg', 'post', NULL, 'DÂY TÓC', 'DÂY TÓC', '0', 1, NULL, 1, '2023-06-27 09:13:48', '2023-06-27 09:13:48'),
(29, 12, 'THƯƠNG HIỆU', 'thuong-hieu', 'Nếu nói đến đồng hồ đeo tay, bạn nghĩ đến những thương hiệu nào? Cái tên phổ biến nhất có lẽ là Rolex, nhưng cũng sẽ không thiếu những Cartier, Ebel, Omega hay TAG Heuer… Bạn nghĩ chúng là hàng cao cấp ư? Đó chỉ là suy nghĩ của những tín đồ thương hiệu thôi! Còn nói đến giá cả thuộc hàng đắt đỏ bậc nhất, phải là những chiếc đồng hồ cơ học của Alain Silberstein, Audemars Piguet, Franck Muller hay Patek Philippe. Mức giá cho một chiếc đồng hồ của những thương hiệu này có thể từ 5.000USD đến hàng triệu USD là bình thường.\r\n\r\n\r\nĐiều gì khiến cho những chiếc đồng hồ thuộc thương hiệu ít phổ biến này lại đắt đỏ đến vậy? Đó có thể là do yếu tố chế tác thủ công, số lượng có hạn, mẫu thiết kế độc quyền… Và dù là do yếu tố nào thì nó cũng khẳng định, thương hiệu phổ biến không phải là thứ quyết định một chiếc đồng hồ có cao cấp hay không.', 'thuong-hieu.webp', 'post', NULL, 'THƯƠNG HIỆU', 'THƯƠNG HIỆU', '0', 1, NULL, 1, '2023-06-27 09:18:21', '2023-06-27 09:18:21'),
(30, 12, 'MỨC ĐỘ PHỨC TẠP', 'muc-do-phuc-tap', 'Đây là một thuật ngữ chỉ những tính năng có thể tích hợp được trên một chiếc đồng hồ. Đơn giản thì có ngày, lịch, hiển thị múi giờ, máy đo thời gian (công năng tương tự như một chiếc đồng hồ bấm giờ). Ngoài ra, những chiếc đồng hồ phức tạp hơn có thể phức hợp các tính năng có tính chuyên biệt cao như hiển thị thời gian của mặt trời, biểu đồ sao, các thời điểm của mặt trăng. Chiếc đồng hồ càng tích hợp được nhiều tính năng thì càng cao cấp, chúng thậm chí được gọi với tên riêng là Grand Complication (độ tinh xảo xuất chúng). Một chiếc đồng hồ có độ tinh xảo xuất chúng cần có 1 trong 3 tính năng: bấm giờ, báo thức hoặc hiển thị lịch mặt trăng.\r\n\r\n\r\nĐồng hồ Franck Muller Aeternitas Mega 4 được mệnh danh là Đệ nhất tinh xảo.\r\nĐồng hồ Franck Muller Aeternitas Mega 4 được mệnh danh là \"Đệ nhất tinh xảo\".\r\n\r\nFranck Muller Aeternitas Mega 4 được xem là chiếc đồng hồ đeo tay phức tạp nhất thế giới với 36 tính năng (25 tính năng nhìn thấy được), 1.483 bộ phận và tất nhiên, có mức giá không hề khiêm tốn là 2.7 triệu USD.', 'muc-do-phuc-tap.webp', 'post', NULL, 'MỨC ĐỘ PHỨC TẠP', 'MỨC ĐỘ PHỨC TẠP', '0', 1, NULL, 1, '2023-06-27 09:22:41', '2023-06-27 09:22:41'),
(31, 12, 'QUY TRÌNH SẢN XUẤT', 'quy-trinh-san-xuat', 'Một trong những yếu tố quyết định chiếc đồng hồ có phải hàng cao cấp hay không là quy trình sản xuất có khép kín không? Hầu hết các loại đồng hồ tầm trung hiện nay đều được sản xuất dưới dây chuyền này. Và điều làm nên sự hấp dẫn cho những cái tên Audemars Piguet, Jaegur-Lecoultre, A. Lange & Sohne và Patek Philippe chính là phương thức sản xuất khép kín, tự động, mang lại ưu thế lớn về sự chuyên biệt.\r\n\r\n\r\nCũng giống như ô tô hay bất cứ một mặt hàng xa xỉ nào, những chiếc đồng hồ này thường được sản xuất với số lượng có hạn để tăng giá trị thương hiệu. Ví dụ như chiếc đồng hồ Audemars Piguet Royal Oak Offshore LeBron James do siêu sao bóng rổ Lebron James thiết kế được hãng Audemars Piguet bán ra với giá 51.500 USD, tuy nhiên số lượng chỉ có 600 chiếc được sản xuất. Hay như mẫu The Shawn Carter do thương hiệu đồng hồ Hublot kết hợp với ca sĩ Jay Z tung ra có giá 33.900 USD nhưng chỉ có 100 chiếc trên thế giới.\r\n\r\nMặc dù vậy, nhiều người đam mê đồng hồ cao cấp cũng vẫn yêu thích yếu tố thủ công trong chiếc đồng hồ của mình. Vì họ biết dù công nghệ có tiên tiến đến đâu thì vẫn có những yếu tố cần sử dụng phương pháp thủ công một thời, một phần để làm sạch và đánh bóng các bộ phận của đồng hồ với sự khéo léo của các nghệ nhân mà không máy móc nào có thể thay thế được, một phần bởi tính thủ công mới là điều làm nên thương hiệu của họ.', 'quy-trinh-san-xuat.webp', 'post', NULL, 'QUY TRÌNH SẢN XUẤT', 'QUY TRÌNH SẢN XUẤT', '0', 1, NULL, 1, '2023-06-27 09:23:29', '2023-06-27 09:23:29'),
(32, 12, 'ĐỘ HIẾM', 'do-hiem', 'Sự hiếm có của chiếc đồng hồ cũng góp phần vào giá trị của nó. Nhiều thương hiệu sẽ có phát hành dòng sản phẩm đặc biệt để kỷ niệm một dịp hoặc một người đặc biệt nào đó. Những dòng sản phẩm này có thể có số lượng từ hàng chục đến hàng nghìn chiếc và được gọi là ‘limited edition’. Nói chung, những sản phẩm này sẽ có giá trị đắt hơn sản phẩm cùng loại bởi nguồn cung khá thấp cũng như sự độc đáo của nó.', 'do-hiem.webp', 'post', NULL, 'ĐỘ HIẾM', 'ĐỘ HIẾM', '0', 1, NULL, 1, '2023-06-27 09:26:48', '2023-06-27 09:26:48'),
(34, 0, 'Chính sách vận chuyển', 'chinh-sach-van-chuyen', 'PHƯƠNG THỨC VẬN CHUYỂN VÀ GIAO HÀNG\r\nĐối tượng và phạm vi vận chuyển\r\nWATCHSTORE cung cấp phương thức vận chuyển trên toàn quốc và áp dụng cho tất cả các kênh mua sắm Online và tại cửa hàng của WATCHSTORE.\r\nPhí giao hàng\r\nMIỄN PHÍ: Áp dụng với các sản phẩm đồng hồ cao cấp.\r\nĐỒNG GIÁ: Áp dụng với các sản phẩm khác với mức phí vận chuyển nhẹ nhàng và hợp lý.\r\nThời gian giao hàng\r\n1. Dịch vụ giao hàng tiết kiệm:\r\nThời gian giao hàng trung bình là 2-3 ngày đối với khu vực trung tâm thành phố và 3-7 ngày đối với khu vực ngoại thành, huyện, xã, thị trấn.\r\nThời gian xử lý đơn hàng sẽ bắt đầu tính từ khi WATCHSTORE xác nhận đã nhận được thanh toán từ quý khách.\r\nWATCHSTORE có thể thay đổi thời gian giao hàng tùy theo yêu cầu của khách hàng hoặc trong trường hợp thiên tai hoặc sự kiện đặc biệt.\r\n2. Dịch vụ giao hàng nhanh:\r\nWATCHSTORE cung cấp dịch vụ giao hàng nhanh trong vòng 24 giờ với phí dịch vụ hợp lý và tùy theo từng thời điểm trong ngày. Để biết thêm thông tin và được hỗ trợ, khách hàng có thể gọi đến số Hotline của WATCHSTORE.\r\n3. Cách kiểm tra đơn hàng:\r\nĐể kiểm tra thông tin hoặc tình trạng đơn hàng, quý khách hàng vui lòng liên hệ trực tiếp với WATCHSTORE qua số điện thoại Hotline hoặc truy cập vào trang web để kiểm tra thông tin. WATCHSTORE đảm bảo khách hàng sẽ được kiểm tra hàng trước khi thanh toán và giữ lại biên lai vận chuyển trong trường hợp cần đối chiếu.\r\nWATCHSTORE luôn cam kết cung cấp dịch vụ vận chuyển và giao hàng tốt nhất để đồng hành cùng khách hàng trên hành trình chinh phục phong cách sống đẳng cấp.\r\nĐồng thời, WATCHSTORE cũng cam kết đem đến cho khách hàng những trải nghiệm mua sắm online tuyệt vời nhất với phương thức vận chuyển và giao hàng thuận tiện, đảm bảo an toàn và nhanh chóng.\r\nVới đội ngũ nhân viên giàu kinh nghiệm và tay nghề cao, WATCHSTORE sẽ đảm bảo rằng mọi đơn hàng đều được xử lý và vận chuyển một cách nhanh chóng và chính xác. Khách hàng có thể yên tâm đặt hàng trên website của chúng tôi hoặc tại cửa hàng trực tiếp, vì WATCHSTORE sẽ đáp ứng mọi yêu cầu vận chuyển từ khách hàng.\r\nĐối với sản phẩm đồng hồ, WATCHSTORE áp dụng chính sách miễn phí giao hàng trên toàn quốc. Đối với các sản phẩm khác, WATCHSTORE áp dụng phí giao hàng đồng giá 30k trên toàn quốc.\r\nThời gian giao hàng của WATCHSTORE cũng được cam kết rất nhanh chóng và đảm bảo. Với dịch vụ giao hàng tiết kiệm, thời gian là 2-3 ngày đối với khu vực trung tâm tỉnh thành phố và 3-7 ngày đối với khu vực ngoại thành, huyện, xã, thị trấn. Đối với dịch vụ giao hàng siêu tốc, WATCHSTORE cung cấp dịch vụ giao hàng trong 2 giờ đối với khách hàng tại khu vự c Hồ Chí Minh, Biên Hòa, Thủ Dầu Một, Vũng Tàu và Cần Thơ.\r\nNếu khách hàng có bất kỳ thắc mắc nào liên quan đến đơn hàng, hãy inbox trực tiếp Fanpage của chúng tôi hoặc gọi đến số Hotline (0938102101) để được hỗ trợ tận tình và chuyên nghiệp. WATCHSTORE xin cam kết sẽ luôn cung cấp dịch vụ vận chuyển và giao hàng tốt nhất để đồng hành cùng khách hàng trên hành trình chinh phục phong cách sống đẳng cấp.', NULL, 'footervc', NULL, 'Chính sách vận chuyển', 'Chính sách vận chuyển', '0', 1, NULL, 1, '2023-06-30 00:27:53', '2023-06-30 00:27:53'),
(35, 0, 'Giới Thiệu', 'gioi-thieu', 'WATCHSTORE là một thương hiệu đồng hồ mới được thành lập tại Việt Nam,\r\n                    nhưng đã nhanh chóng thu hút sự quan tâm của người tiêu dùng bởi sự độc đáo và chất lượng của sản phẩm.\r\n                    Với cam kết cung cấp những sản phẩm đồng hồ và trang sức cao cấp,\r\n                    WATCHSTORE đã trở thành một trong những thương hiệu được đánh giá cao tại thị trường đồng hồ hiện nay.\r\n                Tầm nhìn của công ty WATCHSTORE là trở thành thương hiệu đồng hồ và trang sức cao cấp hàng đầu tại Việt Nam,\r\n                    với khách hàng tin tưởng và hài lòng. Sứ mệnh của chúng tôi là mang đến cho khách hàng những sản phẩm\r\n                    đồng hồ và trang sức chất lượng cao, thiết kế đẹp mắt, đa dạng về mẫu mã và phong cách, đáp ứng nhu cầu\r\n                    và gu thẩm mỹ của từng khách hàng.\r\n                Lịch sử của công ty WATCHSTORE được khởi đầu từ năm 2022, khi công ty chính thức ra mắt thị trường đồng hồ và trang sức.\r\n                    Với tầm nhìn và sứ mệnh đã đề ra, WATCHSTORE không ngừng nỗ lực để nâng cao chất lượng sản phẩm,\r\n                    tăng cường dịch vụ chăm sóc khách hàng và mở rộng thị trường phục vụ đa dạng khách hàng từ các thành phố lớn đến vùng sâu vùng xa.\r\n               Giá trị cốt lõi của công ty WATCHSTORE là cam kết mang đến cho khách hàng những sản phẩm chính hãng, đúng giá trị với chất lượng và thiết kế đẹp mắt.\r\n                    Chúng tôi luôn lắng nghe và đáp ứng nhu cầu của khách hàng,\r\n                    xây dựng niềm tin và sự hài lòng của khách hàng là mục tiêu hàng đầu trong mọi hoạt động của công ty.\r\n                 Với đội ngũ nhân viên tận tâm và chuyên nghiệp, công ty WATCHSTORE đã và đang ngày càng khẳng định vị thế của mình trên thị trường đồng hồ và trang sức tại Việt Nam.\r\n                    Chúng tôi mong muốn trở thành đối tác đáng tin cậy của khách hàng trong lĩnh vực này và tiếp tục phát triển bền vững trong tương lai.\r\n                Ngoài những thông tin về lịch sử, tầm nhìn, sứ mệnh và giá trị cốt lõi của công ty đồng hồ WATCHSTORE, chúng tôi cũng rất mong muốn được đem đến\r\n                    cho khách hàng những sản phẩm chất lượng và dịch vụ hoàn hảo.\r\n                Nếu quý khách quan tâm đến các sản phẩm của chúng tôi hoặc muốn biết thêm thông tin, xin vui lòng liên hệ theo địa chỉ sau:\r\n                Địa chỉ: 103 Phường Tăng Nhơn Phú B, Quận 9, TP. Hồ Chí Minh\r\n                    Số điện thoại: 0397 901 748\r\n                    Email: WATCHSTORE@gmail.com\r\n                    Chúng tôi sẽ nhanh chóng phản hồi và giải đáp mọi thắc mắc của quý khách. Cảm ơn quý khách đã quan tâm và lựa chọn sản phẩm của WATCHSTORE.', NULL, 'footergt', NULL, 'Giới Thiệu', 'Giới Thiệu', '0', 1, NULL, 1, '2023-06-30 00:49:54', '2023-06-30 00:49:54'),
(36, 0, 'Chính sách đổi trả', 'chinh-sach-doi-tra', 'Tại WATCHSTORE, chúng tôi cam kết mang đến trải nghiệm mua sắm đồng hồ tốt nhất cho khách hàng. Chúng tôi hiểu rằng \n                đôi khi sản phẩm không đáp ứng được mong đợi của khách hàng, do đó chúng tôi cung cấp chính sách đổi hàng miễn phí trong vòng 7 ngày kể từ ngày mua sản phẩm.\n  Chính sách đổi hàng của WATCHSTORE áp dụng cho khách hàng mua sắm trực tuyến hoặc tại các cửa hàng của chúng tôi trên toàn quốc. \n                Nếu Quý khách mua hàng trực tuyến, bạn có thể đổi sản phẩm trực tiếp tại các cửa hàng của WATCHSTORE hoặc đổi qua đường bưu điện. Nếu Quý khách mua hàng trực tiếp tại cửa hàng, \n                vui lòng đổi sản phẩm tại cửa hàng mua ban đầu.\n                Điều kiện đổi sản phẩm của WATCHSTORE bao gồm:\n              Yêu cầu đổi hàng được thực hiện trong vòng 7 ngày kể từ ngày Quý khách nhận được sản phẩm.\n               Sản phẩm chưa qua sử dụng và còn lớp keo bọc bên ngoài.\n                Sản phẩm không trầy xước, không bị ngấn dây, dây da chưa đeo và các bộ phận, linh kiện, phụ kiện, tài liệu hướng dẫn sử dụng,\n                 tài liệu kỹ thuật, quà tặng kèm theo (nếu có) phải còn đầy đủ và không có dấu hiệu đã qua sử dụng.\n                 Hộp đựng, bao bì đóng gói sản phẩm còn nguyên vẹn, không bị móp, rách, ố vàng,…\n                 Quý khách chỉ được đổi sản phẩm 1 lần duy nhất (bằng giá hoặc cao hơn) và sản phẩm mới phải là sản phẩm mới 100%. \n                 Điều này chỉ áp dụng nếu sản phẩm đã có dấu hiệu lỗi từ nhà sản xuất. Chúng tôi mong muốn Quý khách đọc kỹ chính sách đổi hàng để đảm bảo sản phẩm đổi được\n                  đáp ứng các điều kiện nêu trên và giúp chúng tôi đáp ứng tốt hơn nhu cầu của Quý khách.\n                  WATCHSTORE luôn tôn trọng quyền lợi của khách hàng và cam kết cung cấp sản phẩm và dịch vụ chất lượng nhất. Nếu quý khách hàng có \n                  bất kỳ thắc mắc, góp ý hay khiếu nại \n                  nào về sản phẩm hoặc dịch vụ của WATCHSTORE, vui lòng liên hệ với chúng tôi qua hotline hoặc email được hiển thị trên trang web của chúng tôi.\n                  Chúng tôi sẽ nhanh chóng xem xét và giải quyết các vấn đề của quý khách hàng trong thời gian sớm nhất. Chúng tôi \n                  mong muốn mang lại sự hài lòng và tin tưởng tuyệt đối từ khách hàng và sẽ luôn cố gắng để nâng cao chất lượng sản phẩm và dịch vụ của mình.\n                  Ngoài ra, WATCHSTORE cũng cung cấp hệ thống bảo hành chuyên nghiệp để đảm bảo quyền lợi của khách hàng. Chúng tôi cam kết \n                  sẽ đáp ứng mọi yêu cầu bảo hành của khách hàng với tinh thần trách nhiệm cao nhất và đảm bảo sự tiện lợi và nhanh chóng cho khách hàng.', NULL, 'footerdt', NULL, 'x', 'd', '0', 1, NULL, 1, '2023-06-30 00:54:11', '2023-06-30 00:54:11'),
(37, 0, 'Chính sách bảo hành', 'chinh-sach-bao-hanh', 'Chào mừng bạn đến với WATCHSTORE!\n              Hãy đọc kỹ chính sách bảo hành của chúng tôi để chúng ta có tiếng nói chung\n                    trong khâu bảo hành và tránh tình trạng tranh chấp giữa WATCHSTORE.vn với khách hàng. Tiêu chí của chúng tôi là:\n                    \"Tạo điều kiện hết sức cho mọi khách hàng\".\n                THẺ hoặc SỔ BẢO HÀNH chính thức này được WATCHSTORE ghi đầy đủ và chính xác\n                    các thông tin của đồng hồ như: Thông tin khách hàng, mã sản phẩm, thời gian bảo hành, cơ sở bảo hành.\n               DUY NHẤT TẠI WATCHSTORE.VN\n                1: Bạn sẽ được bảo hành trọn gói 5 nămtính từ ngày mua tại WATCHSTORE.\n                2: Ngoài ra, riêng đối với dòng đồng hồ Casio, Pin\n                    của đồng hồ bạn mua tại hệ thống của WATCHSTORE.vn sẽ được thay thế miễn phí trọn đời (không áp dụng pin năng lượng từ ánh sáng,\n                    loại pin này sẽ áp dụng theo các chính sách bảo hành kèm theo của hãng) và lau dầu cũng miễn phí trong suốt thời gian bảo hành đối với các sản phẩm đồng hồ cơ</h5>\n                3: WATCHSTORE.vn chấp nhận bảo hành ngay cả khi bạn MẤT THẺ hoặc SỔ BẢO HÀNH liên quan tới chiếc đồng hồ của bạn,\n                    toàn bộ thông tin khách hàng WATCHSTORE.vn đã lưu trên hệ thống và có kích hoạt BẢO HÀNH ĐIỆN TỬ thông qua số điện thoại.\n                    \n                    \nĐịa điểm bảo hành\n                    Bảo hành tại Trung tâm bảo hành\n                Nếu đồng hồ của bạn có bảo hành quốc tế và vẫn còn trong thời gian bảo hành, bạn có thể mang qua bất \n                cứ trung tâm bảo hành chính thức của các hãng đặt tại Việt Nam hoặc nước ngoài đều được.\n                Để tìm Trung tâm sửa chữa và bảo hành chính thức của hãng, bạn có thể vào website của hãng,\n                 tìm phần Service Center hay Service Center Locator hay World Wide Service Center, nhập quốc gia và vị trí bạn đang sống, những địa chỉ của \n                 Trung tâm bảo hành của hãng sẽ được hiển thị toàn bộ.\n               Một số địa chỉ bảo hành quốc tế tại Việt Nam\n                Địa chỉ: 103 Phường Tăng Nhơn Phú B, Quận 9, TP. Hồ Chí Minh\n               Thời gian hoạt động: \n               Sáng 8h – 12h\n                Sáng 13h – 17h\n                Thứ 7 làm việc từ 8h đến 12h\n                \n                \n\n               Bảo hành tại WATCHSTORE\n                Đối với các vấn đề của đồng hồ, thông thường, nếu bạn mang qua trung \n                tâm bảo hành vẫn sẽ phát sinh 1 số khoản chi phí (bất kể lỗi do nhà sản xuất hay người dùng). Vì thế, WATCHSTORE khuyên bạn, trong \n                trường hợp đồng hồ gặp vấn đề cần bảo hành, hãy mang tới các cửa hàng của WATCHSTORE để được trợ giúp.\n              ĐChúng tôi sẽ giúp bạn an tâm và tiết kiệm thời gian, cũng như cam kết không \n                phát sinh bất kỳ chi phí nào khác (đối với các trường hợp lỗi do nhà sản xuất). Mọi trường hợp bảo hành, WATCHSTORE trực tiếp liên hệ với hãng để được xử\n                 lý nhanh nhất và đảm bảo đồng hồ của bạn vẫn hoạt động bình thường và ổn định sau quá trình sửa chữa.\n               Thời gian tiếp nhận bảo hành từ 8h30 - 12h, 13h - 20h các ngày từ thứ 2 tới chủ nhật.', NULL, 'footerbh', NULL, 'd', 'd', '0', 1, NULL, 1, '2023-06-30 00:59:46', '2023-06-30 00:59:46'),
(38, 0, 'Chính sách mua hàng', 'chinh-sach-mua-hang', '1: Thanh toán chuyển khoản\n               QUÝ KHÁCH VUI LÒNG CK QUA TÀI KHOẢN MBBANK CỦA CTY CHÚNG TÔI QUA SỐ TÀI KHOẢN:\n                Chủ tài khoản: Phan Anh Tài\n               Số tài khoản: 0397901748\n             Lưu ý: Chỉ nên chuyển khoản sau khi đội ngũ nhân viên viên của WATCHSTORE gọi điện xác nhận.\n                    Sau khi chúng tôi nhận tiền, WATCHSTORE sẽ tiến hành xử lý đơn hàng cho bạn, trường hợp bạn không nhận hàng với bất cứ lý do gì chúng tôi\n                    sẽ tiến hành hoàn tiền lại cho bạn (bạn chỉ phải trả cho chúng tôi 1 khoản phí nho nhỏ cho bên vận chuyển thu).\n\n              2: Thanh toán khi nhận hàng\n               Đây là hình thức thuận tiện nhất dành cho khách hàng ở khắp mọi nơi trên lãnh thổ Việt Nam.\n             Bước 1: Quý khách gọi điện tới số Hotline của công ty chúng tôi hoặc đặt hàng online ngay trên website watchstore.vn\n            Bước 2: WATCHSTORE.vn sẽ tiến hành gọi điện để xác nhận đơn hàng sau đó sẽ tiến hành điền thông tin vào phiếu bảo hành và giao hàng.\n              Bước 3:Quý khách kiểm tra hàng thật kỹ, kiểm tra đúng seri trên phiếu bảo hành và trên hộp đồng hồ, nếu thấy tem niêm phong\n                    của WATCHSTORE có dấu hiệu bị rách vui lòng gọi điện ngay cho chúng tôi để đối chiếu. Nếu kiểm tra hàng đúng chất lượng thì quý khách mới phải thanh toán tiền. Nếu bạn không\n                    hài lòng có thể từ chối nhận hàng.\n                Đặc biệt khi nhận hàng, Quý khách được phép mở hàng ra và thử hàng ngay trên tay.\n                Nếu phát hiện ra lỗi của nhà sản xuất, trong vòng 30 ngày kể từ ngày mua sản phẩm, khách hàng được phép đổi sang sản phẩm khác mới 100% với đầy đủ giấy tờ và phụ kiện đi kèm.', NULL, 'footermh', NULL, 'd', 'd', '0', 1, NULL, 1, '2023-06-30 01:01:53', '2023-06-30 01:01:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_product`
--

CREATE TABLE `db_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `price` int(100) UNSIGNED NOT NULL,
  `pricesale` int(100) UNSIGNED NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `sale_id` int(10) UNSIGNED DEFAULT NULL,
  `detail` mediumtext NOT NULL,
  `metakey` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `trash` varchar(255) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_product`
--

INSERT INTO `db_product` (`id`, `category_id`, `brand_id`, `name`, `slug`, `description`, `price`, `pricesale`, `image`, `qty`, `sale_id`, `detail`, `metakey`, `metadesc`, `trash`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(19, 17, 28, 'ĐỒNG HỒ NỮ CHARRIOL ST-TROPEZ ST30SC.560.035', 'dong-ho-nu-charriol-st-tropez-st30sc560035', NULL, 5299000, 4999000, 'dong-ho-nu-charriol-st-tropez-watch-30mm-st30sc560035.png', 20, 1, 'Đồng hồ chính hãng ST30SC.560.035 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'CHARRIOL ST-TROPEZ', 'ĐỒNG HỒ NỮ CHARRIOL ST-TROPEZ WATCH 30MM ST30SC.560.035', '0', 1, 1, 1, '2023-06-29 01:36:49', '2023-06-29 01:36:49'),
(20, 17, 28, 'ĐỒNG HỒ NỮ CHARRIOL ST-TROPEZ  ST30PWA1.560.039', 'dong-ho-nu-charriol-st-tropez-st30pwa1560039', NULL, 5099000, 4899000, 'dong-ho-nu-charriol-st-tropez-watch-30mm-st30pwa1560039.png', 19, 0, 'Đồng hồ chính hãng ST30PWA1.560.039 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'CHARRIOL ST-TROPEZ', 'ĐỒNG HỒ NỮ CHARRIOL ST-TROPEZ WATCH 30MM ST30PWA1.560.039', '0', 1, 1, 1, '2023-06-29 01:40:47', '2023-06-29 01:40:47'),
(21, 17, 28, 'ĐỒNG HỒ NỮ CHARRIOL SLIM  ST34SD2.565.016', 'dong-ho-nu-charriol-slim-st34sd2565016', NULL, 4899000, 4699000, 'dong-ho-nu-charriol-slim-watch-parenthese-precieuse-st34sd2565016.png', 10, 1, 'Đồng hồ chính hãng ST34SD2.565.016 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'ST34SD2.565.016', 'ĐỒNG HỒ NỮ CHARRIOL SLIM WATCH PARENTHÈSE PRÉCIEUSE ST34SD2.565.016', '0', 1, 1, 1, '2023-06-29 01:40:34', '2023-06-29 01:40:34'),
(22, 17, 28, 'ĐỒNG HỒ NỮ CHARRIOL SLIM ST34SD2.560.013', 'dong-ho-nu-charriol-slim-st34sd2560013', NULL, 4699000, 4499000, 'dong-ho-nu-charriol-slim-watch-parenthese-precieuse-st34sd2560013.png', 10, NULL, 'Đồng hồ chính hãng ST34SD2.560.013 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'T34SD2.560.013', 'ĐỒNG HỒ NỮ CHARRIOL SLIM WATCH PARENTHÈSE PRÉCIEUSE ST34SD2.560.013', '0', 1, 1, 1, '2023-06-29 01:40:21', '2023-06-29 01:40:21'),
(23, 16, 24, 'ĐỒNG HỒ NAM CALVIN KLEIN INFINITE AUTOMATIC K5S3414Y', 'dong-ho-nam-calvin-klein-infinite-automatic-k5s3414y', NULL, 1479000, 1399000, 'dong-ho-nam-calvin-klein-infinite-automatic-k5s3414y.png', 10, NULL, 'Đồng hồ chính hãng K5S3414Y Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'K5S3414Y', 'ĐỒNG HỒ NAM CALVIN KLEIN INFINITE AUTOMATIC K5S3414Y', '0', 1, NULL, 1, '2023-06-29 01:43:23', '2023-06-29 01:43:23'),
(24, 16, 24, 'ĐỒNG HỒ NAM CALVIN KLEIN HIGH NOON K8M211CN', 'dong-ho-nam-calvin-klein-high-noon-k8m211cn', NULL, 5549000, 5299000, 'dong-ho-nam-calvin-klein-high-noon-k8m211cn.png', 10, 1, 'Đồng hồ chính hãng K8M211CN Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'K8M211CN', 'ĐỒNG HỒ NAM CALVIN KLEIN HIGH NOON K8M211CN', '0', 1, NULL, 1, '2023-06-29 01:43:03', '2023-06-29 01:43:03'),
(25, 16, 24, 'ĐỒNG HỒ NAM CALVIN KLEIN INFINITE AUTOMATIC K5S341CZ', 'dong-ho-nam-calvin-klein-infinite-automatic-k5s341cz', NULL, 1429000, 1329000, 'dong-ho-nam-calvin-klein-infinite-automatic-k5s341cz.png', 10, NULL, 'Đồng hồ chính hãng K5S341CZ Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'K5S341CZ', 'ĐỒNG HỒ NAM CALVIN KLEIN INFINITE AUTOMATIC K5S341CZ', '0', 1, NULL, 1, '2023-06-29 01:42:43', '2023-06-29 01:42:43'),
(26, 16, 24, 'ĐỒNG HỒ NAM CALVIN KLEIN INFINITE K5S341C6', 'dong-ho-nam-calvin-klein-infinite-k5s341c6', NULL, 1449000, 1389000, 'dong-ho-nam-calvin-klein-infinite-k5s341c6.png', 10, NULL, 'Đồng hồ chính hãng K5S341C6 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'K5S341C6', 'ĐỒNG HỒ NAM CALVIN KLEIN INFINITE K5S341C6', '0', 1, NULL, 1, '2023-06-29 01:42:17', '2023-06-29 01:42:17'),
(27, 17, 25, 'ĐỒNG HỒ NỮ ROTARY LES ORIGINALES JURA LB90510/41', 'dong-ho-nu-rotary-les-originales-jura-lb9051041', NULL, 2259000, 2069000, 'dong-ho-nu-rotary-les-originales-jura-lb9051041.png', 10, NULL, 'Đồng hồ chính hãng LB90510/41 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'LB90510/41', 'ĐỒNG HỒ NỮ ROTARY LES ORIGINALES JURA LB90510/41', '0', 1, NULL, 1, '2023-06-29 01:42:02', '2023-06-29 01:42:02'),
(28, 17, 25, 'ĐỒNG HỒ NỮ ROTARY LES ORIGINALES JURA LS90511/38', 'dong-ho-nu-rotary-les-originales-jura-ls9051138', NULL, 1899000, 1789000, 'dong-ho-nu-rotary-les-originales-jura-ls9051138.png', 10, NULL, 'Đồng hồ chính hãng LS90511/38 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'LS90511/38', 'ĐỒNG HỒ NỮ ROTARY LES ORIGINALES JURA LS90511/38', '0', 1, NULL, 1, '2023-06-29 01:41:34', '2023-06-29 01:41:34'),
(29, 17, 25, 'ĐỒNG HỒ NỮ ROTARY LES ORIGINALES LB90144/06', 'dong-ho-nu-rotary-les-originales-lb9014406', NULL, 1199000, 1099000, 'dong-ho-nu-rotary-les-originales-caviano-lb9014406.png', 10, NULL, 'Đồng hồ chính hãng LB90144/06 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'LB90144/06', 'ĐỒNG HỒ NỮ ROTARY LES ORIGINALES CAVIANO LB90144/06', '0', 1, NULL, 1, '2023-06-29 01:39:48', '2023-06-29 01:39:48'),
(30, 17, 25, 'ĐỒNG HỒ NỮ ROTARY LES ORIGINALES LB90143/03', 'dong-ho-nu-rotary-les-originales-lb9014303', NULL, 1119000, 1000000, 'dong-ho-nu-rotary-les-originales-caviano-lb9014303.png', 10, 1, 'Đồng hồ chính hãng LB90143/03 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'LB90143/03', 'ĐỒNG HỒ NỮ ROTARY LES ORIGINALES CAVIANO LB90143/03', '0', 1, NULL, 1, '2023-06-29 01:40:02', '2023-06-29 01:40:02'),
(32, 16, 26, 'ĐỒNG HỒ NAM TISSOT COUTURIER  T035.614.11.051.00', 'dong-ho-nam-tissot-couturier-t0356141105100', NULL, 4999000, 4699000, 'dong-ho-nam-tissot-couturier-automatic-chronograph-valjoux-t0356141105100.png', 10, NULL, 'Đồng hồ chính hãng T035.614.11.051.00 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'T035.614.11.051.00', 'ĐỒNG HỒ NAM TISSOT COUTURIER AUTOMATIC CHRONOGRAPH VALJOUX T035.614.11.051.00', '0', 1, 1, 1, '2023-06-29 01:39:19', '2023-06-29 01:39:19'),
(33, 16, 26, 'ĐỒNG HỒ NAM TISSOT CHEMIN DES T099.408.36.038.00', 'dong-ho-nam-tissot-chemin-des-t0994083603800', NULL, 3359000, 3159000, 'dong-ho-nam-tissot-chemin-des-tourelles-powermatic-80-cosc-t0994083603800.png', 10, 1, 'Đồng hồ chính hãng T099.408.36.038.00 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'T099.408.36.038.00', 'ĐỒNG HỒ NAM TISSOT CHEMIN DES TOURELLES POWERMATIC 80 COSC T099.408.36.038.00', '0', 1, 1, 1, '2023-06-29 01:39:04', '2023-06-29 01:39:04'),
(34, 16, 26, 'ĐỒNG HỒ NAM TISSOT CHEMIN DES T099.427.11.038.00', 'dong-ho-nam-tissot-chemin-des-t0994271103800', NULL, 3299000, 3129000, 'dong-ho-nam-tissot-chemin-des-tourelles-automatic-chronograph-t0994271103800.png', 10, NULL, 'Đồng hồ chính hãng T099.408.36.038.00 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'T099.427.11.038.00', 'ĐỒNG HỒ NAM TISSOT CHEMIN DES TOURELLES AUTOMATIC CHRONOGRAPH T099.427.11.038.00', '0', 1, NULL, 1, '2023-06-29 01:37:57', '2023-06-29 01:37:57'),
(36, 17, 26, 'ĐỒNG HỒ NỮ TISSOT LE LOCLE T006.207.22.116.00', 'dong-ho-nu-tissot-le-locle-t0062072211600', NULL, 2820000, 2610000, 'dong-ho-nu-tissot-le-locle-automatic-lady-2900-t0062072211600.png', 10, 1, 'Đồng hồ chính hãng T099.407.22.038.01 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'T006.207.22.116.00', 'ĐỒNG HỒ NỮ TISSOT LE LOCLE AUTOMATIC LADY (29.00) T006.207.22.116.00', '0', 1, NULL, 1, '2023-06-29 01:38:31', '2023-06-29 01:38:31'),
(37, 17, 26, 'ĐỒNG HỒ NỮ TISSOT CHEMIN DES T099.207.36.448.00', 'dong-ho-nu-tissot-chemin-des-t0992073644800', NULL, 2659000, 2529000, 'dong-ho-nu-tissot-chemin-des-tourelles-powermatic-80-lady-t0992073644800.png', 10, NULL, 'Đồng hồ chính hãng T099.407.22.038.01 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'T099.207.36.448.00', 'ĐỒNG HỒ NỮ TISSOT CHEMIN DES TOURELLES POWERMATIC 80 LADY T099.207.36.448.00', '0', 1, NULL, 1, '2023-06-29 01:38:44', '2023-06-29 01:38:44'),
(38, 16, 27, 'ĐỒNG HỒ NAM MIDO MULTIFORT M040.427.16.052.00', 'dong-ho-nam-mido-multifort-m0404271605200', NULL, 5500000, 5300000, 'dong-ho-nam-mido-multifort-patrimony-chronograph-m0404271605200.png', 10, NULL, 'Đồng hồ chính hãng T099.407.22.038.01 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'M040.427.16.052.00', 'ĐỒNG HỒ NAM MIDO MULTIFORT PATRIMONY CHRONOGRAPH M040.427.16.052.00', '0', 1, NULL, 1, '2023-06-29 01:37:34', '2023-06-29 01:37:34'),
(39, 16, 27, 'ĐỒNG HỒ NAM MIDO OCEAN STAR GMT M026.629.11.041.00', 'dong-ho-nam-mido-ocean-star-gmt-m0266291104100', NULL, 3899000, 3699000, 'dong-ho-nam-mido-ocean-star-gmt-m0266291104100.png', 10, NULL, 'Đồng hồ chính hãng M026.629.11.041.00 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'M026.629.11.041.00', 'ĐỒNG HỒ NAM MIDO OCEAN STAR GMT M026.629.11.041.00', '0', 1, NULL, 1, '2023-06-29 01:41:25', '2023-06-29 01:41:25'),
(40, 16, 27, 'ĐỒNG HỒ NAM MIDO BARONCELLI M8600.4.67.1', 'dong-ho-nam-mido-baroncelli-m86004671', NULL, 3799000, 3599000, 'dong-ho-nam-mido-baroncelli-m86004671.png', 10, NULL, 'Đồng hồ chính hãng M026.629.11.041.00 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'M8600.4.67.1', 'ĐỒNG HỒ NAM MIDO BARONCELLI M8600.4.67.1', '0', 1, NULL, 1, '2023-06-29 01:41:17', '2023-06-29 01:41:17'),
(41, 16, 27, 'ĐỒNG HỒ NAM MIDO MULTIFORT M026.431.22.031.00', 'dong-ho-nam-mido-multifort-m0264312203100', NULL, 3600000, 3490000, 'dong-ho-nam-mido-multifort-chronometer-m0054312203100.png', 10, NULL, 'Đồng hồ chính hãng M026.629.11.041.00 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'M005.431.22.031.00', 'ĐỒNG HỒ NAM MIDO MULTIFORT CHRONOMETER M005.431.22.031.00', '0', 1, NULL, 1, '2023-06-29 01:37:19', '2023-06-29 01:37:19'),
(46, 17, 28, 'ĐỒNG HỒ NỮ CHARRIOL AEL WATCH 33MM AE33CW.561.003', 'dong-ho-nu-charriol-ael-watch-33mm-ae33cw561003', NULL, 2499000, 2399000, 'dong-ho-nu-charriol-ael-watch-33mm-ae33cw561003.png', 10, 1, 'Đồng hồ chính hãng AE33CW.561.003 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'AE33CW.561.003', 'ĐỒNG HỒ NỮ CHARRIOL AEL WATCH 33MM AE33CW.561.003', '0', 1, NULL, 1, '2023-06-29 01:41:07', '2023-06-29 01:41:07'),
(47, 17, 28, 'ĐỒNG HỒ NỮ CHARRIOL ST-TROPEZ WATCH 028CC.540.326', 'dong-ho-nu-charriol-st-tropez-watch-028cc540326', NULL, 3199000, 2999000, 'dong-ho-nu-charriol-st-tropez-watch-245mm-028cc540326.png', 10, NULL, 'Đồng hồ chính hãng 028CC.540.326 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', '028CC.540.326', 'ĐỒNG HỒ NỮ CHARRIOL ST-TROPEZ WATCH 24.5MM 028CC.540.326', '0', 1, NULL, 1, '2023-06-29 01:40:58', '2023-06-29 01:40:58'),
(48, 16, 26, 'ĐỒNG HỒ NAM TISSOT CHEMIN T099.407.22.038.01', 'dong-ho-nam-tissot-chemin-t0994072203801', NULL, 2899000, 2779000, 'dong-ho-nam-tissot-chemin-des-tourelles-t0994072203801.png', 10, 1, 'Đồng hồ chính hãng T099.407.22.038.01 Thể hiện phong cách đẳng cấp với chiếc đồng hồ chính hãng này. Thiết kế tinh tế và chất liệu cao cấp kết hợp tạo nên một sản phẩm đẹp mắt và bền bỉ. Với công nghệ tiên tiến và độ chính xác tuyệt đối, chiếc đồng hồ này sẽ đồng hành cùng bạn suốt cả cuộc sống. Tạo điểm nhấn độc đáo cho phong cách của bạn và thể hiện sự sang trọng với một chiếc đồng hồ chính hãng đáng tin cậy này.', 'T099.407.22.038.01', 'ĐỒNG HỒ NAM TISSOT CHEMIN DES TOURELLES T099.407.22.038.01', '0', 1, NULL, 1, '2023-06-29 01:38:14', '2023-06-29 01:38:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_productsale`
--

CREATE TABLE `db_productsale` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `pricesale` double UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `date_begin` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_productstore`
--

CREATE TABLE `db_productstore` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price` double UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_slider`
--

CREATE TABLE `db_slider` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `link` varchar(1000) NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL,
  `position` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `trash` varchar(255) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_slider`
--

INSERT INTO `db_slider` (`id`, `name`, `image`, `link`, `sort_order`, `position`, `description`, `trash`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(25, 'Slider 1', 'Slider 1.jpg', '1', 0, 'slideshow', NULL, '0', 1, NULL, 1, '2023-06-09 08:39:14', '2023-06-09 08:39:14'),
(26, 'Slider 2', 'Slider 2.jpg', '2', 0, 'slideshow', NULL, '0', 1, NULL, 1, '2023-06-09 08:39:31', '2023-06-09 08:39:31'),
(27, 'Slider 3', 'Slider 3.jpg', '3', 0, 'slideshow', NULL, '0', 1, NULL, 1, '2023-06-09 08:39:46', '2023-06-09 08:39:46'),
(28, 'Slider 4', 'Slider 4.jpg', '4', 0, 'slideshow', NULL, '0', 1, NULL, 1, '2023-06-09 08:42:14', '2023-06-09 08:42:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_topic`
--

CREATE TABLE `db_topic` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `metakey` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `sort_order` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `trash` varchar(255) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_topic`
--

INSERT INTO `db_topic` (`id`, `name`, `slug`, `parent_id`, `metakey`, `metadesc`, `sort_order`, `description`, `trash`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(12, 'GIÁ TRỊ CỦA ĐỒNG HỒ', 'gia-tri-cua-dong-ho', 0, 'GIÁ TRỊ CỦA ĐỒNG HỒ', 'GIÁ TRỊ CỦA ĐỒNG HỒ', 0, '', '0', 1, NULL, 1, '2023-06-27 09:17:37', '2023-06-27 09:17:37'),
(13, 'CẤU TẠO ĐỒNG HỒ', 'cau-tao-dong-ho', 0, 'CẤU TẠO ĐỒNG HỒ', 'CẤU TẠO ĐỒNG HỒ', 0, '', '0', 1, NULL, 1, '2023-06-27 07:48:16', '2023-06-27 07:48:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_user`
--

CREATE TABLE `db_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password1` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `roles` varchar(255) NOT NULL DEFAULT '0',
  `trash` varchar(255) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_user`
--

INSERT INTO `db_user` (`id`, `name`, `email`, `phone`, `gender`, `username`, `password1`, `address`, `image`, `roles`, `trash`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(46, 'Phan', 'patvoli0505@gmail.com', NULL, NULL, 'Anh Tài', 'phananhtaia13', NULL, NULL, '1', '0', 1, NULL, 1, '2023-11-12 23:13:09', '2023-11-12 23:13:09'),
(51, 'Lê', 'giaquan@gmail.com', NULL, NULL, 'Gia Quân', '123', NULL, NULL, '0', '0', 1, NULL, 1, '2023-11-15 07:48:53', '2023-11-15 07:48:53'),
(52, 'Phan', 'dinhhieu@gmail.com', NULL, NULL, 'Dinh Hieu', '123', NULL, NULL, '0', '0', 1, NULL, 1, '2023-11-16 01:20:04', '2023-11-16 01:20:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_05_23_095628_create_brand_table', 1),
(3, '2023_05_23_095648_create_category_table', 1),
(4, '2023_05_23_095652_create_contact_table', 1),
(5, '2023_05_23_095657_create_menu_table', 1),
(6, '2023_05_23_095701_create_order_table', 1),
(7, '2023_05_23_095707_create_orderdetail_table', 1),
(8, '2023_05_23_095712_create_product_table', 1),
(9, '2023_05_23_095717_create_post_table', 1),
(10, '2023_05_23_095722_create_slider_table', 1),
(11, '2023_05_23_095725_create_topic_table', 1),
(12, '2023_05_23_095729_create_user_table', 1),
(13, '2023_05_23_095717_create_policy_table', 2),
(14, '2023_09_29_055509_create_customer_table', 3),
(15, '2023_10_04_105706_create_voucher_table', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `db_brand`
--
ALTER TABLE `db_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_brand_name_unique` (`name`) USING HASH;

--
-- Chỉ mục cho bảng `db_category`
--
ALTER TABLE `db_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_config`
--
ALTER TABLE `db_config`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_contact`
--
ALTER TABLE `db_contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_customer`
--
ALTER TABLE `db_customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_menu`
--
ALTER TABLE `db_menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_order`
--
ALTER TABLE `db_order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_orderdetail`
--
ALTER TABLE `db_orderdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `db_policy`
--
ALTER TABLE `db_policy`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_post`
--
ALTER TABLE `db_post`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_product`
--
ALTER TABLE `db_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_productsale`
--
ALTER TABLE `db_productsale`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_productstore`
--
ALTER TABLE `db_productstore`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_slider`
--
ALTER TABLE `db_slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_topic`
--
ALTER TABLE `db_topic`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_user`
--
ALTER TABLE `db_user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `db_brand`
--
ALTER TABLE `db_brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `db_category`
--
ALTER TABLE `db_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `db_config`
--
ALTER TABLE `db_config`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `db_contact`
--
ALTER TABLE `db_contact`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `db_customer`
--
ALTER TABLE `db_customer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `db_menu`
--
ALTER TABLE `db_menu`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `db_order`
--
ALTER TABLE `db_order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `db_orderdetail`
--
ALTER TABLE `db_orderdetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `db_policy`
--
ALTER TABLE `db_policy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `db_post`
--
ALTER TABLE `db_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `db_product`
--
ALTER TABLE `db_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `db_productsale`
--
ALTER TABLE `db_productsale`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `db_productstore`
--
ALTER TABLE `db_productstore`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `db_slider`
--
ALTER TABLE `db_slider`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `db_topic`
--
ALTER TABLE `db_topic`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `db_user`
--
ALTER TABLE `db_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
