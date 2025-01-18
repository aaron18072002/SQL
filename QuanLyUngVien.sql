CREATE DATABASE [QuanLyUngVien]
CONTAINMENT = NONE
ON PRIMARY 
( 
    NAME = N'QuanLyUngVien_TSQL_FILE', 
    FILENAME = N'D:\SQL\QuanLyUngVien.mdf'
)
LOG ON
( 
    NAME = N'QuanLyUngVien_TSQL_FILE_LOG', 
    FILENAME = N'D:\SQL\QuanLyUngVien_LOG.ldf'
);

USE [QuanLyUngVien];

CREATE TABLE certificates (
);