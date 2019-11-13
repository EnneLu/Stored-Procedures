<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAddVeiculo.aspx.cs" Inherits="Stored_Procedures.WebFormAddVeiculo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Fabricante"></asp:Label>
            <asp:TextBox ID="fabricante" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label2" runat="server" Text="Modelo"></asp:Label>
            <asp:TextBox ID="modelo" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label3" runat="server" Text="Ano Fabricante"></asp:Label>
            <asp:TextBox ID="ano_fabricante" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label4" runat="server" Text="Placa"></asp:Label>
            <asp:TextBox ID="placa" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label5" runat="server" Text="UF"></asp:Label>
            <asp:TextBox ID="uf" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="salvar" runat="server" Text="SALVAR" OnClick="salvar_Click"/>
            <asp:Button ID="cancelar" runat="server" Text="CANCELAR"/>
        </div>
    </form>
</body>
</html>
