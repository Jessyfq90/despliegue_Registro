-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 18, 2019 at 09:19 AM
-- Server version: 8.0.13
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `despliegue`
--

-- --------------------------------------------------------

--
-- Table structure for table `juegos`
--

CREATE TABLE `juegos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `id_modelo` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `year` int(4) NOT NULL,
  `disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `juegos`
--

INSERT INTO `juegos` (`id`, `nombre`, `precio`, `id_modelo`, `descripcion`, `year`, `disponible`) VALUES
(1, 'FIFA 19', 65, 1, 'juego de fútbol', 2018, 1),
(2, 'Red DeadRedemption 2', 50, 1, 'Ámérica 1899. El ocaso del Salvaje Oeste ha comenzado y las fuerzas de la ley dan caza a las últimas bandas de forajidos', 2018, 1),
(3, 'Fortnite: Lote de Criogenización', 30, 1, 'Fortnite Battle Royale es el modo PvP para 100 jugadores de Fortnite. Un mapa enorme. Un autobús de batalla.El último superviviente gana', 2018, 1),
(4, 'Crash Bandicoot Trilogy', 35, 1, 'Trilogía de los juego crash bandicoot de la playstation 1 mejorados. Crash vuelve entusiasmado y listo para bailar.', 2017, 1),
(5, 'W2k19', 30, 1, 'Juego de la wwe ', 2018, 0),
(6, 'spyro trilogy', 35, 1, 'Revive los tres juegos originales, Spyro the Dragon, Spyro 2:En busca de los talismanes y Spyro', 2018, 1),
(7, 'los sims 4 y perros y gatos', 45, 1, 'Disfruta del poder de crear y controlar a personas en un mundo virtual donde no hay reglas.', 2017, 1),
(8, 'just dance 2019', 55, 1, 'juego de baile', 2018, 0),
(9, 'until dawn', 20, 1, '8 amigos, 1 cabaña y un asesino suelto. ¿Lograrás sobrevivir hasta el amanecer?  Utiliza el sofisticado sistema del \"Efecto mariposa\"', 2015, 1),
(10, 'Super Mario 3D Land 3DS', 20, 2, 'Super Mario 3D reinventa todo lo que Mario ha sido en su primer entorno de plataformas en verdadero 3D.', 2017, 1),
(11, 'Pokémon UltraSol 3DS', 40, 2, 'juego de pokemon de la octava generación', 2017, 1),
(12, 'The Legend of Zelda Ocarina of Time', 20, 2, 'Link se embarca en un periplo de leyenda a través del tiempo para detener a Ganondorf, el rey de los ladrones Gerudo, que busca la Triforce', 2016, 0),
(13, 'Super Mario Party', 55, 3, 'Inspirado en el clásico Mario Party, esta serie llega con nuevos minijuegos y estilos de juego que aprovechan los mandos Joy-Con', 2018, 0),
(14, 'Mario Kart 8 Deluxe', 55, 3, 'Juego de carreras con varios de los personajes de nintendo, sobre una gran variedad de circuitos.', 2017, 1),
(15, 'Minecraft', 30, 3, 'Juego de colocación de bloques y aventuras', 2018, 1),
(16, 'Anthem', 65, 4, 'En un mundo abandonado y sin terminar por los dioese, una facción sombría amenaza a toda la humanidad.', 2019, 1),
(17, 'Devil May Cry 5', 55, 4, 'La demoníaca invasión comienza con las semillas de un \"árbol demoníaco\" que está echando sus raíces en Red Grave City.', 2019, 0),
(18, 'Pro Evolution Soccer 2019', 30, 4, 'juego de futbol', 2018, 0),
(19, 'The Witcher 3: Wild Hunt', 35, 4, 'Juega a la versión más completa y pulida del juego más galardonado de 2015.Disponible con todas las expansiones y el contenido adicional. Conviertete en un cazador de monstruos profesional.', 2016, 1),
(20, 'Resident Evil Revelations', 30, 4, 'La acción comienza a bordo de un crucero supuestamente abandonado, el \"Queen Zenobia\", donde los horrores acechan por doquier, antes de que los jugadores se dirijan a tierra firme hacia la devastada ciudad Terragrigia.', 2017, 1),
(21, 'Los sims 4 ¿Quedamos?', 38, 5, 'Juego donde puedes crear y controlar personas en un mundo sin reglas', 2015, 0),
(22, 'Tomb Rider 20 Aniversario', 31, 5, 'La aventura de acción aclamada por la crítica: En Rise of the Tomb Radier, Lara descubre un antiguo misterio que la sitúa en el punto de mira de una despiadada organización conocida como La Trinidad.', 2016, 1),
(23, 'StartCraft II:Legacy of the Void ', 25, 5, 'Encarnarás al jerarca Artanis, líder de la avanzada raza protoss. Años atrás, Aiur, el hogar de los protoss, cayó a manos del implacable Enjambre zerg.', 2015, 1),
(24, 'Diablo III: Reaper of Souls Expansions ', 20, 5, 'Nada detiene a la Muerte. El Demonio Mayor se retuerce de furia en la piedra de alama negra, y su esencia clama libertad y venganza.', 2014, 1),
(25, 'Escape Died Island', 12, 5, 'Juego de misterio y supervivencia que cuenta cómo Cliff Calo se hace a la mar para documentar los inexplicables acontecimientos que, según los rumores, han ocurrido en Banoi.', 2014, 0),
(26, 'Pokemon oro', 10, 2, 'Juego de rol donde tu personaje deberá luchar contra adversarios con sus pokemons para llegar a lo más alto de la Liga Pokemon.', 2017, 1),
(27, 'kirby\'s Extra Epic yam', 35, 2, 'versión ampliada del kirby\'s epic yam original de Wii. Kirby es arrastrado a un mundo hecho de lana y tela en el que deshilachar enemigos', 2019, 1),
(28, 'Donkey Kong Country Returns 3D', 20, 2, 'Toda una aventura con el rey del balanceo por la jungla. Donky Kong y Diddy Kong regresan este plataformas lleno de acción. Versión ampliada del original de Wii', 2018, 1),
(29, 'Luigi\'s Mansion', 35, 2, 'Luigi tiene que buscar a MArio en una oscura mansión. Versión del original de GameCube', 2018, 1),
(30, 'Fornite: Lote Criogenización', 30, 3, 'Juego modo PvP para 100 jugadores de Fornite. Un mapa enorme. Un autobús de batalla. El último superviviente gana', 2018, 1),
(31, 'Super Mario Odyssey', 55, 3, 'Los jugadores podrán vagar por los enormes reinos en 3D recogiendo lunas que servirán de combustible para la aeronave de Mario', 2017, 1),
(32, 'FIFA 19', 35, 3, 'juego de futbol', 2018, 0),
(33, 'arms', 55, 3, 'juego de lucha. Mientras los jugadores luchan en el juego conseguirán monedas que podrán intercambiar en el modo: \'conseguir puño\'', 2017, 1),
(34, 'Lego Harry Potter Collection', 35, 3, 'Esta recopilació aúna la creatividad de Lego y el mundo de Harry Potter, con un emocionante viaje lleno de hechizos, pociones, rompecabezas, lecciones y mucho más.', 2018, 0),
(35, 'Grand Theft Auto V', 20, 4, 'Cuando un joven estafador callejero,un ladrón de bancos y un psicópata aterrador se ven involuchados con lo peor y más desquiciado del mundo criminal, tendrán que llevar a cabo una serie de golpes.', 2014, 1);

