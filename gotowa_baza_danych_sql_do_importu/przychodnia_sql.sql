----------------------------------CREATE----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*--------------------------1.ADRESY------------------------*/
create table Adresy (
    ID_adresu number,
    Ulica varchar2(48) NOT NULL,
    Nr_budynku varchar2(6) NOT NULL,
    Nr_mieszkania varchar2(4),
    Miasto varchar2(48) NOT NULL,
    Kod_pocztowy varchar2(6) NOT NULL,
    Wojewodztwo varchar2(32) NOT NULL,
    
    CONSTRAINT adres_pk PRIMARY KEY (ID_adresu)
);


/*---------------2.PPRZYCHODNIE----------------*/
create table Przychodnie (
    ID_przychodni numeric,
    Nazwa varchar2(64) NOT NULL,
    Nr_telefonu varchar2(12) NOT NULL,
    ID_adresu numeric NOT NULL,
    
    CONSTRAINT przychodnie_pk PRIMARY KEY (ID_przychodni),
    CONSTRAINT przy_adr_fk FOREIGN KEY (ID_adresu) REFERENCES Adresy(ID_adresu)
);


/*---------------3.OSOBY----------------*/
create table Osoby (
    ID_osoby numeric,
    Imie varchar2(32) NOT NULL,
    Nazwisko varchar2(32) NOT NULL,
    Plec varchar2(1) NOT NULL,
    Nr_telefonu varchar(12),
    Email varchar2(64) UNIQUE,
    PESEL varchar2(11) NOT NULL UNIQUE,
    Data_urodzenia date NOT NULL,
    ID_adresu numeric NOT NULL,
    Login varchar2(64) NOT NULL UNIQUE,
    Haslo varchar2(64) NOT NULL,
    
    CONSTRAINT CHK_osoby CHECK ((Plec='K' OR PLEC='M')),
    
    CONSTRAINT osoby_pk PRIMARY KEY (ID_osoby),
    CONSTRAINT osoby_adr_fk FOREIGN KEY (ID_adresu) REFERENCES Adresy(ID_adresu)
);


/*---------------4.PACJENCI----------------*/
create table Pacjenci (
    ID_pacjenta numeric,
    Data_rejestracji date NOT NULL,
    Ubezpieczenie varchar2(1) NOT NULL,
    ID_osoby numeric NOT NULL UNIQUE,
    
    CONSTRAINT CHK_pacjenci CHECK (Ubezpieczenie='T' OR Ubezpieczenie='N'),
    
    CONSTRAINT pacjenci_pk PRIMARY KEY (ID_pacjenta),
    CONSTRAINT pac_oso_fk FOREIGN KEY (ID_osoby) REFERENCES Osoby(ID_osoby)
);


/*---------------5.Stanowisko-----------sle-----*/
create table Stanowiska (
    ID_stanowiska numeric,
    Nazwa varchar2(32) NOT NULL,
    Opis varchar2(255) NOT NULL,
    
    CONSTRAINT Stanowiska_pk PRIMARY KEY (ID_stanowiska)
);


/*---------------6.PRACOWNICY----------------*/
create table Pracownicy (
    ID_pracownika numeric,
    Data_zatrudnienia date NOT NULL,
    Koniec_umowy date NOT NULL,
    Pensja numeric(8,2) NOT NULL,
    ID_stanowiska numeric NOT NULL,
    ID_osoby numeric NOT NULL UNIQUE,
    ID_przychodni numeric NOT NULL,
    
    CONSTRAINT CHK_pracownicy CHECK (Pensja>3000),
    
    CONSTRAINT pracownicy_pk PRIMARY KEY (ID_pracownika),
    
    CONSTRAINT pra_sta_fk FOREIGN KEY (ID_stanowiska) REFERENCES Stanowiska(ID_stanowiska),
    CONSTRAINT pra_oso_fk FOREIGN KEY (ID_osoby) REFERENCES Osoby(ID_osoby),
    CONSTRAINT pra_prz_fk FOREIGN KEY (ID_przychodni) REFERENCES Przychodnie(ID_przychodni)
);

/*---------------7.Leki----------------*/
create table Leki (
    ID_Leku numeric,
    Nazwa varchar2(32) NOT NULL UNIQUE,
    Cena numeric(8,2) NOT NULL,
    
    CONSTRAINT Leki_pk PRIMARY KEY (ID_leku)
);

/*---------------8.Recepty----------------*/
create table Recepty (
    ID_recepty numeric,
    Kod varchar2(32) NOT NULL UNIQUE,
    Erecepta varchar2(1) NOT NULL,
    Data_waznosci date NOT NULL,
    
    CONSTRAINT Recepty_pk PRIMARY KEY (ID_recepty)
);

