<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhvien.aspx.cs" Inherits="WebQLDaoTao.QLSinhvien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>Thiết kế giao diện và chức năng quản lý sinh viên</h2>
      <!-- Trigger the modal with a button -->
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm sinh viên</button>
    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thêm sinh viên</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <label class="col-sm-2 col-form-label">Mã sinh viên</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtMaSV" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 col-form-label">Họ sinh viên</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtHoSV" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 col-form-label">Tên sinh viên</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtTen" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                     <div class="row">
                        <label class="col-sm-2 col-form-label">Giới tính</label>
                        <div class="col-sm-9">
                            <asp:RadioButton ID="rdNam" runat="server" Text="Nam" GroupName="GT" Checked="true"/>
                            <asp:RadioButton ID="rdNu" runat="server" Text="Nữ" GroupName="GT"/>
                        </div>
                    </div>
                      <div class="row">
                        <label class="col-sm-2 col-form-label">Ngày sinh</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtNgaySinh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                      <div class="row">
                        <label class="col-sm-2 col-form-label">Nơi sinh</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtNoiSinh" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                      <div class="row">
                        <label class="col-sm-2 col-form-label">Địa chỉ</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                      <div class="row">
                        <label class="col-sm-2 col-form-label">Chọn khoa</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlMakh" runat="server" CssClass="form-control" DataSourceID="odsKhoa"
                                 DataTextField="tenkh" DataValueField="makh"></asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btXuLy"  OnClick="btXuLy_Click"  runat="server" Text="Lưu" CssClass="btn btn-primary" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="table-responsive">
         <asp:GridView ID="gvSinhVien" runat="server" CssClass="table table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" 
             DataSourceID="odsSinhVien"  PageSize="5" DataKeyNames="masv"> 
        <Columns>
            <asp:BoundField DataField="MaSV" HeaderText="Mã SV"  ReadOnly="true" />
            <asp:BoundField DataField="HoSV" HeaderText="Họ SV"   ControlStyle-Width="150px" >
<ControlStyle Width="150px"></ControlStyle>
            </asp:BoundField>
            <asp:BoundField DataField="TenSV" HeaderText="Tên SV"  ControlStyle-Width="80px">
<ControlStyle Width="80px"></ControlStyle>
            </asp:BoundField>

            <asp:TemplateField HeaderText="Phái">
                <ItemTemplate>
                    <%# Convert.ToBoolean(Eval("gioitinh"))? "Nam": "Nữ"  %>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:CheckBox ID="ckPhai" runat="server" Checked='<%# Bind("gioitinh") %>' />                                   
                  <%--  <asp:DropDownList ID="ddlPhai" runat="server" SelectedValue='<%# Bind("gioitinh") %>'>
                        <asp:ListItem Text="Nam" Value="true"></asp:ListItem>
                        <asp:ListItem Text="Nữ" Value="false"></asp:ListItem>
                    </asp:DropDownList>--%>
                </EditItemTemplate>
            </asp:TemplateField>


            <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh"  DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ"  />
           
            <asp:TemplateField HeaderText="Khoa">
                <ItemTemplate>
                <%# Eval("Makh")  %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlMaKhoa" runat="server" DataSourceID="odsKhoa" 
                       DataTextField="tenkh" DataValueField="makh" SelectedValue='<%# Bind("makh") %>' ></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ButtonType="Button"
                EditText="Sửa" DeleteText="Xoá" UpdateText="Ghi" CancelText="Không" ItemStyle-Wrap="false"/>
        </Columns>
         <HeaderStyle BackColor="#003399" ForeColor="#ffffff" />
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
    </asp:GridView>
    </div>
    <asp:ObjectDataSource ID="odsSinhVien" runat="server" 
        SelectMethod="getAll" TypeName="WebQLDaoTao.Models.SinhVienDAO" 
        DataObjectTypeName="WebQLDaoTao.Models.SinhVien" 
        DeleteMethod="Delete" UpdateMethod="Update"></asp:ObjectDataSource>

     <asp:ObjectDataSource ID="odsKhoa" runat="server" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.KhoaDao"></asp:ObjectDataSource>
</asp:Content>
