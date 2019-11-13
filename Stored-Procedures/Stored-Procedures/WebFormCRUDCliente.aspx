<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormCRUDCliente.aspx.cs" Inherits="Stored_Procedures.WebFormCRUDCliente" %>

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
                            <div class=""><a href="index.aspx" class="text-white pulse" uk-icon="icon:arrow-left; ratio: 1.5"></a></div>
                            <div class="uk-text-large text-white ">CLIENTES</div>
                        </div>
                        <div class=""><a class="uk-button uk-button-default text-white btn">ADICIONAR</a></div>
                </div>



            <table class="uk-table">
                <caption></caption>
                <thead>
                    <tr>
                        <th>NOME</th>
                        <th>DATA DE NASCIMENTO</th>
                        <th>CPF</th>
                        <th></th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td></td>
                    </tr>
                </tfoot>
                <tbody>
                    <tr>
                        <td>Table Data</td>
                        <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</td>
                        <td>15549616405</td>
                        <td><a class="uk-button  uk-button-danger btn" type="button"><i uk-icon="pencil"></i></a></td>
                        <td><a class="uk-button  uk-button-danger btn" type="button"><i uk-icon="trash"></i></a></td>
                    </tr>
                    <tr>
                        <td>Table Data</td>
                        <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</td>
                        <td>15549616405</td>
                        <td><a class="uk-button  uk-button-danger btn" type="button"><i uk-icon="pencil"></i></a></td>
                        <td><a class="uk-button  uk-button-danger btn" type="button"><i uk-icon="trash"></i></a></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
<!--
<asp:Repeater runat="server" ID="crudCliente">
<ItemTemplate>
<div>teste</div>
</ItemTemplate>
</asp:Repeater>

<asp:ObjectDataSource runat="server">
                
</asp:ObjectDataSource>
-->
</div>
</form>
</body>
</html>