/*---------------9.Leki_na_RECEPCIE----------------*/
create table Leki_na_recepcie (
    ID_lnr numeric,
    ID_recepty numeric not null,
    ID_leku numeric not null,
    Refundacja numeric not null,
    
    CONSTRAINT CHK_LnR CHECK ((Refundacja=0) OR (Refundacja>0 and Refundacja<100) OR (Refundacja=100)),
    
    CONSTRAINT LnR_pk PRIMARY KEY (ID_lnr),
    
    CONSTRAINT lnr_rec_fk FOREIGN KEY (ID_recepty) REFERENCES Recepty(ID_recepty),
    CONSTRAINT lnr_lek_fk FOREIGN KEY (ID_leku) REFERENCES Leki(ID_leku)
);


/*---------------10.Choroby----------------*/
create table Choroby (
    ID_choroby numeric,
    Nazwa varchar2(64) not null unique,
    Typ varchar2(16) not null,
    Opis varchar2(255),
    
    CONSTRAINT Choroba_pk PRIMARY KEY (ID_choroby)
);

/*---------------11.BADANIA----------------*/
create table Badania (
    ID_badania numeric,
    Koszt numeric(9,2),
    Opis varchar2(255),
    ID_pacjenta numeric not null,
    ID_pracownika numeric not null,
    ID_recepty numeric,
    
    CONSTRAINT badanie_pk PRIMARY KEY (ID_Badania),
    
    CONSTRAINT bad_pac_fk FOREIGN KEY (ID_pacjenta) REFERENCES pacjenci(ID_pacjenta),
    CONSTRAINT bad_pra_fk FOREIGN KEY (ID_pracownika) REFERENCES Pracownicy(ID_pracownika),
    CONSTRAINT bad_rec_fk FOREIGN KEY (ID_recepty) REFERENCES Recepty(ID_recepty)
);


/*---------------12.CHOROBY_NA_BADANIU----------------*/
create table cnb (
    ID_cnb numeric,
    ID_badania numeric not null,
    ID_choroby numeric not null,
    
    CONSTRAINT cnb_pk PRIMARY KEY (ID_cnb),
    
    constraint cnb_chor_fk FOREIGN KEY (ID_choroby) references choroby(ID_choroby),
    constraint cnb_bad_fk FOREIGN KEY (ID_badania) references Badania(ID_Badania)
);











-------------------------------------INSERTY-------------------------------------------------------------------------------------------------------------------------------------------------------
/*--------------------------1.ADRESY------------------------*/

INSERT INTO Adresy VALUES (1,'Równa','12a','32','Kielce','25-001','Świetokrzyskie');
INSERT INTO Adresy VALUES (2,'Wspólna','15','1','Kielce','25-001','Świetokrzyskie');
INSERT INTO Adresy VALUES (3,'Złota','25','11','Kielce','25-001','Świetokrzyskie');
INSERT INTO Adresy VALUES (4,'Śniadeckich','22/24','10','Kielce','25-001','Świetokrzyskie');
INSERT INTO Adresy VALUES (5,'Paderewskiego','11','48','Kielce','25-001','Świetokrzyskie');
INSERT INTO Adresy VALUES (6,'Olszewskiego','3b','12','Kielce','25-001','Świetokrzyskie');
INSERT INTO Adresy VALUES (7,'Nowaka-Jeziorańskiego','55','30','Kielce','25-001','Świetokrzyskie');
INSERT INTO Adresy VALUES (8,'Nowaka-Jeziorańskiego','55','29','Kielce','25-001','Świetokrzyskie');
INSERT INTO Adresy VALUES (9,'Grunwaldzka','5','3','Kielce','25-001','Świetokrzyskie');
INSERT INTO Adresy VALUES (10,'Jagielońska','41','8','Kielce','25-001','Świetokrzyskie');
INSERT INTO Adresy VALUES (11,'Szajnowicza-Iwanowa','13a','22','Kielce','25-001','Świetokrzyskie');
INSERT INTO Adresy VALUES (12,'Niestachów','100',NULL,'Daleszyce','26-021','Świetokrzyskie');
INSERT INTO Adresy VALUES (13,'Niestachów','188',NULL,'Daleszyce','26-021','Świetokrzyskie');
INSERT INTO Adresy VALUES (14,'Wola Jachowa','100',NULL,'Górno','26-008','Świetokrzyskie');
INSERT INTO Adresy VALUES (15,'Przemysłowa','100',NULL,'Przysucha','26-400','Mazowieckie');

