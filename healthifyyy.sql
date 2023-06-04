-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2023 at 11:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthifyyy`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cariObat` (IN `keyword` VARCHAR(225))   BEGIN
SELECT * FROM katalog_obat
where resep_obat LIKE CONCAT('%', keyword, '%') OR gejala LIKE CONCAT('%', keyword, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getdokter` ()   BEGIN
SELECT * FROM dokter;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPasien` ()   BEGIN
SELECT * FROM PASIEN;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`) VALUES
(5, 'admin', 'admin'),
(8, 'riri', 'annisa');

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `id_artikel` int(11) NOT NULL,
  `nama` varchar(567) NOT NULL,
  `penyebab` varchar(567) NOT NULL,
  `gejala` varchar(567) NOT NULL,
  `pengobatan` varchar(567) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(500) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `id_asal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id_artikel`, `nama`, `penyebab`, `gejala`, `pengobatan`, `deskripsi`, `gambar`, `creator_id`, `id_asal`) VALUES
(1, 'Diare', 'Intoleransi terhadap makanan, seperti laktosa dan fruktosa. Alergi makanan.  Efek samping dari obat-obatan tertentu.  Infeksi bakteri, virus, atau parasit.', 'Perut kembung atau kram, Feses lembek dan cair, Rasa mulas, Sakit perut', 'Minum banyak cairan.Makan makanan sehat rendah serat.Mengonsumsi minuman suplemen probiotik.Hindari makanan yang membuat diare makin parah.Minum teh chamomile.Makan dalam porsi kecil.Minum obat diare', 'Diare merupakan kondisi ketika pengidapan melakukan BAB  lebih sering dari biasanya. ', 'diare.jpg', 0, 0),
(2, 'Flu', 'Infeksi virus influenza yang dapat menular secara mudah, orang yang mudah terserang flu biasanya yang memiliki sistem imun yang lemah.', 'batuk berdahak atau kering, dehidrasi, demam, kelelahan , panas dingin, pilek , sakit kepala', 'Istirahat yang cukup.Banyak minum.Menjaga tubuh agar tetap hangat.Mengkonsumsi obat penurun demam', 'Flu merupakan penyakit yang disebabkan oleh infeksi virus influenza, penyakit ini mudah menular.', 'flu.jpg', 0, 0),
(3, 'Bronkitis', ' Bronkitis umumnya disebabkan oleh adanya infeksi virus yang juga menjadi penyebab seseorang terkena gangguan ISPA. Salah satu virus yang menyebabkan bronchitis adalah virus flu. Virus ini bisa menular dari percikan air liur seseorang yang terkena penyakit ini.', ' Batuk berdahak atau kering atau kronis, Kelelahan atau malaise, pilek, napas pendek, sakit kepala, sakit tenggorokan atau tekanan dada', ' Minum air putih sebanyak 8-12 gelas perhari. Menghirup uap air panas. Istirahat yang cukup. Menghindari asap rokok. Menggunakan masker ketika melakukan aktivitas di luar rumah supaya tidak terpapar ketika terpapar udara dingin', 'Bronkitis adalah peradangan yang terjadi pada saluran pernafasan atau bronkus.', 'batuk.jpg', 0, 0),
(4, 'Anemia (kurang darah)', 'kekurangan zat besi.', ' Perasaan tidak enak badan, Sakit kepala, Gangguan konsentrasi berpikir', 'Mengasup suplemen yang mengandung vitamin dan mineral terutama zat besi asam folat dan dianjurkan untuk transfusi darah apabila kondisi kurang darah yang berat', 'Anemia adalah kondisi ketika tubuh kekurangan sel darah merah tidak berfungsi dengan baik.', 'anemia.jpg', 0, 0),
(6, 'Jantung', ' Penyumbatan Peradangan.Kerusakan pada jantung dan pembuluh darah.Suplai oksigen dan nutrisi di otot dan jaringan di sekitar jantung berkurang', ' Nyeri dada,Sesak napas,Aliran darah terhambat', ' Memperbanyak konsumsi lemak tak jenuh dan serat. Menghilangkan lemak menumpuk di perut dan bagian tubuh lainnya. Mengobati diabetes dan hipertensi. Berolahraga secara teratur. Tidak merokok. Menghindari minuman berakohol', 'Kondisi ketika mengalami gangguan pada jantung', 'default.jpg', 0, 0),
(7, 'Insomnia', 'Stres, Depresi, Gaya hidup tidak sehat, Pengaruh obat-obatan tertentu', 'Sulit tidur atau tidur tidak nyenyak, akibat insomni biasanya mudah marah dan depresi, Gejala itu dapat memicu mengantk pada siang hari, Mudah lelah saat aktivitas, Sulit fokus dalam beraktivitas', 'Hindari banyak makan dan minum sebelum tidur, Usahakan aktif disiang hari agar terhindar dari tidur siang', 'Insomnia adalah gangguan tidur yang membuat orang sulit tidur.', 'default.jpg', 0, 0),
(8, 'Cacar Air', 'Disebabkan oleh virus cacar ', 'Munculnya bintik kemerahan berisi cairan dan terasa gatal bintik cacar biasanya akan timbul pada wajah punggung kulit kepala dada perut lengan dan kaki', ' Cacar air dapat sembuh dengan sendirinya', 'Cacar air merupakan infeksi yang disebabkan oleh virus VAricella zoster.', 'cacar.jpg', 0, 0),
(9, 'Sakit Mata', ' Iritasi.Infeksi.Cedera.Peradangan pada mata,Peningkatan tekanan bola mata', ' Mata merah, Mata Bengkak, Terasa nyeri dan gatal', ' Kompres kantung mata. Tetes air garam steril atau larutan saline. Kompres hangat. Kompres dingin. Hindari kebiasaan meguce-ngucek mata', 'Sakit mata merupakan gangguan penglihatan yang cukup sering sering terjadi dimasyarakat.', 'default.jpg', 0, 0),
(10, 'Sakit Pinggang', ' Cedera otot dan sendi di daerah pinggang. Akibat mengangkat benda yang berat. Melakukan gerakan yang berulang-ulang', ' Pinggang pegal,kaku,nyeri menjalar pada pinggang,sulit untuk bergerak dan berdiri tegak karena nyeri di pinggang,tungkai terasa lemah atau mati rasa', 'Tetap beraktivitas. Kompres dingin atau hangat. Minum obat pereda nyeri, pelemas pinggang yang nyeri', 'Sakit pinggang merupakan gejala yang timbul terus-menerus di bagian pinggang.', 'default.jpg', 0, 0),
(11, 'Nyeri Haid (Dismenore)', ' Otot pada rahim berkontraksi.pasokan oksigen ke rahim berkurang sehingga timbul rasa nyeri', ' Kram dibagian perut,menstruasi tidak lancar,rasa sakit dan mulas pada saat menstruasi berlebihan', ' Memijat dan mengompres hangat area perut yang sakit. Berolahraga ringan. Melakukan relaksasi,mandi air hangat. Mengkonsumsi sumplemen yang mengandung vitamin E, B6, omega 3 dan magnesium', 'Dismenore keluhan yang terjadi pada wanita yang sedang menstruasi.', 'default.jpg', 0, 0),
(12, 'Diabetes', 'Kelebihan berat badan.Kelahiran prematur.', 'Sering merasa haus,Sering buang air kecil terutama di malam hari,Pandangan kabur,Sering mengalami infeksi misalnya gusi kulit vagina atau saluran kemis,', 'Mengatur frekuensi dan menu makanan harus lebih sehat.Menjaga berat badan.Rajin berolahraga.Rutin menjalani pengeckan gula darah setidaknya sekali dalam setahun', 'Diabetes adalah penyakit kronis yang ditandai dengan tingginya kadar gula darah.', 'diabetes.jpg', 0, 0),
(13, 'TBC (Tuberkulosis)', ' Diakibatkan kuman Mycobacterium tuberculosis', ' Batuk yang berlangsung lama (lebih dari 3 minggu) biasanya berdahak dan terkadang mengeluarkan darah, Berat badan turun, Tidak nafsu makan, Nyeri dada', ' TBC dapat disembuhkan jika penderita patuh mengomsumsi obat sesaui drngan resep dokter. Untuk mengatasi penyakit ini penderita perlu minum bebrapa jenis obat untuk waktu yang cukup lama (minimal 6 bulan)', 'TBC adalah penyakit paru-paru yang diakibatkan kuman Mycobacterium tuberculosis', 'default.jpg', 0, 0),
(14, 'ISPA', ' Penyebab ISPA adalah infeksi virus atau bakteri pada sakuran pernafasan walaupun lebih sering disebabkan ileh virus atau bakteri penyakit ISPA ', 'Infeksi saluran pernafasan yang menimbulkan batuk pilek disertai demam yang mudah menular dan dapat dialami oleh siapa saja terutama anak-anak dan lansia, Penderita sulit bernafas, Muntah-Muntah, Muncul suara bengek saat menghembuskan nafas', 'Memperbanyak istirahat dan konsumsi air putih untuk menencerkan dahak.Berkumur dengan air hangat.Memposisikan kepala lebih tinggi ketka tidur.Mengonsumsi minuman lemon hangat atau madu untuk meredakan batuk', 'ISPA adalah infeksi saluran pernafasan yang sangat mudah menular dan dapat dialami oleh siapa saja.', 'default.jpg', 0, 0),
(24, 'demam', 'demam', 'demam', 'demam', 'demam', 'default.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `spesialis` varchar(225) NOT NULL,
  `jk` varchar(225) NOT NULL,
  `no_telp` varchar(225) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `gambar` varchar(128) NOT NULL,
  `deskripsi` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `email`, `password`, `spesialis`, `jk`, `no_telp`, `alamat`, `gambar`, `deskripsi`) VALUES
(3111, 'dr. Agung Nugroho, Sp.PD', 'Agung@gmail.com', '1b2cd7334e5f767d8a9e01b2c3d4e5f6', 'Spesialis Penyakit Dalam', 'Laki-Laki', '0836483829432', 'Bandung Timur', '', 'dr. Agung Nugroho, Sp.PD adalah Dokter Spesialis Penyakit Dalam yang aktif melayani pasien di RS Immanuel Bandung. dr. Agung Nugroho, Sp.PD mendapatkan gelar spesialisnya setelah menamatkan pendidikan di San Juan De Dios Educational.\r\n\r\nBeliau yang tergabung dalam Ikatan Dokter Indonesia (IDI) dan Perhimpunan Dokter Spesialis Penyakit Dalam Indonesia (PDPI) sebagai anggota ini dapat memberikan layanan konsultasi seputar penyakit dalam.'),
(3112, 'dr. Yura Pramesti Sahal', 'Yura@gmail.com', '9a8b7c6d5e4f3e2d1c0b9a8b7c6d5e4f', 'Dokter Umum', 'Perempuan', '084628392939', 'Bandung', '', 'dr. Yura Pramesti Sahal merupakan seorang Dokter Umum yang saat ini berpraktik di Klinik TelkoMedika Health Center Sentot. Beliau dapat membantu layanan Konsultasi kesehatan umum dan menyediakan layanan tes buta warna.\r\n\r\ndr. Yura Pramesti Sahal menamatkan pendidikan Kedokteran Umum di Universitas Islam Bandung. Selain itu, beliau juga terhimpun dalam organisasi Ikatan Dokter Indonesia (IDI).'),
(3113, 'dr. Andini Wilson', 'Andini@gmail.com', 'd66a5e9d232f82ab1f5961f4403f2872', 'Umum', 'Perempuan', '08217839101', 'Jl. Pendidikan No.15, Cibiru Wetan, Kec. Cileunyi, Kabupaten Bandung, Jawa Barat 40625', '', 'dr. Andini Wilson adalah seorang Dokter Umum yang memiliki praktik di Klinik TelkoMedika Health Center Sentot. Dengan pengalamannya yang luas dalam bidang kesehatan, beliau mendedikasikan dirinya untuk memberikan konsultasi kesehatan umum kepada pasien-pasien yang membutuhkan.\r\n\r\ndr. Andini Wilson merupakan lulusan dari Universitas ternama di Indonesia, di mana beliau menyelesaikan pendidikan Kedokteran Umum dengan prestasi gemilang. Selama masa studinya, beliau mengembangkan pengetahuan dan keterampilan medis yang diperlukan untuk memberikan perawatan terbaik kepada pasien.'),
(3114, 'dr. Jessica', 'Jessica@gmail.com', '4f5fe8118af654c293c456a26501c873', 'Spesialis Mata', 'perempuan', '02728721323', 'Jln. Abdurrahman No.190\r\n', '', 'dr. Jessica adalah seorang Dokter Spesialis Mata yang berpraktik di Klinik TelkoMedika Health Center Puri. Dengan keahliannya dalam bidang kesehatan umum, beliau berkomitmen untuk memberikan pelayanan konsultasi medis yang komprehensif kepada pasien-pasien yang membutuhkan.\r\n\r\ndr. Jessica telah menamatkan pendidikan Kedokteran Umum di salah satu universitas terkemuka di Indonesia. Selama masa studinya, beliau mengembangkan pengetahuan dan keterampilan medis yang diperlukan untuk memberikan perawatan yang efektif dan berkualitas kepada pasien.'),
(3115, 'dr. Ray Parker', 'Ray@gmail.com', '7a8ed922e7b781d486d567b82621e362', 'Spesialis THT', 'Laki-laki', '0826463828342', 'Bekasi', '', 'dr. Ray Parker adalah seorang Dokter Spesialis THT yang berpraktik di Klinik MedikaSehat Sentral. Dengan pengalaman luas dalam kesehatan umum, beliau berkomitmen untuk memberikan layanan konsultasi medis yang holistik dan berkualitas kepada pasien-pasien.\r\n\r\ndr. Ray Parker menyelesaikan pendidikan Kedokteran Umum di salah satu institusi terkemuka. Selama masa studinya, beliau mengasah pengetahuan dan keterampilan medis yang diperlukan untuk memberikan perawatan yang optimal kepada pasien.'),
(3116, 'dr. Nanda Azzahra', 'Nanda@gmail.com', '958395d3f7219f945e43d4023bba4aca', 'Spesialis Anak', 'perempuan', '0867891219', 'Jln. Lembang', '', 'dr. Nanda Azzahra adalah seorang Dokter Anak yang berpraktik di Klinik Sehati Medika Jaya. Dengan dedikasi dan keahliannya dalam kesehatan umum, beliau bertujuan untuk memberikan perawatan kesehatan yang terbaik kepada pasien-pasien yang datang mencari bantuan.\r\n\r\ndr. Nanda Azzahra menyelesaikan pendidikan Kedokteran Umum di salah satu universitas ternama di Indonesia. Selama masa studinya, beliau memperoleh pengetahuan dan keterampilan yang diperlukan untuk memberikan perawatan medis yang komprehensif dan berkomitmen untuk meningkatkan kualitas hidup pasien.'),
(3117, 'dr. John Denis', 'John@gmail.com', '7959023b681dcdf089a7742b32db2fba', 'Spesialis Gigi', 'Laki-laki', '0853248291', 'Soreang', '', 'dr. John Denis adalah seorang Dokter Gigi yang berpraktik di Klinik MedPlus Care Center. Dengan pengalaman luas dalam bidang kesehatan umum, beliau berdedikasi untuk memberikan perawatan medis yang komprehensif dan berkualitas kepada pasien-pasien yang mencari bantuan.\r\n\r\ndr. John Denis menyelesaikan pendidikan Kedokteran Umum di salah satu institusi ternama di Indonesia. Selama masa studinya, beliau memperoleh pengetahuan dan keterampilan yang diperlukan untuk memberikan pelayanan kesehatan yang optimal kepada pasien.'),
(3118, 'dr. Lee Park Wo', 'Lee@gmail.com', 'efb8e9ea8a2b9affe074b02cc37a5c69', 'Spesialis Jantung', 'Laki-laki', '084239179319', 'Kopo', '', 'dr. Lee Park Wo adalah seorang Dokter Spesialis Jantung yang berpraktik di Klinik Sehat Sejahtera Sentosa. Dengan pengalaman yang luas dalam bidang kesehatan umum, beliau berkomitmen untuk memberikan perawatan medis yang holistik dan terbaik kepada pasien-pasien yang datang mencari bantuan.\r\n\r\ndr. Lee Park Wo menyelesaikan pendidikan Kedokteran Umum di salah satu universitas terkemuka di Korea Selatan. Selama masa studinya, beliau mendapatkan pengetahuan dan keterampilan yang diperlukan untuk memberikan perawatan medis yang efektif dan sesuai dengan kebutuhan individu setiap pasien.'),
(3119, 'dr. R Muthulakshmi', 'Muthu@gmail.com', '3f2e1d4c5b6a7b8c9d0e1f2g3h4i5j6k', 'Spesialis Penyakit Dalam', 'Perempuan\r\n', '093727493921', 'Depok', '', 'dr. R. Muthulakshmi adalah seorang Dokter Umum yang berpraktik di Klinik Sehati Medika Mandiri. Dengan pengalaman dan pengetahuan yang luas dalam bidang kesehatan umum, beliau berkomitmen untuk memberikan perawatan medis yang berkualitas dan komprehensif kepada pasien-pasien yang mencari bantuan.\r\n\r\ndr. R. Muthulakshmi menyelesaikan pendidikan Kedokteran Umum di salah satu universitas ternama di India. Selama masa studinya, beliau mengembangkan pengetahuan dan keterampilan yang diperlukan untuk memberikan perawatan medis yang efektif dan mengikuti standar terkini dalam bidang kedokteran.');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id_feedback` int(123) NOT NULL,
  `nama_keluhan` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id_feedback`, `nama_keluhan`) VALUES
(6111, 'lambung'),
(6112, 'Gula darah'),
(6113, 'Rematik'),
(6114, 'Leukimia'),
(6115, 'HIV'),
(6116, 'kaca'),
(6117, 'kaca');

-- --------------------------------------------------------

--
-- Table structure for table `katalog_obat`
--

CREATE TABLE `katalog_obat` (
  `id_katalogObat` int(11) NOT NULL,
  `nama_penyakit` varchar(225) NOT NULL,
  `deskripsi` text NOT NULL,
  `gejala` varchar(225) NOT NULL,
  `penyebab` varchar(225) NOT NULL,
  `resep_obat` varchar(225) NOT NULL,
  `gambar` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `katalog_obat`
--

INSERT INTO `katalog_obat` (`id_katalogObat`, `nama_penyakit`, `deskripsi`, `gejala`, `penyebab`, `resep_obat`, `gambar`) VALUES
(2111, 'Diabetes Melitus', 'Diabetes melitus adalah kondisi di mana kadar gula darah dalam tubuh tinggi karena tubuh tidak dapat memproduksi atau menggunakan insulin dengan baik.\r\n', 'Sering buang air kecil, merasa sangat haus dan lapar, lelah, penglihatan kabur, dan luka sulit sembuh.', 'Kekurangan insulin atau resistensi insulin, faktor genetik, obesitas, dan gaya hidup yang tidak sehat.', 'Insulin, Metformin, Glibenklamid, Glipizide.', 'default.jpg'),
(2112, 'Hipertensi', ' Hipertensi atau tekanan darah tinggi adalah kondisi di mana tekanan darah dalam arteri meningkat secara kronis.', 'Tidak ada gejala khusus, tetapi beberapa orang dapat merasakan sakit kepala, sesak napas, dan detak jantung cepat.', ' Faktor genetik, kebiasaan makan yang tidak sehat, kegemukan, kurangnya aktivitas fisik, dan stres.', 'Amlodipin, Lisinopril, Losartan, Metoprolol.', 'default.jpg'),
(2113, 'Asma', 'Asma adalah penyakit paru kronis di mana saluran pernapasan menyempit dan menghasilkan lendir yang lebih banyak dari biasanya.', 'Kesulitan bernapas, dada terasa sempit, batuk dan mengi.', 'Alergi, paparan bahan kimia dan polutan, atau infeksi saluran pernapasan.', 'Albuterol, Ipratropium, Flutikason.', 'default.jpg'),
(2114, 'Kanker payudara', 'Kanker payudara adalah jenis kanker di mana sel-sel abnormal tumbuh dan berkembang di jaringan payudara.', 'enjolan di payudara atau ketiak, perubahan ukuran atau bentuk payudara, kulit yang terlihat kemerahan, dan keluar cairan dari puting susu.', 'Faktor genetik, usia, kelebihan berat badan, paparan radiasi, dan penggunaan hormon.', 'Kemoterapi, Radiasi, Tamoxifen.', 'default.jpg'),
(2115, 'Depresi', 'Depresi adalah kondisi psikologis di mana seseorang merasa sedih, kehilangan minat pada aktivitas yang biasa dilakukan, dan mengalami perubahan mood secara signifikan.', 'Kesulitan tidur, merasa lelah, kehilangan minat pada aktivitas sehari-hari, perubahan berat badan, dan pikiran yang merugikan.', ' Faktor genetik', 'Antidepresan SSRI, Trisiklik Antidepresan , Inhibitor MAO (Monoamine Oxidase) ', 'default.jpg\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `obrolan`
--

CREATE TABLE `obrolan` (
  `id_obrolan` int(11) NOT NULL,
  `id_room` int(128) NOT NULL,
  `pesan` text NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obrolan`
--

INSERT INTO `obrolan` (`id_obrolan`, `id_room`, `pesan`, `id_dokter`, `tanggal`) VALUES
(81156, 9203, 'Pesan baru', 3112, '2023-06-01'),
(81179, 9226, 'Pesan baru', 3112, '2023-06-01'),
(81180, 9227, 'Pesan baru', 3117, '2023-06-01'),
(81181, 9228, 'Pesan baru', 3113, '2023-06-01'),
(81182, 9229, 'Pesan baru', 3112, '2023-06-02'),
(81183, 9230, 'Pesan baru', 3113, '2023-06-02'),
(81184, 9231, 'Pesan baru', 3112, '2023-06-02'),
(81185, 9232, 'Pesan baru', 3119, '2023-06-02');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `jk` varchar(10) NOT NULL,
  `no_telp` int(15) NOT NULL,
  `gambar` varchar(28) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `username`, `email`, `password`, `jk`, `no_telp`, `gambar`) VALUES
