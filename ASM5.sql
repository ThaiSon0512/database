create table DANHBA(
	Name nvarchar(50) not null,
	Address nvarchar(100) not null,
	Telephone int,
	Birthday date not null check(Birthday < getdate()),
	Id int primary key
);
create table DIENTHOAI(
	Telephone int,
	NameId int foreign key references DANHBA(Id)
);
drop table DIENTHOAI;
drop table DANHBA;
insert into DANHBA(Name,Address,Birthday,Id)
values(N'Nguyen Van An',N'111 Nguyen Trai,Thanh Xuan,Ha Noi','1987-11-18',1);
select * from DANHBA;
insert into DIENTHOAI(Telephone)
select '987654321'
union ALL
select '09873452'
union ALL 
select '09832323'
union ALL
select '09434343';
select * from DIENTHOAI;
select DIENTHOAI.Telephone from DIENTHOAI right join DANHBA on DIENTHOAI.Telephone = DANHBA.Telephone