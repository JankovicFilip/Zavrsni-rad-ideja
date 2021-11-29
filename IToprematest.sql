drop database if exists IToprematest;
create database IToprematest character set utf8;
use IToprematest;

# obrisati osoba,radnik, ostaviti kupac, promijeniti produkte u komponenta i u njoj sifra,naziv,opis,cijena i napraviti tablciu gamingxracunalo i u njoj naziv,opis,cijena 
# i povezati sa kupcem da bude da kupac moze kupiti posebno komponente ili cijeli pc slozeni

# mysql -uedunova -pedunova --default_character_set=utf8 < d:\JP25\Zavrsni-rad-ideja\IToprematest.sql
# između values i zagrada ne smije biti razmak u redovima


create table komponenta(
    sifra int not null primary key auto_increment,
    naziv varchar(100) not null,
    opis varchar(1000) not null,
    cijena decimal(18,2) not null
);

create table gamingxracunalo(
    sifra int not null primary key auto_increment,
    naziv varchar(100) not null,
    opis varchar(1000) not null,
    cijena decimal(18,2) not null
);


create table narudzba(
    sifra int not null primary key auto_increment,
    kupac int not null,
    datum_narudzbe datetime,
    datum_otpreme datetime
);

create table proizvod_narudzba(
    gamingxracunalo int,
    komponenta int,
    narudzba int not null
);

create table kupac(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50) not null,
    adresa varchar(50) not null,
    brojtelefona varchar(20) not null
);


alter table narudzba add foreign key (kupac) references kupac(sifra);
alter table proizvod_narudzba add foreign key (gamingxracunalo) references gamingxracunalo(sifra);
alter table proizvod_narudzba add foreign key (komponenta) references komponenta(sifra);
alter table proizvod_narudzba add foreign key (narudzba) references narudzba(sifra);




# 1-6 Kupci

insert into kupac (sifra,ime,prezime,email,adresa,brojtelefona) values
(null,'Petra','Perić','petrica@gmail.com','Kninska 34 31000 Osijek','+385953334445'),
(null,'Marko','Marić','markec@gmail.com','Svačičeva 12 31000 Osijek','+385994445553'),
(null,'Ivan','Ivanić','ivki22@yahoo.com','Drinska 35 31000 Osijek','+385975554443'),
(null,'Borna','Borić','Borki93@gmail.com','Radičeva 27 31000 Osijek','031333444'),
(null,'Tea','Teić','Tea322@gmail.com','Umaška 21 31000 Osijek','031123456'),
(null,'Mario','Marić','Mare54@gmail.com','Strossmayerova 38 31000 Osijek','+385957778889');



# grafičke kartice su od 1-10

