-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 30 2022 г., 21:11
-- Версия сервера: 8.0.24
-- Версия PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `barbershop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Структура таблицы `people`
--

CREATE TABLE `people` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `motto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `people`
--

INSERT INTO `people` (`id`, `name`, `motto`, `description`, `path`) VALUES
(1, 'Александр Сигай', 'Делай то, что любишь и люби то, что делаешь!', 'Записавшись к этому мастеру, во время стрижки Вы можете насладиться непренуждённой беседой на любые темы. Это не отвлечёт Александра от создания его очередного шедевра для Вас. Вы почувствуете на себе столичный уровень, ведь Александр окончил минскую школу барберинга B-shool и точно чувстует себя как рыба в воде.', './people/alex.png'),
(2, 'Женжевская Юля', 'Главное — желание, не останавливаться при виде маленьких препятствий и у Вас всё получится) ', 'Если одажды с Вами приключилсь беда в барбер сфере, то Вам следует обратиться к нашему мастеру Юлии, которая занимается мужскими стрижками с 2012 года. Однако, у неё всё так же горят глаза к этому делу и она стремится создавать ещё и ещё, и уж точно знает своё дело на все 100%. Также даст советы по уходу и укладке волос, чтобы Ваша новая стрижка радовала Вас как можно больше.', './people/Julia.png'),
(3, 'Красовская Даша', 'Не бойтесь трудностей! Смело идите к поставленым целям)', 'Дарья не останавливается только на стрижках, она любит бегать по вечерам, в свободное время учит английский, так что иностранные клиенты это не проблема. В данной сфере с 2018 года, знает последние модные фишки и тенденции. Трепетно относится к клиентам и их пожеланиям и обязательно сделает Вам именно ту самую стрижку, так что, записавшись к ней Вы жалеть точно не будете.', './people/Daria.png'),
(4, 'Роман', 'Удача выпадает лишь раз...', 'no-name мастер, выпадает лишь 1:1000, Вам повезло, если Вы его застали.', './people/Roman.png');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int UNSIGNED NOT NULL,
  `id_type` int UNSIGNED NOT NULL,
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cost` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `id_type`, `name`, `cost`) VALUES
(1, 1, 'Hair tottoo', '5-20'),
(2, 1, 'Камуфляж седины', '25'),
(3, 1, 'Укладка', '10'),
(4, 1, 'Стрижка bro+bro', '45'),
(5, 1, 'Стрижка машинкой (одной насадкой)', '20'),
(6, 1, 'Стрижка папа+сын', '40'),
(7, 1, 'Стрижка детская 5-12 лет', '20'),
(8, 1, 'Стрижка', '25'),
(9, 2, 'Коррекция бороды', '15'),
(10, 2, 'Королевское бритьё', '35'),
(11, 2, 'Тонирование бороды', '20'),
(12, 2, 'Моделирование усов и бороды', '20'),
(13, 3, 'Стрижка + борода + чёрная маска для лица', '55'),
(14, 3, 'Стрижка + борода + тонирование бороды', '55'),
(15, 3, 'Стрижка + борода', '40');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `service_view`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `service_view` (
`cost` varchar(256)
,`id` int unsigned
,`name` varchar(256)
,`type` varchar(256)
);

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`id`, `name`) VALUES
(1, 'голова'),
(2, 'борода'),
(3, 'комплексы');

-- --------------------------------------------------------

--
-- Структура для представления `service_view`
--
DROP TABLE IF EXISTS `service_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `service_view`  AS SELECT `services`.`id` AS `id`, `services`.`name` AS `name`, `services`.`cost` AS `cost`, `types`.`name` AS `type` FROM (`services` join `types` on((`types`.`id` = `services`.`id_type`))) ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type` (`id_type`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `people`
--
ALTER TABLE `people`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
