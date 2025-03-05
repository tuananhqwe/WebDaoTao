using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
    public class KhoaDAO
    {
        //Đọc tất cả khoa
        public List<Khoa> getAll()
        {
            List<Khoa> ds = new List<Khoa>();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from Khoa", conn);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                ds.Add(new Khoa()
                {
                    MaKH = rd["makh"].ToString(),
                    TenKh = rd["tenkh"].ToString(),
                   
                });
            }

            return ds;
        }

        //Thêm khoa
        public int Insert(Khoa kh)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert into Khoa(makh,tenkh) values (@makh,@tenkh)", conn);
            cmd.Parameters.AddWithValue("@tenkh", kh.TenKh);
            cmd.Parameters.AddWithValue("@makh", kh.MaKH);
            return cmd.ExecuteNonQuery();
        }

        //Sửa khoa
        public int Update(Khoa kh)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("update Khoa set tenkh = @tenkh where makh = @makh", conn);
            cmd.Parameters.AddWithValue("@tenkh", kh.TenKh);
            cmd.Parameters.AddWithValue("@makh", kh.MaKH);
            return cmd.ExecuteNonQuery();
        }

        //Xóa khoa
        public int Delete(Khoa kh)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("delete from Khoa where makh = @makh", conn);
                cmd.Parameters.AddWithValue("@makh",kh.MaKH );
                return cmd.ExecuteNonQuery();
            }catch (Exception ex)
            {
                return 0;
            }
        }
        //Lấy môn học theo mã môn học
    }
}
