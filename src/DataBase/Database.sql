/*
Quan trong chay toan bo lenh tao bang

*/

--DROP table NguoiDung;
--Tao bang NguoiDung
create table NguoiDung(
    ID_ND NUMBER(8,0),
    Email varchar2(50),
    Matkhau varchar2(20),
    VerifyCode varchar2(10)DEFAULT NULL,
    Trangthai varchar2(10) DEFAULT '',
    Vaitro varchar2(20)
);
---Them rang buoc
alter table NguoiDung
    add constraint ND_Email_NNULL check ('Email' is not null)
    add constraint ND_Matkhau_NNULL check ('Matkhau' is not null)
    add constraint ND_Vaitro_Ten check (Vaitro in ('Khach Hang','Nhan Vien','Nhan Vien Kho','Quan Ly'));

---Them khoa chinh
alter table NguoiDung
    add constraint NguoiDung_PK PRIMARY KEY (ID_ND);
    
--Tao bang NhanVien
--drop table NhanVien;
create table NhanVien(
    ID_NV NUMBER(8,0),
    TenNV VARCHAR2(50),
    NgayVL DATE ,
    SDT VARCHAR2(50),
    Chucvu VARCHAR2(50),
    ID_ND NUMBER(8,0) DEFAULT NULL,
    ID_NQL NUMBER(8,0),
    Tinhtrang VARCHAR2(20)
);
--Them rang buoc cho bang NhanVien
--Them Check Constraint
alter table NhanVien
    add constraint NV_TenNV_NNULL check ('TenNV' is not null)
    add constraint NV_SDT_NNULL check ('SDT' is not null)
    add constraint NV_NgayVL_NNULL check ('NgayVL' is not null)
    add constraint NV_Chucvu_Thuoc check (Chucvu IN ('Phuc vu','Tiep tan','Thu ngan','Bep','Kho','Quan ly'))
    add constraint NV_Tinhtrang_Thuoc check (Tinhtrang IN ('Dang lam viec','Da nghi viec'));

--Them khoa chinh
alter table NhanVien
    add constraint NV_PK PRIMARY KEY (ID_NV);

--Them khoa ngoai
ALTER TABLE NhanVien
 ADD CONSTRAINT NV_fk_idND FOREIGN KEY 
 (ID_ND) REFERENCES NguoiDung(ID_ND)
 ADD CONSTRAINT NV_fk_idNQL FOREIGN KEY 
 (ID_NQL) REFERENCES NhanVien(ID_NV);
 

--Tao bang KhachHang
--drop table KhachHang;
create table KhachHang(
    ID_KH NUMBER(8,0),
    TenKH varchar2(50), 
    Ngaythamgia date, 
    Doanhso number(10,0) DEFAULT 0, 
    Diemtichluy number(5,0) DEFAULT 0,
    ID_ND NUMBER(8,0)
);

--Them Check Constraint
alter table KhachHang
    add constraint KH_TenKH_NNULL check ('TenKH' is not null)
    add constraint KH_Ngaythamgia_NNULL check ('Ngaythamgia' is not null)
    add constraint KH_Doanhthu_NNULL check ('Doanhthu' is not null)
    add constraint KH_Diemtichluy_NNULL check ('Diemtichluy' is not null)
    add constraint KH_IDND_NNULL check ('ID_ND' is not null);

---Them khoa chinh
alter table KhachHang
    add constraint KhachHang_PK PRIMARY KEY (ID_KH);
    
    
---Them khoa ngoai
ALTER TABLE KhachHang
 ADD CONSTRAINT KH_fk_idND FOREIGN KEY 
 (ID_ND) REFERENCES NguoiDung(ID_ND);

--Tao bang MonAn
--drop table MonAn;
create table MonAn(
    ID_MonAn NUMBER(8,0),
    TenMon varchar2(50), 
    DonGia number(8,0),
    Loai varchar2(50),
    TrangThai varchar2(30)
);
--Them Check Constraint
alter table MonAn
    add constraint MA_TenMon_NNULL check ('TenMon' is not null)
    add constraint MA_DonGia_NNULL check ('Dongia' is not null)
    add constraint MA_Loai_Ten check (Loai in ('Lamb','Beef','Combo','Dessert','Drink','KingCrab','KoreanFood','Salad','Rice','Pork','Chevon','Sushi'))
    add constraint MA_TrangThai_Thuoc check (TrangThai in('Dang kinh doanh','Ngung kinh doanh'));                                             

-

--Them khoa chinh
alter table MonAn
    add constraint MonAn_PK PRIMARY KEY (ID_MonAn);



--Tao bang Ban
--drop table Ban;
create table Ban(
    ID_Ban NUMBER(8,0),
    TenBan varchar2(50), 
    Vitri varchar2(50), 
    Trangthai varchar2(50)
);
--Them Check Constraint
alter table Ban
    add constraint Ban_TenBan_NNULL check ('TenBan' is not null)
    add constraint Ban_Vitri_NNULL check ('Vitri' is not null)
    add constraint Ban_Trangthai_Ten check (Trangthai in ('Con trong','Dang dung bua','Da dat truoc'));


--Them khoa chinh
alter table Ban
    add constraint Ban_PK PRIMARY KEY (ID_Ban);


--Tao bang Voucher

--Tao bang Voucher
--drop table Voucher;

create table Voucher(
    Code_Voucher varchar2(10),
    Mota varchar2(50),
    Phantram number(3,0),
    LoaiMA varchar2(50),
    SoLuong number(3,0),
    Diem number(8,0)
);
--Them Check Constraint
alter table Voucher
    add constraint V_Code_NNULL check ('Code_Voucher' is not null)
    add constraint V_Mota_NNULL check ('Mota' is not null)
    add constraint V_Phantram_NNULL check (Phantram > 0 AND Phantram <= 100)
    add constraint V_LoaiMA_Thuoc check (LoaiMA in ('All','Lamb','Beef','Combo','Dessert','Drink','KingCrab','KoreanFood','Salad','Rice','Pork','Chevon','Sushi'));



---Them khoa chinh
alter table Voucher
    add constraint Voucher_PK PRIMARY KEY (Code_Voucher);
/*  
--Tao bang HoaDon
--drop table HoaDon;
*/
create table HoaDon(
    ID_HoaDon NUMBER(8,0),
    ID_KH number(8,0),
    ID_Ban number(8,0),
    NgayHD date,
    TienMonAn number(8,0),
    Code_Voucher varchar2(10),
    TienGiam number(8,0),
    Tongtien number(10,0),
    Trangthai varchar2(50)
);

--Them Check Constraint
alter table HoaDon
    add constraint HD_NgayHD_NNULL check ('TenMon' is not null)
    add constraint HD_TrangThai check (Trangthai in ('Chua thanh toan','Da thanh toan'));

--Them khoa chinh
alter table HoaDon
    add constraint HD_PK PRIMARY KEY (ID_HoaDon);

ALTER TABLE HoaDon
 ADD CONSTRAINT HD_fk_idKH FOREIGN KEY (ID_KH) REFERENCES KhachHang(ID_KH)
 ADD CONSTRAINT HD_fk_idBan FOREIGN KEY ID_Ban) REFERENCES Ban(ID_Ban);
 

--Tao bang CTHD
--drop table CTHD;
create table CTHD(
    ID_HoaDon NUMBER(8,0),
    ID_MonAn number(8,0),
    SoLuong number(3,0),
    Thanhtien number(10,0)
);

--Them Check Constraint
alter table CTHD
    add constraint CTHD_SoLuong_NNULL check ('SoLuong' is not null);

--Them khoa chinh
alter table CTHD
    add constraint CTHD_PK PRIMARY KEY (ID_HoaDon,ID_MonAn);
    
--
--SELECT ID_HoaDon, ID_MonAn, COUNT(*)
--FROM CTHD
--GROUP BY ID_HoaDon, ID_MonAn
--HAVING COUNT(*) > 1;
--
--DELETE FROM CTHD
--WHERE ID_HoaDon = 113 AND ID_MonAn = 80;


ALTER TABLE CTHD
 ADD CONSTRAINT CTHD_fk_idHD FOREIGN KEY 
 (ID_HoaDon) REFERENCES HoaDon(ID_HoaDon)
 ADD CONSTRAINT CTHD_fk_idMonAn FOREIGN KEY 
 (ID_MonAn) REFERENCES MonAn(ID_MonAn);

 
--Tao bang Nguyenlieu
--drop table NguyenLieu;
create table NguyenLieu(
    ID_NL NUMBER(8,0),
    TenNL VARCHAR2(50), 
    Dongia NUMBER(8,0), 
    Donvitinh VARCHAR2(50)
);
--Them Check Constraint
alter table NguyenLieu
    add constraint NL_TenNL_NNULL check ('TenNL' is not null)
    add constraint NL_Dongia_NNULL check ('Dongia' is not null)
    add constraint NL_DVT_Thuoc check (Donvitinh in ('g','kg','ml','l'));

--Them khoa chinh
alter table NguyenLieu
    add constraint NL_PK PRIMARY KEY (ID_NL);
/*
--Tao bang Kho
--drop table Kho;
*/
create table Kho(
    ID_NL NUMBER(8,0),
    SLTon NUMBER(3,0) DEFAULT 0
);
--Them Check Constraint
--Them khoa chinh
ALTER TABLE Kho
    ADD CONSTRAINT Kho_pk PRIMARY KEY (ID_NL);

--Them khoa ngoai
ALTER TABLE Kho
 ADD CONSTRAINT Kho_fk_idNL FOREIGN KEY 
 (ID_NL) REFERENCES NguyenLieu(ID_NL);