/*---------------2.PPRZYCHODNIE----------------*/

INSERT INTO Przychodnie VALUES (1,'Przychodnia Ratmedik w Kielcach nr.1','681793455',5);
INSERT INTO Przychodnie VALUES (2,'Przychodnia Ratmedik w Niestachowie','681793456',13);
INSERT INTO Przychodnie VALUES (3,'SOR Ratmedik','681793998',9);


/*---------------3.OSOBY----------------*/

INSERT INTO Osoby VALUES (1, 'Jakub', 'Raczynski','M','888137582','jakubraczynski@gmail.com','99325489633',to_date('14/09/2000','DD/MM/YYYY'),12,'kuba','mocnehaslo');
INSERT INTO Osoby VALUES (2, 'Robert', 'Kaleta','M','245758222','robertkaleta@gmail.com','99359764821',to_date('13/12/2000','DD/MM/YYYY'),14,'robson','mocnniejszehaslo');
INSERT INTO Osoby VALUES (3, 'Bartłomiej', 'Palus','M','968247361','bartlomiejpalus@gmail.com','95637845214',to_date('21/10/2000','DD/MM/YYYY'),15,'bartek','najmocnniejszehaslo');
INSERT INTO Osoby VALUES (4, 'Krzysztof', 'Krawczyk','M','786428392','parostatek@wrejs.com','55978641385',to_date('14/12/1955','DD/MM/YYYY'),1,'krawczyk','stateknapare');
INSERT INTO Osoby VALUES (5, 'Maryla', 'Rodowicz','K','758963214','mlodaja@podajtlen.com','11015699987',to_date('02/04/1911','DD/MM/YYYY'),11,'wieczniemloda','kolorowejarmarki');
INSERT INTO Osoby VALUES (6, 'Krzysztof', 'Ibisz','M','789632541','ibisz@poltas.com','12889557487',to_date('30/07/1912','DD/MM/YYYY'),2,'ibisz','botox123');
INSERT INTO Osoby VALUES (7, 'Maria', 'Skłodowska','K','129875641','rad@rad.com','88669452473',to_date('07/11/1988','DD/MM/YYYY'),10,'maria','ur@dowana1');
INSERT INTO Osoby VALUES (8, 'Bolesław', 'Chrobry','M','976348615','kocham@drewno.com','12397684521',to_date('10/02/1954','DD/MM/YYYY'),7,'bolek','mieszko');
INSERT INTO Osoby VALUES (9, 'Kazimierz', 'Wielki','M','752465789','kocham@mury.com','76814129763',to_date('28/03/1928','DD/MM/YYYY'),8,'murbeton','piedziesiatzlotych');
INSERT INTO Osoby VALUES (10, 'Janina', 'Nowak','K','793684256','chytra@baba.com','78954128876',to_date('10/08/1992','DD/MM/YYYY'),4,'janinkack','brajanek');
INSERT INTO Osoby VALUES (11, 'Brajan', 'Nowak','M','188246875','brajanek@gmail.com','18187898788',to_date('01/09/2018','DD/MM/YYYY'),4,'brajannowak','piec100dodac');
INSERT INTO Osoby VALUES (12, 'Jessika', 'Nowak','K','188246866','dzesikan@gmail.com','18187898777',to_date('01/09/2018','DD/MM/YYYY'),4,'jlonowak','piec100dodacrazy2');
INSERT INTO Osoby VALUES (13, 'Witold', 'Kowalski','M','889768852','wk@gmail.com','79684523879',to_date('01/01/1978','DD/MM/YYYY'),6,'witek12','mariola');
INSERT INTO Osoby VALUES (14, 'Mariola', 'Kowalska','K','889768853','mk@gmail.com','78469381752',to_date('16/05/1978','DD/MM/YYYY'),5,'mariola69','witold');
INSERT INTO Osoby VALUES (15, 'Hanna', 'Mostowiak','K','789684253','hannam@carton.com','70897878652',to_date('16/09/1970','DD/MM/YYYY'),3,'hannka','mareczek');



/*---------------4.PACJENCI----------------*/

