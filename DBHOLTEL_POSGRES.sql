

Create table loai_phong
(
	id SERIAL PRIMARY KEY,
	ten_lp varchar(50) NULL,
	mo_ta varchar(255) NULL
);


Create table phong
(
	id SERIAL PRIMARY KEY,
	id_lp Integer,
	so_nguoi Integer NULL,
	don_gia Integer NULL,
	tinh_trang Bit NULL
);
Alter table phong add  foreign key(id_lp) references loai_phong (id)  on update no action on delete no action ;
 
Create table khach_hang
(
	id SERIAL PRIMARY KEY,
	ho_ten varchar(50) NULL,
	cccd Char(12) NULL,
	quoc_tich varchar(50) NULL,
	sdt Char(10) NULL,
	gioi_tinh Bit NULL,
	ngay_sinh time NULL,
	email Varchar(50) NULL
) ;

Create table chuc_vu
(
	id  SERIAL PRIMARY KEY,
	ten_cv Varchar(80) NULL
) ;

Create table nhan_vien
(
	id  SERIAL PRIMARY KEY,
	id_cv Integer,
	ten_nv Varchar(50) NULL,
	ngay_sinh time NULL,
	gioi_tinh Bit NULL,
	tai_khoan Varchar(30) NULL,
	mat_khau Varchar(20) NULL,
	email Varchar(50) NULL
);
Alter table nhan_vien add  foreign key(id_cv) references chuc_vu (id)  on update no action on delete no action;

Create table phieu_dat_phong
(
	id  SERIAL PRIMARY KEY,
	id_kh Integer,
	id_nv Integer,
	ngay_dat time NULL,
	ngay_tra_dk time NULL,
	tien_coc Integer NULL
);

Alter table phieu_dat_phong add  foreign key(id_nv) references nhan_vien (id)  on update no action on delete no action ;
Alter table phieu_dat_phong add  foreign key(id_kh) references khach_hang (id)  on update no action on delete no action ;

Create table ct_pdp
(
	id_pdp Integer,
	id_p Integer,
Primary Key (id_pdp,id_p)
);
Alter table ct_pdp add  foreign key(id_p) references phong (id)  on update no action on delete no action;
Alter table ct_pdp add  foreign key(id_pdp) references phieu_dat_phong (id)  on update no action on delete no action ;

Create table loai_thanh_toan
(
	id  SERIAL PRIMARY KEY,
	ten_ltt Varchar(50) NULL
) ;

Create table hoa_don
(
	id  SERIAL PRIMARY KEY,
	id_nv Integer,
	id_ltt Integer,
	ngay_lap time NULL,
	tong_tien Integer NULL
) ;
Alter table hoa_don add  foreign key(id_ltt) references loai_thanh_toan (id)  on update no action on delete no action ;
Alter table hoa_don add  foreign key(id_nv) references nhan_vien (id)  on update no action on delete no action ;

Create table ct_hd
(
	id_hd Integer,
	id_pdp Integer,
	id_p Integer,
	tien_thue Integer NULL,
	tien_dv Integer NULL,
Primary Key (id_hd,id_pdp,id_p)
) ;
Alter table ct_hd add  foreign key(id_pdp,id_p) references ct_pdp (id_pdp,id_p)  on update no action on delete no action ;
Alter table ct_hd add  foreign key(id_hd) references hoa_don (id)  on update no action on delete no action ;


Create table dich_vu
(
	id  SERIAL PRIMARY KEY,
	ten_dv Varchar(50) NULL,
	don_vi Varchar(50) NULL,
	don_gia Integer NULL
) ;

Create table phieu_su_dung
(
	id  SERIAL PRIMARY KEY,
	id_dv Integer,
	id_p Integer,
	id_pdp Integer,
	id_nv Integer NULL,
	ngay_sd time NULL,
	sl Integer NULL
) ;

Alter table phieu_su_dung add  foreign key(id_dv) references dich_vu (id)  on update no action on delete no action ;
Alter table phieu_su_dung add  foreign key(id_pdp,id_p) references ct_pdp (id_pdp,id_p)  on update no action on delete no action;
Alter table phieu_su_dung add  foreign key(id_nv) references nhan_vien (id)  on update no action on delete no action ;

Create table phieu_kt
(
	id  SERIAL PRIMARY KEY,
	id_pdp Integer,
	id_nv Integer NULL,
	ngay_lap time NULL,
	tinh_trang Varchar(50) NULL
) ;

Alter table phieu_kt add  foreign key(id_pdp) references phieu_dat_phong (id)  on update no action on delete no action ;
Alter table phieu_kt add  foreign key(id_nv) references nhan_vien (id)  on update no action on delete no action;

Create table phieu_den_bu
(
	id  SERIAL PRIMARY KEY,
	id_pkt Integer NULL,
	id_nv Integer NULL,
	id_pdp Integer NULL,
	ngay_lap time NULL,
	tien_phat Integer NULL
) ;

Alter table phieu_den_bu add  foreign key(id_pkt) references phieu_kt (id)  on update no action on delete no action ;
Alter table phieu_den_bu add  foreign key(id_nv) references nhan_vien (id)  on update no action on delete no action ;