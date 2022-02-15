--
-- Database: `Ομάδα 13 - Γραφείο Εύρεσης Εργασίας`
--
-- --------------------------------------------------------
-- 
-- Drop Tables
--


DROP TABLE IF EXISTS `REVIEW`;
DROP TABLE IF EXISTS `CV`;
DROP TABLE IF EXISTS `INTERVIEW`;
DROP TABLE IF EXISTS `EXPERT`;
DROP TABLE IF EXISTS `GUIDE`;
DROP TABLE IF EXISTS `APPLY`;
DROP TABLE IF EXISTS `EMPLOYEE`;
DROP TABLE IF EXISTS `MANAGE`;
DROP TABLE IF EXISTS `OFFER`;
DROP TABLE IF EXISTS `JOB`;
DROP TABLE IF EXISTS `EXPERTISE`;
DROP TABLE IF EXISTS `EMPLOYER`;




DROP TABLE IF EXISTS `CUSTOMER`;

DROP TABLE IF EXISTS `ADMIN`;



-- --------------------------------------------------------
--
-- Table structures
--

CREATE TABLE `CV` (
  `ID_cv` int NOT NULL,
  `CV` varchar(4000) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `CV` ADD PRIMARY KEY (`ID_cv`), 
	MODIFY `ID_cv` int NOT NULL;


CREATE TABLE `MANAGE` (
  `ID_job` int NOT NULL,
  `ID_admin` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `MANAGE` ADD KEY (`ID_job`,`ID_admin`);


CREATE TABLE `EXPERTISE` (
  `ID_expertise` int NOT NULL,
  `Title` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `EXPERTISE` ADD PRIMARY KEY (`ID_expertise`),
	MODIFY `ID_expertise` INT NOT NULL AUTO_INCREMENT;


CREATE TABLE `REVIEW` (
  `ID_employer` int NOT NULL,
  `ID_cv` int NOT NULL,
  `Interview` BOOLEAN NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `REVIEW` ADD KEY (`ID_employer`,`ID_cv`);


CREATE TABLE `EMPLOYER` (
  `ID_employer` int NOT NULL,
  `ID_customer` int NOT NULL,
  `SSN` varchar(10) NOT NULL,
  `Company name` varchar(256) NOT NULL,
  `Company type` varchar(256) NOT NULL,
  `Website` varchar(256)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `EMPLOYER` ADD PRIMARY KEY (`ID_employer`),
	ADD KEY (`ID_customer`),
	ADD UNIQUE KEY `SSN` (`SSN`), 
	MODIFY `ID_employer` int NOT NULL AUTO_INCREMENT;


CREATE TABLE `JOB` (
  `ID_job` int NOT NULL,
  `Title` varchar(256) NOT NULL,
  `Salary` int NOT NULL,
  `Working hours` int NOT NULL,
  `Work type` varchar(256) NOT NULL,
  `City` varchar(256) NOT NULL,
  `Remote` boolean NOT NULL,
  `Specifications` varchar(256),
  `Website published` varchar(256) NOT NULL,
  `Availability` boolean DEFAULT '1',
  `Preffered experience` int(2),
  `ID_expertise` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `JOB` ADD PRIMARY KEY (`ID_job`),
	MODIFY `ID_job` int NOT NULL AUTO_INCREMENT;

    
CREATE TABLE `GUIDE` (
  `ID_employee` int NOT NULL,
  `ID_admin` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `GUIDE` ADD KEY (`ID_employee`,`ID_admin`);


CREATE TABLE `INTERVIEW` (
  `ID_employer` int NOT NULL,
  `ID_employee` int NOT NULL,
  `Date` date NOT NULL,
  `Comments` varchar(256) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `INTERVIEW` ADD KEY (`ID_employer`,`ID_employee`);


CREATE TABLE `APPLY` (
  `ID_app` int NOT NULL,
  `ID_employee` int NOT NULL,
  `ID_job` int NOT NULL,
  `Status` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `APPLY` ADD PRIMARY KEY (`ID_app`), 
	MODIFY `ID_app` INT NOT NULL AUTO_INCREMENT;


CREATE TABLE `EXPERT` (
  `ID_employee` int NOT NULL,
  `ID_expertise` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `EXPERT` ADD KEY (`ID_employee`,`ID_expertise`);


CREATE TABLE `CUSTOMER` (
  `ID_customer` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `E-mail` varchar(256) NOT NULL,
  `Street` varchar(256) ,
  `Number` int ,
  `City` VARCHAR(20) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `CUSTOMER` ADD PRIMARY KEY (`ID_customer`),
	MODIFY `ID_customer` int NOT NULL AUTO_INCREMENT;


CREATE TABLE `OFFER` (
  `ID_employer` int NOT NULL,
  `ID_job` int NOT NULL,
  `DateOffered` date NOT NULL,
  `Due` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `OFFER` ADD KEY (`ID_employer`,`ID_job`);


CREATE TABLE `ADMIN` (
  `ID_admin` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Salary` int NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `SSN` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `ADMIN` ADD PRIMARY KEY (`ID_admin`), ADD UNIQUE KEY `SSN` (`SSN`), 
	MODIFY `ID_admin` int NOT NULL AUTO_INCREMENT;


CREATE TABLE `EMPLOYEE` (
  `ID_customer` int NOT NULL ,
  `Available_hours` int NOT NULL,
  `YearsofExperience` int(2) NOT NULL,
  `ID_cv` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `EMPLOYEE` ADD PRIMARY KEY (`ID_customer`),
	MODIFY `ID_customer` INT NOT NULL;
ALTER TABLE `EMPLOYEE` ADD KEY (`ID_cv`),
	MODIFY `ID_cv` INT NOT NULL AUTO_INCREMENT;


-- --------------------------------------------------------
--
-- Data insertion
--


INSERT INTO `EXPERTISE`(`Title`) VALUES
	( 'Waiter' ), ( 'Salesman' ), ( 'Cleaner' ), ( 'Electrical engineer' ), ( 'Professor' ), 
	( 'Computer engineer' ), ( 'ΜΑΓΕΙΡΑΣ' ), ( 'ΜΗΧΑΝΙΚΟΣ ΑΥΤΟΚΙΝΗΤΩΝ' ), ( 'Civil engineer' ), 
	( 'ΑΕΡΟΣΥΝΟΔΟΣ' ), ( 'Pilot' ), ( 'Doctor' ), ( 'ΥΠΑΛΛΗΛΟΣ' ), ( 'Musician' ), ( 'ΑΛΛΟ' );


INSERT INTO `ADMIN`(`Name`,`Surname`,`Salary`,`Phone`,`DOB`,`SSN`) VALUES
	('Νίκος', 'Μεταξάς', 1200, 6944188394, '1979-05-08', 1409551746),
	('Μαρία', 'Λαμπροδήμου', 1100, 6910942076, '1982-11-12', 1421393084),
	('Θεανώ', 'Γεωργίου', 1300, 6919193549, '1995-06-22', 3217300495),
	('Πέτρος', 'Βασιλείου', 1000, 6972700586, '1999-03-23', 2726173146),
	('Δέσποινα', 'Παπαδάμου', 1200, 6906139765, '1980-07-04', 6639247018),
	('Ευτύχης', 'Παπαδόπουλος', 1700, 6968341352, '1970-01-17', 7807958939),
	('Χριστίνα', 'Αλεξοπούλου', 1500, 6961168000, '1975-04-05', 2527280374),
	('Ανδρέας ', 'Παπαμηχαήλ ', 1400, 6902606103, '1992-09-08', 1290682376),
	('Φωτεινή', 'Σπυροπούλου', 1300, 6903285356, '1988-10-13', 4199860312),
	('Σπύρος', 'Νικολάτος', 1400, 6989452842, '1986-07-06', 6252685786);


INSERT INTO `CUSTOMER`(`Name`,`Surname`,`E-mail`,`Street`,`Number`,`City`,`Phone`,`ID`) VALUES
 ('ΙΩΑΝΝΗΣ', 'ΠΑΠΑΝΙΚΟΛΑΟΥ', 'iopap@denkserw.gr', 'ΚΥΠΑΡΙΣΙΑΣ', 25, 'ΠΑΤΡΑ', 6978256695, 'ΑΙ 772534' ),
 ('ΓΙΩΡΓΟΣ', 'ΖΕΡΒΟΣ', 'gize@denkserw.gr', 'ΚΟΡΙΝΘΟΥ', 12, 'ΠΑΤΡΑ', 6978254480, 'ΑΙ 582245' ),
 ('ΜΙΧΑΛΗΣ', 'ΝΙΚΟΛΟΠΟΥΛΟΣ', 'mixalis@denkserw.gr', 'ΠΑΠΑΝΔΡΕΟΥ', 35, 'ΠΑΤΡΑ', 6977201569, 'ΑΙ 795526' ),
 ('ΜΑΡΙΑ', 'ΠΑΠΑΚΩΣΤΑ', '', '', 0, 'ΠΑΤΡΑ', 6987595252, 'ΑΙ 819216' ),
 ('ΙΩΑΝΝΑ', 'ΒΑΣΙΛΟΠΟΥΛΟΥ', 'ioaba@denkserw.gr', 'ΓΕΡΜΑΝΟΥ', 19, 'ΠΑΤΡΑ', 6968800925, 'ΑΙ 756326' ), 
 ('ΓΙΑΝΝΗΣ', 'ΣΤΑΥΡΟΥΔΑΚΗΣ', 'giannakis@denkserw.gr', 'ΚΥΠΡΟΥ', 108, 'ΑΘΗΝΑ', 6951611504, 'ΑΙ 198706' ),
 ('ΚΩΝΣΤΑΝΤΙΝΟΣ', 'ΘΕΟΔΩΡΟΠΟΥΛΟΣ', 'kwstas@denkserw.gr', 'ΘΕΣΣΑΛΟΝΙΚΗΣ', 24, 'ΑΘΗΝΑ', 6959347255, 'ΑΙ 582634' ), 
 ('ΑΝΤΡΕΑΣ', 'ΠΑΠΑΧΡΗΣΤΟΣ', 'antrpapa@denkserw.gr', 'ΘΕΜΙΣΤΟΚΛΕΩΣ', 37, 'ΠΑΤΡΑ', 6955234850, 'ΑΙ 189652' ),
 ('ΠΑΝΑΓΙΩΤΗΣ', 'ΚΩΝΣΤΑΝΤΙΝΟΥ', 'pakw@denkserw.gr', 'ΔΑΜΑΣΚΗΝΟΥ', 61, 'ΠΑΤΡΑ', 6926352626, 'ΑΙ 197823' ),
 ('ΝΙΚΟΛΙΑ', 'ΚΑΡΑΘΑΝΑΣΗ', 'niki241990@denkserw.gr', '', 0, 'ΠΑΤΡΑ', 6912023022, 'ΑΙ 198846' ),
 ('ΙΩΑΝΝΑ', 'ΜΑΥΡΙΔΗ', 'iwannama@denkserw.gr', 'ΑΜΕΡΙΚΗΣ', 66, 'ΠΑΤΡΑ', 6916263506, 'ΑΙ 165496' ), 
 ('ΠΑΝΑΓΙΩΤΗΣ', 'ΣΑΒΒΟΠΟΥΛΟΣ', '', 'ΜΟΡΦΟΥ', 72, 'ΠΑΤΡΑ', 6977802615, '' ),
 ('ΒΑΣΙΛΗΣ', 'ΠΑΠΑΝΔΡΕΟΥ', 'vasipapa@denkserw.gr', 'ΡΟΔΟΥ', 49, 'ΠΑΤΡΑ', 6972051682, '' ),
 ('ΑΦΡΟΔΙΤΗ', 'ΣΤΑΥΡΟΥ', 'afro@denkserw.gr', 'ΝΟΡΜΑΝ', 21, 'ΠΑΤΡΑ', 6935268249, 'ΑΙ 894613' ),
 ('ΜΑΝΩΛΗΣ', 'ΜΑΝΩΛΟΠΟΥΛΟΣ', 'manwmanw@denkserw.gr', 'ΚΑΝΑΡΗ', 10, 'ΑΘΗΝΑ', 6926851937, 'ΑΙ 468932' ), 
 ('ΕΥΑΓΓΕΛΟΣ', 'ΚΑΛΠΕΤΗΣ', 'vaggos@denkserw.gr', 'ΚΟΡΙΝΘΟΥ', 7, 'ΠΑΤΡΑ', 6911254789, 'ΑΙ 198762' ),
 ('ΠΑΝΑΓΙΩΤΗΣ', 'ΜΑΥΡΟΣ', 'panosmauros@denkserw.gr', 'ΚΑΡΟΛΟΥ', 25, 'ΠΑΤΡΑ', 6902584631, 'ΑΙ 959876' ),
 ('ΒΑΣΙΛΙΚΗ', 'ΚΗΠΟΥΡΟΥ', 'vasokip@denkserw.gr', 'ΗΠΕΙΡΟΥ', 52, 'ΠΑΤΡΑ', 6988520364, 'ΑΙ 265987' ),
 ('ΜΑΡΙΑ', 'ΤΣΑΟΥΣΗ', 'marotsa@denkserw.gr', 'ΑΛΚΙΒΙΑΔΟΥ', 37, 'ΠΑΤΡΑ', 6918279523, 'ΑΙ 198756' ),
 ('ΜΑΡΙΑ', 'ΚΟΚΚΙΝΟΥ', 'mariakok@denkserw.gr', 'ΠΟΛΕΜΗ', 41, 'ΠΑΤΡΑ', 6987452610, 'ΑΙ 657984' ),
 ('ΗΛΙΑΣ', 'ΝΤΑΡΛΑΣ', 'iliasd@denkserw.gr', 'ΜΑΒΙΛΗ', 99, 'ΠΑΤΡΑ', 6999523684, 'ΑΙ 298463' ),
 ('ΑΓΑΠΗ', 'ΦΩΤΟΠΟΥΛΟΥ', 'aga@denkserw.gr', 'ΔΡΑΓΟΥΜΗ', 33, 'ΑΘΗΝΑ', 6972910638, 'ΑΙ 198746' ), 
 ('ΘΩΜΑΣ', 'ΗΛΙΟΠΟΥΛΟΣ', 'tomhelios@denkserw.gr', 'ΒΑΡΙΚΑ', 16, 'ΘΕΣΣΑΛΟΝΙΚΗ', 6988923605, 'ΑΙ 646879' ),
 ('ΠΑΝΑΓΙΩΤΗΣ', 'ΠΕΡΔΙΚΑΚΗΣ', 'panosperd@denkserw.gr', 'ΙΚΑΡΟΥ', 7, 'ΙΩΑΝΝΙΝΑ', 6999382078, 'ΑΙ 658432' ), 
 ('ΘΕΟΔΩΡΟΣ', 'ΨΑΡΑΚΗΣ', '', 'ΚΑΡΑΙΣΚΑΚΗ', 72, 'ΠΑΤΡΑ', 6978201590, 'ΑΙ 987621' ), 
 ('ΣΟΦΙΑ', 'ΚΑΡΥΔΗ', 'sofikaridi@denkserw.gr', '', 0, 'ΠΑΤΡΑ', 6902538526, 'ΑΙ 982536' ),
 ('ΑΘΑΝΑΣΙΑ', 'ΙΩΑΝΝΟΥ', '', 'ΓΕΡΟΚΩΣΤΟΠΟΥΛΟΥ', 15, 'ΠΑΤΡΑ', 6978205369, '' ),
 ('ΦΩΤΗΣ', 'ΒΑΣΙΛΟΠΟΥΛΟΣ', 'fwtisvas@denkserw.gr', 'ΕΡΜΟΥ', 31, 'ΠΑΤΡΑ', 6978519063, '' ),
 ('ΣΤΕΦΑΝΟΣ', 'ΜΑΡΚΟΣ', 'stefanos@denkserw.gr', 'ΑΓΙΟΥ ΝΙΚΟΛΑΟΥ ', 11, 'ΠΑΤΡΑ', 6998205863, 'ΑΙ 946826' ),
 ('ΡΑΦΑΕΛΑ', 'ΣΚΟΝΔΡΑ', 'rafaskondra@denkserw.gr', 'ΕΥΒΟΙΑΣ', 86, 'ΠΑΤΡΑ', 6988752036, 'ΑΙ 151951' ),
 ('ΧΑΡΑ', 'ΣΕΒΑΣΤΗ', 'joyiarespect@denkserw.gr', 'ΜΑΚΕΔΟΝΟΜΑΧΩΝ', 3, 'ΠΑΤΡΑ', 6910254835, 'ΑΙ 498415' ),  
 ('ΠΗΝΕΛΟΠΗ', 'ΚΑΝΕΛΟΠΟΥΛΟΥ', 'penelope@denkserw.gr', 'ΙΘΑΚΗΣ', 52, 'ΙΩΑΝΝΙΝΑ', 6958206536, 'ΑΙ 561615' ),
 ('ΔΗΜΗΤΡΗΣ', 'ΠΑΠΑΖΟΓΛΟΥ', 'dimitrispap@denkserw.gr', 'ΣΜΥΡΝΗΣ', 25, 'ΙΩΑΝΝΙΝΑ', 6992849987, 'ΑΙ 797135' ),
 ('ΔΗΜΗΤΡΗΣ', 'ΠΟΝΤΙΟΣ', 'jimpont@denkserw.gr', 'ΠΟΝΤΟΥ', 19, 'ΘΕΣΣΑΛΟΝΙΚΗ', 6985221058, 'ΑΙ 079135' ),
 ('ΓΕΡΑΣΙΜΟΣ', 'ΑΝΔΡΙΟΠΟΥΛΟΣ', 'jerryandr@denkserw.gr', 'ΚΑΝΕΛΟΠΟΥΛΟΥ', 17, 'ΘΕΣΣΑΛΟΝΙΚΗ', 6988620647, 'ΑΙ 159918' ),
 ('ΑΝΤΩΝΗΣ', 'ΠΑΠΑΝΔΡΕΟΥ', 'tony@denkserw.gr', 'ΚΟΡΙΝΘΟΥ', 102, 'ΠΑΤΡΑ', 6955300562, 'ΑΙ 879162' ),
 ('ΒΑΣΙΛΗΣ', 'ΠΑΝΑΓΟΠΟΥΛΟΣ', 'billpan@denkserw.gr', 'ΑΛΚΙΒΙΑΔΟΥ', 201, 'ΑΘΗΝΑ', 6938105642, 'ΑΙ 519159' ),
 ('ΧΡΗΣΤΟΣ', 'ΦΩΤΕΙΝΟΣ', 'chrisfwtos@denkserw.gr', 'ΖΗΝΩΝΟΣ', 85, 'ΑΘΗΝΑ', 6935890586, 'ΑΙ 156191' ),
 ('ΑΜΑΛΙΑ', 'ΜΠΙΤΡΑ', 'amalitsa@denkserw.gr', 'ΖΑΙΜΗ', 44, 'ΑΘΗΝΑ', 6987223065, 'ΑΙ 594603' ),
 ('ΠΑΝΑΓΙΩΤΑ', 'ΠΑΝΑΓΟΠΟΥΛΟΥ', 'panagiwta@denkserw.gr', 'ΕΡΜΟΥ', 16, 'ΑΘΗΝΑ', 6935755165, 'ΑΙ 791305' ),
 ('ΣΤΑΥΡΟΣ', 'ΜΠΟΥΜΗΣ', 'stauros1997@denkserw.gr', 'ΠΑΤΡΕΩΣ', 29, 'ΑΘΗΝΑ', 6957615065, 'ΑΙ 819324' ),
 ('ΚΑΤΕΡΙΝΑ', 'ΠΑΠΑΝΙΚΟΛΑΟΥ', 'katpap@denkserw.gr', 'ΚΟΡΑΗ', 37, 'ΑΘΗΝΑ', 6998225637, 'ΑΙ 156089' ),
 ('ΜΑΡΙΑ', 'ΜΑΥΡΟΜΑΤΗ', 'maromau@denkserw.gr', 'ΚΥΠΡΟΥ', 58, 'ΑΘΗΝΑ', 6921575315, 'ΑΙ 497136' ),
 ('ΔΗΜΗΤΡΗΣ', 'ΓΙΑΝΝΟΠΟΥΛΟΣ', 'jimgian@denkserw.gr', '', 0, 'ΑΘΗΝΑ', 6945671067, 'ΑΙ 198730' ), 
 ('ΧΡΙΣΤΙΝΑ', 'ΣΤΑΥΡΟΠΟΥΛΟΥ', 'xrista@denkserw.gr', 'ΚΡΗΤΗΣ', 11, 'ΑΘΗΝΑ', 6945183645, 'ΑΙ 561916' ),
 ('ΠΑΝΑΓΙΩΤΗΣ', 'ΛΑΜΠΡΟΠΟΥΛΟΣ', 'panoslam@denkserw.gr', 'ΔΑΜΑΣΚΟΥ', 10, 'ΠΑΤΡΑ', 6956421892, 'ΑΙ 651680' ), 
 ('ΚΩΝΣΤΑΝΤΙΝΟΣ', 'ΚΟΥΦΟΣ', 'kwstaskouf@denkserw.gr', '', 0, 'ΠΑΤΡΑ', 6915648963, 'ΑΙ 156849' ),
 ('ΑΝΤΡΕΑΣ', 'ΠΡΙΝΤΕΖΗΣ', 'priantreas@denkserw.gr', 'ΣΠΑΡΤΗΣ', 56, 'ΠΑΤΡΑ', 6918095135, 'ΑΙ 565161' ), 
 ('ΝΙΚΟΛΑΟΣ', 'ΠΑΠΑΓΙΑΝΝΗΣ', 'nickpap@denkserw.gr', 'ΑΘΗΝΑΣ', 15, 'ΠΑΤΡΑ', 6915889706, 'ΑΙ 564921' ), 
 ('ΘΕΜΙΣΤΟΚΛΗΣ', 'ΣΟΦΟΥΛΗΣ', '', 'ΠΑΝΕΠΙΣΤΗΜΙΟΥ', 77, 'ΠΑΤΡΑ', 6916585462, 'ΑΙ 523168' );


INSERT INTO `EMPLOYER`(`ID_customer`, `SSN`, `Company name`, `Company type`, `Website`) VALUES 
	( 4, 5415446829, 'Patras Hotel', 'Hotel', 'patrashotel.gr' ),
	( 6, 5616321651, 'Galaxias restaurant', 'Restaurant', 'galaxias.gr' ),
	( 7, 2656132123, 'ΑΓΟΡΑ ΘΕΟ', 'Grocerie store', 'theosuper.gr' ), 
	( 9, 5646513212, 'ΗΛΕΚΤΡΟΛΟΓΙΚΑ ΚΩΝΣΤΑΝΤΙΝΟΥ', 'ΗΛΕΚΤΡΟΛΟΓΙΚΕΣ ΕΓΚΑΤΑΣΤΑΣΕΙΣ', '' ), 
	( 12, 5613210654, 'ΚΑΘΗΜΕΡΙΝΗ', 'Paper', 'kathimerini.gr' ),
	( 13, 2365410005, 'ΑΓΟΡΑ ΡΟΥΧΩΝ', 'Clothes', '' ),
	( 14, 5654123000, 'ΑΓΡΟΠΡΟ', 'Grocerie store', 'agropro.gr' ),
	( 16, 6843213501, 'ΕΚΠΑΙΔΕΥΣΗ ΚΑΛΠΕΤΗΣ', 'Education center', 'kalpetis.gr' ),
	( 19, 4895621980, 'ΘΕΑ', 'Hotel', '' ),
	( 23, 5462165095, 'Hightech', 'Technlogy', 'hightech.gr' ),
	( 24, 2195132150, 'ΑΕΡΟΠΛΑΝΟ', 'Airline', 'aeroplano.gr' ), 
	( 25, 1659876510, 'Teo restaurant', 'Restaurant', 'teorestaurant.gr' ),
	( 27, 5649815613, 'ΤΟ ΒΑΠΟΡΙ', 'ΝΑΥΤΙΛΙΑΚΗ', 'tovapori.gr' ),
	( 30, 2164598450, 'ΠΕΤΑΜΕ ΨΗΛΑ', 'Airline', 'petamepsila.gr' ), 
	( 36, 2210465484, 'ΚΑΘΑΡΟΣ', 'Cleaning', 'katharos.gr' ), 
	( 38, 2131651056, 'ΠΛΥΝΤΗΡΙΟ', 'Office', '' ),
	( 4, 1231658820, 'Athens hotel', 'Hotel', 'athenshotel.gr' ),
	( 7, 2132654894, 'ΥΠΕΡΜΑΡΚΕΤ', 'Grocerie', 'hypermarket.gr' ), 
	( 16, 1654879851, 'ΦΡΟΝΤΙΣΤΗΡΙΑ ΚΑΛΠΕΤΗΣ', 'Education center', 'kalpetis.gr' );


INSERT INTO `EMPLOYEE`(`ID_customer`,`Available_hours`,`YearsofExperience`,`ID_cv`)VALUES
	( 1, 8, 0 ,1), ( 2, 8, 1,2), ( 3, 8, 2 ,3), ( 5, 8, 4,4 ), ( 8, 8, 2,5 ), ( 10, 8, 4,6 ), ( 11, 8, 1,7 ), 
	( 15, 8, 10,8 ), ( 17, 8, 8,9 ), ( 18, 4, 2,10 ), ( 21, 4, 3,11), ( 22, 4, 1,12 ), ( 26, 6, 0,13 ), ( 28, 4, 4,14 ),
	( 29, 4, 1, 15), ( 31, 6, 1,16 ), ( 32, 8, 2,17 ), ( 33, 4, 3,18 ), ( 34, 6, 2,19 ), ( 35, 4, 5,20 ), ( 37, 6, 7 ,21), 
	( 39, 8, 2,22 ), ( 40, 8, 1,23 ), ( 41, 8, 2 ,24), ( 42, 8, 2,25 ), ( 43, 8, 2 ,26), ( 44, 4, 1,27 ), ( 45, 6, 4,28 ),
	( 46, 8, 0,29 ), ( 47, 8, 0,30 ), ( 48, 8, 5 ,31), ( 49, 4, 2 ,32), ( 50, 6, 1 ,33);


INSERT INTO `CV`(`ID_cv`) VALUES
	( 1 ), ( 2 ), ( 3 ), ( 4 ), ( 5 ), ( 6 ), ( 7 ), ( 8 ), ( 9 ), ( 10 ), ( 11 ), ( 12 ), ( 13 ), ( 14 ), ( 15 ),
	( 16 ), ( 17 ), ( 18 ), ( 19 ), ( 20 ), ( 21 ), ( 22 ), ( 23 ), ( 24 ), ( 25 ), ( 26 ), ( 27 ), ( 28 ), ( 29 ), ( 30 ), ( 31 ), ( 32 ), ( 33 );


INSERT INTO `JOB` (`Title`,`Salary`,`Working hours`,`Work type`,`City`,`Remote`,`Specifications`,`Website published`,`Availability`,`Preffered experience`,`ID_expertise`) VALUES
	('Καμαριέρα σε ξενοδοχείο', 800, 8, 'Full Time', 'Πρέβεζα', 0, 'Προϋπηρεσία', 'www.aggelies.com', 1, 2,15),
	('Υδραυλικός στο Φράγμα', 1100, 8, 'Full Time', 'Πάτρα', 0, 'Πιστοποίηση Υδραυλικού', 'www.fragma_plumber.eu', 1, 5,15),
	('Μηχανικός Λογισμικού ', 1500, 8, 'Full Time', 'Αθήνα', 1, 'Πτυχίο BSc CE/CE/ECE', 'www.careesforsoftwareengineers.com', 1, 5,6),
	('Ηλεκτρολόγος Εγκαταστάσεων', 1300, 8, 'Full Time', 'Καλαμάτα', 0, 'Πτυχίο Ηλεκτρολόγου ', 'www.electrologoi.gr', 1, 8,4),
	('Μάγειρας', 500, 4, 'Part Time', 'Πάτρα', 0, 'Σχολή Μαγειρικής', 'www.masterchef-jobs.gr', 1, 1,7),
	('Διαχειριστής E-Shop', 450, 4, 'Part Time', 'Αθήνα', 0, '"Microsoft Office & Αγγλικά','', 0, 0,15),
	('Υπάλληλος Βενζινάδικου', 800, 8, 'Full Time', 'Πάτρα', 0, 'Εκπληρωμένες Στρατιωτικές Υποχρεώσεις', 'www.petrol_jobs.com', 0, 2,13),
	('Υπάλληλος Βενζινάδικου', 400, 4, 'Part Time', 'Πάτρα', 0, 'Εκπληρωμένες Στρατιωτικές Υποχρεώσεις', 'www.petrol_jobs.com', 1, 1,13),
	('Μοίρασμα Διαφημιστικών Φυλλαδίων', 350, 4, 'Part Time', 'Αθήνα', 0, '', 'www.fylladiamoirasma.org', 1, 0,15),
	('Καθηγητής/τρια Φιλολογίας για Φροντιστήριο', 950, 8, 'Full Time', 'Πάτρα', 0, 'Πτυχίο Φιλολογίας', 'www.frontistirio.gr', 1, 4,5),
	('Καθηγητής/τρια Μαθηματικών για Φροντιστήριο', 950, 8, 'Full Time', 'Πάτρα', 0, 'Πτυχίο Μαθηματικών', 'www.frontistirio.gr', 1, 4,5),
	('Τεχνικός Δικτύων', 1800, 8, 'Full Time', 'Αθήνα', 0, 'Πτυχίο Ηλεκτρολόγου Μηχανικού', 'www.network_technisian.gr', 0, 8,6),
	('Πωλητής Κινητής Τηλεφωνίας', 400, 4, 'Part Time', 'Πάτρα', 0, 'Ενδιαφέρον για το αντικείμενο', 'www.cellphonesales.eu', 1, 0,2),
	('Υπάλληλος Συνεργείου Αυτοκινήτων', 850, 4, 'Full Time', 'Αίγιο', 0, 'Μηχανολόγος Αυτοκινήτων', 'www.car_mechanics.gr', 1, 5,8),
	('Πολιτικός Μηχανικός', 1300, 8, 'Full Time', 'Πάτρα', 0, 'Πτυχίο Μηχανολόγου', 'www.civil_careers.org', 1, 9,9),
	('Υπάλληλος Supermarket', 850, 8, 'Full Time', 'Πάτρα', 0, '', 'www.supermarkets.org', 0, 0,13),
	('Υπάλληλος MiniMarket', 350, 4, 'Part Time', 'Αίγιο', 0, '', 'www.minimarkets.org', 1, 0,13),
	('Υπάλληλος Μεσιτικού Γραφείου', 900, 8, 'Full Time', 'Πάτρα', 0, 'Γνώσεις PC', 'www.estatepatras.gr', 1, 4,13 ),
	('Ακτινολόγος για ιδιωτικό νοσοκομείο', 1200, 8, 'Full Time', 'Αθήνα', 0, 'Πτυχίο Ιατρικής & Ειδικότητα Ακτινολόγου','', 0, 1,12 ) ,
	('Αναλυτής Δεδομένων', 400, 4, 'Intern', 'Πάτρα', 1, 'Φοιτητές CE/CS/ECE', 'www.data_analysts.com', 1, 0 ,6),
	('Υπάλληλος Μεταφορικής Εταιρείας', 550, 8, 'Full Time', 'Πάτρα', 0, '', 'www.speedtransfers.eu', 1, 2,15 ),
	('Σερβιτόρος', 350, 4, 'Part Time', 'Πάτρα', 0, '', 'www.coffeepatras.gr', 1, 3 ,1),
	('Σερβιτόρος', 800, 8, 'Full Time', 'Πάτρα', 0, '', 'www.coffeepatras.gr', 1, 4 ,1),
	('Ζαχαροπλάστης', 600, 8, 'Full Time', 'Πάτρα', 0, 'Πτυχίο Ζαχαροπλαστικής', 'www.pastryshops.gr', 1, 5,7 ), 
	('Μουσικός', 1500, 8, 'Full Time', 'Αθήνα', 0, 'Μουσικό Πτυχίο', 'www.megaromousikis.gr', 0, 12,15 ), 
	('Οδηγός Ταξί', 350, 4, 'Part Time', 'Πάτρα', 0, 'Δίπλωμα Οδήγησης', 'www.taxidrivers.gr', 1, 4,15 ), 
	('Σύμβουλος Επιχειρήσεων', 1050, 8, 'Full Time', 'Πάτρα', 0, 'Πτυχίο Διοίκησης & MBA', 'www.companyconsulting.gr', 1, 8,15 ),
	('Φαρμακευτικός Αντιπρόσωπος', 2000, 8, 'Full Time', 'Πάτρα', 0, 'Πτυχίο BSc Φαρμακευτικής ', 'www.pharmacy_agents.com', 1, 10,12 ), 
	('Cloud Engineer', 2200, 8, 'Full Time', 'Αθήνα', 1, 'Πτυχίο BSc CE/CE/ECE & MSc Cloud Engineering', 'www.cloudengineersgreece.com', 1, 4,6 ),
	('Μηχανικός Σχεδιασμού Προϊόντων', 1700, 4, 'Full Time', 'Αθήνα', 1, 'BSc Product Design', 'www.sxediasmosproiontwn.com', 1, 4,4 ), 
 	('CyberSecurity Engineer', 2100, 8, 'Full Time', 'Πάτρα', 1, 'Πτυχίο BSc CE/CE/ECE & MSc Cloud Engineering', 'www.cybersecurity.org', 1, 6,6 ), 
 	('Συντηρητής Φωτοβολταϊκών Συστημάτων', 1600, 8, 'Full Time', 'Πάτρα', 0, 'Πιστοποίηση Συντηρητή Φωτοβολταϊκού', 'www.photovoltaika.gr', 1, 5,4 ), 
 	('Ηλεκτρολόγος Μηχανικός', 1300, 4, 'Intern', 'Πάτρα', 0, 'Πτυχίο Ηλεκτρολόγου Μηχανικού', 'www.HMMY_careers.gr', 1, 0,4 ), 
 	('Φύλαξη Ηλικιωμένων', 500, 4, 'Part Time', 'Πάτρα', 0, '', '', 1, 7 ,15), 
 	('Ψυκτικός', 600, 8, 'Full Time', 'Πάτρα', 0, 'Πιστοποίηση Ψυκτικού', 'www.airconditioning.com', 1, 3 ,15), 
 	('Φύλαξη Ανηλίκων', 350, 4, 'Part Time', 'Πάτρα', 0, '', '', 1, 0 ,15), 
 	('Προωθητής Πωλήσεων σε κατάστημα Καλλυντικών', 700, 8, 'Full Time', 'Πάτρα', 0, '', 'www.sephora.gr', 1, 0 ,12), 
 	('Φυσιοθεραπευτής για ιδιωτικό θεραπευτήριο', 900, 8, 'Full Time', 'Θεσσαλονίκη', 0, 'Πτυχίο Φυσιοθεραπείας', 'www.physio.org', 1, 4,12 ),  
	('Υπάλληλος Φύλαξης', 350, 4, 'Part Time', 'Πάτρα', 0, '', 'www.buildingSecurity.com', 1, 0 ,12), 
 	('Υπάλληλος Χρηματοαποστολών', 750, 8, 'Full Time', 'Πάτρα', 0, '', 'www.secure_money.com', 0, 0,12 ),
 	('Γυμναστής', 1100, 8, 'Full Time', 'Ναύπακτος', 0, 'Πτυχίο ΤΕΦΑΑ', 'www.gymnastics.com', 1, 4,15 ), 
 	('Δικηγόρος ', 1800, 8, 'Full Time', 'Πάτρα', 0, 'Πτυχίο Νομικής & Άδεια ασκήσεως επαγγέλματος','', 0, 1,15 ), 
 	('Γραφίστας', 500, 4, 'Part Time', 'Πάτρα', 1, 'Εμπειρία', 'www.graphicdeisgn.com', 1, 6 ,6),
 	('Διατροφολόγος ποδοσφαιρικής ομάδας', 450, 4, 'Part Time', 'Ιωάννινα', 0, 'Πτυχίο Διατροφολογίας', 'www.pasgiannenacareers.gr', 1, 5 ,15),
	('Καθηγητής/τρια Χημείας για Φροντιστήριο', 950, 8, 'Full Time', 'Πάτρα', 0, 'Πτυχίο Χημείας', 'www.frontistirio.gr', 1, 5 ,5), 
 	('Ψυχολόγος', 1500, 8, 'Full Time', 'Θεσσαλονίκη', 0, 'Πτυχίο Ψυχολογίας ', 'www.kentropsuxologias.org', 1, 8,15 ),
 	('Νοσηλευτής για ιδιωτικό Νοσοκομείο', 1200, 8, 'Full Time', 'Πάτρα', 0, 'Πτυχίο Νοσηλευτικής', 'www.hospital-crews.com', 1, 7 ,12), 
 	('Διερμηνέας Αγγλικών-Γερμανικών', 1700, 8, 'Full Time', 'Αθήνα', 0, 'Πτυχίο Αγγλικών Proficiency & Πτυχίο Göethe C2','', 0, 1,15 ), 
 	('Διαχειριστής Logistics', 1400, 8, 'Full Time', 'Πειραιάς', 1, 'Πτυχίο Διοίκησης', 'www.logistics.com', 1, 8 ,6);


INSERT INTO `GUIDE`(`ID_employee`,`ID_admin`) VALUES
	( 1, 2 ), ( 2, 6 ), ( 3, 6 ), ( 5, 3 ), ( 8, 2 ), ( 10, 7 ), ( 11, 10 ), ( 15, 8 ), 
	( 17, 2 ), ( 18, 2 ), ( 21, 4 ), ( 22, 10 ), ( 26, 8 ), ( 28, 1 ), ( 29, 3 ), ( 31, 3 ), 
	( 32, 4 ), ( 33, 10 ), ( 34, 5 ), ( 35, 10 ), ( 37, 5 ), ( 39, 2 ), ( 40, 5 ), ( 41, 7 ), 
	( 42, 9 ), ( 43, 10 ), ( 44, 4 ), ( 45, 2 ), ( 46, 2 ), ( 47, 2 ), ( 48, 4 ), ( 49, 8 ), ( 50, 2 );


INSERT INTO `EXPERT`(`ID_employee`, `ID_expertise`) VALUES
	( 2, 1 ), ( 3, 1 ), ( 5, 2 ), ( 8, 2 ), ( 10, 2 ), ( 11, 3 ), ( 15, 3 ), ( 17, 4 ), ( 18, 5 ),
	( 21, 6 ), ( 22, 7 ), ( 26, 8 ), ( 28, 8 ), ( 29, 1 ), ( 31, 3 ), ( 32, 5 ), ( 33, 8 ), ( 34, 11 ), 
	( 35, 14 ), ( 37, 15 ), ( 39, 15 ), ( 40, 15 ), ( 41, 9 ), ( 42, 1 ), ( 43, 10 ), ( 44, 12 ), 
	( 45, 4 ), ( 46, 6 ), ( 47, 15 ), ( 48, 15 ), ( 49, 11 ), ( 50, 7 );


INSERT INTO `REVIEW`(`ID_employer`,`ID_cv`,`Interview`) VALUES
	( 1, 10, 1 ), ( 2, 3, 0 ), ( 3, 22, 0 ), ( 4, 14, 0 ), ( 5, 28, 1 ), 
	( 6, 26, 0 ), (7, 30, 1 ), ( 8, 5, 0 ), ( 9, 1, 1 ), ( 10, 3, 0 ), 
	( 11, 4, 0 ), ( 12, 3, 1 ), ( 13, 7, 0 ), ( 14, 11, 0 ), ( 15, 11, 1 ), 
	( 16, 17, 0 ), ( 17, 26, 0 ), ( 18, 9, 0 ), ( 19, 28, 0 );


INSERT INTO `OFFER` (`ID_job`, `ID_employer`, `DateOffered`, `Due`) VALUES
	( 1, 1, '2021-01-05', '2021-03-03' ), ( 2,14, '2020-10-06', '2021-05-17' ), ( 3, 10, '2020-12-22', '2021-04-25' ), ( 4, 4, '2020-11-26', '2021-06-10' ), ( 5, 12, '2020-12-25', '2021-06-04' ), 
	( 6, 10, '2020-11-16', '2021-02-14' ), ( 7, 2, '2020-11-30', '2021-06-20' ), ( 8,3, '2020-12-13', '2021-02-26' ), ( 9, 8, '2020-11-19', '2021-06-19' ), ( 10, 8, '2020-11-08', '2021-06-22' ), 
	( 11, 8, '2020-12-09', '2021-05-08' ), ( 12, 10, '2020-09-22', '2021-03-31' ), ( 13, 10, '2020-12-23', '2021-04-22' ), ( 14, 17, '2020-10-18', '2021-02-12' ), ( 15, 18, '2020-12-24', '2021-04-02' ), 
	( 16, 18, '2020-09-20', '2021-04-05' ), ( 17, 18, '2020-12-02', '2021-03-12' ), ( 18, 9, '2020-11-09', '2021-05-29' ), ( 19, 3, '2020-10-12', '2021-05-04' ), ( 20, 10, '2020-10-30', '2021-05-11' ), 	
	( 21, 8, '2020-10-10', '2021-03-09' ), ( 22, 12, '2020-11-30', '2021-04-01' ), ( 23, 12, '2020-11-05', '2021-03-02' ), ( 24, 2, '2020-12-29', '2021-05-11' ), ( 25, 17, '2020-10-17', '2021-02-28' ), 
	( 26, 9, '2020-11-11', '2021-03-14' ), ( 27, 6, '2020-10-28', '2021-03-31' ), ( 28, 11, '2020-10-16', '2021-02-09' ), ( 29, 10, '2020-10-10', '2021-02-19' ), ( 30, 10, '2020-09-28', '2021-05-14' ), 
	( 31, 10, '2020-10-05', '2021-03-23' ), ( 32, 4, '2020-12-09', '2021-03-29' ), ( 33, 4, '2020-10-21', '2021-05-24' ), ( 34, 4, '2020-12-22', '2021-06-24' ), ( 35, 4, '2020-10-12', '2021-03-12' ), 
	( 36, 7, '2020-12-25', '2021-04-04' ), ( 37, 3, '2020-11-13', '2021-03-03' ), ( 38, 12, '2021-01-05', '2021-05-11' ), ( 39, 6, '2021-01-06', '2021-05-29' ), ( 40, 8, '2020-12-23', '2021-02-22' ), 
	( 41, 7, '2020-09-30', '2021-05-17' ), ( 42, 1, '2020-12-07', '2021-05-25' ), ( 43, 10, '2020-10-07', '2021-02-22' ), ( 44, 7, '2020-09-22', '2021-06-13' ), ( 45, 16, '2020-12-14', '2021-02-04' ), 
	( 46, 9, '2020-10-14', '2021-05-03' ), ( 47, 2, '2020-12-03', '2021-06-04' ), ( 48, 11, '2020-09-20', '2021-05-06' ), ( 49, 13, '2020-11-02', '2021-02-22' );


INSERT INTO `INTERVIEW`(`ID_employer`,`ID_employee`,`Date`) VALUES
	( 15, 17, '2021-02-08' ), ( 6, 28, '2021-04-09' ), ( 6, 34, '2021-04-13' ), ( 6, 35, '2021-02-01' ),
	( 10, 37, '2021-03-31' ), ( 9, 39, '2021-04-07' ), ( 7, 40, '2021-03-11' ), ( 19, 41, '2021-02-20' ),
	( 18, 42, '2021-03-22' ), ( 13, 43, '2021-04-17' ), ( 6, 44, '2021-03-22'), ( 18, 45, '2021-04-07' ),
	(  4, 46, '2021-03-08' ), ( 19, 2, '2021-03-10' ), ( 4, 3, '2021-03-02' );


INSERT INTO `APPLY`(`ID_employee`,`ID_job`,`Status`) VALUES
	( 31, 2,'Pending' ), ( 10, 1,'Accepted' ), ( 39, 2 ,'Rejected'), ( 11, 1 ,'Pending'), ( 41, 3,'Accepted' ), 
	( 18, 1,'Rejected' ), ( 8, 5,'Pending'), ( 10, 4,NULL ), ( 17, 7,'Accepted' ), 
	( 22, 15,'Rejected' ), ( 41, 6,'Pending' ), (28, 6,'Rejected' ), 
	( 34, 7,NULL ), ( 37, 8,'Rejected' ), ( 5, 1,'Pending' ), ( 39, 8,NULL ), ( 1, 9,'Pending' ),
	( 5, 9,NULL ), ( 46, 6,'Rejected' ),
	( 18, 9,'Accepted' ), ( 26, 10,'Accepted' ), ( 33, 11,NULL ), ( 32, 22,'Pending' ), 
  	( 29, 23,NULL ), ( 15, 4,'Accepted' ), ( 11, 19 ,'Pending'), ( 28, 19,NULL ), 
	( 8, 14,'Accepted' ), ( 22, 20,'Pending' ), ( 21, 22,NULL ), ( 41, 20,'Rejected' ), 
	( 17, 25,'Rejected' ), ( 41, 12,'Pending' ), ( 45, 20,NULL ), ( 46, 20,'Accepted' ), ( 45, 6,'Rejected' );


INSERT INTO `MANAGE`(`ID_job`,`ID_admin`) VALUES ( 1,1 ), ( 2,5 ), ( 3,7 ), ( 4,3 ), ( 5,1 ), ( 6,3 ), ( 7,7 ), ( 8,7 ), ( 9,10 ), ( 10,6 ), 
								  ( 11,9 ), ( 12,2 ), ( 13,4 ), ( 14,10 ), ( 15,10 ), ( 16,2 ), ( 17,6 ), ( 18,1 ), ( 19,6 ), ( 20,6 ), 
								  ( 21,5 ), ( 22,2 ), ( 23,9 ), ( 24,1 ), ( 25,6 ), ( 26,4 ), ( 27,1 ), ( 28,10 ), ( 29,6 ), ( 30,7 ), 
								  ( 31,3 ), ( 32,7 ), ( 33,3 ), ( 34,6 ), ( 35,7 ), ( 36,4 ), ( 37,5 ), ( 38,10 ), ( 39,7 ), ( 40,6 ),
								  ( 41,9 ), ( 42,7 ), ( 43,5 ), ( 44,8 ), ( 45,10 ), ( 46,1 ), ( 47,1 ), ( 48,8 ), ( 49,6 );



-- --------------------------------------------------------
--
-- Foreign Keys
--

COMMIT;

ALTER TABLE `EMPLOYEE` ADD CONSTRAINT `fk0` FOREIGN KEY (`ID_customer`) REFERENCES `CUSTOMER`(`ID_customer`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `CV` ADD CONSTRAINT `fk1` FOREIGN KEY (`ID_cv`) REFERENCES `EMPLOYEE`(`ID_cv`) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `EMPLOYER` ADD CONSTRAINT `fk2` FOREIGN KEY (`ID_customer`) REFERENCES `CUSTOMER`(`ID_customer`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `INTERVIEW` ADD CONSTRAINT `fk3` FOREIGN KEY (`ID_employer`) REFERENCES `EMPLOYER`(`ID_employer`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `INTERVIEW` ADD CONSTRAINT `fk4` FOREIGN KEY (`ID_employee`) REFERENCES `EMPLOYEE`(`ID_customer`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `REVIEW` ADD CONSTRAINT `fk5` FOREIGN KEY (`ID_employer`) REFERENCES `EMPLOYER`(`ID_employer`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `REVIEW` ADD CONSTRAINT `fk6` FOREIGN KEY (`ID_cv`) REFERENCES `CV`(`ID_cv`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `JOB` ADD CONSTRAINT `fk7` FOREIGN KEY (`ID_expertise`) REFERENCES `EXPERTISE`(`ID_expertise`) ON UPDATE CASCADE;
ALTER TABLE `EXPERT` ADD CONSTRAINT `fk8` FOREIGN KEY (`ID_employee`) REFERENCES `EMPLOYEE`(`ID_customer`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `EXPERT` ADD CONSTRAINT `fk9` FOREIGN KEY (`ID_expertise`) REFERENCES `EXPERTISE`(`ID_expertise`)  ON UPDATE CASCADE;
ALTER TABLE `GUIDE` ADD CONSTRAINT `fk10` FOREIGN KEY (`ID_employee`) REFERENCES `EMPLOYEE`(`ID_customer`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `GUIDE` ADD CONSTRAINT `fk11` FOREIGN KEY (`ID_admin`) REFERENCES `ADMIN`(`ID_admin`)  ON UPDATE CASCADE;
ALTER TABLE `MANAGE` ADD CONSTRAINT `fk12` FOREIGN KEY (`ID_admin`) REFERENCES `ADMIN`(`ID_admin`)  ON UPDATE CASCADE;
ALTER TABLE `MANAGE` ADD CONSTRAINT `fk13` FOREIGN KEY (`ID_job`) REFERENCES `JOB`(`ID_job`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `OFFER` ADD CONSTRAINT `fk14` FOREIGN KEY (`ID_employer`) REFERENCES `EMPLOYER`(`ID_employer`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `OFFER` ADD CONSTRAINT `fk15` FOREIGN KEY (`ID_job`) REFERENCES `JOB`(`ID_job`)  ON UPDATE CASCADE;
ALTER TABLE `APPLY` ADD CONSTRAINT `fk16` FOREIGN KEY (`ID_employee`) REFERENCES `EMPLOYEE`(`ID_customer`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `APPLY` ADD CONSTRAINT `fk17` FOREIGN KEY (`ID_job`) REFERENCES `JOB`(`ID_job`) ON DELETE CASCADE ON UPDATE CASCADE;