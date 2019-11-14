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
    <title></title>
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
                            <div class="uk-text-large text-white "><%# DataBinder.Eval(Container.DataItem, "nome")%></div>
                        </div>
                    </div>

                     <tr>
                        <td><%# DataBinder.Eval(Container.DataItem, "nome")%></td>
                        <td><%# DataBinder.Eval(Container.DataItem, "data_nascimento")%></td>
                        <td><%# DataBinder.Eval(Container.DataItem, "cpf")%></td>                               
                        <td><asp:LinkButton ID="btnEdit" CssClass="uk-button  uk-button-danger btn" runat="server" CommandName="EDITAR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id")%>><i uk-icon="pencil"></i></asp:LinkButton></td>
                        <td><a class="uk-button  uk-button-danger btn" type="button"><i uk-icon="trash"></i></a></td>
                    </tr>
                </div>
            </ItemTemplate>  
        </asp:Repeater>
        <asp:ObjectDataSource runat="server" ID="ObjectDataSourceEdit" DataObjectTypeName="Stored_Procedures.Modelo.Cliente" SelectMethod="Select" TypeName="Stored_Procedures.DAL.DAOCliente" UpdateMethod="Update">
            <SelectParameters>
                <asp:SessionParameter SessionField="idcliente" Name="id" Type="Int32"></asp:SessionParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        <!--fim do repeater para edicao-->
    </div>
</div>
</form>
</body>
</html>
