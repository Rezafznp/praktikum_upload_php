-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2022 at 03:01 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbkampus`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nidn` varchar(10) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `gender` char(1) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tmp_lahir` varchar(30) NOT NULL,
  `pendidikan_akhir` varchar(50) DEFAULT NULL,
  `prodi_kode` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nidn`, `nama`, `gender`, `tgl_lahir`, `tmp_lahir`, `pendidikan_akhir`, `prodi_kode`) VALUES
('0405029102', 'Nurul Janah', 'P', '1981-08-03', 'Jakarta', 'S2', 'SI'),
('0414047101', 'Sirojul Munir', 'L', '1973-03-15', 'Jakarta', 'S2', 'SI'),
('0426048703', 'April Rustianto', 'L', '1968-02-07', 'Jakarta', 'S2', 'SI');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(10) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `gender` char(20) DEFAULT NULL,
  `tmp_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `ipk` double DEFAULT NULL,
  `prodi_kode` varchar(10) DEFAULT NULL,
  `foto` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `gender`, `tmp_lahir`, `tgl_lahir`, `ipk`, `prodi_kode`, `foto`) VALUES
('01021001', 'Cindy Laura', 'P', 'Jakarta', '2003-03-08', 3.88, 'SI', '01021001.jpg'),
('01021007', 'Nurmila Fauziyah', 'L', 'Jakarta', '2003-01-09', 3.44, 'SI', '01021007.jpg'),
('01021009', 'Naurah Husna', 'P', 'Bandung', '2003-03-08', 3.68, 'SI', '01021009.png'),
('0110121059', 'Reza Fauzan Pratama', 'L', 'Depok', '2003-05-18', 4, 'SI', '0110121059.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `kode` varchar(2) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `kaprodi` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`kode`, `nama`, `kaprodi`) VALUES
('BD', 'Bisnis Digital', 'David Panji'),
('SI', 'Sistem Informasi', 'Misna Azqia'),
('TI', 'Teknik Informatika', 'Tifani Nabarian');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(40) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `role`, `created_at`, `last_login`) VALUES
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'admin@sttnf.ac.id', 'ADMIN', '2022-06-01 07:14:05', '2022-06-01 07:14:05'),
(2, 'siswa', '827ccb0eea8a706c4c34a16891f84e7b', 'siswa1@sttnf.ac.id', 'MAHASISWA', '2022-06-01 07:16:02', '2022-06-01 07:16:02'),
(3, 'siswa2', '827ccb0eea8a706c4c34a16891f84e7b', 'siswa2@sttnf.ac.id', 'MAHASISWA', '2022-06-14 10:52:34', '2022-06-14 10:52:34'),
(4, 'siswa3', '827ccb0eea8a706c4c34a16891f84e7b', 'siswa3@sttnf.ac.id', 'MAHASISWA', '2022-06-14 11:12:32', '2022-06-14 11:12:32'),
(5, 'siswa3', '827ccb0eea8a706c4c34a16891f84e7b', 'siswa3@sttnf.ac.id', 'MAHASISWA', '2022-07-05 15:17:00', '2022-07-05 15:17:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nidn`),
  ADD KEY `prodi_kode` (`prodi_kode`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `prodi_kode` (`prodi_kode`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`prodi_kode`) REFERENCES `prodi` (`kode`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`prodi_kode`) REFERENCES `prodi` (`kode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
