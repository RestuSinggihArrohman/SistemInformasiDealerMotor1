		MODUL 1

C:User\user>sqlplus system
SQL*Plus: Release 11.2.0.2.0 Production on Sat Apr 11 13:51:21 2020
Copyright (c) 1982, 2014, Oracle. All rights reserved.
Enter password:

SQL> CREATE TABLESPACE restu_07046
2	datafile ‘D:\semester4 oracle\modul 1\restu_07046.dbf’
3	size 30M;

Tablespace created. 

SQL> create user restu_07046
2	IDENTIFIED BY restu
3	DEFAULT TABLESPACE restu_07046
4	QUOTA 30M ON restu_07046;
User created.
SQL> GRANT ALL PRIVILEGES TO restu_07046;
Grant succeeded.
SQL> conn restu_07046/restu;
Connected.

SQL> create table Admin_07046
2	(
3	Kode_admin		INTEGER 	not null,
4	Nama			VARCHAR2(15),
5	Password		VARCHAR2(8),
6	No_hp			NUMBER(12),
7	constraint PK_Admin primary key (Kode_admin)
8	);
Table created.

SQL> create table Pembeli_07046
2	(
3	Kode_pembeli	INTEGER	not null,
4	No_hp			NUMBER(12),
5	Nama_pembeli	VARCHAR2(15),
6	Alamat		VARCHAR2(15),
7	constraint PK_Pembeli primary key (Kode_pembeli)
8	);
Table created.

SQL> create table Motor_07046
2	(
3	Kode_motor		INTEGER	not null,
4	Type_motor		VARCHAR2(6),
5	Harga_motor	NUMBER(10),
6	Warna			VARCHAR2(6),
7	constraint PK_Motor primary key (Kode_motor)
8	);
Table created.

SQL> create table Transksijual_07046
2	(
3	Kode_jual		INTEGER 	not null,
4	Kode_admin		INTEGER,
5	Kode_pembeli	INTEGER,
6	Kode_motor		INTEGER,
7	Tanggal_beli	DATE,
8	constraint PK_Transaksijual primary key (Kode_jual)
9	);
Table created.

SQL> create table Pembayaran_07046
2	(
3	Kode_pembayaran		INTEGER	not null,
4	Kode_jual			INTEGER,
5	Harga_bayar		NUMBER(10),
6	Tanggal_pembayaran	DATE,
7	Kembalian			VARCHAR2(15),
8	constraint PK_Pembayaran primary key (Kode_pembayaran)
9	);
Table created.	

SQL> alter table Transaksijual_07046
2	add constraint FK_Kode_admin FOREIGN KEY (Kode_admin)
3	references Admin_07046(Kode_admin)
4	add constraint FK_Kode_pembeli FOREIGN KEY (Kode_pembeli)
5	references Pembeli_07046(Kode_pembeli)
6	add constraint FK_Kode_motor FOREIGN KEY (Kode_motor)
7	references Motor_07046(Kode_motor);
Table altered.

SQL> alter table Pembayaran_07046
2	add constraint FK_Kode_jual FOREIGN KEY (Kode_jual)
3	references Transaksijual_07046(Kode_jual);
Table altered.

SQL> create sequence Kode_motor
2	minvalue 1
3	maxvalue 1000
4	start with 1
5	increment by 1
6	cache 20;

Sequence created.

Sql> alter table Motor_07046 rename column Warna to Warna_07046;

Table altered. 

SQL> alter table Pembeli_07046 add constraint No_hp unique (No_hp);

Table altered.

SQL> alter table Pembeli_07046 modify(No_hp char(12));

Table altered.

			MODUL 2

SQL> insert into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (1, 'Adi', 'A1234', '123456');

1 row created.

SQL> insert into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (2, 'Ega', 'E2345', '234567');

1 row created.

SQL> insert all
  2  into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (3, 'Daffa', 'D3456', '345678')
  3  into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (4, 'Restu', 'R4567', '456789')
  4  into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (5, 'Ikae', 'I5678', '567890')
  5  select 1 from dual;

3 rows created.

SQL> insert into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (1, '85706080', 'Dio', 'Jombang');

1 row created.

SQL> insert into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (2, '85504060', 'Krisna', 'Jombang');

1 row created.

SQL> insert all
  2  into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (3, '85938485', 'Dafri', 'Jombang')
  3  into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (4, '85937989', 'Enjel', 'Jombang')
  4  into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (5, '85932322', 'Agung', 'Jombang')
  5  select 1 from dual;