INSERT INTO pacjenci VALUES (1,(SELECT sysdate - round(dbms_random.value(10,20)) as "data" from dual),'T',1);
INSERT INTO pacjenci VALUES (2,(SELECT sysdate - round(dbms_random.value(10,20)) as "data" from dual),'T',2);
INSERT INTO pacjenci VALUES (3,(SELECT sysdate - round(dbms_random.value(10,20)) as "data" from dual),'T',3);
INSERT INTO pacjenci VALUES (4,(SELECT sysdate - round(dbms_random.value(11,15)) as "data" from dual),'T',4);
INSERT INTO pacjenci VALUES (5,(SELECT sysdate - round(dbms_random.value(11,15)) as "data" from dual),'T',5);
INSERT INTO pacjenci VALUES (6,(SELECT sysdate - round(dbms_random.value(16,18)) as "data" from dual),'T',6);
INSERT INTO pacjenci VALUES (7,(SELECT sysdate - round(dbms_random.value(1,10)) as "data" from dual),'N',7);
INSERT INTO pacjenci VALUES (8,(SELECT sysdate - round(dbms_random.value(1,10)) as "data" from dual),'T',8);
INSERT INTO pacjenci VALUES (9,(SELECT sysdate - round(dbms_random.value(1,10)) as "data" from dual),'T',9);
INSERT INTO pacjenci VALUES (10,(SELECT sysdate - round(dbms_random.value(1,10)) as "data" from dual),'T',10);
INSERT INTO pacjenci VALUES (11,(SELECT sysdate - round(dbms_random.value(1,10)) as "data" from dual),'N',11);
INSERT INTO pacjenci VALUES (12,(SELECT sysdate - round(dbms_random.value(1,10)) as "data" from dual),'T',12);
INSERT INTO pacjenci VALUES (13,(SELECT sysdate - round(dbms_random.value(1,10)) as "data" from dual),'T',13);
INSERT INTO pacjenci VALUES (14,(SELECT sysdate - round(dbms_random.value(1,10)) as "data" from dual),'N',14);
INSERT INTO pacjenci VALUES (15,(SELECT sysdate - round(dbms_random.value(1,10)) as "data" from dual),'T',15);


/*---------------5.Stanowisko----------------*/

INSERT INTO stanowiska VALUES (1, 'Pediatra', 'Lekarz zajmujący się leczeniem dzieci.');
INSERT INTO stanowiska VALUES (2, 'Pielegniarka', 'Osoba asystująca lekarzą. Wykonuje takie obowiązki jak pobranie krwi i tym podobne.');
INSERT INTO stanowiska VALUES (3, 'Chirurg', 'Lekarz który wykonuje oprecaje i zabegi na niemal wszystkich elementach ciała człowieka.');
INSERT INTO stanowiska VALUES (4, 'Dermatolog', 'Lekarz zajmujący się chorobami skóry.');
INSERT INTO stanowiska VALUES (5, 'Endokrynolog', 'Lekarz zajmujący się chorobami tarczycy.');
INSERT INTO stanowiska VALUES (6, 'Kardiolog', 'Lekarz zajmujący się chorobami serca.');
INSERT INTO stanowiska VALUES (7, 'Lekarz medycyny pracy', 'Lekarz zajmujący się podbijaniem ksiązeczki xD.');
INSERT INTO stanowiska VALUES (8, 'Neurolog', 'Lekarz zajmujący się chorobami kręgosłupa oraz układu nerwowego.');
INSERT INTO stanowiska VALUES (9, 'Okulista', 'Lekarz zajmujący się chorobami oczu.');
INSERT INTO stanowiska VALUES (10, 'Stomatolog', 'Lekarz badający uzębienie lub jego brak xD.');
INSERT INTO stanowiska VALUES (11, 'Psychiatra', 'Lekarz zajmujący się chorobami psychicznymi.');
INSERT INTO stanowiska VALUES (12, 'Laboratorant', 'Osoba badająca różne próbki które zostały zlecone przez lekarza.');
INSERT INTO stanowiska VALUES (13, 'Ginekolog', 'Osoba badająca brzuszek i to co sie w nim znajduje.');
INSERT INTO stanowiska VALUES (14, 'Dietetyk', 'Układanie diet i porady żywieniowe');
INSERT INTO stanowiska VALUES (15, 'Ortopeda', 'Lekarz zajmujący sie patologiami układu kostnego.');


/*---------------6.PRACOWNICY----------------*/

