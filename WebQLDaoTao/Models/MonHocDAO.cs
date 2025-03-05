using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace WebQLDaoTao.Models
{
    public class MonHocDAO
    {
        //Đọc tất cả môn học
        public List<MonHoc> getAll()
        {
            List<MonHoc> ds = new List<MonHoc>();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from monhoc", conn);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                ds.Add(new MonHoc()
                {
                    MaMH = rd["MaMH"].ToString(),
                    TenMH = rd["TenMH"].ToString(),
                    SoTiet = int.Parse(rd["SoTiet"].ToString())
                });
            }

            return ds;
        }

        //Thêm môn học
        public int Insert(MonHoc mh)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert into monhoc values(@MaMH, @TenMH, @SoTiet)", conn);
            cmd.Parameters.AddWithValue("MaMH", mh.MaMH);
            cmd.Parameters.AddWithValue("TenMH", mh.TenMH);
            cmd.Parameters.AddWithValue("SoTiet", mh.SoTiet);
            return cmd.ExecuteNonQuery();
        }

        //Sửa môn học
        public int Update(MonHoc mh)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("update monhoc set TenMH = @TenMH, SoTiet = @SoTiet where MaMH = @MaMH", conn);
            cmd.Parameters.AddWithValue("MaMH", mh.MaMH);
            cmd.Parameters.AddWithValue("TenMH", mh.TenMH);
            cmd.Parameters.AddWithValue("SoTiet", mh.SoTiet);
            return cmd.ExecuteNonQuery();
        }

        //Xóa môn học
        public int Delete(string mamh)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete from monhoc where MaMH = @MaMH", conn);
            cmd.Parameters.AddWithValue("MaMH", mamh);
            return cmd.ExecuteNonQuery();
        }
        //Lấy môn học theo mã môn học
    }
}