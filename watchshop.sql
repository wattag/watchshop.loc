-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 20 2021 г., 08:00
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.3.17

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
(1, 3),
(1, 30),
(1, 31),
(1, 34),
(1, 35),
(2, 2),
(2, 4),
(3, 32),
(3, 36),
(4, 33),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 33),
(5, 35),
(5, 36),
(6, 30),
(6, 32),
(6, 34),
(7, 31),
(8, 1),
(8, 3),
(8, 4),
(8, 33),
(9, 2),
(9, 30),
(9, 32),
(9, 34),
(9, 35),
(10, 31),
(11, 36),
(12, 1),
(12, 3),
(12, 4),
(12, 33),
(13, 32),
(15, 2),
(15, 30),
(15, 31),
(15, 34),
(15, 36),
(16, 35),
(18, 1),
(18, 2),
(18, 3),
(18, 4),
(18, 30),
(18, 34),
(18, 35),
(19, 31),
(19, 32),
(19, 33),
(19, 36);

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
(2, 'Citizen', 'citizen', 'abt-2.jpg', 'Citizen является крупнейшим мировым производителем часов. Японский бренд, лидер в производстве часов на солнечных батареях.'),
(3, 'Royal London', 'royal-london', 'abt-3.jpg', 'Royal London – молодой часовой бренд родом из Великобритании. «Отцом основателем» бренда является компания Condor Group Ltd.');

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
(1, 'Мужские', 'muzhskie', 0, 'Мужские', 'Мужские'),
(2, 'Женские', 'zhenskie', 0, 'Women', 'Women'),
(3, 'Детские', 'detskie', 0, 'Kids', 'Kids'),
(4, 'Электронные', 'elektronnye', 1, 'Электронные', 'Электронные'),
(5, 'Механические', 'mehanicheskie', 1, 'Mechanical', 'Mechanical'),
(6, 'Casio', 'casio', 4, 'Casio', 'Casio'),
(7, 'Citizen', 'citizen', 4, 'Citizen', 'Citizen'),
(8, 'Royal London', 'royal-london', 5, 'Royal London', 'Royal London'),
(9, 'Seiko', 'seiko', 5, 'Seiko', 'Seiko'),
(10, 'Epos', 'epos', 5, 'Epos', 'Epos'),
(11, 'Электронные', 'elektronnye-11', 2, 'Electronic', 'Electronic'),
(12, 'Механические', 'mehanicheskie-12', 2, 'Mechanical', 'Mechanical'),
(13, 'Adriatica', 'adriatica', 11, 'Adriatica', 'Adriatica'),
(14, 'Anne Klein', 'anne-klein', 12, 'Anne Klein', 'Anne Klein'),
(16, 'Rolex', 'rolex', 4, 'Rolex', 'rolex watches'),
(21, 'Электронные', 'elektronnye-21', 3, 'Электронные', 'Электронные'),
(22, 'Механические', 'mehanicheskie-22', 3, 'Механические', 'Механические'),
(23, 'Diesel', 'diesel', 4, 'Diesel', 'Diesel'),
(24, 'Calvin Klein', 'calvin-klein', 12, '', ''),
(25, 'Guess', 'guess', 12, '', ''),
(26, 'Suunto', 'suunto', 11, '', ''),
(27, 'Casio', 'casio-27', 11, '', ''),
(28, 'Q&Q', 'q-and-q', 22, NULL, 'Q&Q watches'),
(29, 'Casio', 'casio-29', 21, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `currency`
--

CREATE TABLE `currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `code` varchar(3) CHARACTER SET utf8 NOT NULL,
  `symbol_left` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `symbol_right` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `value` float(15,2) NOT NULL,
  `base` enum('0','1') CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `currency`
--

INSERT INTO `currency` (`id`, `title`, `code`, `symbol_left`, `symbol_right`, `value`, `base`) VALUES
(1, 'рубль', 'RUB', '₽', NULL, 74.00, '0'),
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
(3, 1, 's-3.jpg'),
(22, 30, '5a6ed7089e0a98d54e0db2d837b6c9fd.jpg'),
(23, 30, '73ff39fb137256eae7d58736fbbf417e.jpg'),
(24, 30, 'f38d294d0b4aabd9a21139947feca76c.jpg'),
(25, 31, 'b17f7576a553b0659fd9d8284ac028ac.jpg'),
(26, 31, '83e2039d31a1a001c96d4b292350b4f7.jpg'),
(27, 32, 'c33c90a052406f1bf7c3a118ab844c77.jpg'),
(28, 33, 'ea3034f53674cec38cf9c92c97a573b2.jpg'),
(29, 33, 'd0aa8eecc6443bec8425d9ec8f7a303b.jpg'),
(30, 33, '869358bb2ca10e81c0921114ffde047b.jpg');

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
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8 DEFAULT NULL,
  `sum` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `user_id`, `status`, `date`, `update_at`, `currency`, `note`, `sum`) VALUES
(5, 19, 1, '2021-05-29', '2021-06-20 03:09:17', 'RUB', '', 29600),
(6, 23, 0, '2021-06-02', '2021-06-19 17:51:22', 'RUB', 'Для себя и мужа', 59200),
(7, 23, 0, '2021-06-02', '2021-06-19 16:41:27', 'RUB', 'Подарок для моих друзей', 59200),
(8, 23, 0, '2021-06-02', '2021-06-19 16:50:02', 'RUB', 'Я тут был', 65490),
(9, 24, 0, '2021-06-02', '2021-06-19 16:52:52', 'RUB', 'Подарок детям', 8880),
(10, 25, 0, '2021-06-19', '2021-06-19 17:03:01', 'RUB', 'Подарок другу и брату', 27380),
(11, 25, 0, '2021-06-19', NULL, 'RUB', 'Я тут тоже был', 44400),
(12, 16, 0, '2021-06-19', NULL, 'RUB', 'Проверка', 175380),
(13, 16, 0, '2021-06-19', NULL, 'RUB', '', 5180),
(14, 26, 1, '2021-06-19', '2021-06-19 20:00:00', 'RUB', 'Побыстрее бы', 22200),
(15, 27, 0, '2021-06-19', '2021-06-19 17:25:41', 'RUB', 'Купила часы себе и брату', 45880),
(16, 27, 0, '2021-06-19', NULL, 'RUB', 'Хочу себя побаловать', 5180),
(17, 26, 0, '2021-06-19', '2021-06-19 17:14:01', 'RUB', 'Себе и сыну', 81400),
(19, 26, 0, '2021-06-19', '2021-06-19 17:14:47', 'RUB', 'Слов нет. Одни эмоции', 39590),
(20, 28, 0, '2021-06-20', NULL, 'RUB', 'Приду, как только смогу', 62160);

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
(7, 5, 3, 1, 'Casio GA-1000-1AER', 29600),
(8, 6, 30, 1, 'Calvin Klein K2G236X6', 23162),
(9, 6, 2, 1, 'Casio MQ-24-7BUL', 5180),
(10, 7, 3, 1, 'Casio GA-1000-1AER', 29600),
(11, 7, 4, 5, 'Casio JP1010-00E', 29600),
(12, 8, 5, 1, 'Citizen BJ2111-08E', 37000),
(13, 8, 6, 1, 'Citizen AT0696-59E', 25900),
(14, 8, 8, 1, 'Royal London Q56J302Y', 2590),
(15, 9, 34, 1, 'Q&Q QC29J344Y', 1480),
(16, 9, 35, 1, 'Q&Q QC29J315Y', 2960),
(17, 9, 36, 1, 'Casio Collection LA-20WH-8A ', 4440),
(18, 10, 1, 1, 'Casio MRP-700-1AVEF', 22200),
(19, 10, 2, 1, 'Casio MQ-24-7BUL', 5180),
(20, 11, 1, 2, 'Casio MRP-700-1AVEF', 22200),
(21, 12, 1, 1, 'Casio MRP-700-1AVEF', 22200),
(22, 12, 2, 1, 'Casio MQ-24-7BUL', 5180),
(23, 12, 3, 5, 'Casio GA-1000-1AER', 29600),
(24, 13, 2, 1, 'Casio MQ-24-7BUL', 5180),
(25, 14, 1, 1, 'Casio MRP-700-1AVEF', 22200),
(26, 15, 30, 1, 'Calvin Klein K2G236X6', 23680),
(27, 15, 1, 1, 'Casio MRP-700-1AVEF', 22200),
(28, 16, 2, 1, 'Casio MQ-24-7BUL', 5180),
(29, 17, 4, 1, 'Casio JP1010-00E', 29600),
(30, 17, 6, 2, 'Citizen AT0696-59E', 25900),
(33, 19, 5, 1, 'Citizen BJ2111-08E', 37000),
(34, 19, 8, 1, 'Royal London Q56J302Y', 2590),
(35, 20, 30, 2, 'Calvin Klein K2G236X6', 23680),
(36, 20, 32, 5, 'Casio Collection LA-20WH-2A', 2960);

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
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `keywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'product_no_image.jpg',
  `hit` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `title`, `alias`, `content`, `price`, `old_price`, `status`, `keywords`, `description`, `img`, `hit`) VALUES
