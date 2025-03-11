<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NhapDiem.aspx.cs" Inherits="WebQLDaoTao.NhapDiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>NHẬP ĐIỂM THI</h2> <hr />
    <div class="form-inline" style="margin-bottom:10px">
        Chọn môn <asp:DropDownList ID="ddlMaMH" runat="server" 
            AutoPostBack="true" DataSourceID="odsMonhoc"
            DataTextField="TenMH" DataValueField="MaMH" CssClass="form-control" Width="300px"></asp:DropDownList>
    </div>

    <asp:GridView ID="gvKetQua" runat="server" CssClass="table table-bordered"
        AutoGenerateColumns="False" DataSourceID="odsKetQua" Width="70%" DataKeyNames="id" ShowFooter="true">
        <Columns>
            <asp:BoundField DataField="MaSV" HeaderText="Mã SV" SortExpression="MaSV" ReadOnly="true"></asp:BoundField>
            <asp:BoundField DataField="hotensv" HeaderText="Họ tên SV" ></asp:BoundField>
            <asp:TemplateField HeaderText="Điểm">
                <ItemTemplate>
                    <asp:TextBox ID="txtDiem" runat="server" Text='<%# Eval("Diem") %>' CssClass="form-control" Width="150px"></asp:TextBox>
                    <asp:RangeValidator ID="rvDiem" runat="server" ErrorMessage="Điểm thi không hợp lệ"
                        Text="(*)" ControlToValidate="txtDiem" MaximumValue="10" MinimumValue="0" 
                        Type="Double" CssClass="text-danger"></asp:RangeValidator>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btLuu" runat="server" Text="Lưu điểm" CssClass="btn btn-success" OnClick="btLuu_Click" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Xóa">
                <HeaderTemplate>
                    <asp:CheckBox ID="ckAll" runat="server" Text="Chọn tất cả" AutoPostBack="true" OnCheckedChanged="ckAll_CheckedChanged"/>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="ckChon" runat="server" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btXoa" runat="server" Text="Xóa" CssClass="btn btn-danger" OnClick="btXoa_Click"/>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate >
            <div class="alert alert-warning">Không có dữ liệu</div>
        </EmptyDataTemplate>
        <HeaderStyle  BackColor="#87CEEB"/>
    </asp:GridView>
       

    <asp:ObjectDataSource ID="odsMonhoc" runat="server"
        SelectMethod="getAll" TypeName="WebQLDaoTao.Models.MonHocDAO"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsKetQua" runat="server" SelectMethod="getByMaMH" TypeName="WebQLDaoTao.Models.KetQuaDAO">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlMaMH" 
                PropertyName="SelectedValue" Name="mamh" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>