3 rows created.

SQL> insert into Motor_07046
  2  (Kode_motor, Type_motor, Harga_motor, Warna) values
  3  (Kode_motor.NEXTVAL, 'Suprax', '10000000',  'Hitam');

1 row created.

SQL> insert into Motor_07046
  2  (Kode_motor, Type_motor, Harga_motor, Warna) values
  3  (Kode_motor.NEXTVAL, 'Vario', '12000000',  'Putih');

1 row created.

SQL> insert into Motor_07046
  2  (Kode_motor, Type_motor, Harga_motor, Warna) values
  3  (Kode_motor.NEXTVAL, 'Beat', '13000000',  'Merah');

1 row created.

SQL> insert into Motor_07046
  2  (Kode_motor, Type_motor, Harga_motor, Warna) values
  3  (Kode_motor.NEXTVAL, 'Klx', '20000000',  'Silver');

1 row created.

SQL> insert into Motor_07046
  2  (Kode_motor, Type_motor, Harga_motor, Warna) values
  3  (Kode_motor.NEXTVAL, 'Megapro', '22000000',  'Kuning');

1 row created.


SQL> select * from Motor_07046;

KODE_MOTOR TYPE_MOTOR      HARGA_MOTOR WARNA
---------- --------------- ----------- ---------------
         6 Suprax             10000000 Hitam
         7 Vario              12000000 Putih
         8 Beat               13000000 Merah
         9 Klx                20000000 Silver
        10 Megapro            22000000 Kuning

SQL> insert into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (1, 1, 1, 6, to_date('01/01/2020', 'dd/mm/yyyy'));

1 row created.

SQL> insert into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (2, 2, 2, 7, to_date('03/03/2020', 'dd/mm/yyyy'));

1 row created.

SQL> insert all
  2  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (3, 3, 3, 8, to_date('05/03/2020', 'dd/mm/yyyy'));
into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (3, 3, 3, 8, to_date('05/03/2020', 'dd/mm/yyyy'))
                                                                                                                                                *
ERROR at line 2:
ORA-00928: missing SELECT keyword


SQL> insert all
  2  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (3, 3, 3, 8, to_date('05/03/2020', 'dd/mm/yyyy'))
  3  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (4, 4, 4, 9, to_date('07/03/2020', 'dd/mm/yyyy'))
  4  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (5, 5, 5, 10, to_date('09/03/2020', 'dd/mm/yyyy'))
  5  select 1 from dual;

3 rows created.

SQL> insert into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (1, 1, '12000000', to_date('02/01/2020', 'dd/mm/yyyy'), '2000000');

1 row created.

SQL> insert into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (2, 2, '13000000', to_date('04/03/2020', 'dd/mm/yyyy'), '1000000');

1 row created.

SQL> insert all
  2  into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (3, 3, '15000000', to_date('06/03/2020', 'dd/mm/yyyy'), '3000000')
  3  into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (4, 4, '22000000', to_date('08/03/2020', 'dd/mm/yyyy'), '2000000')
  4  into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (5, 5, '24000000', to_date('10/03/2020', 'dd/mm/yyyy'), '2000000')
  5  select 1 from dual;

3 rows created.

SQL> select * from Motor_07046;

KODE_MOTOR TYPE_MOTOR      HARGA_MOTOR WARNA
---------- --------------- ----------- ---------------
         6 Suprax             10000000 Hitam
         7 Vario              12000000 Putih
         8 Beat               13000000 Merah
         9 Klx                20000000 Silver
        10 Megapro            22000000 Kuning

SQL> update Motor_07046 set Type_motor = 'Nmax' WHERE Kode_motor =6;

1 row updated.

SQL> update Motor_07046 set Type_motor = 'Sogun' WHERE Kode_motor =7;

1 row updated.

SQL> update Motor_07046 set Type_motor = 'Satria' WHERE Kode_motor =8;

1 row updated.

SQL> update Motor_07046 set Type_motor = 'Jupiterx' WHERE Kode_motor =9;

1 row updated.

SQL> update Motor_07046 set Type_motor = 'Vixion' WHERE Kode_motor =10;

1 row updated.

SQL> select * from Motor_07046;

KODE_MOTOR TYPE_MOTOR      HARGA_MOTOR WARNA
---------- --------------- ----------- ---------------
         6 Nmax               10000000 Hitam
         7 Sogun              12000000 Putih
         8 Satria             13000000 Merah
         9 Jupiterx           20000000 Silver
        10 Vixion             22000000 Kuning