INSERT INTO pracownicy values (1, (SELECT sysdate - round(dbms_random.value(20,25)) as "data" from dual), (SELECT sysdate + round(dbms_random.value(50,100)) as "data" from dual) , 5300, 3, 1, 1);
INSERT INTO pracownicy values (2, (SELECT sysdate - round(dbms_random.value(20,25)) as "data" from dual), (SELECT sysdate + round(dbms_random.value(50,100)) as "data" from dual) , 3100, 2, 2, 2);
INSERT INTO pracownicy values (3, (SELECT sysdate - round(dbms_random.value(20,25)) as "data" from dual), (SELECT sysdate + round(dbms_random.value(50,100)) as "data" from dual) , 4500, 1, 3, 3);
INSERT INTO pracownicy values (4, (SELECT sysdate - round(dbms_random.value(20,25)) as "data" from dual), (SELECT sysdate + round(dbms_random.value(50,100)) as "data" from dual) , 5600, 6, 4, 1);
INSERT INTO pracownicy values (5, (SELECT sysdate - round(dbms_random.value(20,25)) as "data" from dual), (SELECT sysdate + round(dbms_random.value(50,100)) as "data" from dual) , 5600, 5, 5, 2);
INSERT INTO pracownicy values (6, (SELECT sysdate - round(dbms_random.value(20,25)) as "data" from dual), (SELECT sysdate + round(dbms_random.value(50,100)) as "data" from dual) , 3900, 4, 6, 3);
INSERT INTO pracownicy values (7, (SELECT sysdate - round(dbms_random.value(20,25)) as "data" from dual), (SELECT sysdate + round(dbms_random.value(50,100)) as "data" from dual) , 5800, 8, 7, 1);
INSERT INTO pracownicy values (8, (SELECT sysdate - round(dbms_random.value(20,25)) as "data" from dual), (SELECT sysdate + round(dbms_random.value(50,100)) as "data" from dual) , 4000, 7, 8, 2);
INSERT INTO pracownicy values (9, (SELECT sysdate - round(dbms_random.value(20,25)) as "data" from dual), (SELECT sysdate + round(dbms_random.value(50,100)) as "data" from dual) , 3900, 9, 9, 3);
INSERT INTO pracownicy values (10, (SELECT sysdate - round(dbms_random.value(20,25)) as "data" from dual), (SELECT sysdate + round(dbms_random.value(50,100)) as "data" from dual) , 4600, 15, 10, 3);
INSERT INTO pracownicy values (11, (SELECT sysdate - round(dbms_random.value(20,25)) as "data" from dual), (SELECT sysdate + round(dbms_random.value(50,100)) as "data" from dual) , 6000, 13, 11, 1);
INSERT INTO pracownicy values (12, (SELECT sysdate - round(dbms_random.value(20,25)) as "data" from dual), (SELECT sysdate + round(dbms_random.value(50,100)) as "data" from dual) , 3300, 12, 12, 2);
INSERT INTO pracownicy values (13, (SELECT sysdate - round(dbms_random.value(20,25)) as "data" from dual), (SELECT sysdate + round(dbms_random.value(50,100)) as "data" from dual) , 4900, 10, 15, 3);


/*---------------7.Leki----------------*/

INSERT INTO leki values (1, 'Rutinoscorbin', 10.59);
INSERT INTO leki values (2, 'Ascorlamid', 20.99);
INSERT INTO leki values (3, 'Witamina C 1000', 15.99);
INSERT INTO leki values (4, 'BabyBoom', 9.99);
INSERT INTO leki values (5, 'Vigantoletten 1000', 20.99);
INSERT INTO leki values (6, 'Ketonal', 25.89);
INSERT INTO leki values (7, 'Theraflu', 18.99);
INSERT INTO leki values (8, 'Amol', 32.99);
INSERT INTO leki values (9, 'Apap', 21.99);
INSERT INTO leki values (10, 'Multilac', 18.59);
INSERT INTO leki values (11, 'Xylometazolin', 7.99);
INSERT INTO leki values (12, 'Otrivin', 20.49);
INSERT INTO leki values (13, 'Nasic', 16.49);
INSERT INTO leki values (14, 'Allegra', 11.59);
INSERT INTO leki values (15, 'Sudafet', 17.89);


/*---------------8.Recepty----------------*/

INSERT INTO recepty values (1, 'fawe23tser4w3dsafg4q', 'N', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));
INSERT INTO recepty values (2, 'gshyku75232341rdfa32', 'T', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));
INSERT INTO recepty values (3, 'gasfcqw343wasfceas3r', 'N', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));
INSERT INTO recepty values (4, '4gfdh6usdf3asdfg342g', 'N', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));
INSERT INTO recepty values (5, 'asd3fzve3qwdzfzdfwe2', 'N', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));
INSERT INTO recepty values (6, 'gsdf3qwdasdzwd2qad3a', 'N', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));
INSERT INTO recepty values (7, 'fawed2qgsdf3f54fsdfe', 'T', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));
INSERT INTO recepty values (8, 'fbw4aw43rvw3avefaw3r', 'N', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));
INSERT INTO recepty values (9, 'vaw3rvdefaw3rvvadefr', 'N', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));
INSERT INTO recepty values (10, 'vaw3rvasefzawrwarfwa', 'T', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));
INSERT INTO recepty values (11, 'avw3rvasdfwrfwefawvr', 'T', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));
INSERT INTO recepty values (12, 'tvuyd5tvawerffsafwdf', 'T', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));
INSERT INTO recepty values (13, 'asdfvawervwsdfgrvhdn', 'T', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));
INSERT INTO recepty values (14, 'vaw23ts5ytvse4va32r2', 'T', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));
INSERT INTO recepty values (15, '123rsafwr23revsdrt3w', 'N', (SELECT sysdate + round(dbms_random.value(30,60)) as "data" from dual));



