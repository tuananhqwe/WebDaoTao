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
        AutoGenerateColumns="False" DataSourceID="odsKetQua" Width="70%" DataKeyNames="Id" ShowFooter="true">
        <Columns>
            <asp:BoundField DataField="MaSV" HeaderText="Mã SV" SortExpression="MaSV" ReadOnly="true"></asp:BoundField>
            <asp:TemplateField HeaderText="Điểm">
                <ItemTemplate>
                    <asp:TextBox ID="txtDiem" runat="server" Text='<%# Eval("Diem") %>' CssClass="form-control" Width="150px"></asp:TextBox>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:Button ID="btLuu" runat="server" Text="Lưu điểm" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Xóa">
                <ItemTemplate>
                    <asp:CheckBox ID="ckChon" runat="server" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btXoa" runat="server" Text="Xóa" CssClass="btn btn-danger"/>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate >
            <div class="alert alert-warning">Không có dữ liệu</div>
        </EmptyDataTemplate>
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