--Tao bang PhieuNK
--drop table PhieuNK;
create table PhieuNK(
    ID_NK NUMBER(8,0),
    ID_NV number(8,0),
    NgayNK date,
    Tongtien number(10,0) DEFAULT 0
);

--Them Check Constraint
alter table PhieuNK
    add constraint PNK_NgayNK_NNULL check ('NgayNK' is not null);

--Them khoa chinh
alter table PhieuNK
    add constraint PNK_PK PRIMARY KEY (ID_NK);

ALTER TABLE PhieuNK
 ADD CONSTRAINT PNK_fk_idNV FOREIGN KEY 
 (ID_NV) REFERENCES NhanVien(ID_NV);

/*
--Them bang CTNK
--drop table CTNK;
*/
create table CTNK(
    ID_NK NUMBER(8,0),
    ID_NL number(8,0),
    SoLuong number(3,0),
    Thanhtien number(10,0)
);

--Them Check Constraint
alter table CTNK
    add constraint CTNK_SL_NNULL check ('SoLuong' is not null);

--Them khoa chinh
alter table CTNK
    add constraint CTNK_PK PRIMARY KEY (ID_NK,ID_NL);
    
--Them khoa ngoai
ALTER TABLE CTNK
 ADD CONSTRAINT CTNK_fk_idNK FOREIGN KEY 
 (ID_NK) REFERENCES PhieuNK(ID_NK)
 ADD CONSTRAINT CTNK_fk_idNL FOREIGN KEY 
 (ID_NL) REFERENCES NguyenLieu(ID_NL);


--Tao bang PhieuXK
--drop table PhieuXK;
create table PhieuXK(
    ID_XK NUMBER(8,0),
    ID_NV number(8,0),
    NgayXK date
);

--Them Check Constraint
alter table PhieuXK
    add constraint PXK_NgayXK_NNULL check ('NgayXK' is not null);

--Them khoa chinh
alter table PhieuXK
    add constraint PXK_PK PRIMARY KEY (ID_XK);

ALTER TABLE PhieuXK
 ADD CONSTRAINT PXK_fk_idNV FOREIGN KEY 
 (ID_NV) REFERENCES NhanVien(ID_NV);


--Them bang CTXK
--drop table CTXK;
create table CTXK(
    ID_XK NUMBER(8,0),
    ID_NL number(8,0),
    SoLuong number(3,0)
);

--Them Check Constraint
alter table CTXK
    add constraint CTXK_SL_NNULL check ('SoLuong' is not null);

--Them khoa chinh
alter table CTXK
    add constraint CTXK_PK PRIMARY KEY (ID_XK,ID_NL);

--Them khoa ngoai
ALTER TABLE CTXK
 ADD CONSTRAINT CTNK_fk_idXK FOREIGN KEY 
 (ID_XK) REFERENCES PhieuXK(ID_XK)
 ADD CONSTRAINT CTXK_fk_idNL FOREIGN KEY 
 (ID_NL) REFERENCES NguyenLieu(ID_NL);


--- Tao Trigger

--Khach hang chi duoc co toi da mot hoa don co trang thai Chua thanh toan
CREATE OR REPLACE TRIGGER Tg_SLHD_CTT
BEFORE INSERT OR UPDATE OF ID_KH, TrangThai ON HoaDon
FOR EACH ROW
DECLARE 
    v_count NUMBER;
BEGIN
    -- S? d?ng INTO ?? l?y k?t qu? t? SELECT vào bi?n v_count
    SELECT COUNT(*)
    INTO v_count  -- ??a k?t qu? vào bi?n v_count
    FROM HoaDon
    WHERE ID_KH = :new.ID_KH AND TrangThai = 'Chua thanh toan';

    -- Ki?m tra s? l??ng hóa ??n có tr?ng thái 'Chua thanh toan'
    IF v_count > 0 THEN
        -- N?u ?ã có 1 hóa ??n 'Chua thanh toan', không cho phép t?o thêm
        RAISE_APPLICATION_ERROR(-20000, 'Moi khach hang chi duoc co toi da mot hoa don co trang thai chua thanh toan');
    END IF;
END;
/

--  Trigger Thanh tien o CTHD bang SoLuong x Dongia cua mon an do

CREATE OR REPLACE TRIGGER Tg_CTHD_Thanhtien
BEFORE INSERT OR UPDATE OF SoLuong ON CTHD
FOR EACH ROW
DECLARE 
    gia MonAn.DonGia%TYPE;
BEGIN
    SELECT DonGia
    INTO gia
    FROM MonAn
    WHERE MonAn.ID_MonAn = :new.ID_MonAn;
    
    :new.ThanhTien := :new.SoLuong * gia;
END;
/

/**/
--- Trigger Tien mon an o Hoa Don bang tong thanh tien o CTHD
CREATE OR REPLACE TRIGGER Tg_HD_TienMonAn
AFTER INSERT OR UPDATE OR DELETE ON CTHD
FOR EACH ROW
BEGIN
    IF INSERTING THEN    
        UPDATE HoaDon SET TienMonAn = TienMonAn + :new.ThanhTien WHERE HoaDon.ID_HoaDon=:new.ID_HoaDon;
    END IF;
    
    IF UPDATING THEN    
        UPDATE HoaDon SET TienMonAn = TienMonAn + :new.ThanhTien - :old.ThanhTien WHERE HoaDon.ID_HoaDon=:new.ID_HoaDon;
    END IF;
    
    IF DELETING THEN    
        UPDATE HoaDon SET TienMonAn = TienMonAn - :old.ThanhTien WHERE HoaDon.ID_HoaDon=:old.ID_HoaDon;
    END IF;
END;
/
--Trigger Tien giam o Hoa Don = tong thanh tien cua mon An duoc giam  x Phantram
--CREATE OR REPLACE TRIGGER Tg_HD_TienGiam
--AFTER INSERT OR UPDATE OR DELETE ON CTHD
--FOR EACH ROW
--DECLARE 
--    v_code HoaDon.Code_Voucher%TYPE;
--    v_loaiMA Voucher.LoaiMA%TYPE;
--    MA_Loai MonAn.Loai%TYPE;
--BEGIN
--    v_code:=NULL;
----Tim Code Voucher, Loai mon an duoc Ap dung Voucher tu bang Voucher
--    IF (INSERTING OR UPDATING) THEN
--        SELECT HoaDon.Code_Voucher,Voucher.LoaiMA 
--        INTO v_code,v_LoaiMA
--        FROM HoaDon
--        LEFT JOIN Voucher ON Voucher.Code_Voucher = HoaDon.Code_Voucher
--        WHERE ID_HoaDon=:new.ID_HoaDon;
--    --Tim loai mon an cua Mon an vua duoc them vao CTHD   
--        SELECT Loai
--        INTO MA_Loai
--        FROM MonAn 
--        WHERE ID_MonAn = :new.ID_MonAn;
--    END IF;
--    
--    IF (DELETING) THEN
--        SELECT HoaDon.Code_Voucher,Voucher.LoaiMA 
--        INTO v_code,v_LoaiMA
--        FROM HoaDon
--        LEFT JOIN Voucher ON Voucher.Code_Voucher = HoaDon.Code_Voucher
--        WHERE ID_HoaDon=:old.ID_HoaDon;
--    --Tim loai mon an cua Mon an vua duoc xoa khoi CTHD   
--        SELECT Loai
--        INTO MA_Loai
--        FROM MonAn 
--        WHERE ID_MonAn = :old.ID_MonAn;
--    END IF;
--    
--    IF(v_code IS NOT NULL) THEN
--        IF(v_LoaiMA='All' OR v_LoaiMA=MA_Loai) THEN 
--            IF INSERTING THEN    
--                UPDATE HoaDon SET TienGiam = TienGiam + Tinhtiengiam(:new.ThanhTien,v_code) WHERE HoaDon.ID_HoaDon=:new.ID_HoaDon;
--            END IF;
--            
--            IF UPDATING THEN    
--                UPDATE HoaDon SET TienGiam = TienGiam + Tinhtiengiam(:new.ThanhTien,v_code) - Tinhtiengiam(:old.ThanhTien,v_code) WHERE HoaDon.ID_HoaDon=:new.ID_HoaDon;
--            END IF;
--            
--            IF DELETING THEN    
--                UPDATE HoaDon SET TienGiam = TienGiam - Tinhtiengiam(:old.ThanhTien,v_code) WHERE HoaDon.ID_HoaDon=:old.ID_HoaDon;
--            END IF;
--        END IF;
--    END IF;
--END;
--/
--
-- v2
CREATE OR REPLACE TRIGGER Tg_HD_TienGiam
AFTER INSERT OR UPDATE OR DELETE ON CTHD
FOR EACH ROW
DECLARE 
    v_code HoaDon.Code_Voucher%TYPE;
    v_loaiMA Voucher.LoaiMA%TYPE;
    MA_Loai MonAn.Loai%TYPE;
    v_phantram NUMBER;
