CREATE DATABASE perpustakaan;

CREATE TABLE petugas (
	kode_petugas INT AUTO_INCREMENT NOT NULL,
	nama_petugas VARCHAR (30) NOT NULL,
	alamat_petugas VARCHAR(100) NOT NULL,
	no_telp_petugas VARCHAR(14) NOT NULL,
	foto_petugas VARCHAR (225) NOT NULL,
	PRIMARY KEY (kode_petugas)
);

CREATE TABLE anggota (
	kode_anggota INT AUTO_INCREMENT NOT NULL,
	nama_anggota VARCHAR (30) NOT NULL,
	alamat_anggota VARCHAR(100) NOT NULL,
	no_telp_anggota VARCHAR(14) NOT NULL,
	foto_anggota VARCHAR (225) NOT NULL,
	jenis_kelamin ENUM ('0','1'),
	PRIMARY KEY (kode_anggota)
);

CREATE TABLE peminjaman(
	kode_peminjaman INT AUTO_INCREMENT NOT NULL,
	tanggal_peminjaman DATETIME NOT NULL,
	tanggal_kembali DATETIME NOT NULL,
	kode_buku INT NOT NULL,
	kode_petugas INT NOT NULL,
	kode_anggota INT NOT NULL,
	statuss VARCHAR(10) NOT NULL,
	PRIMARY KEY (kode_peminjaman),
	FOREIGN KEY (kode_buku) REFERENCES buku (kode_buku),
	FOREIGN KEY (kode_petugas) REFERENCES petugas (kode_petugas),
	FOREIGN KEY (kode_anggota) REFERENCES anggota (kode_anggota)	
);

CREATE TABLE pengembalian(
	kode_pengembalian INT AUTO_INCREMENT NOT NULL,
	tanggal_pengembalian DATETIME NOT NULL,
	denda INT(11) NOT NULL,
	kode_peminjaman INT NOT NULL,
	PRIMARY KEY (kode_pengembalian),
	FOREIGN KEY (kode_peminjaman) REFERENCES peminjaman (kode_peminjaman)
);

CREATE TABLE kategori (
	kode_kategori INT AUTO_INCREMENT NOT NULL,
	nama_kategori VARCHAR (30) NOT NULL,
	PRIMARY KEY (kode_kategori)
);

CREATE TABLE pengarang (
	kode_pengarang INT AUTO_INCREMENT NOT NULL,
	nama_pengarang VARCHAR (30) NOT NULL,
	alamat_pengarang VARCHAR(100) NOT NULL,
	no_telp_pengarang VARCHAR(14) NOT NULL,
	PRIMARY KEY (kode_pengarang)
);

CREATE TABLE penerbit (
	kode_penerbit INT AUTO_INCREMENT NOT NULL,
	nama_penerbit VARCHAR (30) NOT NULL,
	alamat_penerbit VARCHAR(100) NOT NULL,
	no_telp_penerbit VARCHAR(14) NOT NULL,
	PRIMARY KEY (kode_penerbit)
);

CREATE TABLE buku (
	kode_buku INT AUTO_INCREMENT NOT NULL,
	judul_buku VARCHAR(30) NOT NULL,
	deskripsi VARCHAR(100) NOT NULL,
	jumlah VARCHAR(2) NOT NULL,
	tahun CHAR(4)NOT NULL,
	kode_kategori INT NOT NULL,
	kode_pengarang INT NOT NULL,
	kode_penerbit INT NOT NULL,
	PRIMARY KEY (kode_buku),
	FOREIGN KEY (kode_kategori) REFERENCES kategori (kode_kategori),
	FOREIGN KEY (kode_pengarang) REFERENCES pengarang (kode_pengarang),
	FOREIGN KEY (kode_penerbit) REFERENCES penerbit (kode_penerbit)
);