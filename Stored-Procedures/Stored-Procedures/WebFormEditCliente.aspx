<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormEditCliente.aspx.cs" Inherits="Stored_Procedures.WebFormEditCliente" %>

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
<script src="script/script.js"></script>
    <title>Cliente</title>
</head>
<body>
<form id="form1" runat="server">
<div>
    <div class="corpo">

        <!--repeater para edicao-->
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSourceEdit">
            <ItemTemplate>
                <div class="tableArea">
                    <div class="red">
                        <div class="title">
                            <div class=""><a href="WebFormCRUDCliente.aspx" class="text-white pulse" uk-icon="icon:arrow-left; ratio: 1.5"></a></div>
                            <div class="uk-text-large text-white ">EDITAR CLIENTE</div>
                        </div>
                    </div>

                <div class="uk-card uk-card-default" id="hide">
                    <div class="uk-card-header">
                        <div class="uk-grid-small uk-flex-middle" uk-grid>
                            <div class="uk-width-expand">
                                <h3 class="uk-card-title uk-margin-remove-bottom" id="nome"><%# DataBinder.Eval(Container.DataItem, "nome")%></h3>
                                <p class="uk-text-meta uk-margin-remove-top"><time datetime="2016-04-01T19:00"><%# DataBinder.Eval(Container.DataItem, "data_nascimento")%></time></p>
                            </div>
                        </div>
                    </div>
                    <div class="uk-card-body">
                        <p id="data"><%# DataBinder.Eval(Container.DataItem, "data_nascimento")%></p>
                        <p id="cpf"><%# DataBinder.Eval(Container.DataItem, "cpf")%></p>
                    </div>
                    <div class="uk-card-footer">
                    </div>
                </div>
            </ItemTemplate>  
        </asp:Repeater>
        <asp:ObjectDataSource runat="server" ID="ObjectDataSourceEdit" DataObjectTypeName="Stored_Procedures.Modelo.Cliente" SelectMethod="Select" TypeName="Stored_Procedures.DAL.DAOCliente" UpdateMethod="Update">
            <SelectParameters>
                <asp:SessionParameter SessionField="idcliente" Name="id" Type="Int32"></asp:SessionParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        <!--fim do repeater para edicao-->


        <div class="uk-card uk-card-default" id="show">
            <div class="uk-card-header">
                <div class="uk-grid-small uk-flex-middle" uk-grid>
                    <div class="uk-width-expand">
                        <h3 class="uk-card-title uk-margin-remove-bottom">Nome <asp:TextBox ID="nometext" runat="server"></asp:TextBox></h3>
                        <p class="uk-text-meta uk-margin-remove-top"></p>
                    </div>
                </div>
            </div>
            <div class="uk-card-body">
                <p>Data de nascimento <asp:TextBox ID="datanascimentotext" runat="server"></asp:TextBox></p>
                <p>CPF <asp:TextBox ID="cpftext" runat="server"></asp:TextBox></p>
            </div>
            <div class="uk-card-footer">
                <asp:LinkButton runat="server" ID="editar" CssClass="uk-button  uk-button-danger btn" OnClick="Button2_Click">Editar</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" CssClass="uk-button  btn" runat="server" PostBackUrl="~/WebFormCRUDCliente.aspx">Cancelar</asp:LinkButton>
            </div>
        </div>            
    </div>
</div>
</form>
</body>
</html>
