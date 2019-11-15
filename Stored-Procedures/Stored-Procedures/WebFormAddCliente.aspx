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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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

        <div class="uk-margin">
            <label class="uk-form-label text-white" for="form-stacked-text">preencha os campos abaixo</label>
            <div class="uk-form-controls">
                
            </div>
        </div>


        <div class="uk-margin">
            <div class="uk-inline">
                <span class="uk-form-icon" uk-icon="icon: user"></span>
                <asp:TextBox CssClass="uk-input uk-form-danger" ID="nometext" placeholder="Nome" runat="server"></asp:TextBox>
            </div>
        </div>


        <div class="uk-margin">
            <div class="uk-inline">
                <span class="uk-form-icon" uk-icon="icon: calendar"></span>
                    <asp:TextBox ID="datanascimentotext" CssClass="uk-input uk-form-danger"  placeholder="Data de nascimento"  runat="server"></asp:TextBox>
            </div>
        </div>


        <div class="uk-margin">
            <div class="uk-inline">
                <span class="uk-form-icon" uk-icon="icon: credit-card"></span>
                <asp:TextBox ID="cpftext" CssClass="uk-input uk-form-danger"  placeholder="CPF" runat="server"></asp:TextBox>
            </div>
        </div>  
        <asp:LinkButton ID="btnsalvar" CssClass="uk-button  uk-button-danger btn" OnClick="salvar_Click" runat="server">Adicionar</asp:LinkButton>
        <asp:LinkButton ID="LinkButton1" CssClass="uk-button  btn" OnClick="salvar_Click" runat="server" PostBackUrl="~/WebFormCRUDCliente.aspx">Cancelar</asp:LinkButton>
    </div>
</div>
</div>
</form>
</body>
</html>