BEGIN
    v_code := NULL;

    -- X? lý cho INSERTING và UPDATING
    IF INSERTING OR UPDATING THEN
        -- L?y Code Voucher và Loai món áp d?ng cho Voucher
        SELECT HoaDon.Code_Voucher, Voucher.LoaiMA, Voucher.Phantram
        INTO v_code, v_LoaiMA, v_phantram
        FROM HoaDon
        LEFT JOIN Voucher ON Voucher.Code_Voucher = HoaDon.Code_Voucher
        WHERE ID_HoaDon = :new.ID_HoaDon;

        -- L?y lo?i món ?n v?a ???c thêm vào ho?c c?p nh?t trong CTHD
        SELECT Loai
        INTO MA_Loai
        FROM MonAn 
        WHERE ID_MonAn = :new.ID_MonAn;
    END IF;

    -- X? lý cho DELETING
    IF DELETING THEN
        -- L?y Code Voucher và Loai món áp d?ng cho Voucher
        SELECT HoaDon.Code_Voucher, Voucher.LoaiMA, Voucher.Phantram
        INTO v_code, v_LoaiMA, v_phantram
        FROM HoaDon
        LEFT JOIN Voucher ON Voucher.Code_Voucher = HoaDon.Code_Voucher
        WHERE ID_HoaDon = :old.ID_HoaDon;

        -- L?y lo?i món ?n v?a b? xóa kh?i CTHD
        SELECT Loai
        INTO MA_Loai
        FROM MonAn 
        WHERE ID_MonAn = :old.ID_MonAn;
    END IF;

    -- N?u có mã Voucher
    IF v_code IS NOT NULL THEN
        -- Ki?m tra n?u áp d?ng cho t?t c? món ?n ho?c ?úng lo?i món ?n
        IF v_LoaiMA = 'All' OR v_LoaiMA = MA_Loai THEN 
            -- X? lý khi thêm dòng m?i vào CTHD
            IF INSERTING THEN    
                UPDATE HoaDon 
                SET TienGiam = TienGiam + (:new.ThanhTien * (v_phantram / 100)) 
                WHERE HoaDon.ID_HoaDon = :new.ID_HoaDon;
            END IF;

            -- X? lý khi c?p nh?t dòng trong CTHD
            IF UPDATING THEN    
                UPDATE HoaDon 
                SET TienGiam = TienGiam + (:new.ThanhTien * (v_phantram / 100)) - (:old.ThanhTien * (v_phantram / 100)) 
                WHERE HoaDon.ID_HoaDon = :new.ID_HoaDon;
            END IF;

            -- X? lý khi xóa dòng kh?i CTHD
            IF DELETING THEN    
                UPDATE HoaDon 
                SET TienGiam = TienGiam - (:old.ThanhTien * (v_phantram / 100)) 
                WHERE HoaDon.ID_HoaDon = :old.ID_HoaDon;
            END IF;
        END IF;
    END IF;
END;
/


-- Tong tien o Hoa Don = Tien mon an - Tien giam
CREATE OR REPLACE TRIGGER Tg_HD_Tongtien
AFTER INSERT OR UPDATE OF TienMonAn,TienGiam ON HoaDon
BEGIN
    UPDATE HoaDon SET Tongtien= TienMonAn - TienGiam;
END;
/
-- Khi cap nhat Code_Voucher o HoaDon, Tinh tien giam theo thong tin cua Voucher do va giam Diem tich luy cua KH
CREATE OR REPLACE TRIGGER Tg_HD_DoiVoucher
BEFORE UPDATE OF Code_Voucher ON HoaDon
FOR EACH ROW
DECLARE 
    TongtienLoaiMonAnduocgiam number(8,0);
    v_Diemdoi number;
    v_Phantram number;
    v_LoaiMA Voucher.LoaiMA%TYPE;
BEGIN
    IF(:new.Code_Voucher is not null) THEN
        SELECT Diem,Phantram,LoaiMA
        INTO v_Diemdoi,v_Phantram,v_LoaiMA
        FROM Voucher
        WHERE Code_Voucher=:new.Code_Voucher;
        
        KH_TruDTL(:new.ID_KH,v_diemdoi);
        Voucher_GiamSL(:new.Code_Voucher);
        
        IF(v_LoaiMA='All') THEN
            TongtienLoaiMonAnduocgiam := :new.TienMonAn;
        ELSE 
            SELECT SUM(Thanhtien)
            INTO TongtienLoaiMonAnduocgiam
            FROM CTHD 
            JOIN MonAn ON MonAn.ID_MonAn = CTHD.ID_MonAn
            WHERE ID_HoaDon = :new.ID_HoaDon AND LOAI = v_LoaiMA;
        END IF;
        
        :new.Tiengiam := ROUND(TongtienLoaiMonAnduocgiam*v_Phantram/100);
        :new.Tongtien := :new.Tienmonan-:new.Tiengiam;
    ELSE
        RAISE_APPLICATION_ERROR(-20000,'Voucher khong ton tai');
    END IF;
END;
/
/*
--Trigger Doanh so cua Khach hang bang tong tien cua tat ca hoa don co trang thai 'Da thanh toan' 
--cua khach hang do
-- Diem tich luy cua Khach hang duoc tinh bang 0.005% Tong tien cua hoa don (1.000.000d tuong duong 50 diem)
*/
CREATE OR REPLACE TRIGGER Tg_KH_DoanhsovaDTL
AFTER UPDATE OF Trangthai ON HoaDon
FOR EACH ROW
BEGIN
    IF :new.Trangthai='Da thanh toan' THEN
        UPDATE KhachHang SET Doanhso = Doanhso + :new.Tongtien WHERE ID_KH=:new.ID_KH;
        UPDATE KhachHang SET Diemtichluy = Diemtichluy + ROUND(:new.Tongtien*0.00005)
        WHERE ID_KH=:new.ID_KH;
    END IF;
END;
/
--Trigger khi khach hang them hoa don moi, trang thai ban chuyen tu 'Con trong' sang 'Dang dung bua'
-- Khi trang thai don hang tro thanh 'Da thanh toan' trang thai ban chuyen tu 'Dang dung bua' sang 'Con trong'

CREATE OR REPLACE TRIGGER Tg_TrangthaiBan
AFTER INSERT OR UPDATE OF Trangthai ON HoaDon
FOR EACH ROW
BEGIN
    IF(:new.Trangthai='Chua thanh toan') THEN 
        UPDATE Ban SET Trangthai='Dang dung bua' WHERE ID_Ban=:new.ID_Ban;
    ELSE 
        UPDATE Ban SET Trangthai='Con trong' WHERE ID_Ban=:new.ID_Ban;
    END IF; 
END;
/
--  Trigger Thanh tien o CTNK bang SoLuong x Dongia cua nguyen lieu do

CREATE OR REPLACE TRIGGER Tg_CTNK_Thanhtien
BEFORE INSERT OR UPDATE OF SoLuong ON CTNK
FOR EACH ROW
DECLARE 
    gia NguyenLieu.DonGia%TYPE;
BEGIN
    SELECT DonGia
    INTO gia
    FROM NguyenLieu
    WHERE NguyenLieu.ID_NL = :new.ID_NL;
    
    :new.ThanhTien := :new.SoLuong * gia;
    
END;
/
--Trigger Tong tien o PhieuNK bang tong thanh tien cua CTNK
CREATE OR REPLACE TRIGGER Tg_PNK_Tongtien
AFTER INSERT OR UPDATE OR DELETE ON CTNK
FOR EACH ROW
BEGIN
    IF INSERTING THEN    
        UPDATE PhieuNK SET Tongtien = Tongtien + :new.ThanhTien WHERE PhieuNK.ID_NK = :new.ID_NK;
    END IF;
    
    IF UPDATING THEN    
        UPDATE PhieuNK SET Tongtien = Tongtien + :new.ThanhTien - :old.ThanhTien WHERE PhieuNK.ID_NK = :new.ID_NK;
    END IF;
    
    IF DELETING THEN    
        UPDATE PhieuNK SET Tongtien = Tongtien - :old.ThanhTien WHERE PhieuNK.ID_NK = :old.ID_NK;
    END IF;
END;
/
--Trigger khi them CTNK tang So luong ton cua nguyen lieu trong kho
CREATE OR REPLACE TRIGGER Tg_Kho_ThemSLTon
AFTER INSERT OR DELETE OR UPDATE OF SoLuong ON CTNK
FOR EACH ROW
BEGIN
    IF INSERTING THEN    
        UPDATE Kho SET SLTon = SLTon + :new.SoLuong WHERE Kho.ID_NL = :new.ID_NL;
    END IF;
    
    IF UPDATING THEN    
        UPDATE Kho SET SLTon = SLTon + :new.SoLuong - :old.SoLuong WHERE Kho.ID_NL = :new.ID_NL;
    END IF;
    
    IF DELETING THEN    
        UPDATE Kho SET SLTon = SLTon - :old.SoLuong WHERE Kho.ID_NL = :old.ID_NL;
    END IF;
END;
/
--Trigger khi them CTXK giam So luong ton cua nguyen lieu trong kho
CREATE OR REPLACE TRIGGER Tg_Kho_GiamSLTon
AFTER INSERT OR DELETE OR UPDATE OF SoLuong ON CTXK
FOR EACH ROW
BEGIN
    IF INSERTING THEN    
        UPDATE Kho SET SLTon = SLTon - :new.SoLuong WHERE Kho.ID_NL = :new.ID_NL;
    END IF;
    
    IF UPDATING THEN    
        UPDATE Kho SET SLTon = SLTon - :new.SoLuong + :old.SoLuong WHERE Kho.ID_NL = :new.ID_NL;
    END IF;
    
    IF DELETING THEN    
        UPDATE Kho SET SLTon = SLTon + :old.SoLuong WHERE Kho.ID_NL = :old.ID_NL;
    END IF;
END;
/
--Trigger khi them mot Nguyen Lieu moi, them NL do vao Kho
CREATE OR REPLACE TRIGGER Tg_Kho_ThemNL
AFTER INSERT ON NguyenLieu
FOR EACH ROW
BEGIN
    INSERT INTO Kho(ID_NL) VALUES(:new.ID_NL);
END;
/

