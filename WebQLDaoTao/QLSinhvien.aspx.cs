using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLSinhvien : System.Web.UI.Page
    {
        SinhVienDAO svDAO = new SinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btXuLy_Click(object sender, EventArgs e)
        {
            string masv = txtMaSV.Text;
            string hosv = txtHoSV.Text;
            string tensv = txtTen.Text;
            bool gioitinh = rdNam.Checked ? true : false;
            DateTime ngaysinh = DateTime.Parse(txtNgaySinh.Text);
            string noisinh = txtNoiSinh.Text;
            string diachi = txtDiaChi.Text;
            string makh = ddlMakh.SelectedValue;

            SinhVien sv = new SinhVien()
            {
                MaSV = masv,
                HoSV = hosv,
                TenSV = tensv,
                GioiTinh = gioitinh,
                NgaySinh = ngaysinh,
                NoiSinh = noisinh,
                DiaChi = diachi,
                MaKH = makh
            };
            svDAO.Insert(sv);
            gvSinhVien.DataBind();
        }
    }
}