SQL> select * from Admin_07046;

KODE_ADMIN NAMA            PASSWORD      NO_HP
---------- --------------- -------- ----------
         1 Adi             A1234        123456
         2 Ega             E2345        234567
         3 Daffa           D3456        345678
         4 Restu           R4567        456789
         5 Ikae            I5678        567890

SQL> update Admin_07046 set Nama = 'Adi1' WHERE Nama LIKE 'A%';

1 row updated.

SQL> update Admin_07046 set Nama = 'Ega2' WHERE Nama LIKE 'E%';

1 row updated.

SQL> update Admin_07046 set Nama = 'Daffa3' WHERE Nama LIKE 'D%';

1 row updated.

SQL> update Admin_07046 set Nama = 'Restu' WHERE Nama LIKE 'R%';

1 row updated.

SQL> update Admin_07046 set Nama = 'Ikae5' WHERE Nama LIKE 'I%';

1 row updated.

SQL> select * from Admin_07046;

KODE_ADMIN NAMA            PASSWORD      NO_HP
---------- --------------- -------- ----------
         1 Adi1            A1234        123456
         2 Ega2            E2345        234567
         3 Daffa3          D3456        345678
         4 Restu           R4567        456789
         5 Ikae5           I5678        567890

SQL> select * from Pembayaran_07046;

KODE_PEMBAYARAN  KODE_JUAL HARGA_BAYAR TANGGAL_P KEMBALIAN
--------------- ---------- ----------- --------- ---------------
              1          1    12000000 02-JAN-20 2000000
              2          2    13000000 04-MAR-20 1000000
              3          3    15000000 06-MAR-20 3000000
              4          4    22000000 08-MAR-20 2000000
              5          5    24000000 10-MAR-20 2000000

SQL> update Pembayaran_07046 set Kembalian = '2000000' WHERE Kode_jual = 1 OR Harga_bayar = '12000000' AND Kode_pembayaran = 1;

1 row updated.

SQL> update Pembayaran_07046 set Kembalian = '1000000' WHERE Kode_jual = 2 OR Harga_bayar = '13000000' AND Kode_pembayaran = 2;

1 row updated.

SQL> update Pembayaran_07046 set Kembalian = '3000000' WHERE Kode_jual = 3 OR Harga_bayar = '15000000' AND Kode_pembayaran = 3;

1 row updated.

SQL> update Pembayaran_07046 set Kembalian = '2000000' WHERE Kode_jual = 4 OR Harga_bayar = '22000000' AND Kode_pembayaran = 4;

1 row updated.

SQL> update Pembayaran_07046 set Kembalian = '2000000' WHERE Kode_jual = 5 OR Harga_bayar = '24000000' AND Kode_pembayaran = 5;

1 row updated.

SQL> select * from Pembayaran_07046;

KODE_PEMBAYARAN  KODE_JUAL HARGA_BAYAR TANGGAL_P KEMBALIAN
--------------- ---------- ----------- --------- ---------------
              1          1    12000000 02-JAN-20 2000000
              2          2    13000000 04-MAR-20 1000000
              3          3    15000000 06-MAR-20 3000000
              4          4    22000000 08-MAR-20 2000000
              5          5    24000000 10-MAR-20 2000000

SQL> delete from Pembayaran_07046 where Harga_bayar < 13000000 and Kode_pembayaran BETWEEN 1 AND 2;

1 row deleted.

SQL> delete from Pembayaran_07046 where Kode_pembayaran = 2 OR Harga_bayar = 13000000;

1 row deleted.

SQL> delete from Pembayaran_07046 where Kode_pembayaran < 5 AND Tanggal_pembayaran LIKE '%6%';

1 row deleted.

SQL> savepoint baru_1;

Savepoint created.

SQL> rollback to baru_1;

Rollback complete.

SQL> commit;

Commit complete.

SQL> select * from Pembeli_07046 order by Nama_pembeli desc;

KODE_PEMBELI      NO_HP NAMA_PEMBELI    ALAMAT
------------ ---------- --------------- ---------------
           2   85504060 Krisna          Jombang
           4   85937989 Enjel           Jombang
           1   85706080 Dio             Jombang
           3   85938485 Dafri           Jombang
           5   85932322 Agung           Jombang

SQL> select Nama from Admin_07046 group by Nama;

NAMA
---------------
Ikae5
Restu
Ega2
Adi1
Daffa3

SQL>


