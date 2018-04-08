-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2017 at 04:43 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

--
-- author: Subhajit Majumder
--
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skybee`
--
CREATE DATABASE IF NOT EXISTS `skybee` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `skybee`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `fstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `mailid` varchar(250) NOT NULL,
  `doba` date NOT NULL,
  `aphone` int(100) NOT NULL,
  `level` int(50) NOT NULL,
  `aprofipic` varchar(255) NOT NULL,
  `apassword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brandid` int(50) NOT NULL,
  `brandname` varchar(100) NOT NULL,
  `brandstat` decimal(1,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `brandid` int(50) NOT NULL,
  `pid` int(50) NOT NULL,
  `pname` varchar(200) NOT NULL,
  `product_pic` varchar(255) NOT NULL,
  `tqty` int(255) NOT NULL,
  `pprice` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

CREATE TABLE `product_order` (
  `order_id` int(6) NOT NULL,
  `mail_id` varchar(255) NOT NULL,
  `order_date` date NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `item_ordered` decimal(2,0) NOT NULL,
  `total_price` decimal(6,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `fname` varchar(250) NOT NULL,
  `lstname` varchar(100) NOT NULL,
  `mailid` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `phone` decimal(10,0) NOT NULL,
  `addr` varchar(200) NOT NULL,
  `proflpic` varchar(255) NOT NULL,
  `panno` decimal(10,0) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`mailid`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brandid`),
  ADD KEY `brandname` (`brandname`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`brandid`,`pid`),
  ADD UNIQUE KEY `pname` (`pname`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `mail_id` (`mail_id`),
  ADD KEY `product_name` (`product_name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`mailid`),
  ADD UNIQUE KEY `panno` (`panno`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_order`
--
ALTER TABLE `product_order`
  MODIFY `order_id` int(6) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brandid`) REFERENCES `brand` (`brandid`);

--
-- Constraints for table `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `mail_id` FOREIGN KEY (`mail_id`) REFERENCES `user` (`mailid`),
  ADD CONSTRAINT `product_name` FOREIGN KEY (`product_name`) REFERENCES `product` (`pname`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