insert into komponenta (sifra,naziv,opis,cijena) values
(null,'Grafička kartica XFX AMD Radeon RX 550, 2 GB GDDR5 (RX-550P2PFG5)','XFX Video Card AMD Radeon RX-550, 2GB 128bit DDR5, 1203/ 7000, PCI-E 3, DP, HDMI, DL-DVI-D, Single Fan, 1 slot',1216.96),
(null,'Grafička kartica ASUS AMD Radeon ROG-STRIX-LC-RX6900XT-T16G-GAMING, 16 GB GDDR6, vodeno hlađenje','Bus Standard PCI Express 4.0
OpenGL OpenGL®4.6
Video Memory 16GB GDDR6
Engine Clock Gaming mode : Up to 2525 MHz (Boost Clock)/ Up to 2375 MHz (Game Clock)
Stream Processors 5120
Memory Speed 16 Gbps
Memory Interface 256-bit
Resolution Digital Max Resolution 7680 x 4320',11026.43),
(null,'Grafička kartica SAPPHIRE AMD Radeon RX 6900 XT Toxic Extreme Edition Gaming, 16 GB GDDR6, AIO Liquid Cooler 360mm','Proizvođač grafičkog procesora (R)	AMD
Grafički procesor (R)	AMD Radeon RX 6900
Frekvencija grafičkog procesora VGA (R)	2250 MHz
Vrsta memorije VGA (R)	GDDR6
Kapacitet memorije VGA (R)	16 GB
Frekvencija memorije VGA (R)	16000 MHz
Sučelje VGA (R)	PCI-Express 4.0
Propusnost sabirnice (R)	256 bit
Instalation slots (R)	2.5 slota',17179.36),
(null,'Grafička kartica ASUS AMD Radeon R7240-2GD5-L, 2 GB GDDR5','Proizvođač grafičkog procesora (R)	AMD
Grafički procesor (R)	AMD Radeon R7 240
Frekvencija grafičkog procesora VGA (R)	780 MHz
Vrsta memorije VGA (R)	GDDR5
Kapacitet memorije VGA (R)	2 GB
Frekvencija memorije VGA (R)	1100 MHz
Sučelje VGA (R)	PCI-Express 3.0
Propusnost sabirnice (R)	128 bit
Instalation slots (R)	1 slot
Tip napajanja VGA (R)	1x 8-pin',748.45),
(null,'Grafička kartica SAPPHIRE AMD Radeon 550 Pulse, 2 GB GDDR5, 64-bit','Proizvođač grafičkog procesora (R)	AMD
Grafički procesor (R)	AMD Radeon RX 550
Frekvencija grafičkog procesora VGA (R)	1206 MHz
Vrsta memorije VGA (R)	GDDR5
Kapacitet memorije VGA (R)	2 GB
Frekvencija memorije VGA (R)	7000 MHz
Sučelje VGA (R)	PCI-Express 3.0
Propusnost sabirnice (R)	128 bit',1269.94),
(null,'Grafička kartica PCI-E GAINWARD GeForce RTX 3080 Phantom+, LHR, 10GB GDDR6X','Sučelje PCI-E
Radni takt GPU [MHz] 1755
Vrsta memorije GDDR6X
Radna memorija (RAM) 10 GB
Memorijsko sučelje [bit] 320
D-SUB n/a
HDMI 1
DisplayPort 3
DVI n/a
Proizvođač čipa nVidia',13999.00),
(null,'Grafička kartica PCI-E GAINWARD GeForce RTX 3070 Phantom+, LHR, 8GB GDDR6X','Sučelje: PCI-E
Radni takt GPU [MHz]: 1440
Vrsta memorije: GDDR6X
Radna memorija (RAM): 8 GB
Memorijsko sučelje [bit]: 320
D-SUB: n/a
HDMI: 1
DisplayPort: 3
DVI: n/a
Proizvođač čipa: nVidia',9399.00),
(null,'Grafička kartica ASUS nVidia GeForce PH-GTX1650-O4GD6-P, 4 GB GDDR6','Sučelje PCI-E
Radni takt GPU [MHz] 1620
Vrsta memorije GDDR6
Radna memorija (RAM) 4 GB
Memorijsko sučelje [bit] 128
D-SUB n/a
HDMI 1
DisplayPort n/a
USB-C n/a
DVI 1
Proizvođač čipa nVidia',2702.45),
(null,'Grafička kartica PCI-E ASUS GeForce RTX 3060TI OC LHR, 8GB GDDR6','Sučelje	PCI-E
Grafika model	RTX 3060TI
Proizvođač čipa	nVidia
Vrsta memorije	DDR6
Radni takt [MHz]	1860
Radna memorija [GB]	8
Memorijska sabirnica [bit]	192',7699.00),
(null,'Grafička kartica PCI-E GIGABYTE Radeon RX 6700 XT Gaming OC, 12GB GDDR6','Sučelje PCI-E
Radni takt GPU [MHz]: TBD
Vrsta memorije GDDR6
Radna memorija (RAM) 12 GB
Memorijsko sučelje [bit] 192
D-SUB n/a
HDMI 2
DisplayPort 2
DVI n/a
USB-Cn/a
Proizvođač čipa AMD',7999.00);



# procesor 11-20

insert into komponenta (sifra,naziv,opis,cijena) values
(null,'Procesor AMD Ryzen 5 5600X, 3700/4600 MHz','Proizvođač procesora (R)	AMD
Model (R)	Ryzen 5
Socket (R)	AM4
Radna frekvencija procesora (T)	3700 MHz
Broj jezgri procesora (R)	6
Broj dretvi (R)	12
Hladnjak (R)	da
Integrirana grafika (R)	ne',2479.45),
(null,'Procesor AMD Ryzen 7 3700X, 3600/4400 MHz','Proizvođač procesora (R)	AMD
Model (R)	Ryzen 7
Socket (R)	AM4
Radna frekvencija procesora (T)	3600 MHz
Broj jezgri procesora (R)	8
Broj dretvi (R)	16
TDP (T)	65 W
Hladnjak (R)	da
Integrirana grafika (R)	ne',2737.06),
(null,'Procesor AMD Ryzen 7 5800X, 3800/4700 MHz','Proizvođač procesora (R)	AMD
Model (R)	Ryzen 7
Socket (R)	AM4
Radna frekvencija procesora (T)	3800 MHz
Broj jezgri procesora (R)	8
Broj dretvi (R)	16
L2 cache (T)	4MB
L3 cache (T)	32MB
TDP (T)	105W
Hladnjak (R)	ne
Integrirana grafika (R)	ne',4099.00),
(null,'Procesor AMD Ryzen 9 5900X, 3700/4800 MHz','Proizvođač procesora (R)	AMD
Model (R)	Ryzen 9
Socket (R)	AM4
Radna frekvencija procesora (T)	3700 MHz
Broj jezgri procesora (R)	12
Broj dretvi (R)	24
Hladnjak (R)	ne
Integrirana grafika (R)	ne',4948.65),
(null,'Procesor AMD Ryzen 9 5950X, 3400/4900 MHz','Proizvođač procesora (R)	AMD
Model (R)	Ryzen 9
Socket (R)	AM4
Radna frekvencija procesora (T)	3400 MHz
Broj jezgri procesora (R)	16
Broj dretvi (R)	32
Hladnjak (R)	ne
Integrirana grafika (R)	ne',6989.84),
(null,'Procesor INTEL Core i9 12900K BOX, s. 1700, 3.2GHz','Proizvođač: Intel
Socket 1700
Procesor tip Core i9 12900K
Broj jezgri 16
Brzina: 3.2 GHz
Cache:30 MB
GPU Da
Hladnjak Ne',5414.05),
(null,'Procesor INTEL Core i9 11900KF BOX, s. 1200, 3.5GHz','Proizvođač: Intel
Socket 1200
Procesor tip Core i9 11900
Broj jezgri 8
Brzina: 2.5 GHz
Cache:16 MB
GPU Da
Hladnjak Da
',4759.05),
(null,'Procesor INTEL Core i9 10900KF BOX, s. 1200, 3.7GHz','Proizvođač: Intel
Socket 1200
Procesor tip Core i9 10900F
Broj jezgri 10
Brzina: 2.8 GHz
Cache:20 MB
GPU Ne
Hladnjak Ne',3932.05),
(null,'Procesor INTEL Core i9 11900 BOX, s. 1200, 2.5GHz','Proizvođač: Intel
Socket 1200
Procesor tip Core i9 11900KF
Broj jezgri 8
Brzina: 3.5 GHz
Cache:16 MB
GPU Ne
Hladnjak Ne',3846.05),
(null,'Procesor INTEL Core i7 12700K BOX, s. 1700, 3.6GHz','Proizvođač: Intel
Socket 1700
Procesor tip Core i7 12700K
Broj jezgri 12
Brzina: 3.6 GHz
Cache:25 MB
GPU Da
Hladnjak Ne',3799.05);



