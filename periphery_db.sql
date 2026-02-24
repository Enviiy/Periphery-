-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 25 2026 г., 01:56
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `periphery_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `basket`
--

CREATE TABLE `basket` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `basket`
--

INSERT INTO `basket` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(12, 4, 1, 1, '2026-02-24 16:07:56', '2026-02-24 16:07:56'),
(22, 5, 1, 1, '2026-02-24 19:01:24', '2026-02-24 19:01:24');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Мыши', 'mice', 'bi-mouse', '2026-02-24 21:01:51', '2026-02-24 21:01:51'),
(2, 'Клавиатуры', 'keyboards', 'bi-keyboard', '2026-02-24 21:01:51', '2026-02-24 21:01:51'),
(3, 'Наушники', 'headphones', 'bi-headphones', '2026-02-24 21:01:51', '2026-02-24 21:01:51'),
(4, 'Микрофоны', 'microphones', 'bi-mic', '2026-02-24 21:01:51', '2026-02-24 21:01:51'),
(5, 'Коврики', 'mousepads', 'bi-grid', '2026-02-24 21:01:51', '2026-02-24 21:01:51'),
(6, 'Мониторы', 'monitors', 'bi-display', '2026-02-24 21:01:51', '2026-02-24 21:01:51');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('new','processing','completed','cancelled') DEFAULT 'new',
  `payment_method` varchar(100) DEFAULT NULL,
  `delivery_method` varchar(100) DEFAULT NULL,
  `delivery_address` text,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `total_amount`, `status`, `payment_method`, `delivery_method`, `delivery_address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'ORD-699e053273fa5-20260224', 5, '31995.00', 'new', 'card', 'post', '12312, 12312312, индекс: 123123', '123131312312312321', '2026-02-24 17:08:18', '2026-02-24 17:08:18'),
(2, 'ORD-699e1891ac6aa-20260224', 6, '24498.00', 'new', 'cash', 'courier', 'похуй, Ул. Пушкина Д. Калатушкина 69, индекс: 5254', '+8 (965) 843 - 90 - 64', '2026-02-24 18:30:57', '2026-02-24 18:30:57'),
(3, 'ORD-699e1f87219d3-20260224', 5, '13998.00', 'new', 'card', 'courier', '123123, 123123, индекс: 123123', '1231231231231', '2026-02-24 19:00:39', '2026-02-24 19:00:39');

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`, `total`, `created_at`) VALUES
(1, 1, 2, 'Epomaker EK68', 1, '3999.00', '3999.00', '2026-02-24 17:08:18'),
(2, 1, 1, 'Ninjutso Sora V2', 4, '6999.00', '27996.00', '2026-02-24 17:08:18'),
(3, 2, 6, 'Xiaomi Fast LCD Monitor 24.5', 1, '19999.00', '19999.00', '2026-02-24 18:30:57'),
(4, 2, 4, 'Fifine AmpliGame AM8', 1, '4499.00', '4499.00', '2026-02-24 18:30:57'),
(5, 3, 1, 'Ninjutso Sora V2', 2, '6999.00', '13998.00', '2026-02-24 19:00:39');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `image` varchar(500) NOT NULL,
  `stock` int DEFAULT '0',
  `stock_status` enum('in_stock','low_stock','out_of_stock') DEFAULT 'in_stock',
  `badge` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `old_price`, `discount`, `category`, `image`, `stock`, `stock_status`, `badge`, `created_at`, `updated_at`) VALUES
(1, 'Ninjutso Sora V2', 'Сверхлегкая (39-40 г) беспроводная игровая мышь симметричной формы, разработанная для когтевого хвата.', '6999.00', NULL, NULL, 'Мыши', '/assets/image/sorav2.png', 15, 'in_stock', NULL, '2026-02-24 16:18:52', '2026-02-24 16:18:52'),
(2, 'Epomaker EK68', 'Компактная (65%, 68 клавиш) механическая клавиатура с тремя режимами подключения (USB-C, 2.4 ГГц, Bluetooth)', '3999.00', '5999.00', 15, 'Клавиатуры', '/assets/image/ek68.png', 8, 'in_stock', 'Скидка 15%', '2026-02-24 16:18:52', '2026-02-24 16:18:52'),
(3, 'Moondrop Blessing 3', 'Гибридные наушники премиум-класса (2DD+4BA) для истинных ценителей звука', '32000.00', NULL, NULL, 'Наушники', '/assets/image/moondrop.png', 5, 'in_stock', NULL, '2026-02-24 16:18:52', '2026-02-24 16:18:52'),
(4, 'Fifine AmpliGame AM8', 'Динамический микрофон с проводным подключением, который отлично подойдет для записи подкастов, стримов, озвучки.', '4499.00', NULL, NULL, 'Микрофоны', '/assets/image/AM8.png', 3, 'low_stock', NULL, '2026-02-24 16:18:52', '2026-02-24 16:18:52'),
(5, 'ControlGamingGear', 'Игровой коврик увеличенного размера с прошитыми краями и оптимальным контролем.', '2499.00', NULL, NULL, 'Коврики', '/assets/image/cgmp.png', 20, 'in_stock', NULL, '2026-02-24 16:18:52', '2026-02-24 16:18:52'),
(6, 'Xiaomi Fast LCD Monitor 24.5', 'Монитор с практически незаметной рамкой обеспечивает качественное изображение и комфорт просмотра.', '19999.00', NULL, NULL, 'Мониторы', '/assets/image/xiaomi.png', 7, 'in_stock', 'Новинка', '2026-02-24 16:18:52', '2026-02-24 16:18:52');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `patronymic` varchar(255) DEFAULT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `patronymic`, `login`, `email`, `password`, `is_admin`, `role`, `created_at`, `updated_at`) VALUES
(5, 'Ярослав', 'Коробейников', 'Андреевич', 'yuki', 'korobejnikovaroslav83@gmail.com', '$2y$10$x5wpBx3iza6M1iuaM80pB.Tukvv0PbC2YtpEu4UTIa/iUyzKk1RjK', 1, 'user', '2026-02-24 16:09:31', '2026-02-24 16:09:31'),
(6, 'макс', 'панама', NULL, 'макс клутой', 'coolmax@gmail.com', '$2y$10$J0YOPs7HWAHoBq255RKb7.ZrHlBxtIKzFIR35d79S7nIjZojhR8fO', 0, 'user', '2026-02-24 18:27:45', '2026-02-24 18:33:39');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `basket_user_id` (`user_id`),
  ADD KEY `basket_product_id` (`product_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `orders_user_id` (`user_id`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id` (`order_id`),
  ADD KEY `order_items_product_id` (`product_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_login_unique` (`login`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `basket`
--
ALTER TABLE `basket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