(1, 6, 'Casio MRP-700-1AVEF', 'casio-mrp-700-1avef', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', 300, 350, 1, NULL, 'display of information about the tides, hourly alarm, repeat alarm; CR2025 battery, battery life of 10 years', 'p-1.png', 1),
(2, 6, 'Casio MQ-24-7BUL', 'casio-mq-24-7bul', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>\r\n', 70, 140, 1, '', '', 'p-2.png', 1),
(3, 6, 'Casio GA-1000-1AER', 'casio-ga-1000-1aer', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>\r\n', 400, 470, 1, '123', '', 'p-3.png', 1),
(4, 6, 'Casio JP1010-00E', 'casio-jp1010-00e', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', 400, 600, 1, NULL, NULL, 'p-4.png', 1),
(5, 7, 'Citizen BJ2111-08E', 'citizen-bj2111-08e', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', 500, 0, 1, NULL, NULL, 'p-5.png', 1),
(6, 7, 'Citizen AT0696-59E', 'citizen-at0696-59e', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', 350, 0, 1, NULL, NULL, 'p-6.png', 1),
(8, 8, 'Royal London Q56J302Y', 'royal-london-q-56-j30-2y', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', 35, 0, 1, NULL, NULL, 'p-7.png', 1),
(30, 24, 'Calvin Klein K2G236X6', 'calvin-klein-k2g236x6', '<p>Стильный дизайн аксессуара, воплощенный в элегантном минимализме, поможет придать вашему повседневному образу завершенности.&nbsp;<strong>City.</strong></p>\r\n', 320, 350, 1, '', '', 'f9329949ecd51fb39cddb7d069669076.jpg', 1),
(31, 26, 'Suunto SS0226 Spartan Sport Wrist', 'suunto-ss-0226-spartan-sport-wrist', '<p>Suunto представляет новую линейку продвинутых GPS-часов для многоборья с цветным сенсорным экраном и пульсометром.&nbsp;<strong>Suunto Spartan Sport Wrist HR All Black.</strong>&nbsp;Унисекс. Спортивные часы, сочетающие в себе систему навигации GPS/GLONASS, хронограф, высотомер, компас, продвинутые возможности мониторинга сердечного ритма. Оптическая технология измерения пульса компании Valencell - оптический датчик пульса на нижней стороне часов испускает свет в запястье пользователя с помощью светодиодов и измеряет количество света, которое рассеивается кровотоком.</p>\r\n', 326, 555, 1, '', '', '6d767f099502d748d1c583b943339114.jpg', 0),
(32, 27, 'Casio Collection LA-20WH-2A', 'casio-collection-la-20wh-2a', '<p>Часы на каждый день должны подходить практически под любой стиль одежды.&nbsp;<strong>Standard Digital.</strong>&nbsp;Циферблат подсвечивается светодиодом. Секундомер с точностью показаний 1/100с и временем измерения 1ч.&nbsp;Сплит-хронограф.&nbsp;12-ти и 24-х часовой формат&nbsp;<strong>12-ти и 24-х часовой формат времени</strong>. Система отображения времени. В электронных часах устанавливается нажатием специальной кнопки. В аналоговых &ndash; 24-х часовая шкала может быть нанесена на безель, основной или дополнительный циферблат. времени.</p>\r\n', 40, 0, 1, '', '', 'ccbd1b8c09b14670a5a5d5a90c15b2cc.jpg', 0),
(33, 26, 'Suunto SS050474000 3 Moss Grey', 'suunto-ss050474000-3-moss-grey', '<p>Эти многофункциональные часы позволят вам планировать и контролировать ваши тренировки! Находка для спортсменов!&nbsp;<strong>3 Moss Grey.</strong>&nbsp;Унисекс смарт-часы для тренировок и поддержания здорового образа жизни. Часы оснащены собственной операционной системой Suunto. На официальном сайте вы можете скачать самое последнее программное обеспечение для улучшения работы часов. Оптическая технология измерения пульса компании Valencell - оптический датчик пульса на нижней стороне часов испускает свет в запястье пользователя с помощью светодиодов и измеряет количество света, которое рассеивается кровотоком. Стальной безель.</p>\r\n', 306, 0, 1, '', '', 'd58678ebd997ab3ac1edffdb5515723d.jpg', 0),
(34, 28, 'Q&Q QC29J344Y', 'q-q-qc29j344y', '<p>Отличное дополнение яркого образа маленького спортсмена - стильные часы.&nbsp;<strong>Casual Kids.&nbsp;</strong>Круглый металлический корпус. Индексы в виде арабских цифр. Циферблат и ремешок украшены рисунком теннисного, футбольного и баскетбольного мячей. Яркие цвета.</p>\r\n', 20, 28, 1, '', '', '514501e3e056c47bcf8159c6973ea954.jpg', 0),
(35, 28, 'Q&Q QC29J315Y', 'q-q-qc29j315y', '<p>Идеальные яркие часики порадуют маленькую принцессу. Прекрасный аксессуар для вашего ребенка.&nbsp;<strong>Casual Kids.&nbsp;</strong>Круглый металлический корпус. Циферблат с арабскими цифрами. Нежные пастельные цвета.</p>\r\n', 40, 0, 1, '', '', 'd17e5950b5bf97c62fa546adda68d10d.jpg', 0),
(36, 29, 'Casio Collection LA-20WH-8A ', 'casio-collection-la-20wh-8a', '<p>Часы на каждый день должны подходить практически под любой стиль одежды.&nbsp;<strong>Standard Digital.</strong>&nbsp;Циферблат подсвечивается светодиодом. Секундомер с точностью показаний 1/100с и временем измерения 1ч.&nbsp;Сплит-хронограф.&nbsp;12-ти и 24-х часовой формат&nbsp;времени.</p>\r\n', 60, 65, 1, '', '', '000f6211a1e3c90af9b25a1564df927e.jpg', 0);

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
(31, 2),
(31, 4),
(31, 8),
(33, 31);

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
(16, 'admin', '$2y$10$uHwnijxkj9saDjOc6QaRCOqmWbwS3MlCQ.JuFKw8wljbaVsM4tt.S', 'admin@gmail.com', 'Ilya', 'Russia1', 'admin'),
(18, 'Jhonny', '$2y$10$sf3KmBAv3J1Ez07VVHTeVenxTflibW0DNNJM6nmw31bSwkVPnQQg.', 'Jhonn@gmail.com', 'Jhonn', 'test addresss', 'user'),
(19, 'MrMangust', '$2y$10$CEO9AVXQm70cnvIbCi/souSJOOC9iDpBJzHqit9eYziEseurMH4FS', 'mangust@gmail.com', 'Alex', 'Pr-t Sozidatelei 54, 210', 'user'),
(20, 'wattag1', '$2y$10$OVV2gR6dMhIP/SltrZFqBOULzYLOMsHKG.rLBBPlGWFZs.hlAECmG', 'asdaaaas@gmail.com', 'Wattag', 'testaaaa', 'user'),
(21, 'wattag2', '$2y$10$Mx6Lp6ycE1TmAmN9GxM0tOECOMCrlO.Ie8PajVaDpMe.KCj9BGodS', 'Antonio@gmail.com', 'Antonio', 'asdasaaa', 'user'),
(22, 'wattag3', '$2y$10$3L0TMLCELbpRsrLe2fCH0ekbEiLK3cW2hvFrZEQo06waV56hWpU06', 'wattag3@gmail.com', 'wattag3', 'wattag3', 'user'),
(23, 'asd', '$2y$10$4lPflytbKOWEi3qxDbRjGevF6JOiWV3VEYOpkc6nj/B.EPIAW1d5a', 'asdasdas@gmail.com', 'Татьяна', 'Проспект Созидателей 54, 210', 'user'),
(24, 'wattago', '$2y$10$gTesV6DHtXz1Q2EycadetuLB2daNvRheCZaGA1ET7ZQ.yAm7aWuja', 'wattago@gmail.com', 'wattago', 'wattago', 'user'),
(25, 'alex', '$2y$10$igBdU1yrsd4FS87LjwgTW.UqWRlLfByj7IjOxLghXzzDxDGORP/Ua', 'alex@gmail.com', 'Алексей', 'Ульяновск, Проспект Созидателей', 'user'),
(26, 'Client', '$2y$10$/7kXXeUtMmnpKSXibJ3sZez8bgJexV.R.L8WV3GdzYuvNjO8k9qKq', 'litvinov374@gmail.com', 'Ilya', 'Ulyanovsk', 'user'),
(27, 'Izzy_Lee', '$2y$10$XjlwYUQ/hcJ8XZ92EXajUub5LjdHa94WdEFENiq42jI6.2BTvFEfu', 'DogCatDogCat567@yandex.ru', 'Татьяна', '123', 'user'),
(28, 'Elvira', '$2y$10$SUyRgduqg.63tPeLlCVMJ.iNexxjG4Vk71Vc8HkBnydgzlYhhla1i', 'Ella3535352@mail.ru', 'Эля', 'test addressa', 'user');

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
  ADD KEY `attribute_product_ibfk_1` (`product_id`);

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
  ADD KEY `gallery_ibfk_1` (`product_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `modification`
--
ALTER TABLE `modification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD CONSTRAINT `attribute_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Ограничения внешнего ключа таблицы `related_product`
--
ALTER TABLE `related_product`
  ADD CONSTRAINT `related_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