SQL> insert all
  2  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (6, 5, 5, 10, to_date ('11/4/2020', 'dd/mm/yyyy'))
  3  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (7, 4, 4, 9, to_date ('11/4/2020', 'dd/mm/yyyy'))
  4  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (8, 3, 3, 8, to_date ('11/4/2020', 'dd/mm/yyyy'))
  5  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (9, 2, 2, 9, to_date ('11/4/2020', 'dd/mm/yyyy'))
  6  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (10, 1, 1, 7, to_date ('11/4/2020', 'dd/mm/yyyy'))
  7  select 1 from dual;

5 rows created.


SQL> insert all
  2  into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (6, 6, '240000', to_date('12/4/2020', 'dd/mm/yyyy'), '2000000')
  3  into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (7, 7, '220000', to_date('12/4/2020', 'dd/mm/yyyy'), '2000000')
  4  into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (8, 8, '150000', to_date('12/4/2020', 'dd/mm/yyyy'), '3000000')
  5  into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (9, 9, '130000', to_date('12/4/2020', 'dd/mm/yyyy'), '1000000')
  6  into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (10, 10, '120000', to_date('12/4/2020', 'dd/mm/yyyy'), '2000000')
  7  select 1 from dual;

5 rows created.


			MODUL 3

SQL> desc Motor_07046;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 KODE_MOTOR                                NOT NULL NUMBER(38)
 TYPE_MOTOR                                         VARCHAR2(15)
 HARGA_MOTOR                                        NUMBER(10)
 WARNA                                              VARCHAR2(15)

SQL> select * from Admin_07046;

KODE_ADMIN NAMA            PASSWORD      NO_HP
---------- --------------- -------- ----------
         1 Adi1            A1234        123456
         2 Ega2            E2345        234567
         3 Daffa3          D3456        345678
         4 Restu           R4567        456789
         5 Ikae5           I5678        567890

SQL> insert all
  2  into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (6, 'Rina', 'R123', '678908')
  3  into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (7, 'Rini', 'Ri23', '789089')
  4  into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (8, 'Rere', 'Re23', '890890')
  5  into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (9, 'Budi', 'Bu23', '908901')
  6  into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (10, 'Bulan', 'B7823', '998901')
  7  select 1 from dual;

5 rows created.

SQL> select * from Pembeli_07046;

KODE_PEMBELI      NO_HP NAMA_PEMBELI    ALAMAT
------------ ---------- --------------- ---------------
           1   85706080 Dio             Jombang
           2   85504060 Krisna          Jombang
           3   85938485 Dafri           Jombang
           4   85937989 Enjel           Jombang
           5   85932322 Agung           Jombang

SQL> insert all
  2  into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (6, '86754653', 'Cahyo', 'Moker')
  3  into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (7, '86754611', 'Mulyo', 'Moker')
  4  into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (8, '86334611', 'Rega', 'Moker')
  5  into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (9, '86337711', 'Ema', 'Moker')
  6  into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (10, '86399711', 'Amel', 'Moker')
  7  select 1 from dual;

5 rows created.

SQL> select * from Motor_07046;

KODE_MOTOR TYPE_MOTOR      HARGA_MOTOR WARNA
---------- --------------- ----------- ---------------
         6 Nmax               10000000 Hitam
         7 Sogun              12000000 Putih
         8 Satria             13000000 Merah
         9 Jupiterx           20000000 Silver
        10 Vixion             22000000 Kuning
        11 Rc                 24000000 Maron
        12 Green              25000000 Jingga
        13 75olong            26000000 Kuning
        14 CbR150             27000000 Abu2
        15 Tiger              28000000 Hijau

10 rows selected.

SQL> insert all
  2  into Motor_07046 (Kode_motor, Type_motor, Harga_motor, Warna) values (16, 'Beat', '30000000', 'Kuning')
  3  into Motor_07046 (Kode_motor, Type_motor, Harga_motor, Warna) values (17, 'Sogun25', '31000000', 'Merah')
  4  into Motor_07046 (Kode_motor, Type_motor, Harga_motor, Warna) values (18, 'Cb', '32000000', 'Pink')
  5  into Motor_07046 (Kode_motor, Type_motor, Harga_motor, Warna) values (19, 'Jupiter25', '33000000', 'Pink')
  6  into Motor_07046 (Kode_motor, Type_motor, Harga_motor, Warna) values (20, 'Tiger160', '34000000', 'Putih')
  7  select 1 from dual;

5 rows created.

