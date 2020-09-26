create database shipper
use shipper
create table RegisterDelivery(
IdOfdelivery varchar(10) not null,
IdOfTimeDelivery varchar(10) not null,
primary key(IdOfdelivery)
)
alter table RegisterDelivery
add constraint FK2 foreign key(IdOfTimeDelivery) references timeDelivery(IdOfTimeDelivery)
go
create table memberOfRegister(
IdOfdelivery varchar(10) not null primary key,
nameMember nvarchar(100) not null,
dateOfBirth date,
gender varchar(5),
phone varchar(14),
address varchar(20),
constraint FK foreign key (IdOfdelivery) references RegisterDelivery(IdOfdelivery)
)
create table erea(
IdOfErea varchar(10) not null primary key,
nameOfErea varchar(30),
)
create table customer(
IdCustomer varchar(10) not null primary key,
IdOfErea varchar(10),
nameItems varchar(50),
phoneNumber varchar(15),
email varchar(20),
address nvarchar(30)
constraint FK1 foreign key(IdOfErea) references erea(IdOfErea)
)
create table service(
idOfSevice varchar(10) not null primary key,
nameService varchar(20) not null
)
create table kindOfItems(
idOfItems varchar(10) not null primary key,
nameOfItems varchar(10) not null
)
create table timeDelivery(
IdOfTimeDelivery varchar(10) not null primary key,
looklike nvarchar(100)
)
create table billAndDelivery(
IdOfbill int not null primary key,
IdCustomer varchar(10) not null,
IdOfdelivery varchar(10) not null,
idOfService varchar(10) not null,
IdOfErea varchar(10) not null,
nameSalesOfMan nvarchar(50) not null,
addressOfDelivery nvarchar(100) not null,
phoneOfPerson varchar(10) not null,
IdOfTimeDelivery varchar(10) not null,
dateOfDelivery date not null,
payBy varchar(20) not null,
statusApproval varchar(20) not null,
statusCustomer varchar(20) not null
constraint FK3 foreign key(IdCustomer) references customer(IdCustomer),
constraint FK4 foreign key(IdOfDelivery) references memberOfRegister(IdOfDelivery),
constraint FK5 foreign key(IdOfErea) references erea(IdOfErea),
constraint FK6 foreign key(idOfService) references service(idOfSevice),
constraint FK7 foreign key(IdOfTimeDelivery) references timeDelivery(IdOfTimeDelivery) 
)
create table detailBill(
IdOfbill int not null,
nameItems nvarchar(100) not null,
numberItems int not null,
weightItems int not null,
idOfItems varchar(10) not null,
money int not null,
primary key(IdOfbill, nameItems),
constraint FK8 foreign key(IdOfbill) references billAndDelivery(IdOfbill),
constraint FK9 foreign key(idOfItems) references kindOfItems(idOfItems)
)
use shipper
insert into RegisterDelivery values
('P1','T1'),
('P2','T2'),
('P3','T3'),
('P4','T4'),
('P5','T5'),
('P6','T1'),
('P7','T3'),
('P8','T4'),
('P9','T5'),
('P10','T6'),
('P11','T7')

insert into timeDelivery values
('T1','only in the morning'),
('T2','before 7pm'),
('T3','after 6pm'),
('T4','before 11am'),
('T5','between 8am to 11am'),
('T6','in the evening for 7pm'),
('T7','morning'),
('T8','morning')

insert into memberOfRegister values
('P1','Nguyen Van An','1998-10-20','Nam','0905587389','Quang Ngai'),
('P2','Nguyen Van Chung','1997-11-30','Nam','0335587389','Quang Nam'),
('P3','Tran Minh Vuong','1995-09-20','Nam','0495587389','Da Nang'),
('P4','Tu Quang Khai','1978-10-20','Nam','0555587389','Thai Nguyen'),
('P5','Vuong Thai Hung','1997-10-20','Nam','0905887389','Hai Phong'),
('P6','Pham Huu Hung','1996-10-20','Nam','0903443589','Ha Noi'),
('P7','Nguyen Hung','2000-10-20','Nam','09055345223','Tp Ho Chi Minh'),
('P8','Nguyen Ngoc Trang','2001-10-20','Nu','094537389','Tp Ho Chi Minh'),
('P9','Nguyen Ngoc Tram','2002-10-20','Nam','0989087389','Hue'),
('P10','Le Viet Hung','1994-10-20','Nam','0905533289','Nghe An'),
('P11','Tu Thi Thu Uyen','2000-10-20','Nu','093457389','Quang Binh')

