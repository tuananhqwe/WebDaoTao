using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class NhapDiem : System.Web.UI.Page
    {
        KetQuaDAO kqDAO = new KetQuaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btLuu_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i < gvKetQua.Rows.Count; i++)
                {
                    // lay id cua dong
                    int id = int.Parse(gvKetQua.DataKeys[i].Value.ToString());
                    // lay diem
                    float diem = float.Parse(((TextBox)gvKetQua.Rows[i].FindControl("txtDiem")).Text);
                    // goi lop DAO de cap nhat csdl
                    kqDAO.Update(id, diem);
                }
                Response.Write("<script>alert('Lưu điểm thành công');</script>");
                //lbThongBao.Text = "Lưu điểm thành công";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Lưu điểm không thành công');</script>");
                //lbThongBao.Text = "Lưu điểm không thành công";
            }
        }

        protected void btXoa_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < gvKetQua.Rows.Count; i++)
            {
                // lay id cua dong
                int id = int.Parse(gvKetQua.DataKeys[i].Value.ToString());
                // Kiểm tra checkbox chọn
                CheckBox chon = (CheckBox)gvKetQua.Rows[i].FindControl("ckChon");
                if (chon.Checked)
                {
                    // goi lop DAO de xoa  csdl
                    kqDAO.Delete(id);
                }
            }
            gvKetQua.DataBind();
        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            bool checkState = ((CheckBox)gvKetQua.HeaderRow.FindControl("ckAll")).Checked;
            for (int i = 0; i < gvKetQua.Rows.Count; i++)
            {
                //Kiem tra chon
                CheckBox chkchon = (CheckBox)gvKetQua.Rows[i].FindControl("ckChon");
                chkchon.Checked = ((CheckBox)sender).Checked;
            }
        }
    }
}