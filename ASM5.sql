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
-- cau 4
select * from DANHBA;
select Telephone from DANHBA;

-- cau 5
select * from DANHBA order by Name asc;
select Telephone from DANHBA where Name like 'Nguyen Van An';
select Name from DANHBA where Birthday like '2009-12-12';

-- cau 6
select count(Telephone) as soluongdt from DANHBA;

select * from DANHBA;
select * from DANHBA where Telephone like '123456789';

-- cau 7
update 

-- cau 8
create index IX_HoTen on DANHBA(Name);
create index IX_SoDienThoi on DANHBA(Telephone);

create view View_SoDienThoai as 
select Name,Telephone from DANHBA;

create view View_SinhNhat as
select Name,Birthday,Telephone from DANHBA;

create procedure SP_Them_DanhBa @name nvarchar(50), @address nvarchar(100), @telephone varchar(100), @birhtday date, @Id int as
insert into DANHBA(Name,Address,Telephone,Birthday,Id)
values(@name,@address,@telephone,@birhtday,@Id);

create procedure SP_Tim_DanhBa