use master
go

create database BookStore
GO

use BookStore
GO

create TABLE tblProduct
(
    productID NCHAR(10) PRIMARY KEY,
    productName NVARCHAR(50) not null,
    [description] NVARCHAR(100),
    categoryID NCHAR(10)  not null,
    price int not null,
    quantity int not null,
    statusID bit not null,
    createDate date,
    [image] NVARCHAR(50),
)

create TABLE tblStatus
(
    statusID bit PRIMARY KEY,
    statusName NVARCHAR(50) not null
)


create TABLE tblCategory
(
    categoryID NCHAR(10) PRIMARY KEY,
    categoryName NVARCHAR(50) not null
)


create TABLE tblUsers
(
    userID NCHAR(10) PRIMARY KEY,
    email NVARCHAR(50) unique,
    [name] NVARCHAR(50) not null,
    [password] NVARCHAR(50) not null,
    phone NVARCHAR(15),
    [address] NVARCHAR(50),
    createDate date,
    roleID NCHAR(10) not null,
    statusID bit DEFAULT 1
)


CREATE TABLE tblRoles
(
    roleID NCHAR(10) PRIMARY KEY,
    roleName NVARCHAR(50) not null
)

create TABLE tblOrders
(
    orderID nchar(30) PRIMARY KEY,
    email NVARCHAR(50),
    userID NCHAR(10),
    name NVARCHAR(50),
    [address] NVARCHAR(50),
    phone NVARCHAR(15),
    totalMoney int,
    orderDate date,
    statusID bit,
    paymentStatus NVARCHAR(20)
)


create TABLE tblOrderDetail
(
    orderDetailID int IDENTITY PRIMARY KEY,
    orderID nchar(30) not null,
    productID NCHAR(10) not null,
    quantity int not null,
    price int not null,
    statusID bit not null
)
go

ALTER TABLE tblProduct ADD CONSTRAINT fk_tblProduct_statusID FOREIGN KEY (statusID) REFERENCES tblStatus(statusID)
ALTER TABLE tblProduct ADD CONSTRAINT fk_tblProduct_categoryID FOREIGN KEY (categoryID) REFERENCES tblCategory(categoryID)
ALTER TABLE tblUsers ADD CONSTRAINT fk_tblUsers_roleID FOREIGN KEY (roleID) REFERENCES tblRoles(roleID)
ALTER TABLE tblUsers ADD CONSTRAINT fk_tblUsers_statusID FOREIGN KEY (statusID) REFERENCES tblStatus(statusID)
ALTER TABLE tblOrders ADD CONSTRAINT fk_tblOrders_userID FOREIGN KEY (userID) REFERENCES tblUsers(userID)
ALTER TABLE tblOrders ADD CONSTRAINT fk_tblOrders_statusID FOREIGN KEY (statusID) REFERENCES tblStatus(statusID)
ALTER TABLE tblOrderDetail ADD CONSTRAINT fk_tblOrderDetail_orderID FOREIGN KEY (orderID) REFERENCES tblOrders(orderID)
ALTER TABLE tblOrderDetail ADD CONSTRAINT fk_tblOrderDetail_productID FOREIGN KEY (productID) REFERENCES tblProduct(productID)



INSERT into tblRoles VALUES('AD', 'admin')
GO
INSERT into tblRoles VALUES('US', 'user')
GO
INSERT into tblStatus VALUES(1, 'active')
GO
INSERT into tblStatus VALUES(0, 'deleted')
GO
insert into tblUsers (userID, email, name, [password], createDate, roleID) VALUES
('admin', 'admin@dtbookstore.com', 'Admin','1','20210708','AD')
GO
insert into tblUsers (userID, email, name, [password], createDate, roleID) VALUES
('duy', 'duy@dtbookstore.com', 'Duy','1','20210708','US')
GO

INSERT into tblCategory VALUES('KN', N'K?? n??ng')
INSERT into tblCategory VALUES('KT', N'Kinh t???')
INSERT into tblCategory VALUES('NN', N'Ngo???i ng???')
INSERT into tblCategory VALUES('VH', N'V??n h???c')
GO


INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('1', N'Ki???p N??o Ta C??ng T??m Th???y Nhau', 'VH', 56000, 20, 1, '20210709', N'img/book-image/Kiep-Nao-Ta-Cung-Tim-Thay-Nhau.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('2', N'Nh?? Gi??? Kim', 'VH', 68000, 20, 1, '20210709', N'img/book-image/nha-gia-kim.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('3', N'Nh?? L??nh ?????o Kh??ng Ch???c Danh', 'KT', 42900, 20, 1, '20210709', N'img/book-image/nha-lanh-dao-khong-chuc-danh.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('4', N'T??m L?? H???c V??? Ti???n', 'KT', 107000, 20, 1, '20210709', N'img/book-image/tam_ly_hoc_ve_tien.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('5', N'T??? H???c 2000 T??? V???ng Ti???ng Anh Theo Ch??? ?????', 'NN', 46200, 20, 1, '20210709', N'img/book-image/2000-tu-vung.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('6', N'25 Chuy??n ????? Ng??? Ph??p Ti???ng Anh Tr???ng T??m', 'NN', 66000, 20, 1, '20210709', N'img/book-image/25-chuyen-de-ta.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('7', N'B???n ?????t Gi?? Bao Nhi??u?', 'KN', 63500, 20, 1, '20210709', N'img/book-image/ban-dat-gia-bao-nhieu.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('8', N'?????c Nh??n T??m', 'KN', 76000, 20, 1, '20210709', N'img/book-image/dac_nhan_tam.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('9', N'Kh??ng Gia ????nh', 'VH', 150000, 20, 1, '20210709', N'img/book-image/khong-gia-dinh.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('10', N'C?? Hai Con M??o Ng???i B??n C???a S???', 'VH', 47500, 20, 1, '20210709', N'img/book-image/con-meo.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('11', N'C???m Nang C???u Tr??c Ti???ng Anh', 'NN', 59600, 20, 1, '20210709', N'img/book-image/cam-nang-ta.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('12', N'30 Ch??? ????? T??? V???ng Ti???ng Anh', 'NN', 109700, 20, 1, '20210709', N'img/book-image/3-chu-de-tu-vung.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('13', N'C??u Chuy???n T??? Tr??i Tim', 'KN', 96200, 20, 1, '20210709', N'img/book-image/cau-chuyen-trai-tim.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('14', N'K??? Lu???t T??? Gi??c', 'KN', 57800, 20, 1, '20210709', N'img/book-image/ky-luat-tu-giac.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('15', N'R??n Luy???n T?? Duy Ph???n Bi???n', 'KN', 56000, 20, 1, '20210709', N'img/book-image/phan-bien.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('16', N'Kh???i Nghi???p B??n L???', 'KT', 148000, 20, 1, '20210709', N'img/book-image/khoi-nghiep-ban-le.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('17', N'?????n Starbucks Mua C?? Ph?? C???c L???n', 'KT', 83300, 20, 1, '20210709', N'img/book-image/starbucks.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('18', N'Hack N??o 1500', 'NN', 420000, 20, 1, '20210713', N'img/book-image/hack-nao.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('19', N'Qu???ng g??nh lo ??i v?? vui s???ng', 'KN', 65000, 20, 1, '20210713', N'img/book-image/quangganhlodi.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('20', N'L???i T???t Kh???i Nghi???p', 'KT', 165000, 20, 1, '20210713', N'img/book-image/loi-tat.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('21', N'????n ??ng Sao H???a ????n B?? Sao Kim', 'KN', 120000, 20, 1, '20210713', N'img/book-image/hoa-kim.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('22', N'Gi???i H???n C???a B???n Ch??? L?? Xu???t Ph??t ??i???m C???a T??i', 'KN', 53400, 20, 1, '20210713', N'img/book-image/gioi-han.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('23', N'Mindmap English Grammar', 'NN', 127000, 20, 1, '20210713', N'img/book-image/mindmap.jpg')
GO

CREATE FUNCTION [dbo].[ufn_removeMark] (@text nvarchar(max))
RETURNS nvarchar(max)
AS
BEGIN
	SET @text = LOWER(@text)
	DECLARE @textLen int = LEN(@text)
	IF @textLen > 0
	BEGIN
		DECLARE @index int = 1
		DECLARE @lPos int
		DECLARE @SIGN_CHARS nvarchar(100) = N'???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????'
		DECLARE @UNSIGN_CHARS varchar(100) = 'aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyydd'

		WHILE @index <= @textLen
		BEGIN
			SET @lPos = CHARINDEX(SUBSTRING(@text,@index,1),@SIGN_CHARS)
			IF @lPos > 0
			BEGIN
				SET @text = STUFF(@text,@index,1,SUBSTRING(@UNSIGN_CHARS,@lPos,1))
			END
			SET @index = @index + 1
		END
	END
	RETURN @text
END

