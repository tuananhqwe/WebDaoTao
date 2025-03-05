using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
    public class SinhVien
    {
        public string MaSV { set; get; }
        public string HoSV { get; set; }
        public string TenSV { get; set; }
        public bool GioiTinh { get; set; }
        public DateTime NgaySinh { get; set; }
        public string NoiSinh { get; set; }
        public string DiaChi { get; set; }
        public string MaKH { get; set; }

    }
}