insert into erea values
('V1','Noi Thanh Tp Ho Chi Minh'),
('V2','Ngoai Thanh Tp Ho Chi Minh'),
('V3','lan can TP Ho Chi Minh'),
('V4','Ha Noi, Da Nang, Hue'),
('V5','Quan, Huyen cac Thanh Pho khac'),
('V6','vung sau vung sa vung hai dao'),
('V7','cac khu vuc mien nui')
/*
create table customer(
IdCustomer varchar(10) not null primary key,
IdOfErea varchar(10),
namestores varchar(50),
phoneNumber varchar(15),
email varchar(20),
address nvarchar(30)
constraint FK1 foreign key(IdOfErea) references erea(IdOfErea)
)*/
sp_rename 'customer.nameItems','nameStore','column'
insert into customer values
('C1','V1','Cua Hang 1','0905587389','le999@gmail.com','110 La Xuan Oai Tp Ho Chi Minh'),
('C2','V1','Cua Hang 1','0905123389','tung999@gmail.com','88 Hiep Phu Tp Ho Chi Minh'),
('C3','V1','Cua Hang 1','0905456389','nhi999@gmail.com','34-Thoai Ngoc Hau-Ho Chi Minh'),
('C4','V2','Cua Hang 1','0905789389','sky9@gmail.com','110 HoocMon TP Ho Chi Minh'),
('C5','V2','Cua Hang 1','0905587123','nguyen999@gmail.com','23-Nha Be-Tp Ho Chi Minh'),
('C6','V3','Cua Hang 1','0905587446','nhat999@gmail.com','48-Nguyen Tri Phuong-Dong Nai'),
('C7','V3','Cua Hang 1','0905587789','long@gmail.com','110 Nguyen Van Tri-Binh Duong'),
('C8','V4','Cua Hang 1','0911287389','le999@gmail.com','110-Dong Da-Ha Noi'),
('C9','V5','Cua Hang 1','0911387389','thai@gmail.com','110-Hung Vuong-Quang Ngai'),
('C10','V6','Cua Hang 1','0911487389','truong@gmail.com','112-Ly Son-Quang Ngai'),
('C11','V7','Cua Hang 1','0911487389','hoa@gmail.com','112-Muong Thanh-Dien Bien')
insert into kindOfItems values
('SP1','clothes'),
('SP2','book'),
('SP3','technology'),
('SP4','food'),
('SP5','medicine')

insert into service values
('SV1','Giao Hang tieu chuan'),
('SV2','Giao Hang hai gio')

