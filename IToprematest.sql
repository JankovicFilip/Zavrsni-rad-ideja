drop database if exists IToprematest;
create database IToprematest character set utf8;
use IToprematest;


# mysql -uedunova -pedunova --default_character_set=utf8 < d:\JP25\Zavrsni-rad-ideja\IToprematest.sql
# između values i zagrada ne smije biti razmak u redovima

create table shop(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    adresa varchar(50)
);

create table produkti(
    sifra int not null primary key auto_increment,
    gpu varchar(50) not null,
    gpucijena decimal(18,2) not null,
    cpu varchar(50) not null,
    cpucijena decimal(18,2) not null,
    ram varchar(50) not null,
    ramcijena decimal(18,2) not null
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50)
);

create table radnik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    shop int not null
);

create table kupac(
    sifra int not null primary key auto_increment,
    osoba int not null,
    produkti int not null
);

alter table radnik add foreign key (shop) references shop(sifra);
alter table radnik add foreign key (osoba) references osoba(sifra);

alter table kupac add foreign key (osoba) references osoba(sifra);
alter table kupac add foreign key (produkti) references produkti(sifra);





# 1-2 radnik 3-6 kupac

insert into osoba (sifra,ime,prezime) values
(null,'Mato','Matić'),
(null,'Pero','Perica'),
(null,'Iva','Ivić'),
(null,'Petra','Perić'),
(null,'Tomisliva','Tomić'),
(null,'Kruno','Krunić');

# 1

insert into shop (sifra,naziv,adresa) values
(null,'PC Osijek','Svačićeva 25');



# 1-2

insert into radnik (sifra,osoba,shop) values
(null,1,1),
(null,2,1);



# 1-4

insert into produkti (sifra,gpu,gpucijena,cpu,cpucijena,ram,ramcijena) values
(null,'Grafička Asus TUF Gaming Radeon RX6900XT OC',14299.99,'Procesor Intel Core i7-10700KF',2499.99,'RAM PC-42600 16 GB G.SKILL Trident Z Royal Elite',2944.05),
(null,'Grafička MSI AMD Radeon RX6800XT Gaming X Trio',11999.99,'Procesor AMD Ryzen 7 3700X',2399.99,'RAM PC-42600 16 GB G.SKILL Trident Z Royal Elite',274.05),
(null,'Grafička XFX AMD Radeon RX6800XT',11999.99,'Procesor Intel Core i5-11600K)',2199.99,'RAM PC-28800 32 GB G.SKILL Trident Z Neo',2564.05),
(null,'Grafička Asus AMD Radeon ROG Strix RX6700XT',9599.99,'Procesor Intel Core i5-11600KF',2099.99,'RAM PC-32000 16 GB G.SKILL Trident Z Royal Elite',2469.05);




# 1-4

insert into kupac (sifra,osoba,produkti) values
(null,3,1),
(null,4,2),
(null,5,3),
(null,6,4);

