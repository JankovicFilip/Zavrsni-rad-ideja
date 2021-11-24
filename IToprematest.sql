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
    cijena decimal(18,2) not null,
    narudzba int not null
);

create table gamingxracunalo(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    opis varchar(200) not null,
    cijena decimal(18,2) not null,
    narudzba int not null
);


create table narudzba(
    sifra int not null primary key auto_increment,
    kupac int not null,
    datum_narudzbe datetime,
    datum_otpreme datetime
);

create table proizvod_narudzba(
    gamingxracunalo int not null,
    komponenta int not null,
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