/*---------------9.Leki_na_RECEPCIE----------------*/

INSERT INTO leki_na_recepcie values (1, 1,1,25);
INSERT INTO leki_na_recepcie values (2, 1,3,25);
INSERT INTO leki_na_recepcie values (3, 2,5,90);
INSERT INTO leki_na_recepcie values (4, 3,4,0);
INSERT INTO leki_na_recepcie values (5, 4,8,0);
INSERT INTO leki_na_recepcie values (6, 4,2,0);
INSERT INTO leki_na_recepcie values (7, 5,3,100);
INSERT INTO leki_na_recepcie values (8, 5,5,50);
INSERT INTO leki_na_recepcie values (9, 7,11,80);
INSERT INTO leki_na_recepcie values (10, 9,15,0);
INSERT INTO leki_na_recepcie values (11, 12,1,0);
INSERT INTO leki_na_recepcie values (12, 12,15,25);
INSERT INTO leki_na_recepcie values (13, 14,2,20);
INSERT INTO leki_na_recepcie values (14, 15,4,100);
INSERT INTO leki_na_recepcie values (15, 15,8,0);


/*---------------10.Choroby----------------*/

Insert into choroby values (1,'Przeziebienie', 'Wirusowa', 'kaszel, katar');
Insert into choroby values (2,'Grypa', 'Wirusowa', 'Gorączka, kaszel, złe samopoczucie, ból mięśniowo-szkieletowy');
Insert into choroby values (3,'Covid-19', 'Wirusowa', 'Gorączka, kaszel, katar, brak wechu i smaku');
Insert into choroby values (4,'Ospa wietrzna', 'Wirusowa', 'krosty na całym ciele');
Insert into choroby values (5,'Świnka', 'Wirusowa', 'Powiekszenie slinianek przyusznych');
Insert into choroby values (6,'Różyczka', 'Wirusowa', 'Wysypka, powiekszenie wezlów chłonnych');
Insert into choroby values (7,'Cukrzyca', 'Metaboliczna', 'Nietolerancja cukru');
Insert into choroby values (8,'Zapalenie płuc', 'Wirusowa', 'Infekcja płuc');
Insert into choroby values (9,'Arytmia', 'Zaburzenia', 'Nie regularne bicie serca');
Insert into choroby values (10,'Nadczynność tarczycy', 'Metaboliczna', 'Ciagłe zapalenie tarczycy');
Insert into choroby values (11,'Zapalenie ucha', 'Bakteryjne', 'Silny ból ucha');
Insert into choroby values (12,'Zapalenie zatok', 'Bakteryjna', 'Silny katar i ucisk w zatokach');
Insert into choroby values (13,'Złamana kończyna', 'Uraz', 'Złamanie kończyny');
Insert into choroby values (14,'Kamienie nerkowe', 'Metaboliczna', 'Kolka nerwowa');
Insert into choroby values (15,'Trądzik', 'Bakteryjna', 'Krosty i ropnie na skórze');


/*---------------11.BADANIA----------------*/

INSERT INTO badania values (1,0,'Wizyta kontrolna. Kaszel i wymioty',11,3,1);
INSERT INTO badania values (2,300,'Badanie krwi',9,2,2);
INSERT INTO badania values (3,150,'Badanie krwi i moczu',8,2,3);
INSERT INTO badania values (4,200,'Echo serca',10,4,4);
INSERT INTO badania values (5,0,'Badanie wzroku',6,9,5);
INSERT INTO badania values (6,50,'Przeciecie ropnia',8,1,6);
INSERT INTO badania values (7,500,'Rezonans',5,7,7);
INSERT INTO badania values (8,25,'Badanie krwi i moczu',7,2,8);
INSERT INTO badania values (9,100,'Badanie kału',15,2,9);
INSERT INTO badania values (10,40,'Wizyta u dermatologa',14,6,10);
INSERT INTO badania values (11,89,'Wizyta kontrolna',8,3,11);
INSERT INTO badania values (12,100,'Badanie serca',9,4,12);
INSERT INTO badania values (13,0,'Badanie próbek',2,12,13);
INSERT INTO badania values (14,0,'Leczenie zebów',3,12,14);
INSERT INTO badania values (15,250,'Wyrywanie zeba nr.1',1,12,15);

