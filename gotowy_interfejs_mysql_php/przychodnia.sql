-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 23 Sty 2022, 20:47
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `przychodnia`
--
CREATE DATABASE IF NOT EXISTS `przychodnia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `przychodnia`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adresy`
--

DROP TABLE IF EXISTS `adresy`;
CREATE TABLE `adresy` (
  `ID_adresu` int(11) NOT NULL,
  `Ulica` varchar(48) NOT NULL,
  `Nr_budynku` varchar(6) NOT NULL,
  `Nr_mieszkania` varchar(4) DEFAULT NULL,
  `Miasto` varchar(48) NOT NULL,
  `Kod_pocztowy` varchar(6) NOT NULL,
  `Wojewodztwo` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `adresy`
--

INSERT INTO `adresy` (`ID_adresu`, `Ulica`, `Nr_budynku`, `Nr_mieszkania`, `Miasto`, `Kod_pocztowy`, `Wojewodztwo`) VALUES
(1, 'Niska', '5', '2', 'Kielce', '25-001', 'Świętokrzyskie'),
(2, 'Zagnańska', '78a', '9', 'Kielce', '25-001', 'Świętokrzyskie'),
(3, 'Sandomierska', '106', '65', 'Kielce', '25-001', 'Świętokrzyskie'),
(4, 'Grunwaldzka', '78', NULL, 'Kielce', '25-001', 'Świętokrzyskie'),
(5, 'Kościuszki', '25', NULL, 'Kielce', '25-001', 'Świętokrzyskie'),
(6, 'Artwinskiego', '3', NULL, 'Kielce', '25-001', 'Świętokrzyskie'),
(7, 'Szajnowicza-Iwanowa', '13a', '14', 'Kielce', '25-001', 'Świętokrzyskie'),
(8, 'Niestachów', '207', NULL, 'Daleszyce', '26-021', 'Świętokrzyskie'),
(9, 'Mickiewicza', '25', '3', 'Kielce', '25-001', 'Świętokrzyskie'),
(11, 'Duża', '3', '1', 'Kielce', '25-001', 'Świetokrzyskie'),
(12, 'Kielecka', '4', '2', 'Kraków', '31-523', 'Małopolskie'),
(14, 'Radomska', '4c', '1', 'Kielce', '25-001', 'Świetokrzyskie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `badania`
--

DROP TABLE IF EXISTS `badania`;
CREATE TABLE `badania` (
  `ID_badania` int(11) NOT NULL,
  `Koszt` int(11) DEFAULT NULL,
  `Opis` varchar(255) DEFAULT NULL,
  `ID_pacjenta` int(11) NOT NULL,
  `ID_pracownika` int(11) NOT NULL,
  `ID_recepty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `badania`
--

INSERT INTO `badania` (`ID_badania`, `Koszt`, `Opis`, `ID_pacjenta`, `ID_pracownika`, `ID_recepty`) VALUES
(3, 25, 'Pobierania krwi oraz badanie próbki pod kątem TSH', 4, 8, 4),
(4, 650, 'Leczenie kanałowe zęba', 5, 7, 5),
(5, 120, 'Wizyta kontrolna.', 6, 9, 6),
(6, 140, 'Test na obecność wirusa SARS-COV2. Antropogenowy. ', 5, 8, NULL),
(9, 25, 'Test na COVID-19', 8, 10, NULL),
(12, 25, 'Badanie glukozy z krwi oraz zawartości mocznika w moczu', 8, 8, NULL),
(14, 120, 'Usuwanie zębów mądrości', 6, 8, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `choroby`
--

DROP TABLE IF EXISTS `choroby`;
CREATE TABLE `choroby` (
  `ID_choroby` int(11) NOT NULL,
  `Nazwa` varchar(64) NOT NULL,
  `Typ` varchar(16) NOT NULL,
  `Opis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `choroby`
--

INSERT INTO `choroby` (`ID_choroby`, `Nazwa`, `Typ`, `Opis`) VALUES
(1, 'Przeziębienie', 'Wirusowa', 'Ból głowy, gorączka'),
(2, 'Bakteryjne zapalenie dziąsła', 'Bakteryjna', 'Zaczerwienione krwawiące dziąsła'),
(3, 'COVID-19', 'Wirusowa', 'Ból głowy, gorączka, brak węchu i zapachu'),
(4, 'Pacjent zdrowy', 'brak', 'Żadna choroba nie została wykryta podczas badania'),
(5, 'Grypa', 'Wirusowa', 'Ból ciała, kaszel, gorączka');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cnb`
--

DROP TABLE IF EXISTS `cnb`;
CREATE TABLE `cnb` (
  `ID_cnb` int(11) NOT NULL,
  `ID_badania` int(11) NOT NULL,
  `ID_choroby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `cnb`
--

INSERT INTO `cnb` (`ID_cnb`, `ID_badania`, `ID_choroby`) VALUES
(1, 5, 1),
(2, 4, 2),
(3, 5, 1),
(4, 6, 3);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `info_badania`
-- (Zobacz poniżej rzeczywisty widok)
--
DROP VIEW IF EXISTS `info_badania`;
CREATE TABLE `info_badania` (
`PESEL` varchar(11)
,`Imie_pacjenta` varchar(32)
,`Nazwisko_pacjenta` varchar(32)
,`ID_badania` int(11)
,`Koszt` int(11)
,`Opis` varchar(255)
,`Imie_lekarza` varchar(32)
,`Nazwisko_lekarza` varchar(32)
,`ID_recepty` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `info_pacjencji`
-- (Zobacz poniżej rzeczywisty widok)
--
DROP VIEW IF EXISTS `info_pacjencji`;
CREATE TABLE `info_pacjencji` (
`ID_pacjenta` int(11)
,`ID_osoby` int(11)
,`Imie` varchar(32)
,`Nazwisko` varchar(32)
,`Plec` varchar(1)
,`PESEL` varchar(11)
,`Data_urodzenia` date
,`Nr_telefonu` varchar(12)
,`Email` varchar(64)
,`Data_rejestracji` date
,`Ubezpieczenie` varchar(1)
,`ID_adresu` int(11)
,`Wojewodztwo` varchar(32)
,`Miasto` varchar(48)
,`Kod_pocztowy` varchar(6)
,`Ulica` varchar(48)
,`Nr_budynku` varchar(6)
,`Nr_mieszkania` varchar(4)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `info_pracownicy`
-- (Zobacz poniżej rzeczywisty widok)
--
DROP VIEW IF EXISTS `info_pracownicy`;
CREATE TABLE `info_pracownicy` (
`ID_osoby` int(11)
,`Imie` varchar(32)
,`Nazwisko` varchar(32)
,`Plec` varchar(1)
,`Nr_telefonu` varchar(12)
,`Email` varchar(64)
,`PESEL` varchar(11)
,`Data_urodzenia` date
,`Nazwa` varchar(64)
,`Pensja` int(11)
,`stanowisko` varchar(32)
,`Data_zatrudnienia` date
,`Koniec_umowy` date
,`Login` varchar(64)
,`Haslo` varchar(64)
,`Miasto` varchar(48)
,`Kod_pocztowy` varchar(6)
,`Ulica` varchar(48)
,`Nr_budynku` varchar(6)
,`Nr_mieszkania` varchar(4)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `info_recepty`
-- (Zobacz poniżej rzeczywisty widok)
--
DROP VIEW IF EXISTS `info_recepty`;
CREATE TABLE `info_recepty` (
`ID_recepty` int(11)
,`Kod` varchar(32)
,`Data_waznosci` date
,`Nazwa` varchar(32)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `leki`
--

DROP TABLE IF EXISTS `leki`;
CREATE TABLE `leki` (
  `ID_Leku` int(11) NOT NULL,
  `Nazwa` varchar(32) NOT NULL,
  `Cena` int(11) NOT NULL CHECK (`Cena` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `leki`
--

INSERT INTO `leki` (`ID_Leku`, `Nazwa`, `Cena`) VALUES
(1, 'Rutinoscorbin', 9),
(2, 'Xylometazolin', 10),
(3, 'Fervex', 23),
(4, 'BabyBoom', 9),
(5, 'Apap', 7),
(6, 'Witamina C 1000', 8),
(7, 'Test COVID-19', 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lnr`
--

DROP TABLE IF EXISTS `lnr`;
CREATE TABLE `lnr` (
  `ID_lnr` int(11) NOT NULL,
  `ID_recepty` int(11) NOT NULL,
  `ID_leku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `lnr`
--

INSERT INTO `lnr` (`ID_lnr`, `ID_recepty`, `ID_leku`) VALUES
(1, 4, 1),
(2, 4, 4),
(3, 5, 3),
(4, 6, 2),
(5, 6, 5),
(6, 6, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `osoby`
--

DROP TABLE IF EXISTS `osoby`;
CREATE TABLE `osoby` (
  `ID_osoby` int(11) NOT NULL,
  `Imie` varchar(32) NOT NULL,
  `Nazwisko` varchar(32) NOT NULL,
  `Plec` varchar(1) NOT NULL CHECK (`Plec` = 'K' or `Plec` = 'M'),
  `Nr_telefonu` varchar(12) DEFAULT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `PESEL` varchar(11) NOT NULL,
  `Data_urodzenia` date NOT NULL,
  `ID_adresu` int(11) NOT NULL,
  `Login` varchar(64) NOT NULL,
  `Haslo` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `osoby`
--

INSERT INTO `osoby` (`ID_osoby`, `Imie`, `Nazwisko`, `Plec`, `Nr_telefonu`, `Email`, `PESEL`, `Data_urodzenia`, `ID_adresu`, `Login`, `Haslo`) VALUES
(1, 'Jakub', 'Raczyński', 'M', '885339052', 'jraczynski1409@gmail.com', '95848384858', '2000-09-14', 1, 'admin1', 'projekt'),
(2, 'Robert', 'Kaleta', 'M', '784756354', 'robson@gmail.com', '89495849312', '2000-12-13', 3, 'robson', 'szachista1'),
(3, 'Bartłomiej', 'Palus', 'M', '964284721', 'bartek@checc.pl', '85739471832', '2000-10-21', 2, 'bartek', 'szachista2'),
(4, 'Barbara', 'Barabasz', 'K', '9275849583', NULL, '89234543237', '1978-01-12', 7, 'bbarabasz', 'haslo123'),
(5, 'Robert', 'Lawendowski', 'M', '579347534', 'rl9@gmail.com', '88235268453', '1988-04-14', 8, 'rl9bayern', 'ania1234'),
(6, 'Monika', 'Brodka', 'K', '758485739', NULL, '8584920394', '1984-07-20', 9, 'monia123', '321ainom'),
(8, 'Michał', 'Anioł', 'M', '123876543', 'michal@gmail.com', '55121209876', '1999-01-18', 11, 'michael', 'angelo'),
(9, 'Maria', 'Rokita', 'K', '958475233', '', '72150198765', '1977-12-12', 12, 'mrokita72', 'koronapany'),
(11, 'Anna', 'Chmiel', 'K', '948527364', 'ac@gmail.com', '91928475432', '0000-00-00', 14, 'achmiel', 'achmiel');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pacjenci`
--

DROP TABLE IF EXISTS `pacjenci`;
CREATE TABLE `pacjenci` (
  `ID_pacjenta` int(11) NOT NULL,
  `Data_rejestracji` date NOT NULL,
  `Ubezpieczenie` varchar(1) NOT NULL CHECK (`Ubezpieczenie` = 'T' or `Ubezpieczenie` = 'N'),
  `ID_osoby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pacjenci`
--

INSERT INTO `pacjenci` (`ID_pacjenta`, `Data_rejestracji`, `Ubezpieczenie`, `ID_osoby`) VALUES
(4, '2022-01-21', 'T', 4),
(5, '2022-01-21', 'T', 5),
(6, '2022-01-23', 'T', 6),
(7, '2022-01-23', 'N', 8),
(8, '2022-01-23', 'T', 9);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

DROP TABLE IF EXISTS `pracownicy`;
CREATE TABLE `pracownicy` (
  `ID_pracownika` int(11) NOT NULL,
  `Data_zatrudnienia` date NOT NULL,
  `Koniec_umowy` date NOT NULL,
  `Pensja` int(11) NOT NULL CHECK (`Pensja` > 3000),
  `ID_stanowiska` int(11) NOT NULL,
  `ID_osoby` int(11) NOT NULL,
  `ID_przychodni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`ID_pracownika`, `Data_zatrudnienia`, `Koniec_umowy`, `Pensja`, `ID_stanowiska`, `ID_osoby`, `ID_przychodni`) VALUES
(7, '2022-01-01', '2022-02-28', 3500, 1, 3, 1),
(8, '2022-01-01', '2022-06-30', 5000, 3, 1, 3),
(9, '2022-01-01', '2022-03-31', 4500, 2, 2, 2),
(10, '2022-01-23', '0000-00-00', 3600, 1, 11, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przychodnie`
--

DROP TABLE IF EXISTS `przychodnie`;
CREATE TABLE `przychodnie` (
  `ID_przychodni` int(11) NOT NULL,
  `Nazwa` varchar(64) NOT NULL,
  `Nr_telefonu` varchar(12) NOT NULL,
  `ID_adresu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `przychodnie`
--

INSERT INTO `przychodnie` (`ID_przychodni`, `Nazwa`, `Nr_telefonu`, `ID_adresu`) VALUES
(1, '\"RATMEDIC\" NZOZ przychodnia nr 1', '496543212', 4),
(2, '\"RATMEDIC\" NZOZ przychodnia nr 2', '', 5),
(3, '\"RATMEDIC\" NZOZ przychodnia sportowa nr 3', '', 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recepty`
--

DROP TABLE IF EXISTS `recepty`;
CREATE TABLE `recepty` (
  `ID_recepty` int(11) NOT NULL,
  `Kod` varchar(32) NOT NULL,
  `Erecepta` varchar(1) NOT NULL CHECK (`Erecepta` = 'T' or `Erecepta` = 'N'),
  `Data_waznosci` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `recepty`
--

INSERT INTO `recepty` (`ID_recepty`, `Kod`, `Erecepta`, `Data_waznosci`) VALUES
(4, 'k92isi32', 'T', '2022-02-20'),
(5, '2o30fls2', 'T', '2022-02-20'),
(6, '23h5d6h4', 'T', '2022-03-20');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stanowiska`
--

DROP TABLE IF EXISTS `stanowiska`;
CREATE TABLE `stanowiska` (
  `ID_stanowiska` int(11) NOT NULL,
  `Nazwa` varchar(32) NOT NULL,
  `Opis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `stanowiska`
--

INSERT INTO `stanowiska` (`ID_stanowiska`, `Nazwa`, `Opis`) VALUES
(1, 'Pielegniarz/Pielegniarka', 'Do jej obowiązków należy, przyjmowanie pacjentów, pobieranie krwi, wystawianie recept itp...'),
(2, 'Pediatra', 'Lekarz zajmujący się chorobami dzieci'),
(3, 'Stomatolog', 'Lekarz leczący uzębienie'),
(4, 'Kardiolog', 'Lekarz od serca'),
(5, 'Dietetyk', 'Układa diety i dba o zdrowe odżywaianie'),
(6, 'Neurolog', 'Bada układ nerwowy oraz kręgosłup'),
(7, 'Okulista', 'Lekarz badający wzrok'),
(8, 'Chemik/Laborant', 'Zajmuje się dostarczaniem wiedzy o lekach oraz bada próbki'),
(9, 'Endokrynolog', 'Zajmuje się leczeniem tarczycy'),
(10, 'Ginekolog', 'Bada płód oraz drogi rozrodcze kobiet'),
(11, 'Urolog', 'Zajmuje się sprawami mężczyzn');

-- --------------------------------------------------------

--
-- Struktura widoku `info_badania`
--
DROP TABLE IF EXISTS `info_badania`;

DROP VIEW IF EXISTS `info_badania`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `info_badania`  AS SELECT `pac`.`PESEL` AS `PESEL`, `pac`.`Imie` AS `Imie_pacjenta`, `pac`.`Nazwisko` AS `Nazwisko_pacjenta`, `badania`.`ID_badania` AS `ID_badania`, `badania`.`Koszt` AS `Koszt`, `badania`.`Opis` AS `Opis`, `pra`.`Imie` AS `Imie_lekarza`, `pra`.`Nazwisko` AS `Nazwisko_lekarza`, `badania`.`ID_recepty` AS `ID_recepty` FROM ((((`osoby` `pac` join `badania`) join `osoby` `pra`) join `pracownicy`) join `pacjenci`) WHERE `pracownicy`.`ID_pracownika` = `badania`.`ID_pracownika` AND `pacjenci`.`ID_pacjenta` = `badania`.`ID_pacjenta` AND `pracownicy`.`ID_osoby` = `pra`.`ID_osoby` AND `pac`.`ID_osoby` = `pacjenci`.`ID_osoby` ;

-- --------------------------------------------------------

--
-- Struktura widoku `info_pacjencji`
--
DROP TABLE IF EXISTS `info_pacjencji`;

DROP VIEW IF EXISTS `info_pacjencji`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `info_pacjencji`  AS SELECT `pacjenci`.`ID_pacjenta` AS `ID_pacjenta`, `osoby`.`ID_osoby` AS `ID_osoby`, `osoby`.`Imie` AS `Imie`, `osoby`.`Nazwisko` AS `Nazwisko`, `osoby`.`Plec` AS `Plec`, `osoby`.`PESEL` AS `PESEL`, `osoby`.`Data_urodzenia` AS `Data_urodzenia`, `osoby`.`Nr_telefonu` AS `Nr_telefonu`, `osoby`.`Email` AS `Email`, `pacjenci`.`Data_rejestracji` AS `Data_rejestracji`, `pacjenci`.`Ubezpieczenie` AS `Ubezpieczenie`, `adresy`.`ID_adresu` AS `ID_adresu`, `adresy`.`Wojewodztwo` AS `Wojewodztwo`, `adresy`.`Miasto` AS `Miasto`, `adresy`.`Kod_pocztowy` AS `Kod_pocztowy`, `adresy`.`Ulica` AS `Ulica`, `adresy`.`Nr_budynku` AS `Nr_budynku`, `adresy`.`Nr_mieszkania` AS `Nr_mieszkania` FROM ((`pacjenci` join `osoby`) join `adresy`) WHERE `adresy`.`ID_adresu` = `osoby`.`ID_adresu` AND `osoby`.`ID_osoby` = `pacjenci`.`ID_osoby` ;

-- --------------------------------------------------------

--
-- Struktura widoku `info_pracownicy`
--
DROP TABLE IF EXISTS `info_pracownicy`;

DROP VIEW IF EXISTS `info_pracownicy`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `info_pracownicy`  AS SELECT `osoby`.`ID_osoby` AS `ID_osoby`, `osoby`.`Imie` AS `Imie`, `osoby`.`Nazwisko` AS `Nazwisko`, `osoby`.`Plec` AS `Plec`, `osoby`.`Nr_telefonu` AS `Nr_telefonu`, `osoby`.`Email` AS `Email`, `osoby`.`PESEL` AS `PESEL`, `osoby`.`Data_urodzenia` AS `Data_urodzenia`, `przychodnie`.`Nazwa` AS `Nazwa`, `pracownicy`.`Pensja` AS `Pensja`, `stanowiska`.`Nazwa` AS `stanowisko`, `pracownicy`.`Data_zatrudnienia` AS `Data_zatrudnienia`, `pracownicy`.`Koniec_umowy` AS `Koniec_umowy`, `osoby`.`Login` AS `Login`, `osoby`.`Haslo` AS `Haslo`, `adresy`.`Miasto` AS `Miasto`, `adresy`.`Kod_pocztowy` AS `Kod_pocztowy`, `adresy`.`Ulica` AS `Ulica`, `adresy`.`Nr_budynku` AS `Nr_budynku`, `adresy`.`Nr_mieszkania` AS `Nr_mieszkania` FROM ((((`osoby` join `przychodnie`) join `pracownicy`) join `adresy`) join `stanowiska`) WHERE `adresy`.`ID_adresu` = `osoby`.`ID_adresu` AND `osoby`.`ID_osoby` = `pracownicy`.`ID_osoby` AND `pracownicy`.`ID_stanowiska` = `stanowiska`.`ID_stanowiska` AND `pracownicy`.`ID_przychodni` = `przychodnie`.`ID_przychodni` ;

-- --------------------------------------------------------

--
-- Struktura widoku `info_recepty`
--
DROP TABLE IF EXISTS `info_recepty`;

DROP VIEW IF EXISTS `info_recepty`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `info_recepty`  AS SELECT `recepty`.`ID_recepty` AS `ID_recepty`, `recepty`.`Kod` AS `Kod`, `recepty`.`Data_waznosci` AS `Data_waznosci`, `leki`.`Nazwa` AS `Nazwa` FROM ((`recepty` join `lnr`) join `leki`) WHERE `recepty`.`ID_recepty` = `lnr`.`ID_recepty` AND `lnr`.`ID_leku` = `leki`.`ID_Leku` ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `adresy`
--
ALTER TABLE `adresy`
  ADD PRIMARY KEY (`ID_adresu`);

--
-- Indeksy dla tabeli `badania`
--
ALTER TABLE `badania`
  ADD PRIMARY KEY (`ID_badania`),
  ADD KEY `ID_pacjenta` (`ID_pacjenta`),
  ADD KEY `ID_pracownika` (`ID_pracownika`),
  ADD KEY `ID_recepty` (`ID_recepty`);

--
-- Indeksy dla tabeli `choroby`
--
ALTER TABLE `choroby`
  ADD PRIMARY KEY (`ID_choroby`),
  ADD UNIQUE KEY `Nazwa` (`Nazwa`);

--
-- Indeksy dla tabeli `cnb`
--
ALTER TABLE `cnb`
  ADD PRIMARY KEY (`ID_cnb`),
  ADD KEY `ID_badania` (`ID_badania`),
  ADD KEY `ID_choroby` (`ID_choroby`);

--
-- Indeksy dla tabeli `leki`
--
ALTER TABLE `leki`
  ADD PRIMARY KEY (`ID_Leku`),
  ADD UNIQUE KEY `Nazwa` (`Nazwa`);

--
-- Indeksy dla tabeli `lnr`
--
ALTER TABLE `lnr`
  ADD PRIMARY KEY (`ID_lnr`),
  ADD KEY `ID_leku` (`ID_leku`),
  ADD KEY `ID_recepty` (`ID_recepty`);

--
-- Indeksy dla tabeli `osoby`
--
ALTER TABLE `osoby`
  ADD PRIMARY KEY (`ID_osoby`),
  ADD UNIQUE KEY `PESEL` (`PESEL`),
  ADD UNIQUE KEY `Login` (`Login`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `ID_adresu` (`ID_adresu`);

--
-- Indeksy dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  ADD PRIMARY KEY (`ID_pacjenta`),
  ADD KEY `ID_osoby` (`ID_osoby`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`ID_pracownika`),
  ADD UNIQUE KEY `ID_osoby` (`ID_osoby`),
  ADD KEY `ID_stanowiska` (`ID_stanowiska`),
  ADD KEY `fk_osoby` (`ID_przychodni`);

--
-- Indeksy dla tabeli `przychodnie`
--
ALTER TABLE `przychodnie`
  ADD PRIMARY KEY (`ID_przychodni`),
  ADD KEY `ID_adresu` (`ID_adresu`);

--
-- Indeksy dla tabeli `recepty`
--
ALTER TABLE `recepty`
  ADD PRIMARY KEY (`ID_recepty`),
  ADD UNIQUE KEY `Kod` (`Kod`);

--
-- Indeksy dla tabeli `stanowiska`
--
ALTER TABLE `stanowiska`
  ADD PRIMARY KEY (`ID_stanowiska`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `adresy`
--
ALTER TABLE `adresy`
  MODIFY `ID_adresu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT dla tabeli `badania`
--
ALTER TABLE `badania`
  MODIFY `ID_badania` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `choroby`
--
ALTER TABLE `choroby`
  MODIFY `ID_choroby` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `cnb`
--
ALTER TABLE `cnb`
  MODIFY `ID_cnb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `leki`
--
ALTER TABLE `leki`
  MODIFY `ID_Leku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `lnr`
--
ALTER TABLE `lnr`
  MODIFY `ID_lnr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `osoby`
--
ALTER TABLE `osoby`
  MODIFY `ID_osoby` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  MODIFY `ID_pacjenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `ID_pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `przychodnie`
--
ALTER TABLE `przychodnie`
  MODIFY `ID_przychodni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `recepty`
--
ALTER TABLE `recepty`
  MODIFY `ID_recepty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `stanowiska`
--
ALTER TABLE `stanowiska`
  MODIFY `ID_stanowiska` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `badania`
--
ALTER TABLE `badania`
  ADD CONSTRAINT `badania_ibfk_1` FOREIGN KEY (`ID_pacjenta`) REFERENCES `pacjenci` (`ID_pacjenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `badania_ibfk_2` FOREIGN KEY (`ID_pracownika`) REFERENCES `pracownicy` (`ID_pracownika`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `badania_ibfk_3` FOREIGN KEY (`ID_recepty`) REFERENCES `recepty` (`ID_recepty`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `cnb`
--
ALTER TABLE `cnb`
  ADD CONSTRAINT `cnb_ibfk_1` FOREIGN KEY (`ID_badania`) REFERENCES `badania` (`ID_badania`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cnb_ibfk_2` FOREIGN KEY (`ID_choroby`) REFERENCES `choroby` (`ID_choroby`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `lnr`
--
ALTER TABLE `lnr`
  ADD CONSTRAINT `lnr_ibfk_1` FOREIGN KEY (`ID_leku`) REFERENCES `leki` (`ID_Leku`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `lnr_ibfk_2` FOREIGN KEY (`ID_recepty`) REFERENCES `recepty` (`ID_recepty`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `osoby`
--
ALTER TABLE `osoby`
  ADD CONSTRAINT `fk_os_adr` FOREIGN KEY (`ID_adresu`) REFERENCES `adresy` (`ID_adresu`);

--
-- Ograniczenia dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  ADD CONSTRAINT `pacjenci_ibfk_1` FOREIGN KEY (`ID_osoby`) REFERENCES `osoby` (`ID_osoby`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD CONSTRAINT `fk_bad_prac` FOREIGN KEY (`ID_stanowiska`) REFERENCES `stanowiska` (`ID_stanowiska`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_osoby` FOREIGN KEY (`ID_przychodni`) REFERENCES `przychodnie` (`ID_przychodni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pracownicy_ibfk_1` FOREIGN KEY (`ID_osoby`) REFERENCES `osoby` (`ID_osoby`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `przychodnie`
--
ALTER TABLE `przychodnie`
  ADD CONSTRAINT `fk_przy_adr` FOREIGN KEY (`ID_adresu`) REFERENCES `adresy` (`ID_adresu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
