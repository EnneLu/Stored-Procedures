<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAddVeiculo.aspx.cs" Inherits="Stored_Procedures.WebFormAddVeiculo" %>

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
    <title>Veiculo</title>
</head>
<body>
<form id="form1" runat="server">
<div>
<div class="corpo">
    <div class="tableArea">
        <div class="red">
            <div class="title">
                <div class=""><a href="WebFormCRUDVeiculo.aspx" class="text-white pulse" uk-icon="icon:arrow-left; ratio: 1.5"></a></div>
                <div class="uk-text-large text-white ">ADICIONAR VEICULO</div>
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
                <asp:TextBox CssClass="uk-input uk-form-danger" ID="fabricante" placeholder="Fabricante" runat="server"></asp:TextBox>
            </div>
        </div>


        <div class="uk-margin">
            <div class="uk-inline">
                <span class="uk-form-icon" uk-icon="icon: calendar"></span>
                    <asp:TextBox ID="modelo" CssClass="uk-input uk-form-danger"  placeholder="Modelo"  runat="server"></asp:TextBox>
            </div>
        </div>


        <div class="uk-margin">
            <div class="uk-inline">
                <span class="uk-form-icon" uk-icon="icon: credit-card"></span>
                <asp:TextBox ID="ano_fabricante" CssClass="uk-input uk-form-danger"  placeholder="Ano fabricante" runat="server"></asp:TextBox>
            </div>
        </div>  

        <div class="uk-margin">
            <div class="uk-inline">
                <span class="uk-form-icon" uk-icon="icon: credit-card"></span>
                <asp:TextBox ID="placa" CssClass="uk-input uk-form-danger"  placeholder="Placa" runat="server"></asp:TextBox>
            </div>
        </div>  

        <div class="uk-margin">
            <div class="uk-inline">
                <span class="uk-form-icon" uk-icon="icon: credit-card"></span>
                <asp:TextBox ID="uf" CssClass="uk-input uk-form-danger"  placeholder="UF" runat="server"></asp:TextBox>
            </div>
        </div>  
        <asp:LinkButton ID="btnsalvar" CssClass="uk-button  uk-button-danger btn" OnClick="salvar_Click" runat="server">Adicionar</asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" CssClass="uk-button  btn" OnClick="salvar_Click" runat="server" PostBackUrl="~/WebFormCRUDVeiculo.aspx">Cancelar</asp:LinkButton>
    </div>
</div>
</div>
</form>
</body>
</html>
