drop database if exists IToprematest;
create database IToprematest character set utf8;
use IToprematest;

# obrisati osoba,radnik, ostaviti kupac, promijeniti produkte u komponenta i u njoj sifra,naziv,opis,cijena i napraviti tablciu gamingxracunalo i u njoj naziv,opis,cijena 
# i povezati sa kupcem da bude da kupac moze kupiti posebno komponente ili cijeli pc slozeni

# mysql -uedunova -pedunova --default_character_set=utf8 < d:\JP25\Zavrsni-rad-ideja\IToprematest.sql
# između values i zagrada ne smije biti razmak u redovima


create table komponenta(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    opis varchar(150) not null,
    cijena decimal(18,2) not null
);

create table gamingxracunalo(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    opis varchar(200) not null,
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
(null,'Grafička kartica','Grafička kartica XFX AMD Radeon RX 550, 2 GB GDDR5 (RX-550P2PFG5)',1216.96),
(null,'Grafička kartica','Grafička kartica ASUS AMD Radeon ROG-STRIX-LC-RX6900XT-T16G-GAMING, 16 GB GDDR6, vodeno hlađenje',11026.43),
(null,'Grafička kartica','Grafička kartica SAPPHIRE AMD Radeon RX 6900 XT Toxic Extreme Edition Gaming, 16 GB GDDR6, AIO Liquid Cooler 360mm, 11308-08-20G',17179.36),
(null,'Grafička kartica','Grafička kartica ASUS AMD Radeon R7240-2GD5-L, 2 GB GDDR5',748.45),
(null,'Grafička kartica','Grafička kartica SAPPHIRE AMD Radeon 550 Pulse, 2 GB GDDR5, 64-bit (11268-21-20G)',1269.94),
(null,'Grafička kartica','Grafička kartica PCI-E GAINWARD GeForce RTX 3080 Phantom+, LHR, 10GB GDDR6X',13999.00),
(null,'Grafička kartica','Grafička kartica PCI-E GAINWARD GeForce RTX 3070 Phantom+, LHR, 8GB GDDR6X',9399.00),
(null,'Grafička kartica','Grafička kartica ASUS nVidia GeForce PH-GTX1650-O4GD6-P, 4 GB GDDR6',2702.45),
(null,'Grafička kartica','Grafička kartica PCI-E ASUS GeForce RTX 3060TI OC LHR, 8GB GDDR6',7699.00),
(null,'Grafička kartica','Grafička kartica PCI-E GIGABYTE Radeon RX 6700 XT Gaming OC, 12GB GDDR6',7999.00);