--Procedure
--Procudure them mot khach hang moi voi cac thong tin tenKH , NgayTG va ID_ND
CREATE OR REPLACE PROCEDURE KH_ThemKH(
    tenKH KHACHHANG.TenKH%TYPE, 
    NgayTG KHACHHANG.Ngaythamgia%TYPE,
    ID_ND KHACHHANG.ID_ND%TYPE
)
IS
    v_ID_KH KHACHHANG.ID_KH%TYPE;
BEGIN
    -- Them ma KH tiep theo
    SELECT MIN(ID_KH) + 1
    INTO v_ID_KH
    FROM KHACHHANG
    WHERE ID_KH + 1 NOT IN (SELECT ID_KH FROM KHACHHANG);
    
    INSERT INTO KhachHang(ID_KH, TenKH, Ngaythamgia, ID_ND) 
    VALUES (v_ID_KH, tenKH, TO_DATE(NgayTG, 'dd-MM-YYYY'), ID_ND);
    
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20000, 'Thong tin khong hop le');
END;
/

--Procudure them mot nhan vien moi voi cac thong tin tenNV, NgayVL, SDT, Chucvu, ID_NQL, Tinhtrang

CREATE OR REPLACE PROCEDURE NV_ThemNV(
    tenNV NHANVIEN.TenNV%TYPE, 
    NgayVL NHANVIEN.NgayVL%TYPE, 
    SDT NHANVIEN.SDT%TYPE,
    Chucvu NHANVIEN.Chucvu%TYPE,
    ID_NQL NHANVIEN.ID_NQL%TYPE, 
    Tinhtrang NHANVIEN.Tinhtrang%TYPE
)
IS
    v_ID_NV NHANVIEN.ID_NV%TYPE;
BEGIN
    -- Them ma NV tiep theo
    SELECT MIN(ID_NV) + 1
    INTO v_ID_NV
    FROM NHANVIEN
    WHERE ID_NV + 1 NOT IN (SELECT ID_NV FROM NHANVIEN);
    
    INSERT INTO NhanVien(ID_NV, TenNV, NgayVL, SDT, Chucvu, ID_NQL, Tinhtrang) 
    VALUES (v_ID_NV, tenNV, TO_DATE(NgayVL, 'dd-MM-YYYY'), SDT, Chucvu, ID_NQL, Tinhtrang);
    
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20000, 'Thong tin khong hop le');
END;
/


-- Procudure xoa mot NHANVIEN voi idNV
/*****************************************************************************************************

-----------------------------------------------------------------------------------------------------

*******/
--CREATE OR REPLACE PROCEDURE NV_XoaNV(idNV NHANVIEN.ID_NV%TYPE)
--IS
--    v_count NUMBER;
--    idNQL NHANVIEN.ID_NQL%TYPE;
--BEGIN 
--    SELECT COUNT(ID_NV),ID_NQL
--    INTO v_count,ID_NQL
--    FROM NHANVIEN
--    WHERE ID_NV=idNV;
--    
--    IF(v_count>0) THEN
--        IF (id_NV = idNQL) THEN
--            RAISE_APPLICATION_ERROR(-20000,'Khong the xoa QUAN LY');
--        ELSE
--            FOR cur IN (SELECT ID_NK FROM PHIEUNK
--            WHERE ID_NV=idNV
--            )
--            LOOP
--                DELETE FROM CTNK WHERE ID_NK=cur.ID_NK;
--            END LOOP;
--            
--            FOR cur IN (SELECT ID_XK FROM PHIEUXK
--            WHERE ID_NV=idNV
--            )
--            LOOP
--                DELETE FROM CTXK WHERE ID_XK=cur.ID_XK;
--            END LOOP;
--            
--            DELETE FROM PHIEUNK WHERE ID_NV=idNV;
--            DELETE FROM PHIEUNK WHERE ID_NV=idNV;
--            DELETE FROM NHANVIEN WHERE ID_NV=idNV;
--        END IF;
--    ELSE 
--        RAISE_APPLICATION_ERROR(-20000,'Nhan vien khong ton tai');
--    END IF;
--END;
--/
CREATE OR REPLACE PROCEDURE NV_XoaNV(idNV NHANVIEN.ID_NV%TYPE)
IS
    v_count NUMBER;
    idNQL NHANVIEN.ID_NQL%TYPE;
BEGIN 
    -- Select to check if the employee exists and to get the ID_NQL
    SELECT COUNT(ID_NV), ID_NQL
    INTO v_count, idNQL
    FROM NHANVIEN
    WHERE ID_NV = idNV;

    -- Check if employee exists
    IF(v_count > 0) THEN
        -- Check if the employee is a manager (i.e., idNV is the same as idNQL)
        IF (idNV = idNQL) THEN
            RAISE_APPLICATION_ERROR(-20000, 'Khong the xoa QUAN LY');
        ELSE
            -- Delete related entries in CTNK
            FOR cur IN (SELECT ID_NK FROM PHIEUNK WHERE ID_NV = idNV)
            LOOP
                DELETE FROM CTNK WHERE ID_NK = cur.ID_NK;
            END LOOP;
            
            -- Delete related entries in CTXK
            FOR cur IN (SELECT ID_XK FROM PHIEUXK WHERE ID_NV = idNV)
            LOOP
                DELETE FROM CTXK WHERE ID_XK = cur.ID_XK;
            END LOOP;

            -- Delete records from PHIEUNK and PHIEUXK
            DELETE FROM PHIEUNK WHERE ID_NV = idNV;
            DELETE FROM PHIEUXK WHERE ID_NV = idNV;

            -- Finally, delete the employee from NHANVIEN
            DELETE FROM NHANVIEN WHERE ID_NV = idNV;
        END IF;
    ELSE 
        RAISE_APPLICATION_ERROR(-20000, 'Nhan vien khong ton tai');
    END IF;
END;
/


-- Procudure xoa mot KHACHHANG voi idKH
CREATE OR REPLACE PROCEDURE KH_XoaKH(idKH KHACHHANG.ID_KH%TYPE)
IS
    v_count NUMBER;
BEGIN 
    SELECT COUNT(*)
    INTO v_count
    FROM KHACHHANG
    WHERE ID_KH=idKH;
    
    IF(v_count>0) THEN
        FOR cur IN (SELECT ID_HoaDon FROM HOADON 
        WHERE ID_KH=idKH
        )
        LOOP
            DELETE FROM CTHD WHERE ID_HoaDon=cur.ID_HoaDon;
        END LOOP;
        DELETE FROM HOADON WHERE ID_KH=idKH;
        DELETE FROM KHACHHANG WHERE ID_KH=idKH;
    ELSE 
        RAISE_APPLICATION_ERROR(-20000,'Khach hang khong ton tai');
    END IF;
END;
/

-- Procedure xem thong tin KHACHHANG voi thong tin idKH
CREATE OR REPLACE PROCEDURE KH_XemTT(idKH KHACHHANG.ID_KH%TYPE)
IS
BEGIN 
    FOR cur IN (SELECT TenKH, Ngaythamgia, Doanhso, Diemtichluy, ID_ND
                FROM KHACHHANG 
                WHERE ID_KH = idKH)  -- Bo dau cham phay o day
    LOOP
        DBMS_OUTPUT.PUT_LINE('Ma khach hang: ' || idKH);
        DBMS_OUTPUT.PUT_LINE('Ten khach hang: ' || cur.TenKH);
        DBMS_OUTPUT.PUT_LINE('Ngay tham gia: ' || TO_CHAR(cur.Ngaythamgia, 'dd-MM-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Doanh so: ' || cur.Doanhso);
        DBMS_OUTPUT.PUT_LINE('Diem tich luy: ' || cur.Diemtichluy);
        DBMS_OUTPUT.PUT_LINE('Ma nguoi dung: ' || cur.ID_ND);
    END LOOP;
    
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20000, 'Khach hang khong ton tai');
END;
/

