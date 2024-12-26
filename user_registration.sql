-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2024 at 04:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_registration`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateUser` (IN `fname` VARCHAR(50), IN `lname` VARCHAR(50), IN `mobile` VARCHAR(10), IN `pass` VARCHAR(255))   BEGIN
    INSERT INTO registration (first_name, last_name, mobile_number, password_hash)
    VALUES (fname, lname, mobile, pass);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUser` (IN `userId` INT)   BEGIN
    DELETE FROM registration WHERE id = userId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUser` (IN `userId` INT)   BEGIN
    SELECT * FROM registration WHERE id = userId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUser` (IN `userId` INT, IN `fname` VARCHAR(50), IN `lname` VARCHAR(50), IN `mobile` VARCHAR(10))   BEGIN
    UPDATE registration
    SET first_name = fname, last_name = lname, mobile_number = mobile
    WHERE id = userId;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(10) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `first_name`, `last_name`, `mobile_number`, `password_hash`, `created_date`, `updated_date`) VALUES
(1, 'neha', 'suhas', '0987654321', '$2y$10$CUxgRdnEp4H7mGHuxOku4ePrZRpNYS6Bs6dYPm7Umyf8.079Mx326', '2024-12-26 19:26:39', '2024-12-26 19:26:39'),
(2, 'neha', 'suhas', '0987654321', '$2y$10$N/wMR3dC1CElHGYrOxPHSeaQNyrjfYaHFEv9a5yVHikZPWBlxyv5S', '2024-12-26 19:30:38', '2024-12-26 19:30:38'),
(3, 'Neha', 'Wani', '0987654321', '$2y$10$IOfAIB47A0ZDymZJ96BWku7lna4bxXqKccS2s4DZFHtJU0cEmJ70a', '2024-12-26 19:33:34', '2024-12-26 19:33:34'),
(4, 'Neha', 'Wani', '0987654321', '$2y$10$kmZhFN8YZaFSjwTqDsig1e5NHonseOEKVrzjgM/HmM4OxzzPniY9C', '2024-12-26 19:34:03', '2024-12-26 19:34:03'),
(5, 'Trupti', 'Wani', '1234567890', '$2y$10$UShzoeinhRSVHZu3gqOiF.20yjSM8l.zQJFAyMv7WHNn1mD65u0la', '2024-12-26 19:34:34', '2024-12-26 19:34:34'),
(6, 'Neha', 'Wani', '9067881048', '$2y$10$O6lMA0dMKWN7WtNOSHRwiuSAcyMSjKsyCUto2RtjopRY7fWf77HmC', '2024-12-26 20:00:39', '2024-12-26 20:00:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
