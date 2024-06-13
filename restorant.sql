-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2021 at 09:37 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restorant`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblkategori`
--

CREATE TABLE `tblkategori` (
  `idkategori` int(11) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblkategori`
--

INSERT INTO `tblkategori` (`idkategori`, `kategori`, `keterangan`) VALUES
(8, 'Makanan', 'Ini adalah menu makanan'),
(9, 'Minuman', 'Ini adalah menu minuman'),
(10, 'Cemilan', 'ini cemilan');

-- --------------------------------------------------------

--
-- Table structure for table `tblmeja`
--

CREATE TABLE `tblmeja` (
  `idmeja` int(11) NOT NULL,
  `meja` varchar(20) NOT NULL,
  `is_aktif` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblmeja`
--

INSERT INTO `tblmeja` (`idmeja`, `meja`, `is_aktif`) VALUES
(1, 'Meja 1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblmenu`
--

CREATE TABLE `tblmenu` (
  `idmenu` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `menu` varchar(100) NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `harga` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblmenu`
--

INSERT INTO `tblmenu` (`idmenu`, `idkategori`, `menu`, `gambar`, `harga`) VALUES
(28, 8, 'Nasi Goreng', 'nasi goreng.jpg', 15000),
(29, 8, 'Ayam goreng', 'ayamgoreng.jpg', 15000),
(30, 8, 'Ayam geprek', 'Ayam_geprek.png', 15000),
(31, 8, 'Nasi kebuli', 'nasi kebuli.jpg', 23000),
(32, 9, 'Es teh', 'es teh.jfif', 6000),
(33, 9, 'Es jeruk manis', 'es jeruk.jfif', 7500),
(34, 9, 'Es campur', 'es campur.jfif', 10000),
(35, 9, 'Es coklat', 'es coklat.jfif', 10000),
(36, 10, 'Kebab', 'kebab.jpg', 13000),
(37, 10, 'Kentang goreng', 'kentang_goreng.jpg', 15000),
(38, 10, 'Singkong goreng', 'singkong goreng.jpg', 13000),
(39, 10, 'Sosis goreng', 'sosis goreng.jfif', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

CREATE TABLE `tblorder` (
  `idorder` int(11) NOT NULL,
  `idpelanggan` int(11) NOT NULL,
  `tglorder` date NOT NULL,
  `total` float NOT NULL DEFAULT 0,
  `bayar` float NOT NULL DEFAULT 0,
  `kembali` float NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblorder`
--

INSERT INTO `tblorder` (`idorder`, `idpelanggan`, `tglorder`, `total`, `bayar`, `kembali`, `status`) VALUES
(13, 5, '2020-02-24', 51000, 60000, 9000, 1),
(14, 5, '2020-02-26', 54000, 60000, 6000, 1),
(15, 5, '2020-02-26', 36000, 0, 0, 0),
(16, 1, '2020-02-26', 24000, 0, 0, 0),
(17, 1, '2020-02-26', 45000, 0, 0, 0),
(18, 2, '2020-02-26', 126000, 0, 0, 0),
(19, 1, '2020-02-26', 24000, 0, 0, 0),
(20, 2, '2020-02-27', 30000, 30000, 0, 1),
(21, 5, '2020-02-28', 54000, 60000, 6000, 1),
(22, 6, '2020-11-30', 33000, 34000, 1000, 1),
(23, 7, '2021-03-26', 10000, 11000, 1000, 1),
(24, 7, '2021-03-26', 30500, 0, 0, 0),
(25, 7, '2021-03-26', 6000, 0, 0, 0),
(26, 7, '2021-03-29', 15000, 0, 0, 0),
(27, 8, '2021-03-30', 10000, 12000, 2000, 1),
(28, 7, '2021-03-30', 15000, 16000, 1000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblorderdetail`
--

CREATE TABLE `tblorderdetail` (
  `idorderdetail` int(11) NOT NULL,
  `idorder` int(11) NOT NULL,
  `idmenu` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `hargajual` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblorderdetail`
--

INSERT INTO `tblorderdetail` (`idorderdetail`, `idorder`, `idmenu`, `jumlah`, `hargajual`) VALUES
(26, 13, 17, 2, 18000),
(27, 13, 23, 1, 15000),
(28, 14, 17, 3, 18000),
(29, 15, 17, 2, 18000),
(30, 16, 18, 2, 12000),
(31, 17, 21, 2, 15000),
(32, 17, 23, 1, 15000),
(33, 18, 17, 7, 18000),
(34, 19, 18, 2, 12000),
(35, 20, 23, 1, 15000),
(36, 20, 24, 1, 15000),
(37, 21, 17, 3, 18000),
(38, 22, 35, 1, 10000),
(39, 22, 31, 1, 23000),
(40, 23, 35, 1, 10000),
(41, 24, 33, 1, 7500),
(42, 24, 31, 1, 23000),
(43, 25, 32, 1, 6000),
(44, 26, 28, 1, 15000),
(45, 27, 34, 1, 10000),
(46, 28, 28, 1, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `tblpelanggan`
--

CREATE TABLE `tblpelanggan` (
  `idpelanggan` int(11) NOT NULL,
  `pelanggan` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telp` varchar(200) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `aktif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpelanggan`
--

INSERT INTO `tblpelanggan` (`idpelanggan`, `pelanggan`, `alamat`, `telp`, `email`, `password`, `aktif`) VALUES
(1, 'Andi', 'Sidoarjo', '12345678', 'andi14@gmail.com', '1234', 1),
(2, 'Sayyid Deo', 'Sidoarjo', '0813345666789', 'sayyiddeo.34@gmail.com', 'sdam', 1),
(4, 'Sayyid', 'Surabaya', 'xxxx-xxxxx-xxxxx', 'kasir@gmail.com', '1234', 0),
(7, 'wow', 'wow', '89', 'wow@gmail.com', '$2y$10$hSbYFaSwPx6PjvPQ2NyxDu.mMkndOrF/e1qcxQXE6yp6H.2c9q.uC', 1),
(8, 'lol', 'puri', '123', 'lol@gmail.com', '$2y$10$iZQGzeYlVdejoyNuNdyZUe.JO47Fbp7QGj2eb.YHH5l8th6QkVP.G', 1),
(9, 'ahmad', 'gca', '123', 'ahmad@gmail.com', '$2y$10$1CIeaHxU4gieCVGUG5XU3uLlec9vLzAY6k10aN8/Cr5jf7olPDFqy', 1),
(10, 'jomni', 'graha', '0812345678910', 'joni@gmail.com', '$2y$10$BybAn4paQhBpZQP4lF6OZOxTcgJeAnrs0CSP65UXhavC/XRpikURa', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `iduser` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(50) NOT NULL,
  `aktif` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`iduser`, `user`, `email`, `password`, `level`, `aktif`) VALUES
(15, 'admin', 'admin@gmail.com', '$2y$10$wehwkEctRPwIhrWl/jXc4.1UJ5X8X34690D4r6WQLz1DhxA8RdvvO', 'Admin', 1),
(16, 'kasir', 'kasir@gmail.com', '$2y$10$9l1UhXfDinE4aYiakU0Tfuz3BlEoTRqw1kqUqMgviccMAigvD8A7K', 'Kasir', 1),
(17, 'koki', 'koki@gmail.com', '$2y$10$dIGEQEhtbeCTKjTrfTv2ju3/CPMmlcAiA.EYk21w4s2jWfJ.GZcNK', 'Koki', 1),
(18, 'gudang', 'gudang@gmail.com', '$2y$10$GsKEuJJvoqesKwPINfJOf.UVaZ8bzPAwoVGOmivXRt.vWRnu.qbjm', 'Gudang', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vorder`
-- (See below for the actual view)
--
CREATE TABLE `vorder` (
`idorder` int(11)
,`idpelanggan` int(11)
,`tglorder` date
,`total` float
,`bayar` float
,`kembali` float
,`status` int(11)
,`pelanggan` varchar(100)
,`alamat` varchar(200)
,`telp` varchar(200)
,`email` varchar(150)
,`password` varchar(255)
,`aktif` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vorderdetail`
-- (See below for the actual view)
--
CREATE TABLE `vorderdetail` (
`idorderdetail` int(11)
,`idorder` int(11)
,`idmenu` int(11)
,`jumlah` int(11)
,`hargajual` float
,`idkategori` int(11)
,`menu` varchar(100)
,`gambar` varchar(200)
,`harga` float
,`kategori` varchar(100)
,`idpelanggan` int(11)
,`tglorder` date
,`total` float
,`bayar` float
,`kembali` float
,`status` int(11)
,`pelanggan` varchar(100)
,`alamat` varchar(200)
,`telp` varchar(200)
,`email` varchar(150)
,`password` varchar(255)
,`aktif` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `vorder`
--
DROP TABLE IF EXISTS `vorder`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vorder`  AS  select `tblorder`.`idorder` AS `idorder`,`tblorder`.`idpelanggan` AS `idpelanggan`,`tblorder`.`tglorder` AS `tglorder`,`tblorder`.`total` AS `total`,`tblorder`.`bayar` AS `bayar`,`tblorder`.`kembali` AS `kembali`,`tblorder`.`status` AS `status`,`tblpelanggan`.`pelanggan` AS `pelanggan`,`tblpelanggan`.`alamat` AS `alamat`,`tblpelanggan`.`telp` AS `telp`,`tblpelanggan`.`email` AS `email`,`tblpelanggan`.`password` AS `password`,`tblpelanggan`.`aktif` AS `aktif` from (`tblpelanggan` join `tblorder` on(`tblpelanggan`.`idpelanggan` = `tblorder`.`idpelanggan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vorderdetail`
--
DROP TABLE IF EXISTS `vorderdetail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vorderdetail`  AS  select `tblorderdetail`.`idorderdetail` AS `idorderdetail`,`tblorderdetail`.`idorder` AS `idorder`,`tblorderdetail`.`idmenu` AS `idmenu`,`tblorderdetail`.`jumlah` AS `jumlah`,`tblorderdetail`.`hargajual` AS `hargajual`,`tblmenu`.`idkategori` AS `idkategori`,`tblmenu`.`menu` AS `menu`,`tblmenu`.`gambar` AS `gambar`,`tblmenu`.`harga` AS `harga`,`tblkategori`.`kategori` AS `kategori`,`tblorder`.`idpelanggan` AS `idpelanggan`,`tblorder`.`tglorder` AS `tglorder`,`tblorder`.`total` AS `total`,`tblorder`.`bayar` AS `bayar`,`tblorder`.`kembali` AS `kembali`,`tblorder`.`status` AS `status`,`tblpelanggan`.`pelanggan` AS `pelanggan`,`tblpelanggan`.`alamat` AS `alamat`,`tblpelanggan`.`telp` AS `telp`,`tblpelanggan`.`email` AS `email`,`tblpelanggan`.`password` AS `password`,`tblpelanggan`.`aktif` AS `aktif` from ((((`tblorderdetail` join `tblorder` on(`tblorderdetail`.`idorder` = `tblorder`.`idorder`)) join `tblpelanggan` on(`tblorder`.`idpelanggan` = `tblpelanggan`.`idpelanggan`)) join `tblmenu` on(`tblorderdetail`.`idmenu` = `tblmenu`.`idmenu`)) join `tblkategori` on(`tblmenu`.`idkategori` = `tblkategori`.`idkategori`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblkategori`
--
ALTER TABLE `tblkategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indexes for table `tblmeja`
--
ALTER TABLE `tblmeja`
  ADD PRIMARY KEY (`idmeja`);

--
-- Indexes for table `tblmenu`
--
ALTER TABLE `tblmenu`
  ADD PRIMARY KEY (`idmenu`);

--
-- Indexes for table `tblorder`
--
ALTER TABLE `tblorder`
  ADD PRIMARY KEY (`idorder`);

--
-- Indexes for table `tblorderdetail`
--
ALTER TABLE `tblorderdetail`
  ADD PRIMARY KEY (`idorderdetail`);

--
-- Indexes for table `tblpelanggan`
--
ALTER TABLE `tblpelanggan`
  ADD PRIMARY KEY (`idpelanggan`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblkategori`
--
ALTER TABLE `tblkategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblmeja`
--
ALTER TABLE `tblmeja`
  MODIFY `idmeja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblmenu`
--
ALTER TABLE `tblmenu`
  MODIFY `idmenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tblorder`
--
ALTER TABLE `tblorder`
  MODIFY `idorder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tblorderdetail`
--
ALTER TABLE `tblorderdetail`
  MODIFY `idorderdetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tblpelanggan`
--
ALTER TABLE `tblpelanggan`
  MODIFY `idpelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