/*---------------12.CHOROBY_NA_BADANIU----------------*/

insert into cnb values (1,1,5);
insert into cnb values (2,1,3);
insert into cnb values (3,3,3);
insert into cnb values (4,4,4);
insert into cnb values (5,5,3);
insert into cnb values (6,5,1);
insert into cnb values (7,7,3);
insert into cnb values (8,8,3);
insert into cnb values (9,8,5);
insert into cnb values (10,8,2);
insert into cnb values (11,11,3);
insert into cnb values (12,11,3);
insert into cnb values (13,14,6);
insert into cnb values (14,14,8);
insert into cnb values (15,15,7);









------------------------------------------------WIDOKI-----------------------------------------------------------------------------------------------------------------------------
/*---------Informacje_o_pacjentach------------*/
create or replace view informacje_o_pacjentach as 
select  
    pacjenci.id_pacjenta, 
    osoby.imie, 
    osoby.nazwisko, 
    osoby.data_urodzenia, 
    osoby.pesel, 
    osoby.plec, 
    adresy.miasto, 
    adresy.ulica, 
    adresy.nr_budynku, 
    adresy.nr_mieszkania, 
    pacjenci.data_rejestracji, 
    pacjenci.ubezpieczenie 
from 
    pacjenci, 
    osoby, 
    adresy 
where 
    pacjenci.id_osoby=osoby.id_osoby and 
    osoby.id_adresu = adresy.id_adresu 
order by 
    id_pacjenta 
    asc;



/*---------Informacje_o_pracownikach------------*/
create or replace view informacje_o_pracownikach as
select 
    pracownicy.id_pracownika,
    osoby.imie,
    osoby.nazwisko,
    osoby.data_urodzenia,
    osoby.pesel,
    osoby.plec,
    adresy.miasto,
    adresy.ulica,
    adresy.nr_budynku,
    adresy.nr_mieszkania,
    pracownicy.data_zatrudnienia,
    pracownicy.koniec_umowy,
    (select pracownicy.koniec_umowy-pracownicy.data_zatrudnienia from dual) as przepracowane_dni,
    pracownicy.pensja,
    stanowiska.nazwa as stanowisko,
    przychodnie.nazwa as przychodnia
    
from
    pracownicy,
    osoby,
    adresy,
    stanowiska,
    przychodnie
where
    pracownicy.id_osoby=osoby.id_osoby and 
    osoby.id_adresu=adresy.id_adresu and
    pracownicy.id_stanowiska=stanowiska.id_stanowiska and
    przychodnie.id_przychodni=pracownicy.id_przychodni
order by
    id_Pracownika
    asc;
    

/*---------------------------------------------Liczenie kosztów------------------------------------*/
create or replace view dochod_z_badan as
    select count(id_badania)as ilosc_badan, sum(koszt) as suma from badania; 
    

/*---------------------------------------------Wystawione_leki------------------------------------*/
create or replace view wypisane_leki as
    select badania.id_badania,osoby.pesel, recepty.kod, leki.nazwa, leki_na_recepcie.refundacja
    from badania,recepty,leki,leki_na_recepcie,osoby,pacjenci
    where badania.id_recepty=recepty.id_recepty and recepty.id_recepty=leki_na_recepcie.id_recepty and leki_na_recepcie.id_leku=leki.id_leku and osoby.id_osoby=pacjenci.id_osoby and pacjenci.id_pacjenta=badania.id_pacjenta
    order by badania.id_badania asc;
    


/*---------------------------------------------Historia_chorob------------------------------------*/
create or replace view choroby_pacjentow as
select badania.id_badania, pacjenci.id_pacjenta, osoby.imie, osoby.nazwisko, osoby.pesel, choroby.nazwa, choroby.typ, choroby.opis 
from osoby,pacjenci,badania,cnb,choroby
where osoby.id_osoby=pacjenci.id_osoby and pacjenci.id_pacjenta=badania.id_pacjenta and badania.id_badania=cnb.id_badania and cnb.id_choroby=choroby.id_choroby
order by badania.id_badania asc;