(5111, 'Riska', 'riska@gmail.com', 'c1196c027686a4ba23fbb53450a2f00c', 'perempuan', 82713199, ''),
(5112, 'Selly ', 'Selly@gmail.com', 'e61ba834ac4021942349fcecc49c4df1', 'perempuan', 876829182, ''),
(5113, 'Donny', 'Donny@gmail.com', 'cb4c709bcbf606099e7d3f48fb6cd8d6', 'Laki-laki', 923647289, ''),
(5114, 'Carolinna', 'Caron@gmail.com', '0984352980e8b32c4664eeacc3b9a83a', 'perempuan', 876289932, ''),
(5115, 'Georgina', 'Geo@gmail.com', '74dc9d517740d0391f0bf1e483d063db', 'Laki-laki', 83239131, '');

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

CREATE TABLE `rank` (
  `id_rank` int(11) NOT NULL,
  `id_room` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rank`
--

INSERT INTO `rank` (`id_rank`, `id_room`, `id_dokter`) VALUES
(81132, 9179, 3112),
(81133, 9180, 3115),
(81134, 9181, 3115),
(81135, 9182, 3115),
(81136, 9183, 3115),
(81137, 9184, 3115),
(81138, 9185, 3115),
(81139, 9186, 3115),
(81140, 9187, 3112),
(81141, 9188, 3112),
(81142, 9189, 3112),
(81143, 9190, 3112),
(81144, 9191, 3112),
(81145, 9192, 3112),
(81146, 9193, 3113),
(81147, 9194, 3112),
(81148, 9195, 3112),
(81149, 9196, 3112),
(81150, 9197, 3112),
(81151, 9198, 3112),
(81152, 9199, 3112),
(81153, 9200, 3113),
(81154, 9201, 3115),
(81155, 9202, 3112),
(81156, 9203, 3112),
(81157, 9204, 3111),
(81158, 9205, 3111),
(81159, 9206, 3112),
(81160, 9207, 3112),
(81161, 9208, 3119),
(81162, 9209, 3112),
(81163, 9210, 3112),
(81164, 9211, 3112),
(81165, 9212, 3112),
(81166, 9213, 3113),
(81167, 9214, 3115),
(81168, 9215, 3116),
(81169, 9216, 3118),
(81170, 9217, 3113),
(81171, 9218, 3112),
(81172, 9219, 3113),
(81173, 9220, 3119),
(81174, 9221, 3118),
(81175, 9222, 3112),
(81176, 9223, 3112),
(81177, 9224, 3111),
(81178, 9225, 3112),
(81179, 9226, 3112),
(81180, 9227, 3117),
(81181, 9228, 3113),
(81182, 9229, 3112),
(81183, 9230, 3113),
(81184, 9231, 3112),
(81185, 9232, 3119);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id_room` int(128) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `status_room` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id_room`, `id_pasien`, `id_dokter`, `status_room`) VALUES
(9203, 5114, 3112, 'tutup'),
(9226, 5114, 3112, 'tutup'),
(9227, 5114, 3117, 'tutup'),
(9228, 5114, 3113, 'tutup'),
(9229, 5114, 3112, 'tutup'),
(9230, 5114, 3113, 'tutup'),
(9231, 5114, 3112, 'aktif'),
(9232, 5114, 3119, 'aktif');

--
-- Triggers `room`
--
DELIMITER $$
CREATE TRIGGER `fee_dokter` AFTER INSERT ON `room` FOR EACH ROW BEGIN
  DECLARE id_rank INT;
  SELECT id_rank INTO id_rank FROM rank WHERE id_dokter = NEW.id_dokter LIMIT 1;
    INSERT INTO rank (id_room, id_dokter) 
    VALUES (NEW.id_room, NEW.id_dokter);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_obrolan_after_insert` AFTER INSERT ON `room` FOR EACH ROW BEGIN
  INSERT INTO obrolan (id_obrolan, id_room, pesan, id_dokter, tanggal)
  VALUES (LAST_INSERT_ID(), NEW.id_room, 'Pesan baru', NEW.id_dokter, CURRENT_TIMESTAMP);
end
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id_artikel`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_feedback`);

--
-- Indexes for table `katalog_obat`
--
ALTER TABLE `katalog_obat`
  ADD PRIMARY KEY (`id_katalogObat`);

--
-- Indexes for table `obrolan`
--
ALTER TABLE `obrolan`
  ADD PRIMARY KEY (`id_obrolan`),
  ADD KEY `id_room` (`id_room`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`id_rank`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id_room`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id_artikel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3121;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id_feedback` int(123) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6118;

--
-- AUTO_INCREMENT for table `katalog_obat`
--
ALTER TABLE `katalog_obat`
  MODIFY `id_katalogObat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2116;

--
-- AUTO_INCREMENT for table `obrolan`
--
ALTER TABLE `obrolan`
  MODIFY `id_obrolan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81186;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5116;

--
-- AUTO_INCREMENT for table `rank`
--
ALTER TABLE `rank`
  MODIFY `id_rank` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81186;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id_room` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9233;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `obrolan`
--
ALTER TABLE `obrolan`
  ADD CONSTRAINT `obrolan_ibfk_1` FOREIGN KEY (`id_room`) REFERENCES `room` (`id_room`),
  ADD CONSTRAINT `obrolan_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `room_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