-- --------------------------------------------------------

--
-- Table structure for table `modelo`
--

CREATE TABLE `modelo` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `modelo`
--

INSERT INTO `modelo` (`id`, `tipo`) VALUES
(1, 'PlayStation'),
(2, 'Nintendo 2DS/3DS'),
(3, 'Nintendo Switch'),
(4, 'X-Box'),
(5, 'PC');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `user` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `password`, `hash`) VALUES
(1, 'juana', 'D404559F602EAB6FD602AC7680DACBFAADD13630335E951F097AF3900E9DE176B6DB28512F2E000B9D04FBA5133E8B1C6E8DF59DB3A8AB9D60BE4B97CC9E81DB', ''),
(2, 'jess90', '32E2808526296DCDCF03DD7DE37E00680FFC2F23678A185DF91F59B8123D7833AEC0FD021AB1E4AA8E054922FE0647A45228EEBAA6DABB8955EF5519228D7FB6', ''),
(3, 'rodri', '3C9909AFEC25354D551DAE21590BB26E38D53F2173B8D3DC3EEE4C047E7AB1C1EB8B85103E3BE7BA613B31BB5C9C36214DC9F14A42FD7A2FDB84856BCA5C44C2', '98AC71DCD2FB632D272BF49BD417B57123E6080C3211D67FBCA7C7180AD325A84EB1839C4AA164078019F6BEDE5E687C80780B3D548A03A8A47F23D02E35DC75'),
(4, 'kiiko12', 'D404559F602EAB6FD602AC7680DACBFAADD13630335E951F097AF3900E9DE176B6DB28512F2E000B9D04FBA5133E8B1C6E8DF59DB3A8AB9D60BE4B97CC9E81DB', ''),
(5, 'pepe', '974F3036F39834082E23F4D70F1FEBA9D4805B3EE2CEDB50B6F1F49F72DD83616C2155F9FF6E08A1CEFBF9E6BA2F4AAA45233C8C066A65E002924ABFA51590C4', ''),
(6, 'julian23', 'A1C5F6141D3F0ADE044CDEC140E260C4054504D1F31663FB1B6211399C2AB7A5CFBE15C0A5D39D75B9D708FB3FEB7346C27D6D8AD917A650C294413929304141', '6E6E22656D46C7C9FEE46178AA80DDAA5EA617083226F00EFB069472E90BED1D571EDFB04FBF711D7A5FEA41178B6B82C9C4A59C215522E06CA5FAA37B58B712'),
(7, 'roberto12', '7F08D2F631BEBA8CC605499752F8C4BACDA734E1B0D7900D37DC136143C446348CD63ADE7DBFDC2520C5DC30FE5639E388921F7262D998835E089794E16322E9', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_juego_modelo` (`id_modelo`);

--
-- Indexes for table `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `juegos`
--
ALTER TABLE `juegos`
  ADD CONSTRAINT `fk_juego_modelo` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