/*---------------------------------------------Lista_covid------------------------------------*/
create or replace view lista_covid as
select badania.id_badania, pacjenci.id_pacjenta, osoby.imie, osoby.nazwisko, osoby.pesel, choroby.nazwa, adresy.miasto, adresy.ulica, adresy.nr_budynku, adresy.nr_mieszkania
from osoby,pacjenci,badania,cnb,choroby,adresy
where osoby.id_osoby=pacjenci.id_osoby and pacjenci.id_pacjenta=badania.id_pacjenta and badania.id_badania=cnb.id_badania and cnb.id_choroby=choroby.id_choroby and osoby.id_adresu=adresy.id_adresu and choroby.nazwa='Covid-19'
order by badania.id_badania asc;

-----------------------------------------------WIDOKI_DO_WYZWALACZY-------------------------------

create or replace view osoba_widok 
as select imie,nazwisko,plec,nr_telefonu,email,pesel,data_urodzenia,id_adresu,login,haslo from osoby;

create or replace view leki_widok
as select nazwa,cena from leki;











--------------------------------------------------KURSORY------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------PODWYZKA----------------
CREATE OR REPLACE PROCEDURE podwyzka (procent numeric, pracownik numeric)
IS
CURSOR cur_pod IS
	select id_pracownika,koniec_umowy,pensja from pracownicy where id_pracownika=pracownik;
    
pen numeric := 0;
tmp cur_pod%rowtype;
begin 
open cur_pod;
    Fetch cur_pod INTO tmp;
    pen := tmp.pensja;
    Update pracownicy set pracownicy.pensja=pen*((100+procent)/100) where id_pracownika=tmp.id_pracownika;
    
close cur_pod;
end;
/


-----------PREMIA---------------------

CREATE OR REPLACE PROCEDURE premia (pre numeric, pracownik numeric)
IS
CURSOR cur_pre IS
	select id_pracownika,koniec_umowy,pensja from pracownicy where id_pracownika=pracownik;
    
tmp cur_pre%rowtype;
begin 
open cur_pre;
    Fetch cur_pre INTO tmp;
    Update pracownicy set pracownicy.pensja=pracownicy.pensja+pre where id_pracownika=tmp.id_pracownika;
    
close cur_pre;
end;
/

------------PRZEDŁURZENIE---UMOWY-------------
create or replace procedure przedluzanie_umowy (dldni date, idprac numeric) is
cursor cur_pu is
    select id_pracownika,koniec_umowy from pracownicy where id_pracownika=idprac;

tmp cur_pu%rowtype;

begin 
open cur_pu;
    fetch cur_pu into tmp;
    update pracownicy set pracownicy.koniec_umowy=dldni where pracownicy.id_pracownika=tmp.id_pracownika;
close cur_pu;
end;
/

------------ZMIANA_CENY_LEKU--------------------
CREATE OR REPLACE PROCEDURE zw_cene_leku (nowacena numeric, idlek numeric)
IS
CURSOR cur_zcl IS
	select * from leki where id_leku=idlek;
    
cen numeric := 0;
tmp cur_zcl%rowtype;
begin 
open cur_zcl;
    Fetch cur_zcl INTO tmp;
    cen := tmp.cena;
    Update leki set leki.cena=nowacena where id_leku=tmp.id_leku;
close cur_zcl;
end;
/

---------------------------------------------------------------------------------------------WYZWALACZE-----------------------------------------------------------------------------------------
----------------------------DODAJ_PACJENTA-----------------------------------------
create sequence seq_lek
start with 16
increment by 1;

select * from leki_widok;

CREATE OR REPLACE TRIGGER dodaj_lek
INSTEAD OF INSERT ON leki_widok FOR EACH ROW
BEGIN
	INSERT INTO leki VALUES(seq_lek.nextval, :NEW.nazwa, :NEW.cena);
END;
/

INSERT INTO leki_widok VALUES('Gripex',10.99);


---------------------------DODAJ_OSOBE---------------------------------
create sequence seq_osoby
start with 16
increment by 1;

CREATE OR REPLACE TRIGGER dodaj_osobe 
INSTEAD OF INSERT ON osoba_widok FOR EACH ROW 
BEGIN 
	INSERT INTO osoby VALUES(seq_osoby.nextval, :NEW.Imie, :NEW.Nazwisko, :NEW.Plec, :NEW.NR_telefonu, :NEW.EMAIL, :NEW.PESEL, :NEW.DATA_URODZENIA, :NEW.ID_ADRESU, :NEW.LOGIN, :NEW.HASLO); 
END; 
/
INSERT INTO osoba_widok VALUES('Jan','Kowalski','M','423567543','jankowalski@polak.pl','12345678901',to_date('10/10/2021','DD/MM/YYYY'),5,'jan','kowalski1');

select * from osoby;
