<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAddCliente.aspx.cs" Inherits="Stored_Procedures.WebFormAddCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="nome" runat="server" Text="Nome"></asp:Label>
            <asp:TextBox ID="nometext" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="datanascimento" runat="server" Text="Data Nascimento"></asp:Label>
            <asp:TextBox ID="datanascimentotext" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="cpf" runat="server" Text="Cpf"></asp:Label>
            <asp:TextBox ID="cpftext" runat="server"></asp:TextBox>
            <br/>
            <asp:Button ID="salvar" runat="server" Text="Salvar"   />
            <asp:Button ID="cancelar" runat="server" Text="Cancelar" PostBackUrl="~/WebFormCRUDCliente.aspx"/>
        </div>
    </form>
</body>
</html>