SQL> select * from Transaksijual_07046;

 KODE_JUAL KODE_ADMIN KODE_PEMBELI KODE_MOTOR TANGGAL_B
---------- ---------- ------------ ---------- ---------
         1          1            1          6 01-JAN-20
         2          2            2          7 03-MAR-20
         3          3            3          8 05-MAR-20
         4          4            4          9 07-MAR-20
         5          5            5         10 09-MAR-20
         6          5            5         10 11-APR-20
         7          4            4          9 11-APR-20
         8          3            3          8 11-APR-20
         9          2            2          9 11-APR-20
        10          1            1          7 11-APR-20

10 rows selected.



SQL> insert all
  2  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (11, 10, 10, 10, to_date('12/05/2020', 'dd/mm/yyyy'))
  3  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (12, 6, 6, 6, to_date('13/05/2020', 'dd/mm/yyyy'))
  4  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (13, 7, 7, 7, to_date('14/05/2020', 'dd/mm/yyyy'))
  5  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (14, 8, 8, 8, to_date('15/05/2020', 'dd/mm/yyyy'))
  6  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (15, 9, 9, 9, to_date('16/05/2020', 'dd/mm/yyyy'))
  7  select 1 from dual;

5 rows created.

SQL> select * from Pembayaran_07046;

KODE_PEMBAYARAN  KODE_JUAL HARGA_BAYAR TANGGAL_P KEMBALIAN
--------------- ---------- ----------- --------- ---------------
              4          4    22000000 08-MAR-20 2000000
              5          5    24000000 10-MAR-20 2000000
              6          6      240000 12-APR-20 2000000
              7          7      220000 12-APR-20 2000000
              8          8      150000 12-APR-20 3000000
              9          9      130000 12-APR-20 1000000
             10         10      120000 12-APR-20 2000000

7 rows selected.

