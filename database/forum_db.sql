-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CameroVnet_db`
--

-- --------------------------------------------------------



CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `categories` (`id`, `name`, `description`, `date_updated`) VALUES
(1, 'Ajamil', 'Ajamil de Cameros', '2023-5-16 14:56:25'),
(2, 'San Román', 'San Román de cameros', '2023-5-16 14:56:46'),
(3, 'Fiestas', 'Festividad celebrada en algún pueblo', '2023-5-16 14:57:02'),
(4, 'Rabanera', 'Rabanera de Cameros', '2023-5-16 14:57:36'),
(5, 'Terroba', 'Terroba de Cameros', '2023-5-16 14:58:03'),
(6, 'Soto', 'Soto de Cameros', '2023-5-16 14:58:54');

-- --------------------------------------------------------



CREATE TABLE `comments` (
  `id` int(30) NOT NULL,
  `topic_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `comments` (`id`, `topic_id`, `user_id`, `comment`, `date_created`, `date_updated`) VALUES
(1, 2, 1, 'Prueba de comentario', '2023-5-16 14:59:13', '2023-5-16 14:59:46'),
(2, 2, 2, 'test', '2023-5-16 18:57:46', '2023-5-16 18:58:12'),
(3, 2, 1, 'Ejemplo', '2023-5-16 18:58:36', '2023-5-16 18:59:24'),
(4, 2, 1, 'asdasd', '2023-5-16 18:59:32', '2023-5-16 18:59:55');

-- --------------------------------------------------------


CREATE TABLE `forum_views` (
  `id` int(30) NOT NULL,
  `topic_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `forum_views` (`id`, `topic_id`, `user_id`) VALUES
(1, 2, 2),
(2, 2, 1),
(3, 2, 3);

-- --------------------------------------------------------


CREATE TABLE `replies` (
  `id` int(30) NOT NULL,
  `comment_id` int(30) NOT NULL,
  `reply` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `replies` (`id`, `comment_id`, `reply`, `user_id`, `date_created`, `date_updated`) VALUES
(1, 1, 'Opino lo mismo', 1, '2023-5-16 18:59:24', '0000-00-00 00:00:00'),
(2, 2, 'Prueba', 1, '2023-5-16 18:59:24', '0000-00-00 00:00:00'),
(3, 1, 'Respuesta', 1, '2023-5-16 18:59:24', '0000-00-00 00:00:00'),
(4, 1, 'Ejemplo respuesta', 1, '2020-10-17 10:01:00', '0000-00-00 00:00:00'),
(5, 1, 'Ejemplo respuesta', 1, '2023-5-16 18:59:24', '0000-00-00 00:00:00'),
(6, 1, 'Ejemplo respuesta', 1, '2023-5-16 18:59:24', '0000-00-00 00:00:00'),
(7, 1, 'Ejemplo respuesta', 1, '2023-5-16 18:59:24', '0000-00-00 00:00:00'),
(8, 1, 'Ejemplo respuesta', 1, '2023-5-16 18:59:24', '0000-00-00 00:00:00'),
(9, 1, 'Ejemplo respuesta', 1, '2023-5-16 18:59:24', '0000-00-00 00:00:00');

-- --------------------------------------------------------


CREATE TABLE `topics` (
  `id` int(30) NOT NULL,
  `category_ids` text NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `topics` (`id`, `category_ids`, `title`, `content`, `user_id`, `date_created`) VALUES
(1, '3,2,1', 'Discusión de ejemplo', 'Las fiestas de Soto son el dia 23 de julio, hasta el 25 de julio', 1, '2023-5-16 18:59:24'),
(2, '2', 'Discusión 2', 'Se cancelan las fiestas de Terroba', 1, '2023-5-16 18:59:24');

-- --------------------------------------------------------


CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Staff, 3= subscriber'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrador', 'admin', '0192023a7bbd73250516f069df18b500', 1),
(2, 'Usuario', 'user@gmail.com', '0192023a7bbd73250516f069df18b500', 2),
(3, 'Usuario2', 'user2@gmail.com', '46fd21746f5a5924c7f515fbf6ccc81e', 2);


ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `forum_views`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `comments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `forum_views`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `replies`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `topics`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
