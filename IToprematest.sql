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



# 21-30 matična ploča

insert into komponenta (sifra,naziv,opis,cijena) values
(null,'Matična ploča ASUS Maximus XII Formula, Intel Z490','Chipset Intel Z490
Socket 1200
Format ATX
Vrsta memorije DDR4
DIMM4
USB 2.0: n/a
USB 3.0: n/a
USB 3.2: 9
USB-C: 1
D-SUB n/a
DVI n/a
DisplayPort n/a
HDMI n/a
M.2 Da
U.2 n/a
LAN: 10/100/1000
Audio ROG SupremeFX 7.1 Surround Sound High Definition Audio CODEC S1220
Bluetooth Da
Wi-Fi Da',4179.05),
(null,'Matična ploča ASUS ROG MAXIMUS XIII HERO, Intel Z590','ChipsetIntel Z590
Socket1200
FormatATX
Vrsta memorijeDDR4
DIMM4
USB 2.0: 2
USB 3.0: n/a
USB 3.2: 6
USB-C: 2
D-SUBn/a
DVIn/a
DisplayPortn/a
HDMI1
M.2Da
U.2n/a
LAN: 10/100/1000
AudioDa
Bluetoothn/a
Wi-Fi Da',4179.05),
(null,'Matična ploča ASUS Maximus XII Apex, Intel Z490','Chipset Intel Z490
Socket 1200
Format ATX
Vrsta memorije DDR4
DIMM2
USB 2.0: n/a
USB 3.0: n/a
USB 3.2: 9
USB-C: 1
D-SUB n/a
DVI n/a
DisplayPort n/a
HDMI n/a
M.2 Da
U.2 n/a
LAN: 10/100/1000
Audio ROG SupremeFX 7.1-Channel High Definition Audio CODEC S1220A
Bluetooth Da
Wi-Fi Da',3989.05),
(null,'Matična ploča ROG Strix Z690-F Gaming Wi-Fi, Intel Z690','CPU: Intel Socket LGA1700 for 12th Gen Intel Core
Chipset: Intel Z690
Socket: 1700
Format: ATX
Vrsta memorije: 4 x DIMM, Max. 128GB, DDR5

USB 2.0: 4
USB 3.0: n/a
USB 3.2: 7
USB-C: 3
D-SUB: n/a
DVI: n/a
DisplayPort: 1
HDMI: 1
M.2: 4
U.2: n/a
LAN: 1

Audio: ROG SupremeFX 7.1 Surround Sound High Definition Audio CODEC ALC4080
Bluetooth: Da
Wi-Fi: Da (802.11 a/b/g/n/ac/ax)',3989.05),
(null,'Matična ploča ASUS ROG Crosshair VIII Hero WiFi, AMD X570','Chipset AMD X570
Socket AM4
Format ATX
Vrsta memorije DDR4
DIMM4
USB 2.0: n/a
USB 3.0: n/a
USB 3.2: 11
USB-C: 1
D-SUB n/a
DVI n/a
DisplayPort n/a
HDMI n/a
M.2 Da
U.2 n/a
LAN: 10/100/1000
Audio ROG SupremeFX 8-Channel High Definition Audio CODEC
Bluetooth Da
Wi-Fi Da',3837.05),
(null,'Matična ploča GIGABYTE Z590 AORUS Master WiFi, Intel Z590','ChipsetIntel Z590
Socket1200
FormatATX
Vrsta memorijeDDR4
DIMM4
USB 2.0: 2
USB 3.0: n/a
USB 3.2: 9 (Gen 1 x4 , Gen x5)
USB-C: 1
D-SUBn/a
DVIn/a
DisplayPort1
HDMIn/a
M.2Da
U.2n/a
LAN: 10/100/1000/2500
AudioDa
Bluetooth n/a
Wi-FiDa [Intel Wi-Fi 6E AX210 / IEEE 802.11ax Wi-Fi 6]',3514.05),
(null,'Matična ploča ASUS ROG STRIX Z590-E Gaming WiFi, Intel Z590','ChipsetIntel Z590
Socket1200
FormatATX
Vrsta memorijeDDR4
DIMM4
USB 2.0: 2
USB 3.0: n/a
USB 3.2: 6
USB-C: 2
D-SUBn/a
DVIn/a
DisplayPort1
HDMI1
M.2Da
U.2n/a
LAN: 10/100/1000
AudioDa
Bluetoothn/a
Wi-FiDa',3115.05),
(null,'Matična ploča ROG Strix Z690-G Gaming Wi-Fi, Intel Z690','CPU: Intel Socket LGA1700 for 12th Gen Intel Core
Chipset: Intel Z690
Socket: 1700
Format: mATX
Vrsta memorije: 4 x DIMM, Max. 128GB, DDR5

USB 2.0: 4
USB 3.0: n/a
USB 3.2: 7
USB-C: 3
D-SUB: n/a
DVI: n/a
DisplayPort: 1
HDMI: 1
M.2: 3
U.2: n/a
LAN: 1

Audio: ROG SupremeFX 7.1 Surround Sound High Definition Audio CODEC ALC4080
Bluetooth: Da
Wi-Fi: Da (802.11 a/b/g/n/ac/ax)',2944.05),
(null,'Matična ploča ASUS ROG STRIX Z590-F Gaming WiFi, Intel Z590','ChipsetIntel Z590
Socket1200
FormatATX
Vrsta memorijeDDR4
DIMM4
USB 2.0: 2
USB 3.0: n/a
USB 3.2: 6
USB-C: 2
D-SUBn/a
DVIn/a
DisplayPort1
HDMI1
M.2Da
U.2n/a
LAN: 10/100/1000
AudioDa
Bluetoothn/a
Wi-Fi Da',2849.05),
(null,'Matična ploča ASROCK Z490 Taichi, Intel Z490','Chipset Intel Z490
Socket 1200
Format ATX
Vrsta memorije DDR4
DIMM4
USB 2.0: n/a
USB 3.0: n/a
USB 3.1: 7
USB-C: 1
D-SUB n/a
DVI n/a
DisplayPort 1
HDMI 1
M.2 3
LAN: 10/100/1000
Audio Realtek ALC1200 Audio Codec
Bluetooth n/a
Wi-Fi Da',2754.05);


# 31-40 memorija


insert into komponenta (sifra,naziv,opis,cijena) values
(null,'Memorija PC-42600, 16 GB, G.SKILL Trident Z Royal Elite','Vrsta memorijeDDR4
Veličina memorije (GB)2x8GB
Brzina memorije (MHz)5333
Napon1.60V',2754.05),
(null,'Memorija PC-28800, 32 GB, G.SKILL Trident Z Neo','Vrsta memorijeDDR4
Veličina memorije (GB)2x16GB
Brzina memorije (MHz)3600
Napon1.35V',2564.05),
(null,'Memorija PC-32000, 16 GB, G.SKILL Trident Z Royal Elite','Vrsta memorijeDDR4
Veličina memorije (GB)2x8GB
Brzina memorije (MHz)4000
Napon1.55V',2469.05),
(null,'Memorija PC-32000, 16 GB, G.SKILL Trident Z Neo','Vrsta memorijeDDR4
Veličina memorije (GB)2x8GB
Brzina memorije (MHz)4000
Napon1.35V',2089.05),
(null,'Memorija PC-40500, 16 GB, G.SKILL Trident Z Royal Elite','Vrsta memorijeDDR4
Veličina memorije (GB)2x8GB
Brzina memorije (MHz)5066
Napon1.60V',1994.05),
(null,'Memorija PC-28800, 16 GB, G.SKILL Trident Z Royal Elite','Vrsta memorijeDDR4
Veličina memorije (GB)2x8GB
Brzina memorije (MHz)3600
Napon1.45V',1899.05),
(null,'Memorija PC-32000, 16 GB, G.SKILL Ripjaws V','Vrsta memorijeDDR4
Veličina memorije (GB)2x8GB
Brzina memorije (MHz)4000
Napon1.35V',1804.05),
(null,'Memorija PC4-25600, 32 GB, CRUCIAL Ballistix White','Vrsta memorije DDR4
Veličina memorije (GB) 2x16GB
Brzina memorije (MHz) 3200
Napon 1.35V',1709.05),
(null,'Memorija PC-24000, 32 GB, KINGSTON','Vrsta memorije: DDR4
Veličina memorije (GB): 2x 16GB
Brzina memorije (MHz): 3000
Napon: 1.2V',1709.05),
(null,'Memorija PC-24000, 32 GB, CORSAIR','Vrsta memorije DDR4
Veličina memorije (GB) 32GB (2x16GB kit)
Brzina memorije (MHz) 3000
CAS: 16-20-20-38
Napon 1.35V',1519.05);


# 41-50 napajanje

insert into komponenta (sifra,naziv,opis,cijena) values
(null,'Napajanje 850W, ANTEC High Current Gamer Gold Series','Tip: ATX 12V 2.4
Modularni: Potpuno modularni
Dimenzije (Š x D x V): 140 x 150 x 86 mm
Ulazni napon: 100-240 VAC ±10%
Ulazna struja: 12A-6A
Raspon ulazne frekvencije: 50Hz-60Hz
PFC: aktivni PFC (>0,9)
Snaga signala: 100-500ms
Učinkovitost: 92%
Zaštita: OCP/OVP/UVP/SCP/OPP/OTP/SIP/NLO
Izlazni kapacitet: 850W
Radna temperatura: 0~40°C
Regulator: cTUVus/TUV/CB/RCM/CE/EAC/CCC/BSMI/FCC/KR
Ventilator: 120 mm FDB ventilator
Certifikati: 80 Plus Gold
Konektor: 1 x MB 24(20+4) Pin
2 x 8(4+4) Pin EPS 12V
6 x 8(6+2) Pin PCI-E
10 x SATA
5 x Molex
1 x FDD',1139.05),
(null,'Napajanje 750W CORSAIR RM750x','Snaga [W]750
ATX standard:ATX V2,40
80+ Certifikat80+ Gold
Ventilator [mm]135
ModularnoDa

Konektori:
20+4 pin ATX:1
4 pin 12V:n/a
8 pin (4+4) 12V:2
6 pin PCIe:n/a
8 pin (6+2) PCIe:4
SATA:10
MOLEX:n/a',1091.55),
(null,'Napajanje 850W CORSAIR RM850','Snaga [W]850
ATX standard:ATX V2,40
80+ Certifikat80+ Gold
Ventilator [mm]140
ModularnoDa

Konektori:
20+4 pin ATX:1
4 pin 12V:n/a
8 pin (4+4) 12V:3
6 pin PCIe:n/a
8 pin (6+2) PCIe:4
SATA:14
MOLEX:n/a',1044.05),
(null,'Napajanje 750W, ANTEC HCG750 Gold','Snaga [W]750
ATX standard:ATX V2,4
80+ Certifikat80+ Gold
Ventilator [mm]120
ModularnoDa

Konektori:
20+4 pin ATX:1
4 pin 12V:n/a
8 pin (4+4) 12V:2
6 pin PCIe:n/a
8 pin (6+2) PCIe:4
8 pin PCIe:n/a
SATA:8
MOLEX:3
Floppy:1
',949.05),
(null,'Napajanje 650W, BE QUIET Straight Power 11','Snaga [W]650
ATX standard:ATX V2.4
80+ Certifikat80+ Gold
Ventilator [mm]135
Modularno Da
',949.05),
(null,'Napajanje 750W, MSI MPG A750GF','Naziv proizvoda MPG A750GF
Faktor oblika PSU ATX
Snaga Watt 750W
Ulazni napon 100 ~ 240 Vac
Ulazna struja max. 115Vac / 10,0A 230Vac / 5,0A maks.
Ulazna frekvencija 47Hz ~ 63Hz
Učinkovitost Do 90% (80 Plus gold)
Veličina ventilatora 140 mm
Dimenzija 150mm x160mm x86mm
PFC tip Active PFC',949.05),
(null,'Napajanje 850W, CORSAIR TX-M Series, TX850','Snaga [W]850
ATX standard:ATX V2,4
80+ Certifikat80+ Platinum
Ventilator [mm]140
ModularnoDa

Konektori:
20+4 pin ATX:1
4 pin 12V:n/a
8 pin (4+4) 12V:1
6 pin PCIe:n/a
8 pin (6+2) PCIe:4
SATA:8
MOLEX:n/a
Floppy:2',911.05),
(null,'Napajanje 550W, CORSAIR RM550x','Snaga [W]550
ATX standard:ATX V2,40
80+ Certifikat80+ Gold
Ventilator [mm]135
ModularnoDa

Konektori:
20+4 pin ATX:1
4 pin 12V:n/a
8 pin (4+4) 12V:1
6 pin PCIe:n/a
8 pin (6+2) PCIe:2
SATA:7
MOLEX:n/a',901.55),
(null,'Napajanje 650W, CORSAIR RM650x','Snaga [W]650
ATX standard:ATX V2,4
80+ Certifikat80+ Gold
Ventilator [mm]140
ModularnoDa

Konektori:
20+4 pin ATX:1
4 pin 12V:n/a
8 pin (4+4) 12V:1
6 pin PCIe:n/a
8 pin (6+2) PCIe:4
SATA:9
MOLEX:4
Floppy:1',873.05),
(null,'Napajanje 650W, MSI MPG A650GF','Naziv proizvoda MPG A650GF
Faktor oblika PSU ATX
Snaga Watt 650W
Ulazni napon 100-240Vac
Ulazna struja max. 115Vac / 10,0A 230Vac / 5,0A maks.
Ulazna frekvencija 47Hz ~ 63Hz
Učinkovitost Do 90% (80 Plus gold)
Veličina ventilatora 140 mm
Dimenzija 150mm x160mm x86mm
PFC tip Active PFC',854.05);


# ssd 51-60


insert into komponenta (sifra,naziv,opis,cijena) values
(null,'SSD 2000 GB SAMSUNG 980 PRO NVMe M.2','Sučelje M.2 (2280)
Kapacitet diska 2000GB
Brzina čitanja [MB/s] 7000
Brzina zapisivanja [MB/s] 5000
Veličina 2280
Vrsta flash memorije Samsung V-NAND 3-bit MLC',3229.05),
(null,'SSD 2000 GB SAMSUNG 870 EVO','Sučelje SATA
Kapacitet diska 2000GB
Brzina čitanja [MB/s] 560
Brzina zapisivanja [MB/s] 530
Vrsta flash memorije V-NAND MLC
',2184.05),
(null,'SSD 2000 GB SAMSUNG 970 Evo Plus NVMe M.2','Sučelje M.2
Kapacitet diska 1000GB
Brzina čitanja [MB/s] 3400
Brzina zapisivanja [MB/s] 2500
Veličina 2280
Vrsta flash memorije V-NAND MLC
',2136.55),
(null,'SSD 2048 GB KINGSTON KC600','Sučelje SATA 3
Kapacitet diska 2048GB
Brzina čitanja [MB/s] 550
Brzina zapisivanja [MB/s] 520
Veličina 2.5"
Vrsta flash memorije 3D TLC',2089.05    ),
(null,'SSD 1000 GB SAMSUNG 980 PRO NVMe M.2','Sučelje M.2 (2280)
Kapacitet diska 1000GB
Brzina čitanja [MB/s] 7000
Brzina zapisivanja [MB/s] 5000
Veličina 2280
Vrsta flash memorije Samsung V-NAND 3-bit MLC
',1519.05),
(null,'SSD 2000 GB KINGSTON NV1 SNVS/2000G, M.2/NVMe PCIe','Sučelje M.2 / NVMe PCIe Gen 3.0 x 4 Lanes
Kapacitet diska 2000GB
Brzina čitanja [MB/s] 2100
Brzina zapisivanja [MB/s] 1700
Veličina 2280
Vrsta flash memorije n/a',1462.05),
(null,'SSD 1000 GB LC POWER Phenom Pro Series','Sučelje M.2 / PCIe
Kapacitet diska 1000GB
Brzina čitanja [MB/s] 3200
Brzina zapisivanja [MB/s] 2500
Veličina 2280
Vrsta flash memorije 3D NAND TLC',1120.05),
(null,'SSD 1000 GB SAMSUNG 970 Evo Plus NVMe M.2','Sučelje PCI-E/M.2
Kapacitet diska 1000GB
Brzina čitanja [MB/s] 3500
Brzina zapisivanja [MB/s] 3300
Veličina 2280
Vrsta flash memorije V-NAND 3-bit MLC
',1072.55),
(null,'SSD 500 GB SAMSUNG 980 PRO NVMe M.2','Sučelje M.2 (2280)
Kapacitet diska 500GB
Brzina čitanja [MB/s] 6900
Brzina zapisivanja [MB/s] 5000
Veličina 2280
Vrsta flash memorije Samsung V-NAND 3-bit MLC
',968.05),
(null,'SSD 1000 GB LC POWER Phenom Series','Sučelje M.2 / PCIe
Kapacitet diska 1000GB
Brzina čitanja [MB/s] 1800
Brzina zapisivanja [MB/s] 1500
Veličina 2280
Vrsta flash memorije 3D NAND TLC
',873.05);


# 61-65 hdd

insert into komponenta (sifra,naziv,opis,cijena) values
(null,'Tvrdi disk 10000 GB SEAGATE Ironwolf Pro NAS ST','Optimizirano za NAS uz AgileArray ™. AgileArray je izrađen za balansiranje s dvije razine
i optimizaciju RAID-a u multi-bay okruženjima s najnaprednijom snagom.
Moguće upravljanje.

Sučelje: SATA 6 Gb/s
Kapacitet diska [GB]: 10000
Brzina rotacije [okr./min.]: 5900
Cache [MB]: 256
Veličina: 3.5"
Namjena: Desktop',3704.05),
(null,'Tvrdi disk TOSHIBA MG06ACA10TEY, 10000GB','Kapacitet: 10TB
Brzina: 7.200 o / min
Vrste sučelja: SATA
Faktor oblika: 3,5-inčni 1,0-inčni LFF tvrdi disk
Veličina sektora: 512 / 512e
Održana propusnost: 237
Sučelje: SATA 600 - 6,0 Gbps
Ugrađena predmemorija: 256 MB',3229.05),
(null,'Tvrdi disk 12000 GB SEAGATE Desktop Iron Wolf Guardian','Sučelje: SATA3
Kapacitet diska [GB]: 12000
Brzina rotacije [okr./min.]: 7200
Cache [MB]: 256
Veličina: 3.5´´
Namjena: Desktop/NAS',2849.05),
(null,'Tvrdi disk 10000 GB SEAGATE Ironwolf Guardian','Sučelje: SATA6
Kapacitet diska [GB]: 10000
Brzina rotacije [okr./min.]: 7200
Cache [MB]: 256
Veličina: 3.5"
Namjena: NAS',2469.05),
(null,'Tvrdi disk 8000 GB SEAGATE Desktop Skyhawk Guardian','Sučelje: SATA3
Kapacitet diska [GB]: 8000
Brzina rotacije [okr./min.]: 7200
Cache [MB]: 256
Veličina: 3.5´´
Namjena: Desktop',2374.05);



# 66-71 Kućište

insert into komponenta (sifra,naziv,opis,cijena) values
(null,'Kućište NZXT H710, E-ATX','Format: Mini-ITX/MicroATX/ATX/E-ATX
USB 2.0: 1
USB 3.0: n/a
USB 3.1: 4
USB-C:1
2.5": 7
3.5": 4
5.25'': n/a
Napajanje: n/a
Window: DA
Dimenzije [mm] 230 x 516 x 494',1281.55),
(null,'Kućište NZXT H710, E-ATX','Format: Mini-ITX/MicroATX/ATX/E-ATX
USB 2.0: n/a
USB 3.0: n/a
USB 3.1: 4
USB-C:1
2.5": 7
3.5": 4
5.25'': n/a
Napajanje: n/a
Window: DA
Dimenzije [mm] 230 x 516 x 494',1281.55),
(null,'Kućište NZXT H510i, ATX','Format: Mini ITX/Micro ATX/ATX
USB 2.0: 1
USB 3.0: n/a
USB 3.1: 3
USB-C:1
2.5": 3
3.5": 3
5.25'': n/a
Napajanje: n/a
Window: DA
Dimenzije [mm] 210 x 460 x 428',949.05),
(null,'Kućište LC POWER LC-709B-ON ','Format: MIDI
Podržavane Ploče: ATX, Micro-ATX, Mini-ITX
USB 2.0:
USB 3.0: 2
2.5": 2
3.5": 2
Napajanje: n/a
Window: Da
Dimenzije [mm] 477 x 214 x 440',616.55),
(null,'Kućište COOLERMASTER MasterBox','Format: mITX
Podržavane Ploče: Mini DTX, Mini ITX
USB 2.0: n/a
USB 3.0: 2
2.5": 2
3.5": 1
5.25'': n/a
Napajanje: n/a
Window: Da
Dimenzije [mm] 376 x 185 x 292',669.00),
(null,'Kućište CHIEFTEC BT-02B-U3-250VS, mini ITX','Format: mini ITX
USB 2.0: n/a
USB 3.0: 2
2.5": n/a
3.5": 1
5.25":1
Napajanje: 250
Window: n/a
Dimenzije [mm] 240 x 135 x 295',464.05);




# 72-76 hladnjaci

insert into komponenta (sifra,naziv,opis,cijena) values
(null,'Cooler BE QUIET Dark Rock TF 2','Socket: 1200/1150/1151/1155/2011-3/2066/AM3+/AM4
Veličina ventilatora (mm): 135
Dimenzije hladnjaka (mm): 163 x 140 x 134
Brzina ventilatora (rpm): 1400
Razina buke (dBA): 27.1v',730.55),
(null,'Cooler BE QUIET Dark Rock Pro 4','Socket: 1150/1151/1155/1156/1366/2011-3/2066/AM2+/AM3+/AM4/FM1/FM2+
Veličina ventilatora (mm): 1x120, 1x135
Dimenzije hladnjaka (mm): 123.7 x 136 x 162.8
Brzina ventilatora (rpm): 1200 / 1500
',721.05),
(null,'Cooler BE QUIET Shadow Rock 3 White','Socket: 1150/1151/1155/1200/2066/2011/AM3+/AM4/
Veličina ventilatora (mm): 120
Dimenzije hladnjaka (mm): 96 x 130 x 163
Brzina ventilatora (rpm): 1600',502.55),
(null,'Cooler ARCTIC Freezer i35 A-RGB','Socket: 1155, 1151, 1150, 1200, 1700
Veličina ventilatora (mm): 120
Dimenzije (mm): 133 x 91 x 189
Brzina ventilatora (rpm): 200 - 1700',379.05),
(null,'Cooler ARCTIC Freezer 34 eSports DUO','Socket: 1150/1151/1155/1156/2011/2011-3/2066/AM4
Veličina ventilatora (mm): 2x 120
Dimenzije (mm): 124 x 103 x 157
Brzina ventilatora (rpm): 200 - 2100
Termički spoj: Unaprijed primjenjena MX-4 termalna pasta
',360.05);
