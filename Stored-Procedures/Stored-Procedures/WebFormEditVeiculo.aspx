<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormEditVeiculo.aspx.cs" Inherits="Stored_Procedures.WebFormEditVeiculo1" %>
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
    <title>Veículo</title>
</head>
<body>
<form id="form1" runat="server">
<div>
    <div class="corpo">
        <!--repeater para edicao-->
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
            <ItemTemplate>
                <div class="tableArea">
                    <div class="red">
                        <div class="title">
                            <div class=""><a href="WebFormCRUDVeiculo.aspx" class="text-white pulse" uk-icon="icon:arrow-left; ratio: 1.5"></a></div>
                            <div class="uk-text-large text-white ">EDITAR VEICULO</div>
                        </div>
                    </div>

                    <div class="uk-card uk-card-default" id="hide">
                        <div class="uk-card-header">
                            <div class="uk-grid-small uk-flex-middle" uk-grid>
                                <div class="uk-width-expand">
                                    <h3 class="uk-card-title uk-margin-remove-bottom" id="modelo"><%# DataBinder.Eval(Container.DataItem, "modelo")%></h3>
                                    <p class="uk-text-meta uk-margin-remove-top"><time datetime="2016-04-01T19:00"><%# DataBinder.Eval(Container.DataItem, "fabricante")%></time></p>
                                </div>
                            </div>
                        </div>
                        <div class="uk-card-body">
                            <p>Fabricante: <%# DataBinder.Eval(Container.DataItem, "fabricante")%></p>
                            <p>Ano fabricante: <%# DataBinder.Eval(Container.DataItem, "ano_fabricante")%></p>
                            <p>Placa: <%# DataBinder.Eval(Container.DataItem, "placa")%></p>
                            <p>UF: <%# DataBinder.Eval(Container.DataItem, "uf")%></p>
                        </div>
                        <div class="uk-card-footer">
                        </div>
                    </div>
            </ItemTemplate>
        </asp:Repeater>
        <!--fim do repeater para edicao-->
        <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" DataObjectTypeName="Stored_Procedures.Modelo.Veiculo" SelectMethod="Select" TypeName="Stored_Procedures.DAL.DAOVeiculo" UpdateMethod="Update">
            <SelectParameters>
                <asp:SessionParameter SessionField="idveiculo" Name="id" Type="Int32"></asp:SessionParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        <div class="uk-card uk-card-default" id="show">
            <div class="uk-card-header">
                <div class="uk-grid-small uk-flex-middle" uk-grid>
                    <div class="uk-width-expand">
                        <h3 class="uk-card-title uk-margin-remove-bottom">Modelo<asp:TextBox ID="modelotext" runat="server"></asp:TextBox></h3>
                        <p class="uk-text-meta uk-margin-remove-top"></p>
                    </div>
                </div>
            </div>
            <div class="uk-card-body">
                <p>Fabricante <asp:TextBox ID="fabricante" runat="server"></asp:TextBox></p>
                <p>Ano fabricante <asp:TextBox ID="ano_fabricante" runat="server"></asp:TextBox></p>
                <p>Placa <asp:TextBox ID="placa" runat="server"></asp:TextBox></p>
                <p>UF <asp:TextBox ID="uf" runat="server"></asp:TextBox></p>
            </div>
            <div class="uk-card-footer">
                <asp:LinkButton runat="server" ID="editar" CssClass="uk-button  uk-button-danger btn" OnClick="Button2_Click">editar</asp:LinkButton>
            </div>
        </div>            
    </div>
</div>
</form>
</body>
</html>
