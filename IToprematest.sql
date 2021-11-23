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


create table kupac(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    komponenta int,
    gamingxracunalo int
);


alter table kupac add foreign key (komponenta) references komponenta(sifra);
alter table kupac add foreign key (gamingxracunalo) references gamingxracunalo(sifra);