SQL> insert all
  2  into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (11, 11, '31000000', to_date('14/05/2020', 'dd/mm/yyyy'), '1000000')
  3  into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (12, 12, '32000000', to_date('15/05/2020', 'dd/mm/yyyy'), '1000000')
  4  into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (13, 13, '33000000', to_date('16/05/2020', 'dd/mm/yyyy'), '1000000')
  5  into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (14, 14, '34000000', to_date('16/05/2020', 'dd/mm/yyyy'), '1000000')
  6  into Pembayaran_07046 (Kode_pembayaran, Kode_jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (15, 15, '35000000', to_date('18/05/2020', 'dd/mm/yyyy'), '1000000')
  7  select 1 from dual;

5 rows created.

SQL> select Kode_motor, MAX(Type_motor) AS
  2  terbanyak, MIN(Type_motor) AS terendah from Motor_07046
  3  group by Kode_motor;

KODE_MOTOR TERBANYAK       TERENDAH
---------- --------------- ---------------
         6 Nmax            Nmax
         7 Sogun           Sogun
         8 Satria          Satria
         9 Jupiterx        Jupiterx
        10 Vixion          Vixion
        11 Rc              Rc
        12 Green           Green
        13 75olong         75olong
        14 CbR150          CbR150
        15 Tiger           Tiger
        16 Beat            Beat

KODE_MOTOR TERBANYAK       TERENDAH
---------- --------------- ---------------
        17 Sogun25         Sogun25
        18 Cb              Cb
        19 Jupiter25       Jupiter25
        20 Tiger160        Tiger160

15 rows selected.





SQL> select * from Pembayaran_07046;

KODE_PEMBAYARAN  KODE_JUAL HARGA_BAYAR TANGGAL_P KEMBALIAN
--------------- ---------- ----------- --------- ---------------
             12         12    32000000 15-MAY-20 1000000
             13         13    33000000 16-MAY-20 1000000
             14         14    34000000 16-MAY-20 1000000
              4          4    22000000 08-MAR-20 2000000
              5          5    24000000 10-MAR-20 2000000
              6          6      240000 12-APR-20 2000000
              7          7      220000 12-APR-20 2000000
              8          8      150000 12-APR-20 3000000
              9          9      130000 12-APR-20 1000000
             10         10      120000 12-APR-20 2000000
             11         11    31000000 14-MAY-20 1000000

KODE_PEMBAYARAN  KODE_JUAL HARGA_BAYAR TANGGAL_P KEMBALIAN
--------------- ---------- ----------- --------- ---------------
             15         15    35000000 18-MAY-20 1000000

12 rows selected.


SQL> select Kode_motor, sum(Kode_motor) as Harga_motor from Motor_07046
  2  where Kode_motor = 9 group by Kode_motor;

KODE_MOTOR HARGA_MOTOR
---------- -----------
         9           9

SQL> select Kode_pembayaran, count(Kode_pembayaran) as Kembalian
  2  from Pembayaran_07046 where Kode_pembayaran = 5 AND Kode_jual = 5 group by  Kode_pembayaran;

KODE_PEMBAYARAN  KEMBALIAN
--------------- ----------
              5          1


SQL> select Kode_motor, sum(Harga_motor) as Harga_motor from Motor_07046
  2  where Kode_motor = 9 group by Kode_motor;

KODE_MOTOR HARGA_MOTOR
---------- -----------
         9    20000000

SQL> select avg(Harga_motor) as Ratahargamotor from Motor_07046;

RATAHARGAMOTOR
--------------
    24466666.7


SQL> select Kode_motor, (select MAX(Type_motor) from Motor_07046
  2  where Motor_07046.Kode_motor = Motor_07046.Kode_motor)
  3  as Type_motor_yg_dipilih from Motor_07046 where Kode_Motor = 9;

KODE_MOTOR TYPE_MOTOR_YG_D
---------- ---------------
         9 Vixion

SQL>
SQL> select Kode_motor, (select MIN(Harga_motor) from Motor_07046
  2  where Motor_07046.Kode_motor = Motor_07046.Kode_motor)
  3  as Harga_motor_terendah from Motor_07046 where Kode_motor = 9;

KODE_MOTOR HARGA_MOTOR_TERENDAH
---------- --------------------
         9             10000000

SQL> select Nama_pembeli, (select COUNT(*) FROM Transaksijual_07046
  2  WHERE Transaksijual_07046.Kode_pembeli = Pembeli_07046.Kode_pembeli AND Pembeli_07046.No_hp IS NOT NULL)
  3  AS jumlah_beli FROM Pembeli_07046;

NAMA_PEMBELI    JUMLAH_BELI
--------------- -----------
Dio                       2
Krisna                    2
Dafri                     2
Enjel                     2
Agung                     2
Cahyo                     1
Mulyo                     1
Rega                      1
Ema                       1
Amel                      1

10 rows selected.

SQL>
SQL> select Type_motor, (select SUM(Harga_motor)
  2  from Transaksijual_07046 WHERE Transaksijual_07046.Kode_motor = Motor_07046.Kode_motor) AS Harga_yg_dibayar
  3  from Motor_07046 where Kode_motor = 8;

TYPE_MOTOR      HARGA_YG_DIBAYAR
--------------- ----------------
Satria                  39000000

SQL>

SQL> select Warna, (select AVG(Harga_motor)
  2  from Transaksijual_07046 WHERE Transaksijual_07046.Kode_motor = Motor_07046.Kode_motor) AS Rata2_Harga_yg_dibayar
  3  from Motor_07046 where Kode_motor = 9;

WARNA           RATA2_HARGA_YG_DIBAYAR
--------------- ----------------------
Silver                        20000000

SQL>
SQL> select Nama
  2  from Admin_07046
  3  where Kode_admin < (select AVG(Kode_admin)
  4  from Admin_07046)
  5  group by Nama;

NAMA
---------------
Ikae5
Restu
Ega2
Adi1
Daffa3

SQL>
SQL> select Kode_jual, (select MAX(Harga_motor)
  2  from Motor_07046) AS Harga_motor
  3  from Transaksijual_07046 where Kode_motor = (select Kode_jual
  4  from Motor_07046 where Harga_motor = (select MAX(Harga_motor)
  5  from Motor_07046));

 KODE_JUAL HARGA_MOTOR
---------- -----------
         8    34000000
         9    34000000

SQL>
SQL> select Type_motor AS Harga_motor_terendah_tertinggi
  2  from Motor_07046 where Kode_motor = (select Kode_motor
  3  from Pembayaran_07046 where Harga_bayar = (select MAX(Harga_bayar)
  4  from Pembayaran_07046)) OR Kode_motor = (select Kode_motor
  5  from Pembayaran_07046 where Harga_bayar = (select MIN(Harga_bayar)
  6  from Pembayaran_07046));

HARGA_MOTOR_TER
---------------
Nmax
Sogun
Satria
Jupiterx
Vixion
Rc
Green
75olong
CbR150
Tiger
Beat

HARGA_MOTOR_TER
---------------
Sogun25
Cb
Jupiter25
Tiger160

15 rows selected.

SQL>


			MODUL 4

SQL> insert all
  2  into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (11, 'Doni', 'Don123', '987654')
  3  into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (12, 'Riko', 'Rik123', '987434')
  4  into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (13, 'Dodi', 'Di123', '987994')
  5  into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (14, 'Amel', 'Am123', '985647')
  6  into Admin_07046 (Kode_admin, Nama, Password, No_hp) values (15, 'Budi1', 'Bud123', '985678')
  7  select 1 from dual;

5 rows created.

SQL> insert all
  2  into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (11, '86579086', 'Rika', 'Kesamben')
  3  into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (12, '86579988', 'Rina', 'Kesamben')
  4  into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (13, '86577766', 'Rini', 'Kesamben')
  5  into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (14, '86571122', 'Ripin', 'Kesamben')
  6  into Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) values (15, '84433550', 'Coni', 'Sumobito')
  7  select 1 from dual;

