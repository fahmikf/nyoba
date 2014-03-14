/*
/*percobaan fahmi yang ke2 kalinya,berhasilkah?? */;
SQLyog Community Edition- MySQL GUI v5.23
Host - 5.0.51b-community-nt : Database - inventori_fahmi
*********************************************************************
Server version : 5.0.51b-community-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `inventori_fahmi`;

USE `inventori_fahmi`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `detail_keluar` */

DROP TABLE IF EXISTS `detail_keluar`;

CREATE TABLE `detail_keluar` (
  `kode_keluar` int(10) NOT NULL,
  `kode_barang` int(10) NOT NULL,
  `jumlah_keluar` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detail_keluar` */

/*Table structure for table `detail_permintaan` */

DROP TABLE IF EXISTS `detail_permintaan`;

CREATE TABLE `detail_permintaan` (
  `no_permintaan` char(10) NOT NULL,
  `kode_barang` char(10) NOT NULL,
  `jumlah_barang` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detail_permintaan` */

insert  into `detail_permintaan`(`no_permintaan`,`kode_barang`,`jumlah_barang`) values ('1','BR1',2),('1','BR1',2),('2','BR1',2),('2','BR2',4),('3','BR2',2),('3','BR1',3);

/*Table structure for table `detail_terima` */

DROP TABLE IF EXISTS `detail_terima`;

CREATE TABLE `detail_terima` (
  `no_faktur` int(10) NOT NULL,
  `kode_barang` int(10) NOT NULL,
  `jumlah_terima` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detail_terima` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `username` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `status` enum('kepala_gudang','pegawai_gudang','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`username`,`pass`,`status`) values ('admin','admin','admin'),('pg','pg','pegawai_gudang'),('kg','kg','kepala_gudang'),('q','q','kepala_gudang'),('pg2','pg2','pegawai_gudang'),('maman','maman','pegawai_gudang');

/*Table structure for table `t_barang` */

DROP TABLE IF EXISTS `t_barang`;

CREATE TABLE `t_barang` (
  `kode_barang` varchar(10) NOT NULL,
  `kode_jenis` varchar(10) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga` int(10) NOT NULL,
  `keterangan` varchar(1000) NOT NULL,
  `stok` int(5) NOT NULL,
  PRIMARY KEY  (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_barang` */

insert  into `t_barang`(`kode_barang`,`kode_jenis`,`nama_barang`,`satuan`,`harga`,`keterangan`,`stok`) values ('BR1','JB1','beras','kg',6500,'mahal',200);

/*Table structure for table `t_jenis` */

DROP TABLE IF EXISTS `t_jenis`;

CREATE TABLE `t_jenis` (
  `kode_jenis` varchar(10) NOT NULL,
  `nama_jenis` varchar(20) NOT NULL,
  PRIMARY KEY  (`kode_jenis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_jenis` */

insert  into `t_jenis`(`kode_jenis`,`nama_jenis`) values ('JB1','ganteng kalem jow');

/*Table structure for table `t_keluar` */

DROP TABLE IF EXISTS `t_keluar`;

CREATE TABLE `t_keluar` (
  `kode_keluar` int(10) NOT NULL,
  `tgl_keluar` date NOT NULL,
  `kode_costumer` int(10) NOT NULL,
  PRIMARY KEY  (`kode_keluar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_keluar` */

/*Table structure for table `t_pelanggan` */

DROP TABLE IF EXISTS `t_pelanggan`;

CREATE TABLE `t_pelanggan` (
  `kode_costumer` varchar(10) NOT NULL,
  `nama_costumer` varchar(30) NOT NULL,
  `alamat_costumer` varchar(50) NOT NULL,
  `telp_costumer` char(20) NOT NULL,
  `email_costumer` varchar(30) NOT NULL,
  PRIMARY KEY  (`kode_costumer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_pelanggan` */

insert  into `t_pelanggan`(`kode_costumer`,`nama_costumer`,`alamat_costumer`,`telp_costumer`,`email_costumer`) values ('PEL1','fahmi ganteng','cililin','085624671061','benclungboy@gmail.com');

/*Table structure for table `t_permintaan` */

DROP TABLE IF EXISTS `t_permintaan`;

CREATE TABLE `t_permintaan` (
  `no_permintaan` int(10) NOT NULL,
  `tgl_permintaan` date NOT NULL,
  `kode_suplier` int(10) NOT NULL,
  PRIMARY KEY  (`no_permintaan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_permintaan` */

/*Table structure for table `t_suplier` */

DROP TABLE IF EXISTS `t_suplier`;

CREATE TABLE `t_suplier` (
  `kode_suplier` varchar(10) NOT NULL,
  `nama_suplier` varchar(30) NOT NULL,
  `alamat_suplier` varchar(50) NOT NULL,
  `telp_suplier` char(20) NOT NULL,
  `email_suplier` varchar(30) NOT NULL,
  `pemasok` varchar(30) NOT NULL,
  PRIMARY KEY  (`kode_suplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_suplier` */

insert  into `t_suplier`(`kode_suplier`,`nama_suplier`,`alamat_suplier`,`telp_suplier`,`email_suplier`,`pemasok`) values ('SUP1','pt.waras','cuililin','09890','bbbam','icvwei');

/*Table structure for table `t_terima` */

DROP TABLE IF EXISTS `t_terima`;

CREATE TABLE `t_terima` (
  `no_faktur` int(10) NOT NULL,
  `no_permintaan` int(10) NOT NULL,
  `tgl_terima` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_terima` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