use shipper
insert into billAndDelivery values
(1,'C1','P1','SV1','V1','tiki.vn','30 Hoang Van Thu','0903456012','T1','2020-01-09','chuyen khoan','not accept','not recieve'),
(2,'C1','P1','SV2','V2','shoppee.vn','30 To Ngoc Van','090345623','T2','2020-01-09','chuyen khoan','accept','not recieve'),
(3,'C2','P2','SV1','V3','lazada.vn','30 Le Van Viet','090345623','T3','2020-01-09','chuyen khoan','not accept','not recieve'),
(4,'C3','P2','SV2','V1','shopee.vn','30 To Ngoc Van','090345656','T1','2020-01-09','chuyen khoan','accept','not recieve'),
(5,'C4','P3','SV1','V2','sendo.vn','29 Le Huu Tho','090345689','T4','2020-01-09','chuyen khoan','not accept','not recieve'),
(6,'C5','P4','SV2','V4','shoppee.vn','30 To Ngoc Van','090345600','T5','2020-01-09','chuyen khoan','accept','not recieve'),
(7,'C6','P5','SV2','V5','tiki.vn','30 Hoang Van Thu','0903456002','T6','2020-01-09','chuyen khoan','not accept','not recieve'),
(8,'C7','P6','SV1','V6','tiki.vn','30 Hoang Van Thu','0903456722','T7','2020-01-09','chuyen khoan','not accept','not recieve'),
(9,'C8','P7','SV2','V7','tiki.vn','30 Hoang Van Thu','0903456124','T8','2020-01-09','chuyen khoan','accept','not recieve')
insert into detailBill values
(1,'Smart phone','1',200,'SP3',15),
(2,'Smart phone','1',200,'SP3',15),
(3,'Smart phone','1',200,'SP3',15),
(4,'Smart phone','1',200,'SP3',15),
(5,'Smart phone','1',200,'SP3',15),
(6,'Smart phone','1',200,'SP3',15),
(7,'Smart phone','1',200,'SP3',15),
(8,'Smart phone','1',200,'SP3',15),
(9,'Smart phone','1',200,'SP3',15)
/*
Cập nhật
Câu 1: Xóa những khách hàng có ID ='C1'.

Câu 2: Cập nhật những khách hàng đang thường trú ở khu vực
“110 La Xuan Oai” thành khu vực “88 Hiep Phu Tp Ho Chi Minh”.

Truy Vấn
Câu 4: Liệt kê những đơn hàng có NgayGiaoHang nằm trong năm 2017 và có khu vực giao
hàng là “V1”.

Câu 5: Liệt kê MaDonHangGiaoHang, MaThanhVienGiaoHang, TenThanhVienGiaoHang,
NgayGiaoHang, PhuongThucThanhToan của tất cả những đơn hàng có trạng thái là “accept”.
Kết quả hiển thị được sắp xếp tăng dần theo NgayGiaoHang 

Câu 6: Liệt kê những thành viên có giới tính là “Nam” và chưa từng được giao hàng lần nào.

Câu 7: Liệt kê họ tên của những khách hàng đang có trong hệ thống. Nếu họ tên trùng nhau
thì chỉ hiển thị 1 lần. Học viên cần thực hiện yêu cầu này bằng 2 cách khác nhau (mỗi cách
được tính 0.5 điểm)

Câu 8: Liệt kê MaKhachHang, TenKhachHang, DiaChiNhanHang, MaDonHangGiaoHang,
PhuongThucThanhToan, TrangThaiGiaoHang của tất cả các khách hàng đang có trong hệ
thống

Câu 9: Liệt kê những thành viên giao hàng có giới tính là “Nu” và từng giao hàng cho 10
khách hàng khác nhau ở khu vực giao hàng là “Hai Chau”

Câu 10: Liệt kê những khách hàng đã từng yêu cầu giao hàng tại khu vực “Lien Chieu” và
chưa từng được một thành viên giao hàng nào có giới tính là “Nam” nhận giao hàng*/
select * into customer1 from customer
delete from customer1 where IdCustomer = 'C1'; 
-----------------------------------------------------------------------------------------------------------------
update customer1 set address ='88 Hiep Phu Tp Ho Chi Minh' where IdCustomer ='C2';
-----------------------------------------------------------------------------------------------------------------
select * from billAndDelivery as b
where b.dateOfDelivery between '2019-03-01' and '2020-11-01'
and b.IdOfErea = 'V1'
-----------------------------------------------------------------------------------------------------------------
select b.IdOfdelivery, b.IdOfbill, m.nameMember, b.dateOfDelivery, b.payBy 
from billAndDelivery as b, memberOfRegister as m
where b.statusApproval ='accept' and b.IdOfdelivery = m.IdOfdelivery
order by b.IdOfTimeDelivery
-----------------------------------------------------------------------------------------------------------------
select m.nameMember, m.IdOfdelivery from memberOfRegister as m
where m.IdOfdelivery not in(select b.IdOfdelivery from billAndDelivery as b)
and m.gender ='Nam'
-----------------------------------------------------------------------------------------------------------------
select distinct(c.nameStore) from customer as c
-----------------------------------------------------------------------------------------------------------------
select c.IdCustomer, c.address, b.IdOfbill, b.payBy, b.statusApproval from customer as c, billAndDelivery as b
where b.IdCustomer = c.IdCustomer
-----------------------------------------------------------------------------------------------------------------
select m.nameMember,count(distinct b.IdCustomer) as numberOfDeivery from memberOfRegister as m, billAndDelivery as b
where m.IdOfdelivery = b.IdOfdelivery
group by m.nameMember
having count(distinct b.IdCustomer)>1