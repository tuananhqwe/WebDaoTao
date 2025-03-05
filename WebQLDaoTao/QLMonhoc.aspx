<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLMonhoc.aspx.cs" Inherits="WebQLDaoTao.QLMonhoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Contents/pagination.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <p>Trang Quản lý môn học</p>
    <!-- Trigger the modal with a button -->
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm môn học</button>
    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thêm môn học</h4>
                </div>
                <div class="modal-body">
                    <div class="mb-3 row">
                        <label for="txtMaMH" class="col-sm-2 col-form-label">Mã môn học</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtMaMH" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="txtTenMon" class="col-sm-2 col-form-label">Tên môn học</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtTenMon" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="txtSoTiet" class="col-sm-2 col-form-label">Số tiết</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtSoTiet" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button1" OnClick="btnSubmit_Click" runat="server" Text="Lưu" CssClass="btn btn-primary" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div>
        <asp:GridView ID="gvMonHoc" runat="server" AutoGenerateColumns="false" CssClass="table table-border table-hover"
            OnRowEditing="gvMonHoc_RowEditing"
            OnRowCancelingEdit="gvMonHoc_RowCancelingEdit"
            OnRowUpdating="gvMonHoc_RowUpdating"
            OnRowDeleting="gvMonHoc_RowDeleting"
            DataKeyNames="MaMH" OnPageIndexChanging="gvMonHoc_PageIndexChanging" AllowPaging="true" PageSize="5">
            <Columns>
                <asp:BoundField DataField="MaMH" HeaderText="Mã môn học" ReadOnly="true" />
                <asp:BoundField DataField="TenMH" HeaderText="Tên môn học" />
                <asp:BoundField DataField="SoTiet" HeaderText="Số tiết" />
                <asp:CommandField ShowEditButton="true" ButtonType="Button" EditText="Sửa" HeaderText="Chọn tác vụ"
                    ShowDeleteButton="true" DeleteText="Xóa" />
            </Columns>
            
            <HeaderStyle BackColor="#003399" ForeColor="#ffffff" />
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        </asp:GridView>
    </div>
</asp:Content>