-- Procedure xem thong tin NHANVIEN voi thong tin idNV
CREATE OR REPLACE PROCEDURE NV_XemTT(idNV NHANVIEN.ID_NV%TYPE)
IS
BEGIN 
    FOR cur IN (SELECT TenNV, NgayVL, SDT, Chucvu, ID_NQL   
                FROM NHANVIEN 
                WHERE ID_NV = idNV)  -- B? d?u ch?m ph?y ? ?ây
    LOOP
        DBMS_OUTPUT.PUT_LINE('Ma nhan vien: ' || idNV);
        DBMS_OUTPUT.PUT_LINE('Ten nhan vien: ' || cur.TenNV);
        DBMS_OUTPUT.PUT_LINE('Ngay vao lam: ' || TO_CHAR(cur.NgayVL, 'dd-MM-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Chuc vu: ' || cur.Chucvu);
        DBMS_OUTPUT.PUT_LINE('Ma nguoi quan ly: ' || cur.ID_NQL);
    END LOOP;
    
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
             RAISE_APPLICATION_ERROR(-20000, 'Nhan vien khong ton tai');
END;
/


-- Procedure liet ke danh sach hoa don tu ngay A den ngay B
--CREATE OR REPLACE PROCEDURE NV_XemTT(idNV NHANVIEN.ID_NV%TYPE)
--IS
--BEGIN 
--    FOR cur IN (SELECT TenNV, NgayVL, SDT, Chucvu, ID_NQL   
--                FROM NHANVIEN 
--                WHERE ID_NV = idNV)  -- Không có d?u ch?m ph?y
--    LOOP
--        DBMS_OUTPUT.PUT_LINE('Ma nhan vien: ' || idNV);
--        DBMS_OUTPUT.PUT_LINE('Ten nhan vien: ' || cur.TenNV);
--        DBMS_OUTPUT.PUT_LINE('Ngay vao lam: ' || TO_CHAR(cur.NgayVL, 'dd-MM-YYYY'));
--        DBMS_OUTPUT.PUT_LINE('Chuc vu: ' || cur.Chucvu);
--        DBMS_OUTPUT.PUT_LINE('Ma nguoi quan ly: ' || cur.ID_NQL);
--           
--        EXCEPTION WHEN NO_DATA_FOUND THEN
--             RAISE_APPLICATION_ERROR(-20000,'Khong co hoa don nao');
--    END LOOP;
--END;
--/

CREATE OR REPLACE PROCEDURE NV_XemTT(idNV NHANVIEN.ID_NV%TYPE)
IS
BEGIN 
    FOR cur IN (SELECT TenNV, NgayVL, SDT, Chucvu, ID_NQL   
                FROM NHANVIEN 
                WHERE ID_NV = idNV)  -- Không có d?u ch?m ph?y
    LOOP
        DBMS_OUTPUT.PUT_LINE('Ma nhan vien: ' || idNV);
        DBMS_OUTPUT.PUT_LINE('Ten nhan vien: ' || cur.TenNV);
        DBMS_OUTPUT.PUT_LINE('Ngay vao lam: ' || TO_CHAR(cur.NgayVL, 'dd-MM-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Chuc vu: ' || cur.Chucvu);
        DBMS_OUTPUT.PUT_LINE('Ma nguoi quan ly: ' || cur.ID_NQL);
    END LOOP;
    
    -- Kh?i EXCEPTION ph?i n?m ngoài vòng l?p
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20000, 'Nhan vien khong ton tai');
END;
/
-- danh sach hoa don tu a den b
CREATE OR REPLACE PROCEDURE DS_HoaDon_tuAdenB(fromA DATE, toB DATE)
IS
BEGIN 
    FOR cur IN (SELECT ID_HOADON, ID_KH, ID_BAN, NGAYHD, TIENMONAN, TIENGIAM, TONGTIEN, TRANGTHAI   
                FROM HOADON 
                WHERE NGAYHD BETWEEN fromA AND (toB + 1))  -- Không có d?u ch?m ph?y ? ?ây
    LOOP
        DBMS_OUTPUT.PUT_LINE('Ma hoa don: ' || cur.ID_HOADON);
        DBMS_OUTPUT.PUT_LINE('Ma khach hang: ' || cur.ID_KH);
        DBMS_OUTPUT.PUT_LINE('Ma ban: ' || cur.ID_BAN);
        DBMS_OUTPUT.PUT_LINE('Ngay hoa don: ' || TO_CHAR(cur.NGAYHD, 'dd-MM-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Tien mon an: ' || cur.TIENMONAN);
        DBMS_OUTPUT.PUT_LINE('Tien giam: ' || cur.TIENGIAM);
        DBMS_OUTPUT.PUT_LINE('Tong tien: ' || cur.TONGTIEN);
        DBMS_OUTPUT.PUT_LINE('Trang thai: ' || cur.TRANGTHAI);
    END LOOP;

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20000, 'Khong co hoa don nao');
END;
/

-- Procedure liet ke danh sach phieu nhap kho tu ngay A den ngay B
--CREATE OR REPLACE PROCEDURE DS_PhieuNK_tuAdenB(fromA DATE, toB DATE)
--IS
--BEGIN 
--    FOR cur IN (SELECT ID_NK,ID_NV,NGAYNK,TONGTIEN  
--    FROM PHIEUNK WHERE NGAYNK BETWEEN fromA AND (toB +1);
--    )
--    LOOP
--        DBMS_OUTPUT.PUT_LINE('Ma nhap kho: '||cur.ID_NK);
--        DBMS_OUTPUT.PUT_LINE('Ma nhan vien: '||cur.ID_NV);
--        DBMS_OUTPUT.PUT_LINE('Ngay nhap kho: '||TO_CHAR(cur.NGAYNK,'dd-MM-YYYY');
--        DBMS_OUTPUT.PUT_LINE('Tong tien: '||cur.TONGTIEN);
--        
--        EXCEPTION WHEN NO_DATA_FOUND THEN
--             RAISE_APPLICATION_ERROR(-20000,'Khong co hoa don nao');
--    END LOOP;
--END;
--/
CREATE OR REPLACE PROCEDURE DS_PhieuNK_tuAdenB(fromA DATE, toB DATE)
IS
BEGIN 
    FOR cur IN (SELECT ID_NK, ID_NV, NGAYNK, TONGTIEN  
                FROM PHIEUNK 
                WHERE NGAYNK BETWEEN fromA AND (toB + 1))  -- B? d?u ch?m ph?y
    LOOP
        DBMS_OUTPUT.PUT_LINE('Ma nhap kho: ' || cur.ID_NK);
        DBMS_OUTPUT.PUT_LINE('Ma nhan vien: ' || cur.ID_NV);
        DBMS_OUTPUT.PUT_LINE('Ngay nhap kho: ' || TO_CHAR(cur.NGAYNK, 'dd-MM-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Tong tien: ' || cur.TONGTIEN);
    END LOOP;

    -- Kh?i EXCEPTION n?m ngoài vòng l?p
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20000, 'Khong co hoa don nao');
END;
/

-- Procedure liet ke danh sach phieu xuat kho tu ngay A den ngay B
--CREATE OR REPLACE PROCEDURE DS_PhieuXK_tuAdenB(fromA DATE, toB DATE)
--IS
--BEGIN 
--    FOR cur IN (SELECT ID_XK,ID_NV,NGAYXK
--    FROM PHIEUXK WHERE NGAYXK BETWEEN fromA AND (toB +1);
--    )
--    LOOP
--        DBMS_OUTPUT.PUT_LINE('Ma xuat kho: '||cur.ID_XK);
--        DBMS_OUTPUT.PUT_LINE('Ma nhan vien: '||cur.ID_NV);
--        DBMS_OUTPUT.PUT_LINE('Ngay xuat kho: '||TO_CHAR(cur.NGAYXK,'dd-MM-YYYY');
--        
--        EXCEPTION WHEN NO_DATA_FOUND THEN
--             RAISE_APPLICATION_ERROR(-20000,'Khong co hoa don nao');
--    END LOOP;
--END;
--/

CREATE OR REPLACE PROCEDURE DS_PhieuXK_tuAdenB(fromA DATE, toB DATE)
IS
BEGIN 
    FOR cur IN (SELECT ID_XK, ID_NV, NGAYXK
                FROM PHIEUXK 
                WHERE NGAYXK BETWEEN fromA AND (toB + 1))  -- B? d?u ch?m ph?y
    LOOP
        DBMS_OUTPUT.PUT_LINE('Ma xuat kho: ' || cur.ID_XK);
        DBMS_OUTPUT.PUT_LINE('Ma nhan vien: ' || cur.ID_NV);
        DBMS_OUTPUT.PUT_LINE('Ngay xuat kho: ' || TO_CHAR(cur.NGAYXK, 'dd-MM-YYYY'));
    END LOOP;

    -- Kh?i EXCEPTION n?m ngoài vòng l?p
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20000, 'Khong co hoa don nao');
END;
/

-- Procedure xem chi tiet hoa don cua 1 hoa don
CREATE OR REPLACE PROCEDURE HD_XemCTHD(idHD HOADON.ID_HOADON%TYPE)
IS
BEGIN 
    FOR cur IN (SELECT ID_MONAN, SOLUONG, THANHTIEN
                FROM CTHD 
                WHERE ID_HOADON = idHD)  -- B? d?u ch?m ph?y
    LOOP
        DBMS_OUTPUT.PUT_LINE('Ma mon an: ' || cur.ID_MONAN);
        DBMS_OUTPUT.PUT_LINE('So luong: ' || cur.SOLUONG);
        DBMS_OUTPUT.PUT_LINE('Thanh tien: ' || cur.THANHTIEN);
    END LOOP;
    
    -- Kh?i EXCEPTION n?m ngoài vòng l?p
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20000, 'Khong co chi tiet hoa don nao');
END;
/

-- Procedure giam So Luong cua Voucher di 1 khi KH doi Voucher
CREATE OR REPLACE PROCEDURE Voucher_GiamSL(code Voucher.Code_Voucher%TYPE)
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM Voucher
    WHERE Code_Voucher=code;
    IF(v_count>0) THEN
        UPDATE Voucher SET SoLuong = SoLuong - 1 WHERE Code_Voucher=code;
    ELSE 
        RAISE_APPLICATION_ERROR(-20000,'Voucher khong ton tai');
    END IF;
END;
/

-- Procedure giam Diem tich luy cua KH khi doi Voucher
CREATE OR REPLACE PROCEDURE KH_TruDTL(ID KHACHHANG.ID_KH%TYPE,diemdoi NUMBER)
IS
    v_count NUMBER;
BEGIN 
    SELECT COUNT(*)
    INTO v_count
    FROM KHACHHANG
    WHERE ID_KH=ID;
    IF(v_count>0) THEN
        UPDATE KHACHHANG SET Diemtichluy = Diemtichluy - diemdoi WHERE ID_KH=ID;
    ELSE 
        RAISE_APPLICATION_ERROR(-20000,'Khach hang khong ton tai');
    END IF;
END;
/

--Fuction 
--Fuction Tinh doanh thu hoa don theo ngay
CREATE OR REPLACE FUNCTION DoanhThuHD_theoNgay (ngHD DATE)
RETURN NUMBER
IS 
    v_Doanhthu NUMBER;
BEGIN
    SELECT SUM(Tongtien)
    INTO v_Doanhthu
    FROM HOADON 
    WHERE NGAYHD=ngHD;
    
    v_Doanhthu := NVL(v_Doanhthu,0);
    RETURN v_Doanhthu;
END;
/
--Fuction Tinh chi phi nhap kho theo ngay
CREATE OR REPLACE FUNCTION ChiPhiNK_theoNgay (ngNK DATE)
RETURN NUMBER
IS 
    v_Chiphi NUMBER;
BEGIN
    SELECT SUM(Tongtien)
    INTO v_Chiphi
    FROM PHIEUNK 
    WHERE NGAYNK=ngNK;
    
    v_Chiphi := NVL(v_Chiphi,0);
    RETURN v_Chiphi;
END;
/
--Fuction Tinh doanh so trung binh cua x KHACHHANG co doanh so cao nhat
CREATE OR REPLACE FUNCTION DoanhsoTB_TOPxKH(x INT)
RETURN DECIMAL
IS 
   v_avg DECIMAL;
BEGIN
    SELECT AVG(Doanhso)
    INTO v_avg
    FROM (
        SELECT Doanhso 
        FROM KHACHHANG
        ORDER BY Doanhso DESC
        FETCH FIRST x ROWS ONLY
        );
    RETURN v_avg;
END;
/

--Fuction Tinh so luong KHACHANG moi trong thang chi dinh cua nam co it nhat mot hoa don co tri gia tren x vnd
--CREATE OR REPLACE FUNCTION SL_KH_Moi(thang NUMBER, nam NUMBER, trigiaHD NUMBER)
--RETURN NUMBER
--IS 
--   v_count NUMBER;
--BEGIN
--    SELECT COUNT(ID_KH)
--    INTO v_count;
--    FROM KHACHHANG
--    WHERE EXTRACT(MONTH FROM Ngaythamgia)=thang AND EXTRACT(YEAR FROM Ngaythamgia) = nam
--    AND EXISTS(SELECT *
--               FROM HOADON 
--               WHERE HOADON.ID_KH=KHACHHANG.ID_KH AND TONGTIEN>trigiaHD
--               );
--    RETURN v_count;          
--END;
--/
CREATE OR REPLACE FUNCTION SL_KH_Moi(thang NUMBER, nam NUMBER, trigiaHD NUMBER)
RETURN NUMBER
IS 
   v_count NUMBER;
BEGIN
    SELECT COUNT(ID_KH)
    INTO v_count
    FROM KHACHHANG
    WHERE EXTRACT(MONTH FROM Ngaythamgia) = thang 
    AND EXTRACT(YEAR FROM Ngaythamgia) = nam
    AND EXISTS (SELECT 1
                FROM HOADON 
                WHERE HOADON.ID_KH = KHACHHANG.ID_KH 
                AND TONGTIEN > trigiaHD);
    
    RETURN v_count;          
END;
/
    
--Fuction Tinh tien mon an duoc giam khi them mot CTHD moi
CREATE OR REPLACE FUNCTION CTHD_Tinhtiengiam(Tongtien Number,Code Voucher.Code_Voucher%TYPE)
RETURN NUMBER
IS 
    Tiengiam NUMBER;
    v_phantram NUMBER;
BEGIN
    SELECT Phantram
    INTO v_Phantram
    FROM Voucher
    WHERE Code_Voucher=Code;
    Tiengiam := ROUND(Tongtien*v_Phantram/100);
    RETURN Tiengiam;
END;
/

--Them data set format ngay
ALTER SESSION SET NLS_DATE_FORMAT = 'dd-MM-YYYY';




/*
--------------------------------------------------------------------------
Trong lan dau chay data CHAY L?NH nay khi bi bao loi VI PH?M TRIGGER ; Pk, FK
TÔ H?P PHÍM NHANH LA Ctr + /
--------------------------------------------------------------------------
*/

-- Disable t?t c? các trigger
--BEGIN
--   FOR rec IN (SELECT trigger_name FROM user_triggers) LOOP
--      EXECUTE IMMEDIATE 'ALTER TRIGGER ' || rec.trigger_name || ' DISABLE';
--   END LOOP;
--END;
--/

/* ****************************************
Pk Fk
********************
*/
--ALTER TABLE BAN DISABLE ALL CONSTRAINTS;
--ALTER TABLE CTHD DISABLE ALL CONSTRAINTS;
--ALTER TABLE CTNK DISABLE ALL CONSTRAINTS;
--ALTER TABLE CTXK DISABLE ALL CONSTRAINTS;
--ALTER TABLE HOADON DISABLE ALL CONSTRAINTS;
--ALTER TABLE KHACHHANG DISABLE ALL CONSTRAINTS;
--ALTER TABLE KHO DISABLE ALL CONSTRAINTS;
--ALTER TABLE MONAN DISABLE ALL CONSTRAINTS;
--ALTER TABLE NGUOIDUNG DISABLE ALL CONSTRAINTS;
--ALTER TABLE NGUYENLIEU DISABLE ALL CONSTRAINTS;
--ALTER TABLE NHANVIEN DISABLE ALL CONSTRAINTS;
--ALTER TABLE PHIEUNK DISABLE ALL CONSTRAINTS;
--ALTER TABLE PHIEUXK DISABLE ALL CONSTRAINTS;
--ALTER TABLE VOUCHER DISABLE ALL CONSTRAINTS;




/*
--Them data cho Bang NguoiDung
--Nhan vien
*/
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (100,'NVHoangHieu@gmail.com','123','Verified','Nhan Vien');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (101,'NVAnhDuc@gmail.com','123','Verified','Quan Ly');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (102,'NVThebao@gmail.com','123','Verified','Nhan Vien Kho');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (103,'NVNgocDinh@gmail.com','123','Verified','Nhan Vien');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (116,'Admin1.panda@gmail.com','123','Verified','Quan Ly');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (115,'Admin2.panda@gmail.com','123','Verified','Nhan Vien');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (117,'Admin3.panda@gmail.com','123','Verified','Nhan Vien Kho');
--

SELECT * FROM nguoidung;

---- check vai tro
--SELECT search_condition
--FROM all_constraints
--WHERE constraint_name = 'ND_VAITRO_TEN';

---- check bang nguoidung
--SELECT * From NguoiDung;

--Khach Hang
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (104,'KHTuanAnh@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (105,'KHTanHieu@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (106,'KHQuocThinh@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (107,'KHNhuMai@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (108,'KHBichHao@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (109,'KHMaiQuynh@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (110,'KHMinhQuang@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (111,'KHThanhHang@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (112,'KHThanhNhan@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (113,'KHPhucNguyen@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (114,'Pandadmin','123','Verified','Khach Hang');

--Them data cho bang Nhan Vien
ALTER SESSION SET NLS_DATE_FORMAT = 'dd-MM-YYYY';

--Co tai khoan
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_ND,ID_NQL,Tinhtrang) VALUES (100,'Tran The Bao','10/05/2024','0848044725','Kho',102,101,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_ND,ID_NQL,Tinhtrang) VALUES (101,'Nguyen Duy Hieu','20/05/2024','0838033334','Tiep tan',100,101,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_ND,ID_NQL,Tinhtrang) VALUES (102,'Nguyen Anh Duc','19/05/2024','0838033234','Quan ly',101,101,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_ND,ID_NQL,Tinhtrang) VALUES (103,'Ho Thi Ngoc Dinh','19/05/2024','0838033234','Tiep tan',103,101,'Dang lam viec');

-- Update Tran The Bao's record in NhanVien to have the correct ID_ND and ID_NQL
UPDATE NhanVien SET Chucvu= 'Kho'  WHERE ID_NV = 100 AND TenNV = 'Tran The Bao';

-- Update Nguyen Duy Hieu's record in NhanVien to have the correct ID_ND and ID_NQL
UPDATE NhanVien SET ID_ND = 100, ID_NQL = 101 WHERE ID_NV = 101 AND TenNV = 'Nguyen Duy Hieu';

-- Update Nguyen Anh Duc's record in NhanVien to have the correct ID_ND and ID_NQL
UPDATE NhanVien SET Chucvu = 'Quan ly' WHERE ID_NV = 102 AND TenNV = 'Nguyen Anh Duc';

-- Update Ho Thi Ngoc Dinh's record in NhanVien to have the correct ID_ND and ID_NQL
UPDATE NhanVien SET ID_ND = 103, ID_NQL = 101 WHERE ID_NV = 103 AND TenNV = 'Ho Thi Ngoc Dinh';

select * from NhanVien;

--Khong co tai khoan
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (104,'Le Tuan Anh','10/05/2024','0838033232','Phuc vu',100,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (105,'Nguyen Quoc Thinh','11/05/2024','0838033734','Phuc vu',100,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (106,'Truong Tan Hieu','12/05/2024','0838033834','Phuc vu',100,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (107,'Nguyen Thai Bao','10/05/2024','0838093234','Phuc vu',100,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (108,'Tran Nhat Khang','11/05/2024','0838133234','Thu ngan',100,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (109,'Nguyen Ngoc Luong','12/05/2024','0834033234','Bep',100,'Dang lam viec');

--Them data cho bang KhachHang
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (100,'Ha Thao Duong','10/05/2024',104);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (101,'Truong Tan Hieu','10/05/2024',105);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (102,'Nguyen Quoc Thinh','10/05/2024',106);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (103,'Tran Nhu Mai','10/05/2024',107);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (104,'Nguyen Thi Bich Hao','10/05/2024',108);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (105,'Nguyen Mai Quynh','11/05/2024',109);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (106,'Hoang Minh Quang','11/05/2024',110);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (107,'Nguyen Thanh Hang','12/05/2024',111);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (108,'Nguyen Ngoc Thanh Nhan','11/05/2024',112);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (109,'Hoang Thi Phuc Nguyen','12/05/2024',113);
/*
--Them data cho bang MonAn

*/

--Lamb - Cuu
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(1,'DUI CUU NUONG XE NHO', 250000,'Lamb','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(2,'BE SUON CUU NUONG GIAY BAC MONG CO', 230000,'Lamb','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(3,'DUI CUU NUONG TRUNG DONG', 350000,'Lamb','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(4,'CUU XOC LA CA RI', 129000,'Lamb','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(5,'CUU KUNGBAO', 250000,'Lamb','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(6,'BAP CUU NUONG CAY', 250000,'Lamb','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(7,'CUU VIEN HAM CAY', 19000,'Lamb','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(8,'SUON CONG NUONG MONG CO', 250000,'Lamb','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(9,'DUI CUU LON NUONG TAI BAN', 750000,'Lamb','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(10,'SUONG CUU NUONG SOT NAM', 450000,'Lamb','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(11,'DUI CUU NUONG TIEU XANH', 285000,'Lamb','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(12,'SUON CUU SOT PHO MAI', 450000,'Lamb','Dang kinh doanh');

select * from MonAn;



--Beef - bò
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(13,'Bit tet bo My khoai tay', 179000,'Beef','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(14,'Bo bit tet Uc',169000,'Beef','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(15,'Bit tet bo My BASIC', 179000,'Beef','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(16,'My Y bo bam', 169000,'Beef','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(17,'Thit suon Wagyu', 1180000,'Beef','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(18,'Steak Thit Vai Wagyu', 1290000,'Beef','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(19,'Steak Thit Bung Bo', 550000,'Beef','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(20,'Tomahawk', 2390000,'Beef','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(21,'Salad Romaine Nuong', 180000,'Beef','Dang kinh doanh');


--Comb-uu dai
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(22,'Combo Happy', 180000,'Combo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(23,'Combo Fantastic', 190000,'Combo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(24,'Combo Dreamer', 230000,'Combo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(25,'Combo Cupid', 180000,'Combo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(26,'Combo Poseidon', 190000,'Combo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(27,'Combo LUANG PRABANG', 490000,'Combo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(28,'Combo VIENTIANE', 620000,'Combo','Dang kinh doanh');




--KingCrab - cua hoang de
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(29,'Cua KingCrab Duc sot', 3650000,'KingCrab','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(30,'Mai Cua KingCrab Topping Pho Mai', 2650000,'KingCrab','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(31,'Cua KingCrab sot Tu Xuyen', 2300000,'KingCrab','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(32,'Cua KingCrab Nuong Tu Nhien', 2550000,'KingCrab','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(33,'Cua KingCrab Nuong Bo Toi', 2650000,'KingCrab','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(34,'Com Mai Cua KingCrab Chien', 1850000,'KingCrab','Dang kinh doanh');


--KoreanFood
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(35,'BOSSAM', 650000,'KoreanFood','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(36,'KIMCHI PANCAKE', 350000,'KoreanFood','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(37,'SPICY RICE CAKE', 250000,'KoreanFood','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(38,'SPICY SAUSAGE HOTPOT', 650000,'KoreanFood','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(39,'SPICY PORK', 350000,'KoreanFood','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(40,'MUSHROOM SPICY SILKY TOFU STEW', 350000,'KoreanFood','Dang kinh doanh');



--Dessert - Trang Mieng
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(41,'Pavlova', 150000,'Dessert','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(42,'Kesutera', 120000,'Dessert','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(43,'Cremeschnitte', 250000,'Dessert','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(44,'Sachertorte', 150000,'Dessert','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(45,'Schwarzwalder Kirschtorte', 250000,'Dessert','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(46,'New York-Style Cheesecake', 250000,'Dessert','Dang kinh doanh');



--Salad -Rau
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(47,'Cobb Salad', 150000,'Salad','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(48,'Salad Israeli', 120000,'Salad','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(49,'Salad Dau den', 120000,'Salad','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(50,'Waldorf Salad', 160000,'Salad','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(51,'Salad Gado-Gado', 200000,'Salad','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(52,'Nicoise Salad', 250000,'Salad','Dang kinh doanh');


--Rice - com nh?t
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(53,'BULGOGI LUNCHBOX', 250000,'Rice','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(54,'CHICKEN TERIYAKI LUNCHBOX', 350000,'Rice','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(55,'SPICY PORK LUNCHBOX', 350000,'Rice','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(56,'TOFU TERIYAKI LUNCHBOX', 250000,'Rice','Dang kinh doanh');




--Pork - Heo
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(57,'Thit heo do tuoi', 250000,'Pork','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(58,'Steak Thit heo', 350000,'Pork','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(59,'Thit heo ban gang', 350000,'Pork','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(60,'Long heo xao dua', 150000,'Pork','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(61,'Thit heo xao sa ot', 250000,'Pork','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(62,'Heo tang bbq', 350000,'Pork','Dang kinh doanh');



Select * From MonAn;

--Dau
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(63,'Thit de xong hoi', 229000,'Chevon','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(64,'Thit de xao rau ngo', 199000,'Chevon','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(65,'Thit de nuong tang', 229000,'Chevon','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(66,'Thit de chao', 199000,'Chevon','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(67,'Thit de nuong xien', 199000,'Chevon','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(68,'Nam de nuong/chao', 199000,'Chevon','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(69,'Thit de xao lan', 19000,'Chevon','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(70,'Dui de tan thuoc bac', 199000,'Chevon','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(71,'Canh de ham duong quy', 199000,'Chevon','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(72,'Chao de dau xanh', 50000,'Chevon','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(73,'Thit de nhung me', 229000,'Chevon','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(74,'Lau de nhu', 499000,'Chevon','Dang kinh doanh');


--Drink - N??c gi?i khát
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(75,'SIGNATURE WINE', 3290000,'Drink','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(76,'CHILEAN WINE', 3990000,'Drink','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(77,'ARGENTINA WINE', 2890000,'Drink','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(78,'ITALIAN WINE', 5590000,'Drink','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(79,'AMERICAN WINE', 4990000,'Drink','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(80,'CLASSIC COCKTAIL', 200000,'Drink','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(81,'SIGNATURE COCKTAIL', 250000,'Drink','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(82,'MOCKTAIL', 160000,'Drink','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(83,'JAPANESE SAKE', 1490000,'Drink','Dang kinh doanh');



--Sushi
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(84,'Ca Hoi Ngam Tuong', 289000,'Sushi','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(85,'Ca Ngu Ngam Tuong', 289000,'Sushi','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(86,'IKURA:Trung ca hoi', 189000,'Sushi','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(87,'KARIN:Sashimi Ca Ngu', 149000,'Sushi','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(88,'KEIKO:Sashimi Ca Hoi', 199000,'Sushi','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(89,'CHIYO:Sashimi Bung Ca Hoi', 219000,'Sushi','Dang kinh doanh');



/*
--Them data cho bang Ban
--Tang 1
*/
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(100,'Ban T1.1','Tang 1','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(101,'Ban T1.2','Tang 1','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(102,'Ban T1.3','Tang 1','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(103,'Ban T1.4','Tang 1','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(104,'Ban T1.5','Tang 1','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(105,'Ban T1.6','Tang 1','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(106,'Ban T1.7','Tang 1','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(107,'Ban T1.8','Tang 1','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(108,'Ban T1.9','Tang 1','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(109,'Ban T1.10','Tang 1','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(110,'Ban T1.11','Tang 1','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(111,'Ban T1.12','Tang 1','Con trong');
--Tang 2
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(112,'Ban T2.1','Tang 2','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(113,'Ban T2.2','Tang 2','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(114,'Ban T2.3','Tang 2','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(115,'Ban T2.4','Tang 2','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(116,'Ban T2.5','Tang 2','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(117,'Ban T2.6','Tang 2','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(118,'Ban T2.7','Tang 2','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(119,'Ban T2.8','Tang 2','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(120,'Ban T2.9','Tang 2','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(121,'Ban T2.10','Tang 2','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(122,'Ban T2.11','Tang 2','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(123,'Ban T2.12','Tang 2','Con trong');
--Tang 3
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(124,'Ban T3.1','Tang 3','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(125,'Ban T3.1','Tang 3','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(126,'Ban T3.1','Tang 3','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(127,'Ban T3.1','Tang 3','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(128,'Ban T3.1','Tang 3','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(129,'Ban T3.1','Tang 3','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(130,'Ban T3.1','Tang 3','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(131,'Ban T3.1','Tang 3','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(132,'Ban T3.1','Tang 3','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(133,'Ban T3.1','Tang 3','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(134,'Ban T3.1','Tang 3','Con trong');
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(135,'Ban T3.1','Tang 3','Con trong');

--Them data cho bang Voucher
INSERT INTO Voucher(Code_Voucher, Mota, Phantram, LoaiMA, SoLuong, Diem) VALUES ('loQy', '20% off for Drink Menu', 20, 'Drink', 10, 200);
INSERT INTO Voucher(Code_Voucher, Mota, Phantram, LoaiMA, SoLuong, Diem) VALUES ('pCfI', '30% off for Lamb Menu', 30, 'Lamb', 5, 300);
INSERT INTO Voucher(Code_Voucher, Mota, Phantram, LoaiMA, SoLuong, Diem) VALUES ('pApo', '20% off for Beef Menu', 20, 'Beef', 10, 200);
INSERT INTO Voucher(Code_Voucher, Mota, Phantram, LoaiMA, SoLuong, Diem) VALUES ('ugQx', '100% off for Rice Menu', 100, 'Rice', 3, 500);
INSERT INTO Voucher(Code_Voucher, Mota, Phantram, LoaiMA, SoLuong, Diem) VALUES ('nxVX', '20% off for All Menu', 20, 'All', 5, 300);
INSERT INTO Voucher(Code_Voucher, Mota, Phantram, LoaiMA, SoLuong, Diem) VALUES ('Pwyn', '20% off for Pork Menu', 20, 'Pork', 10, 200);
INSERT INTO Voucher(Code_Voucher, Mota, Phantram, LoaiMA, SoLuong, Diem) VALUES ('bjff', '50% off for Pork Menu', 50, 'Pork', 5, 600);
INSERT INTO Voucher(Code_Voucher, Mota, Phantram, LoaiMA, SoLuong, Diem) VALUES ('YPzJ', '20% off for KingCrab Menu', 20, 'KingCrab', 5, 200);
INSERT INTO Voucher(Code_Voucher, Mota, Phantram, LoaiMA, SoLuong, Diem) VALUES ('Y5g0', '30% off for KingCrab Menu', 30, 'KingCrab', 5, 300);
INSERT INTO Voucher(Code_Voucher, Mota, Phantram, LoaiMA, SoLuong, Diem) VALUES ('7hVO', '60% off for Chevon Menu', 60, 'Chevon', 0, 1000);
INSERT INTO Voucher(Code_Voucher, Mota, Phantram, LoaiMA, SoLuong, Diem) VALUES ('WHLm', '20% off for Sushi Menu', 20, 'Sushi', 0, 200);
INSERT INTO Voucher(Code_Voucher, Mota, Phantram, LoaiMA, SoLuong, Diem) VALUES ('GTsC', '20% off for KoreanFood Menu', 20, 'KoreanFood', 0, 200);





--Them data cho bang HoaDon
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (101,100,100,'10-1-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (102,104,102,'15-1-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (103,105,103,'20-1-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (104,101,101,'13-2-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (105,103,120,'12-2-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (106,104,100,'16-3-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (107,107,103,'20-3-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (108,108,101,'10-4-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (109,100,100,'20-4-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (110,103,101,'5-5-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (111,106,102,'10-5-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (112,108,103,'15-5-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (113,106,102,'20-5-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (114,108,103,'5-6-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (115,109,104,'7-6-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (116,100,105,'7-6-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (117,106,106,'10-6-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (118,102,106,'10-2-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (119,103,106,'12-2-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (120,104,106,'10-4-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (121,105,106,'12-4-2024',0,0,'Chua thanh toan');
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (122,107,106,'12-5-2024',0,0,'Chua thanh toan');



--Them data cho CTHD
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (101,1,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (101,3,1);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (101,10,3);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (102,1,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (102,2,1);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (102,4,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (103,12,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (104,30,3);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (104,59,4);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (105,28,1);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (105,88,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (106,70,3);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (106,75,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (106,78,4);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (107,32,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (107,12,5);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (108,12,1);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (108,40,4);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (109,45,4);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (110,34,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (110,43,4);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (111,65,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (111,47,4);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (112,49,3);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (112,80,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (112,31,5);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (113,80,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (113,46,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (114,30,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (114,32,3);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (115,80,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (116,57,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (116,34,1);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (117,67,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (117,66,3);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (118,34,10);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (118,35,5);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (119,83,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (119,78,2);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (120,38,5);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (120,39,4);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (121,53,5);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (121,31,4);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (122,33,5);
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (122,34,6);
UPDATE HOADON SET TrangThai='Da thanh toan';

--Them data cho bang NguyenLieu
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(100,'Thit ga',40000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(101,'Thit heo',50000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(102,'Thit bo',80000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(103,'Tom',100000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(104,'Ca hoi',500000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(105,'Gao',40000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(106,'Sua tuoi',40000,'l');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(107,'Bot mi',20000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(108,'Dau ca hoi',1000000,'l');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(109,'Dau dau nanh',150000,'l');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(110,'Muoi',20000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(111,'Duong',20000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(112,'Hanh tay',50000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(113,'Toi',30000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(114,'Dam',50000,'l');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(115,'Thit de',130000,'kg');

--Them data cho PhieuNK
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (100,102,'10-01-2024');
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (101,102,'11-02-2024');
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (102,102,'12-02-2024');
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (103,102,'12-03-2024');
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (104,102,'15-03-2024');
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (105,102,'12-04-2024');
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (106,102,'15-04-2024');
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (107,102,'12-05-2024');
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (108,102,'15-05-2024');
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (109,102,'5-06-2024');
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (110,102,'7-06-2024');

--Them data cho CTNK
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (100,100,10);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (100,101,20);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (100,102,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,101,10);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,103,20);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,104,10);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,105,10);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,106,20);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,107,5);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,108,5);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,109,10);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,110,20);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,112,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,113,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,114,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (103,112,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (103,113,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (103,114,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (104,112,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (104,113,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (105,110,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (106,102,25);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (106,115,25);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (107,110,35);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (107,105,25);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (108,104,25);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (108,103,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (108,106,30);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (109,112,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (109,113,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (109,114,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (110,102,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (110,106,25);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (110,107,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (110,110,20);

--Them data cho PhieuXK
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (100,102,'10-01-2024');
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (101,102,'11-02-2024');
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (102,102,'12-03-2024');
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (103,102,'13-03-2024');
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (104,102,'12-04-2024');
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (105,102,'13-04-2024');
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (106,102,'12-05-2024');
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (107,102,'15-05-2024');
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (108,102,'20-05-2024');
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (109,102,'5-06-2024');
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (110,102,'10-06-2024');

--Them data cho CTXK
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (100,100,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (100,101,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (100,102,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,101,7);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,103,10);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,104,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,105,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,106,10);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,109,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,110,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,112,10);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,113,8);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,114,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (103,114,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (103,104,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (104,101,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (104,112,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (105,113,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (105,102,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (106,103,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (106,114,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (107,105,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (107,106,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (108,115,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (108,110,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (109,110,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (109,112,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (110,113,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (110,114,5);



/* Bat lai cac chuc nang trigger pk fk  */
-- Enable l?i t?t c? các trigger

--BEGIN
--   FOR rec IN (SELECT trigger_name FROM user_triggers) LOOP
--      EXECUTE IMMEDIATE 'ALTER TRIGGER ' || rec.trigger_name || ' ENABLE';
--   END LOOP;
--END;
--/
--
--ALTER TABLE BAN ENABLE ALL CONSTRAINTS;
--ALTER TABLE CTHD ENABLE ALL CONSTRAINTS;
--ALTER TABLE CTNK ENABLE ALL CONSTRAINTS;
--ALTER TABLE CTXK ENABLE ALL CONSTRAINTS;
--ALTER TABLE HOADON ENABLE ALL CONSTRAINTS;
--ALTER TABLE KHACHHANG ENABLE ALL CONSTRAINTS;
--ALTER TABLE KHO ENABLE ALL CONSTRAINTS;
--ALTER TABLE MONAN ENABLE ALL CONSTRAINTS;
--ALTER TABLE NGUOIDUNG ENABLE ALL CONSTRAINTS;
--ALTER TABLE NGUYENLIEU ENABLE ALL CONSTRAINTS;
--ALTER TABLE NHANVIEN ENABLE ALL CONSTRAINTS;
--ALTER TABLE PHIEUNK ENABLE ALL CONSTRAINTS;
--ALTER TABLE PHIEUXK ENABLE ALL CONSTRAINTS;
--ALTER TABLE VOUCHER ENABLE ALL CONSTRAINTS;


-- Ki?m tra b?ng BAN
SELECT * FROM BAN;

-- Ki?m tra b?ng CTHD
SELECT * FROM CTHD;

-- Ki?m tra b?ng CTNK
SELECT * FROM CTNK;

-- Ki?m tra b?ng CTXK
SELECT * FROM CTXK;

-- Ki?m tra b?ng HOADON
SELECT * FROM HOADON;

-- Ki?m tra b?ng KHACHHANG
SELECT * FROM KHACHHANG;

-- Ki?m tra b?ng KHO
SELECT * FROM KHO;

-- Ki?m tra b?ng MONAN
SELECT * FROM MONAN;

-- Ki?m tra b?ng NGUOIDUNG
SELECT * FROM NGUOIDUNG;

-- Ki?m tra b?ng NGUYENLIEU
SELECT * FROM NGUYENLIEU;

-- Ki?m tra b?ng NHANVIEN
SELECT * FROM NHANVIEN;

-- Ki?m tra b?ng PHIEUNK
SELECT * FROM PHIEUNK;

-- Ki?m tra b?ng PHIEUXK
SELECT * FROM PHIEUXK;

-- Ki?m tra b?ng VOUCHER
SELECT * FROM VOUCHER;


--DROP TABLE CTHD CASCADE CONSTRAINTS;
--DROP TABLE HOADON CASCADE CONSTRAINTS;
--DROP TABLE VOUCHER CASCADE CONSTRAINTS;
--DROP TABLE BAN CASCADE CONSTRAINTS;
--DROP TABLE MONAN CASCADE CONSTRAINTS;
--DROP TABLE NGUOIDUNG CASCADE CONSTRAINTS;
--DROP TABLE NHANVIEN CASCADE CONSTRAINTS;
--DROP TABLE KHACHHANG CASCADE CONSTRAINTS;
--DROP TABLE PHIEUNK CASCADE CONSTRAINTS;
--DROP TABLE PHIEUXK CASCADE CONSTRAINTS;
--DROP TABLE CTNK CASCADE CONSTRAINTS;
--DROP TABLE CTXK CASCADE CONSTRAINTS;
--DROP TABLE NGUYENLIEU CASCADE CONSTRAINTS;
--DROP TABLE KHO CASCADE CONSTRAINTS;
