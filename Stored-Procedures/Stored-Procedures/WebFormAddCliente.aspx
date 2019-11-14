<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAddCliente.aspx.cs" Inherits="Stored_Procedures.WebFormAddCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<!-- UIkit CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.2.3/dist/css/uikit.min.css" />

<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.2.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.2.3/dist/js/uikit-icons.min.js"></script>
<link rel="stylesheet" href="css/crudStyle.css" />
    <title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<div class="corpo">

    <div class="tableArea">
        <div class="red">
            <div class="title">
                <div class=""><a href="WebFormCRUDCliente.aspx" class="text-white pulse" uk-icon="icon:arrow-left; ratio: 1.5"></a></div>
                <div class="uk-text-large text-white ">ADICIONAR CLIENTE</div>
            </div>
        </div>

        <asp:Label ID="nome" runat="server" Text="Nome"></asp:Label>
        <asp:TextBox ID="nometext" runat="server"></asp:TextBox>
        <br/>
        <asp:Label ID="datanascimento" runat="server" Text="Data Nascimento"></asp:Label>
        <asp:TextBox ID="datanascimentotext" runat="server"></asp:TextBox>
        <br/>
        <asp:Label ID="cpf" runat="server" Text="CPF"></asp:Label>
        <asp:TextBox ID="cpftext" runat="server"></asp:TextBox>
        <br/>
        <asp:Button ID="salvar" runat="server" Text="Salvar" OnClick="salvar_Click"   />
        <asp:Button ID="cancelar" runat="server" Text="Cancelar" PostBackUrl="~/WebFormCRUDCliente.aspx"/>
    </div>
</div>
</div>
</form>
</body>
</html>
