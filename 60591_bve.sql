-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 16 2023 г., 23:32
-- Версия сервера: 5.7.38
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `60591_bve`
--

-- --------------------------------------------------------

--
-- Структура таблицы `пользователь`
--

CREATE TABLE `пользователь` (
  `id_people` int(11) NOT NULL COMMENT 'id_people',
  `Фамилия Имя` varchar(255) NOT NULL COMMENT 'фамилия имя заказчика',
  `Телефон` varchar(11) NOT NULL COMMENT 'номер телефона заказчика',
  `e-mail` varchar(50) NOT NULL COMMENT 'e-mail заказчика'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `пользователь`
--

INSERT INTO `пользователь` (`id_people`, `Фамилия Имя`, `Телефон`, `e-mail`) VALUES
(1, 'Анна Иванова', '89465227988', 'A98@mail.ru'),
(2, 'Виктор Тук', '84662785455', 'TukTuk@cloun.com'),
(3, 'Надежна Апурюк', '89124518737', 'Nadya.Ap1975@mail.ru'),
(4, 'Григорий Тканов', '89124545544', 'Cqi@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `заказы`
--

CREATE TABLE `заказы` (
  `id` int(11) NOT NULL COMMENT 'id заказа',
  `id_people` int(11) NOT NULL COMMENT 'кто заказал',
  `id_cake` int(11) NOT NULL COMMENT 'начинка',
  `вес` int(20) NOT NULL COMMENT 'вес торта',
  `цена` int(50) NOT NULL COMMENT 'цена заказа',
  `дата` date NOT NULL COMMENT 'на когда торт',
  `комментарии` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `заказы`
--

INSERT INTO `заказы` (`id`, `id_people`, `id_cake`, `вес`, `цена`, `дата`, `комментарии`) VALUES
(1, 1, 1, 3, 4500, '2023-01-25', 'добавить розовую свечку в виде цифры 5'),
(2, 4, 7, 2, 3000, '2023-02-23', '');

-- --------------------------------------------------------

--
-- Структура таблицы `торты`
--

CREATE TABLE `торты` (
  `id_cake` int(11) NOT NULL COMMENT 'id_cake',
  `название` varchar(255) NOT NULL COMMENT 'наименование торта',
  `категория` varchar(255) NOT NULL,
  `начинка` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `торты`
--

INSERT INTO `торты` (`id_cake`, `название`, `категория`, `начинка`) VALUES
(1, 'красный бархат', 'ягодный', 'красный бисквит, сливочный творожный крем и конфи из ягод на выбор: клубника, вишня, малина'),
(2, 'чёрный лес', 'шоколадный', 'шоколадный бисквит, два вида крема сливочно-творожный и шоколадный, в прослойке ягоды вишни'),
(3, 'молочная девочка', 'ягодный', 'белые коржи на сгущенке, сливочно-творожный крем, в прослойке ягодный джем на выбор: клубника, малина, вишня'),
(4, 'сникерс', 'ореховый', 'шоколадный бисквит, крем - взбитый шоколадный ганаш, в прослойке соленая карамель и дробленый арахис'),
(5, 'птичье молоко', 'классический', 'белый бисквит, нежной сливочное суфле и шоколадная глазировка'),
(6, 'медовик', 'классический', 'медовые коржи и нежный сметанный крем'),
(7, 'рыжик', 'классический', 'медовые коржи и нежный заварной крем на сгущенке'),
(8, 'шоколадный медовик', 'шоколадный', 'шоколадные медовые коржи и нежный сметанный крем');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `пользователь`
--
ALTER TABLE `пользователь`
  ADD PRIMARY KEY (`id_people`);

--
-- Индексы таблицы `заказы`
--
ALTER TABLE `заказы`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cake` (`id_cake`),
  ADD KEY `заказы_ibfk_2` (`id_people`);

--
-- Индексы таблицы `торты`
--
ALTER TABLE `торты`
  ADD PRIMARY KEY (`id_cake`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `пользователь`
--
ALTER TABLE `пользователь`
  MODIFY `id_people` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id_people', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `заказы`
--
ALTER TABLE `заказы`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id заказа', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `торты`
--
ALTER TABLE `торты`
  MODIFY `id_cake` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id_cake', AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `заказы`
--
ALTER TABLE `заказы`
  ADD CONSTRAINT `заказы_ibfk_1` FOREIGN KEY (`id_cake`) REFERENCES `торты` (`id_cake`),
  ADD CONSTRAINT `заказы_ibfk_2` FOREIGN KEY (`id_people`) REFERENCES `пользователь` (`id_people`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
