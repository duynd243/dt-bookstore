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

INSERT into tblCategory VALUES('KN', N'Kĩ năng')
INSERT into tblCategory VALUES('KT', N'Kinh tế')
INSERT into tblCategory VALUES('NN', N'Ngoại ngữ')
INSERT into tblCategory VALUES('VH', N'Văn học')
GO


INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('1', N'Kiếp Nào Ta Cũng Tìm Thấy Nhau', 'VH', 56000, 20, 1, '20210709', N'img/book-image/Kiep-Nao-Ta-Cung-Tim-Thay-Nhau.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('2', N'Nhà Giả Kim', 'VH', 68000, 20, 1, '20210709', N'img/book-image/nha-gia-kim.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('3', N'Nhà Lãnh Đạo Không Chức Danh', 'KT', 42900, 20, 1, '20210709', N'img/book-image/nha-lanh-dao-khong-chuc-danh.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('4', N'Tâm Lý Học Về Tiền', 'KT', 107000, 20, 1, '20210709', N'img/book-image/tam_ly_hoc_ve_tien.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('5', N'Tự Học 2000 Từ Vựng Tiếng Anh Theo Chủ Đề', 'NN', 46200, 20, 1, '20210709', N'img/book-image/2000-tu-vung.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('6', N'25 Chuyên Đề Ngữ Pháp Tiếng Anh Trọng Tâm', 'NN', 66000, 20, 1, '20210709', N'img/book-image/25-chuyen-de-ta.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('7', N'Bạn Đắt Giá Bao Nhiêu?', 'KN', 63500, 20, 1, '20210709', N'img/book-image/ban-dat-gia-bao-nhieu.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('8', N'Đắc Nhân Tâm', 'KN', 76000, 20, 1, '20210709', N'img/book-image/dac_nhan_tam.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('9', N'Không Gia Đình', 'VH', 150000, 20, 1, '20210709', N'img/book-image/khong-gia-dinh.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('10', N'Có Hai Con Mèo Ngồi Bên Cửa Sổ', 'VH', 47500, 20, 1, '20210709', N'img/book-image/con-meo.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('11', N'Cẩm Nang Cấu Trúc Tiếng Anh', 'NN', 59600, 20, 1, '20210709', N'img/book-image/cam-nang-ta.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('12', N'30 Chủ Đề Từ Vựng Tiếng Anh', 'NN', 109700, 20, 1, '20210709', N'img/book-image/3-chu-de-tu-vung.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('13', N'Câu Chuyện Từ Trái Tim', 'KN', 96200, 20, 1, '20210709', N'img/book-image/cau-chuyen-trai-tim.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('14', N'Kỷ Luật Tự Giác', 'KN', 57800, 20, 1, '20210709', N'img/book-image/ky-luat-tu-giac.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('15', N'Rèn Luyện Tư Duy Phản Biện', 'KN', 56000, 20, 1, '20210709', N'img/book-image/phan-bien.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('16', N'Khởi Nghiệp Bán Lẻ', 'KT', 148000, 20, 1, '20210709', N'img/book-image/khoi-nghiep-ban-le.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('17', N'Đến Starbucks Mua Cà Phê Cốc Lớn', 'KT', 83300, 20, 1, '20210709', N'img/book-image/starbucks.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('18', N'Hack Não 1500', 'NN', 420000, 20, 1, '20210713', N'img/book-image/hack-nao.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('19', N'Quẳng gánh lo đi và vui sống', 'KN', 65000, 20, 1, '20210713', N'img/book-image/quangganhlodi.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('20', N'Lối Tắt Khởi Nghiệp', 'KT', 165000, 20, 1, '20210713', N'img/book-image/loi-tat.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('21', N'Đàn Ông Sao Hỏa Đàn Bà Sao Kim', 'KN', 120000, 20, 1, '20210713', N'img/book-image/hoa-kim.jpg')

INSERT into tblProduct (productID, productName, categoryID, price, quantity, statusID, createDate, [image]) VALUES
('22', N'Giới Hạn Của Bạn Chỉ Là Xuất Phát Điểm Của Tôi', 'KN', 53400, 20, 1, '20210713', N'img/book-image/gioi-han.jpg')

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
		DECLARE @SIGN_CHARS nvarchar(100) = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệếìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵýđð'
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

