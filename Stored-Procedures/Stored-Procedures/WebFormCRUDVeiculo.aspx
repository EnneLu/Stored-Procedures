<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormCRUDVeiculo.aspx.cs" Inherits="Stored_Procedures.WebFormCRUDVeiculo" %>

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
    <title>Veículo</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
    <div class="corpo">
        <div class="tableArea">
                <div class="red">
                        <div class="title">
                           <div class=""><a href="index.aspx" class="text-white pulse" uk-icon="icon:arrow-left; ratio: 1.5"></a></div>
                            <div class="uk-text-large text-white">VEÍCULOS</div>
                        </div>
                        <div class=""><a class="uk-button uk-button-default text-white btn" href="WebFormAddVeiculo.aspx">ADICIONAR</a></div>
                </div>

            <table class="uk-table uk-table-hover text-white">
                <caption></caption>
                <thead>
                    <tr>
                        <th>FABRICANTE</th>
                        <th>MODELO</th>
                        <th>ANO DE FABRICAÇÃO</th>
                        <th>PLACA</th>
                        <th>ESTADO</th>
                        <th></th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td></td>
                    </tr>
                </tfoot>
                <tbody>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSourceVeiculo" OnItemCommand="Repeater1_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td><%# DataBinder.Eval(Container.DataItem, "fabricante")%></td>
                                    <td><%# DataBinder.Eval(Container.DataItem, "modelo")%></td>
                                    <td><%# DataBinder.Eval(Container.DataItem, "ano_fabricante")%></td>
                                    <td><%# DataBinder.Eval(Container.DataItem, "placa")%></td>
                                    <td><%# DataBinder.Eval(Container.DataItem, "uf")%></td>

                                    <td><asp:LinkButton ID="btnEdit" CssClass="uk-button  uk-button-danger btn" runat="server" CommandName="EDITAR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id")%>><i uk-icon="pencil"></i></asp:LinkButton></td>
                                <td><asp:LinkButton ID="btnDel" CssClass="uk-button  uk-button-danger btn" runat="server" CommandName="DELETAR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id")%>><i uk-icon="trash"></i></asp:LinkButton></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource runat="server" ID="ObjectDataSourceVeiculo" SelectMethod="SelectAll" TypeName="Stored_Procedures.DAL.DAOVeiculo"></asp:ObjectDataSource>
                </tbody>
            </table>
        </div>

    </div>

            <!--
            <asp:Repeater runat="server" ID="crudVeiculo">
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