5 rows created.

SQL> insert all
  2  into Motor_07046 (Kode_motor, Type_motor, Harga_motor, Warna) values (21, 'Beat125', '29000000', 'Hitam')
  3  into Motor_07046 (Kode_motor, Type_motor, Harga_motor, Warna) values (22, 'Vario125', '30000000', 'Putih')
  4  into Motor_07046 (Kode_motor, Type_motor, Harga_motor, Warna) values (23, 'Megapro160', '31000000', 'Hitam')
  5  into Motor_07046 (Kode_motor, Type_motor, Harga_motor, Warna) values (24, 'Sogun25', '32000000', 'Hitam')
  6  into Motor_07046 (Kode_motor, Type_motor, Harga_motor, Warna) values (25, 'Tiger150', '33000000', 'Silver')
  7  select 1 from dual;

5 rows created.

SQL> insert all
  2  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (16, 11, 11, 21, to_date ('17/06/2020', 'dd/mm/yyyy'))
  3  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (17, 12, 12, 22, to_date ('18/06/2020', 'dd/mm/yyyy'))
  4  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (18, 13, 13, 23, to_date ('19/06/2020', 'dd/mm/yyyy'))
  5  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (19, 14, 14, 24, to_date ('20/06/2020', 'dd/mm/yyyy'))
  6  into Transaksijual_07046 (Kode_jual, Kode_admin, Kode_pembeli, Kode_motor, Tanggal_beli) values (20, 15, 15, 25, to_date ('21/06/2020', 'dd/mm/yyyy'))
  7  select 1 from dual;

5 rows created.

