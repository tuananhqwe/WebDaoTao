using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
    public class SinhVienDAO
    {
        public List<SinhVien> getAll()
        {
            List<SinhVien> ds = new List<SinhVien>();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from sinhvien", conn);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                ds.Add(new SinhVien()
                {
                    MaSV = rd["MaSV"].ToString(),
                    HoSV = rd["HoSV"].ToString(),
                    TenSV = rd["TenSV"].ToString(),
                    GioiTinh = Convert.ToBoolean(rd["GioiTinh"].ToString()),
                    NgaySinh = DateTime.Parse(rd["NgaySinh"].ToString()),
                    NoiSinh = rd["noisinh"].ToString(),
                    DiaChi = rd["diachi"].ToString(),
                    MaKH = rd["makh"].ToString()
                });
            }

            return ds;
        }
        public int Update(SinhVien sv)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("update sinhvien set hosv= @hosv, tensv= @tensv, gioitinh= @gioitinh," +
                    " ngaysinh = @ngaysinh, noisinh = @noisinh, diachi= @diachi, makh= @makh where masv =@masv ", conn);
                cmd.Parameters.AddWithValue("@masv", sv.MaSV);
                cmd.Parameters.AddWithValue("@hosv", sv.HoSV);
                cmd.Parameters.AddWithValue("@tensv", sv.TenSV);
                cmd.Parameters.AddWithValue("@gioitinh", sv.GioiTinh);
                cmd.Parameters.AddWithValue("@ngaysinh", sv.NgaySinh);
                cmd.Parameters.AddWithValue("@noisinh", sv.NoiSinh);
                cmd.Parameters.AddWithValue("@diachi", sv.DiaChi);
                cmd.Parameters.AddWithValue("@makh", sv.MaKH);
                return cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public int Delete(SinhVien sv)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete from sinhvien where masv = @masv", conn);
            cmd.Parameters.AddWithValue("@masv", sv.MaSV);
            return cmd.ExecuteNonQuery();
        }
        public int Insert(SinhVien sv)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
           SqlCommand cmd = new SqlCommand("insert into sinhvien (masv, hosv, tensv, gioitinh," +
                "ngaysinh,noisinh,diachi,makh) values (@masv, @hosv, @tensv, @gioitinh, @ngaysinh,@noisinh,@diachi,@makh)", conn);
            cmd.Parameters.AddWithValue("@masv", sv.MaSV);
            cmd.Parameters.AddWithValue("@hosv", sv.HoSV);
            cmd.Parameters.AddWithValue("@tensv", sv.TenSV);
            cmd.Parameters.AddWithValue("@gioitinh", sv.GioiTinh);
            cmd.Parameters.AddWithValue("@ngaysinh", sv.NgaySinh);
            cmd.Parameters.AddWithValue("@noisinh", sv.NoiSinh);
            cmd.Parameters.AddWithValue("@diachi", sv.DiaChi);
            cmd.Parameters.AddWithValue("@makh", sv.MaKH);
            return cmd.ExecuteNonQuery();
        }
    }
}