<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormViewCliente.aspx.cs" Inherits="Stored_Procedures.WebFormViewCliente" %>

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
    <title>Cliente</title>
</head>
<body>
<form id="form1" runat="server">
<div>
    <div class="corpo">

        <div class="tableArea">


            <!--Repeater para mostrar dados do cliente-->
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
            <div class="red">
                <div class="title">
                    <div class=""><a href="WebFormCRUDCliente.aspx" class="text-white pulse" uk-icon="icon:arrow-left; ratio: 1.5"></a></div>
                    <div class="uk-text-large text-white ">Nome:<%# DataBinder.Eval(Container.DataItem, "nome")%></div>
                </div>
            </div>


                <div class="uk-card uk-card-default ">
                    <div class="uk-card-header">
                        <div class="uk-grid-small uk-flex-middle" uk-grid>
                            <div class="uk-width-expand">
                                <h3 class="uk-card-title uk-margin-remove-bottom"><%# DataBinder.Eval(Container.DataItem, "nome")%></h3>
                                <p class="uk-text-meta uk-margin-remove-top"><time datetime="2016-04-01T19:00"><%# DataBinder.Eval(Container.DataItem, "data_nascimento")%></time></p>
                            </div>
                        </div>
                    </div>
                    <div class="uk-card-body">
                        <p>Data de nascimento: <%# DataBinder.Eval(Container.DataItem, "data_nascimento")%></p>
                        <p>CPF: <%# DataBinder.Eval(Container.DataItem, "cpf")%></p>
                    </div>
                    <div class="uk-card-footer">
                       <asp:LinkButton ID="btnEdit" CssClass="uk-button  uk-button-danger btn" runat="server" CommandName="DELETAR"  CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id")%>>DELETAR</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" CssClass="uk-button  btn" runat="server" PostBackUrl="~/WebFormCRUDCliente.aspx">Cancelar</asp:LinkButton>
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="Select" TypeName="Stored_Procedures.DAL.DAOCliente">
                <SelectParameters>
                    <asp:SessionParameter SessionField="idcliente" Name="id" Type="Int32"></asp:SessionParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
            <!--Fim do repeater para mostrar dados do cliente-->

        </div>
    </div>

</div>
</form>
</body>
</html>