SQL> insert all
  2  into Pembayaran_07046 (Kode_pembayaran, Kode_Jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (16, 16, '30000000', to_date ('18/07/2020', 'dd/mm/yyyy'), '1000000')
  3  into Pembayaran_07046 (Kode_pembayaran, Kode_Jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (17, 17, '31000000', to_date ('19/07/2020', 'dd/mm/yyyy'), '1000000')
  4  into Pembayaran_07046 (Kode_pembayaran, Kode_Jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (18, 18, '32000000', to_date ('20/07/2020', 'dd/mm/yyyy'), '1000000')
  5  into Pembayaran_07046 (Kode_pembayaran, Kode_Jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (19, 19, '33000000', to_date ('21/07/2020', 'dd/mm/yyyy'), '1000000')
  6  into Pembayaran_07046 (Kode_pembayaran, Kode_Jual, Harga_bayar, Tanggal_pembayaran, Kembalian) values (20, 20, '34000000', to_date ('22/07/2020', 'dd/mm/yyyy'), '1000000')
  7  select 1 from dual;

5 rows created.

SQL> select a.Kode_pembeli, b.Kode_jual
  2  from Pembeli_07046 a join
  3  Transaksijual_07046 b
  4  on a.Kode_pembeli = b.Kode_pembeli
  5  where rownum <=15;

KODE_PEMBELI  KODE_JUAL
------------ ----------
          11         16
          12         17
          13         18
          14         19
          15         20
           1          1
           2          2
           3          3
           4          4
           5          5
           5          6

KODE_PEMBELI  KODE_JUAL
------------ ----------
           4          7
           3          8
           2          9
           1         10

15 rows selected.

SQL> select a.Nama_pembeli, b.Tanggal_beli, c.Tanggal_pembayaran, (select COUNT(*) from Pembeli_07046) AS jumlah_seluru_pembeli
  2  from Pembeli_07046 a
  3  JOIN Transaksijual_07046 b ON a.Kode_pembeli = b.Kode_pembeli
  4  LEFT JOIN Pembayaran_07046 c ON b.Kode_jual = c.Kode_jual
  5  where rownum <=15;

NAMA_PEMBELI    TANGGAL_B TANGGAL_P JUMLAH_SELURU_PEMBELI
--------------- --------- --------- ---------------------
Rika            17-JUN-20 18-JUL-20                    15
Rina            18-JUN-20 19-JUL-20                    15
Rini            19-JUN-20 20-JUL-20                    15
Ripin           20-JUN-20 21-JUL-20                    15
Coni            21-JUN-20 22-JUL-20                    15
Cahyo           13-MAY-20 15-MAY-20                    15
Mulyo           14-MAY-20 16-MAY-20                    15
Rega            15-MAY-20 16-MAY-20                    15
Enjel           07-MAR-20 08-MAR-20                    15
Agung           09-MAR-20 10-MAR-20                    15
Agung           11-APR-20 12-APR-20                    15

NAMA_PEMBELI    TANGGAL_B TANGGAL_P JUMLAH_SELURU_PEMBELI
--------------- --------- --------- ---------------------
Enjel           11-APR-20 12-APR-20                    15
Dafri           11-APR-20 12-APR-20                    15
Krisna          11-APR-20 12-APR-20                    15
Dio             11-APR-20 12-APR-20                    15

15 rows selected.

SQL>
SQL> select a.harga_motor AS harga_motor_yg_dibeli,
  2  count (b.kode_jual) AS Kode_motor, c.kode_pembeli AS kode_pembeli_motor
  3  from motor_07046 a
  4  right join Pembayaran_07046 b
  5  on a.kode_motor = b.kode_pembayaran
  6  right join pembeli_07046 c
  7  on b.kode_pembayaran = c.kode_pembeli
  8  where not c.kode_pembeli LIKE '%5%' and not c.kode_pembeli LIKE '%1%'
  9  group by a.harga_motor, c.kode_pembeli;

HARGA_MOTOR_YG_DIBELI KODE_MOTOR KODE_PEMBELI_MOTOR
--------------------- ---------- ------------------
             10000000          1                  6
             13000000          1                  8
                               1                  4
                               0                  3
             12000000          1                  7
             20000000          1                  9
                               0                  2

7 rows selected.

SQL> CREATE VIEW list_motor
  2  AS select Kode_motor,Harga_motor, type_motor, Warna
  3  from motor_07046;

View created.

SQL> create view nama_calon_pembeli
  2  as select a.nama_pembeli, b.kode_jual
  3  from pembeli_07046 a JOIN
  4  transaksijual_07046 b
  5  on a.kode_pembeli = b.kode_jual
  6  where b.kode_jual <=10;

View created.
SQL> CREATE view tanggal_beli
  2  as select a.nama_pembeli, b.tanggal_beli, c.tanggal_pembayaran, (select COUNT(*)
  3  from pembeli_07046)
  4  as jumlah_seluru_pembeli
  5  from pembeli_07046 a JOIN transaksijual_07046 b ON a.kode_pembeli = b.kode_pembeli
  6  LEFT JOIN pembayaran_07046 c ON b.kode_jual = c.kode_jual
  7  where rownum <=15;

View created.
SQL> create view harga_motor
  2  AS select a.harga_motor AS harga_motor_yg_dibeli,
  3  count (b.kode_jual) AS Kode_motor, c.kode_pembeli AS kode_pembeli_motor
  4  from motor_07046 a
  5  right join Pembayaran_07046 b
  6  on a.kode_motor = b.kode_pembayaran
  7  right join pembeli_07046 c
  8  on b.kode_pembayaran = c.kode_pembeli
  9  where not c.kode_pembeli LIKE '%5%' and not c.kode_pembeli LIKE '%1%'
 10  group by a.harga_motor, c.kode_pembeli;

View created.


				MODUL 5

SQL> create view data_motor
  2	as SELECT a.kode_jual, b.kode_motor, b.harga_motor
  3     FROM transaksijual_07046 a
  4	JOIN motor_07046 b ON a.kode_motor = b.kode_motor
  5	WHERE b.kode_moto = b.kode_motor;

SELECT a.kode_pembayaran, a.kode_jual, a.harga_bayar, tanggal_pembayaran, kembalian,
                + "b.kode_jual,  b.kode_jual AS kode_jual_pembeli, "
                + "FROM Pembayaran_07046 a "
                + "JOIN Transaksijual_07046 b ON a.kode_pembayaran = b.kode_jual "
                + "ORDER BY kode_pembayaran ASC";