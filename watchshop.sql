-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 31 2021 г., 20:35
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `watchshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_group`
--

CREATE TABLE `attribute_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `attribute_group`
--

INSERT INTO `attribute_group` (`id`, `title`) VALUES
(1, 'Механизм'),
(2, 'Стекло'),
(3, 'Ремешок'),
(4, 'Корпус'),
(5, 'Индикация');

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_product`
--

CREATE TABLE `attribute_product` (
  `attr_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `attribute_product`
--

INSERT INTO `attribute_product` (`attr_id`, `product_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 18),
(1, 19),
(2, 4),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 18),
(6, 19),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 18),
(9, 19),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 18),
(14, 19),
(18, 1),
(18, 2),
(18, 4),
(18, 18),
(18, 19),
(19, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_value`
--

CREATE TABLE `attribute_value` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 NOT NULL,
  `attr_group_id` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `attribute_value`
--

INSERT INTO `attribute_value` (`id`, `value`, `attr_group_id`) VALUES
(1, 'Механика с автоподзаводом ', 1),
(2, 'Механика с ручным заводом', 1),
(3, 'Кварцевый от батарейки', 1),
(4, 'Кварцевый от солнечного аккумулятора ', 1),
(5, 'Сапфировое', 2),
(6, 'Минеральное', 2),
(7, 'Полимерное', 2),
(8, 'Стальной', 3),
(9, 'Кожаный', 3),
(10, 'Каучуковый', 3),
(11, 'Полимерный', 3),
(12, 'Нержавеющая сталь', 4),
(13, 'Титановый сплав', 4),
(14, 'Латунь', 4),
(15, 'Полимер', 4),
(16, 'Керамика', 4),
(17, 'Алюминий', 4),
(18, 'Аналоговые', 5),
(19, 'Цифровые', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `brand`
--

CREATE TABLE `brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'brand_no_image.jpg',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `brand`
--

INSERT INTO `brand` (`id`, `title`, `alias`, `img`, `description`) VALUES
(1, 'Rolex', 'rolex', 'abt-1.jpg', 'Часы Rolex прошли испытание временем благодаря мастерству часовщиков, прилагающих все свои знания и умения для создания каждой модели Rolex.'),
(2, 'Citizen', 'citizen', 'abt-2.jpg', 'Citizen is the world\'s largest watch manufacturer. Currently, the company is engaged in the latest developments in the field of Eco-Drive technology.'),
(3, 'Royal London', 'royal-london', 'abt-3.jpg', 'Royal London is a young watch brand originally from the United Kingdom. The \"founding father\" of the brand is Condor Group Ltd.'),
(4, 'Seiko', 'seiko', 'brand_no_image.jpg', 'Seiko watches'),
(5, 'Diesel', 'diesel', 'brand_no_image.jpg', 'Diesel watches'),
(7, 'Casio', 'casio', 'abt-1.jpg', 'Часы Rolex прошли испытание временем благодаря мастерству часовщиков, дизайнеров и инженеров, преданных своему делу и прилагающих все свои знания и умения для создания каждой часовой модели Rolex.');

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 NOT NULL,
  `parent_id` tinyint(3) UNSIGNED NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`, `alias`, `parent_id`, `keywords`, `description`) VALUES
(1, 'Men', 'men', 0, 'Men', 'Men'),
(2, 'Women', 'women', 0, 'Women', 'Women'),
(3, 'Kids', 'kids', 0, 'Kids', 'Kids'),
(4, 'Electronic', 'elektronnye', 1, 'Electronic', 'Electronic'),
(5, 'Mechanical', 'mehanicheskie', 1, 'Mechanical', 'Mechanical'),
(6, 'Casio', 'casio', 4, 'Casio', 'Casio'),
(7, 'Citizen', 'citizen', 4, 'Citizen', 'Citizen'),
(8, 'Royal London', 'royal-london', 5, 'Royal London', 'Royal London'),
(9, 'Seiko', 'seiko', 5, 'Seiko', 'Seiko'),
(10, 'Epos', 'epos', 5, 'Epos', 'Epos'),
(11, 'Electronic', 'elektronnye-11', 2, 'Electronic', 'Electronic'),
(12, 'Mechanical', 'mechanical-12', 2, 'Mechanical', 'Mechanical'),
(13, 'Adriatica', 'adriatica', 11, 'Adriatica', 'Adriatica'),
(14, 'Anne Klein', 'anne-klein', 12, 'Anne Klein', 'Anne Klein'),
(16, 'Rolex', 'rolex', 4, 'Rolex', 'rolex watches');

-- --------------------------------------------------------

--
-- Структура таблицы `currency`
--

CREATE TABLE `currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `code` varchar(3) CHARACTER SET utf8 NOT NULL,
  `symbol_left` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `symbol_right` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `value` float(15,2) NOT NULL,
  `base` enum('0','1') CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `currency`
--

INSERT INTO `currency` (`id`, `title`, `code`, `symbol_left`, `symbol_right`, `value`, `base`) VALUES
(1, 'рубль', 'RUB', '₽', 'руб.', 74.00, '0'),
(2, 'доллар', 'USD', '$', NULL, 1.00, '1'),
(3, 'евро', 'EUR', '€', NULL, 1.20, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--

CREATE TABLE `gallery` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'no_image.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gallery`
--

INSERT INTO `gallery` (`id`, `product_id`, `img`) VALUES
(1, 1, 's-1.jpg'),
(2, 1, 's-2.jpg'),
(3, 1, 's-3.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `modification`
--

CREATE TABLE `modification` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `modification`
--

INSERT INTO `modification` (`id`, `product_id`, `title`, `price`) VALUES
(1, 1, 'Silver', 300),
(2, 1, 'Black', 300),
(3, 1, 'Dark Black', 305),
(4, 1, 'Red', 310),
(5, 2, 'Silver', 80),
(6, 2, 'Red', 70);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `user_id`, `status`, `date`, `update_at`, `currency`, `note`) VALUES
(5, 19, '1', '2021-05-29 11:45:57', '2021-05-29 12:59:25', 'RUB', '');

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `qty`, `title`, `price`) VALUES
(7, 5, 3, 1, 'Casio GA-1000-1AER', 29600);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8 DEFAULT NULL,
  `price` float NOT NULL DEFAULT 0,
  `old_price` float NOT NULL DEFAULT 0,
  `status` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '1',
  `keywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'product_no_image.jpg',
  `hit` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `title`, `alias`, `content`, `price`, `old_price`, `status`, `keywords`, `description`, `img`, `hit`) VALUES
(1, 6, 'Casio MRP-700-1AVEF', 'casio-mrp-700-1avef', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', 300, 350, '1', NULL, 'display of information about the tides, hourly alarm, repeat alarm; CR2025 battery, battery life of 10 years', 'p-1.png', '1'),
(2, 6, 'Casio MQ-24-7BUL', 'casio-mq-24-7bul', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', 70, 140, '1', NULL, NULL, 'p-2.png', '1'),
(3, 6, 'Casio GA-1000-1AER', 'casio-ga-1000-1aer', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', 400, 470, '1', NULL, NULL, 'p-3.png', '1'),
(4, 6, 'Casio JP1010-00E', 'casio-jp1010-00e', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', 400, 600, '1', NULL, NULL, 'p-4.png', '1'),
(5, 7, 'Citizen BJ2111-08E', 'citizen-bj2111-08e', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', 500, 0, '1', NULL, NULL, 'p-5.png', '1'),
(6, 7, 'Citizen AT0696-59E', 'citizen-at0696-59e', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', 350, 0, '1', NULL, NULL, 'p-6.png', '1'),
(7, 8, 'Royal London 41040-01', 'royal-london-41040-01', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', 90, 0, '1', NULL, NULL, 'p-8.png', '1'),
(8, 8, 'Royal London Q56J302Y', 'royal-london-q-56-j30-2y', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', 35, 0, '1', NULL, NULL, 'p-7.png', '1'),
(13, 4, 'Тестовая товар 1', 'testovaya-tovar-1', '<p><strong>Тестовая товар 1</strong></p>\r\n', 350, 555, '1', 'Тестовая товар 1', 'Тестовая товар 1', 'product_no_image.jpg', '0'),
(14, 1, 'Тестовый товар 1', 'testovyy-tovar-1', '<p><img alt=\"\" src=\"/public/upload/images/1/6dNQCVfQTlU.jpg\" style=\"float:left; height:818px; width:1080px\" />asdasdasdasd</p>\r\n', 350, 555, '1', 'Тестовый товар 1', 'Тестовый товар 1', 'product_no_image.jpg', '1'),
(15, 4, 'Тестовый товар 2', 'testovyy-tovar-2', '', 350, 555, '1', 'Тестовый товар 2', 'Тестовый товар 2', 'product_no_image.jpg', '1'),
(16, 4, 'Тестовый товар 2', 'testovyy-tovar-2-16', '', 350, 555, '1', 'Тестовый товар 2', 'Тестовый товар 2', 'product_no_image.jpg', '1'),
(17, 4, 'Тестовый товар 2', 'testovyy-tovar-2-17', '', 350, 555, '1', 'Тестовый товар 2', 'Тестовый товар 2', 'product_no_image.jpg', '1'),
(18, 4, 'Тестовый товар 2', 'testovyy-tovar-2-18', '', 350, 555, '1', 'Тестовый товар 2', 'Тестовый товар 2', 'product_no_image.jpg', '1'),
(19, 4, 'Тестовый товар 3', 'testovyy-tovar-3', '', 350, 11111, '1', 'Тестовый товар 3', 'Тестовый товар 3', 'product_no_image.jpg', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `related_product`
--

CREATE TABLE `related_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `related_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `related_product`
--

INSERT INTO `related_product` (`product_id`, `related_id`) VALUES
(1, 2),
(1, 5),
(2, 5),
(2, 8),
(5, 1),
(5, 7),
(5, 8),
(19, 2),
(19, 4),
(19, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `role` enum('user','admin') CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `email`, `name`, `address`, `role`) VALUES
(6, 'wattag', '$2y$10$puHiNOwU5/13MF1KE8.Z0ekvUV1O2kQWWJWdbbe20N9iVZOQoWY5q', 'asdas@gmail.com', 'Ilya', 'test', 'user'),
(8, 'user1', '$2y$10$dBSPNTecgwE.07YZlw5dneJ7siJkqxP8SDJlNeXx7mmEuZoEIhZau', 'test4@gmail.com', 'Anton', '121321', 'user'),
(9, 'mondew', '$2y$10$bW6vrSu.HcnGBxpOub8kwuHHNHlRWuJs.QaVxffimEZBEGOVSP1em', 'john12@gmail.com', 'John', 'Amerika', 'user'),
(10, 'root', '$2y$10$VYNBb5nnQbfdQvn/Xdnrge5OtgUkuB8MPxrHVfOZaRko7c09TH/Ym', 'root@gmail.com', 'Ilya', 'test root address', 'user'),
(12, 'test1', '$2y$10$AIIAHqaPgezp48zPeVVdb.iyqWD73PqjgqQypkBbe3mFtdBzGzF6i', 'testtest@gmail.com', 'test test', 'testtest', 'user'),
(13, 'Tatyana', '$2y$10$Rk/TtmnrUt8aw4LNabgH..eLZErAkuo3E.g1AM/2BCvQe6yRrfooi', 'asda5s@gmail.com', 'Ttt', 'asdas33', 'user'),
(14, 'asdd', '$2y$10$iCd4JkhlDpTIeF2kldILrur/BZzxj2GJRqzNtpRMvnsMwTwzFEM1m', 'aasff@gmail.com', 'test test test', 'asdasdasds', 'user'),
(15, 'test12', '$2y$10$K90VPMWVZZgflsrWQOrgG..I2Y.ULoLV6bYCy5XY822AJo0qUI5Xu', 'asdasd@gmail.com', 'asdasdsa', 'gfhgfhf', 'user'),
(16, 'admin', '$2y$10$uHwnijxkj9saDjOc6QaRCOqmWbwS3MlCQ.JuFKw8wljbaVsM4tt.S', 'admin@gmail.com', 'Ilya', 'Russia', 'admin'),
(18, 'Jhonny', '$2y$10$sf3KmBAv3J1Ez07VVHTeVenxTflibW0DNNJM6nmw31bSwkVPnQQg.', 'Jhonn@gmail.com', 'Jhonn', 'test addresss', 'user'),
(19, 'MrMangust', '$2y$10$CEO9AVXQm70cnvIbCi/souSJOOC9iDpBJzHqit9eYziEseurMH4FS', 'mangust@gmail.com', 'Alex', 'Pr-t Sozidatelei 54, 210', 'user'),
(20, 'wattag1', '$2y$10$OVV2gR6dMhIP/SltrZFqBOULzYLOMsHKG.rLBBPlGWFZs.hlAECmG', 'asdaaaas@gmail.com', 'Wattag', 'testaaaa', 'user'),
(21, 'wattag2', '$2y$10$Mx6Lp6ycE1TmAmN9GxM0tOECOMCrlO.Ie8PajVaDpMe.KCj9BGodS', 'Antonio@gmail.com', 'Antonio', 'asdasaaa', 'user'),
(22, 'wattag3', '$2y$10$3L0TMLCELbpRsrLe2fCH0ekbEiLK3cW2hvFrZEQo06waV56hWpU06', 'wattag3@gmail.com', 'wattag3', 'wattag3', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `attribute_group`
--
ALTER TABLE `attribute_group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD PRIMARY KEY (`attr_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attr_group_id` (`attr_group_id`);

--
-- Индексы таблицы `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `modification`
--
ALTER TABLE `modification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modification_ibfk_1` (`product_id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_product_ibfk_1` (`order_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `related_product`
--
ALTER TABLE `related_product`
  ADD PRIMARY KEY (`product_id`,`related_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address` (`address`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `attribute_group`
--
ALTER TABLE `attribute_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `attribute_value`
--
ALTER TABLE `attribute_value`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `modification`
--
ALTER TABLE `modification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD CONSTRAINT `attribute_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `attribute_product_ibfk_2` FOREIGN KEY (`attr_id`) REFERENCES `attribute_value` (`id`);

--
-- Ограничения внешнего ключа таблицы `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD CONSTRAINT `attribute_value_ibfk_1` FOREIGN KEY (`attr_group_id`) REFERENCES `attribute_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Ограничения внешнего ключа таблицы `modification`
--
ALTER TABLE `modification`
  ADD CONSTRAINT `modification_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
