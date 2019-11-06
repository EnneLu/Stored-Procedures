<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormCRUDVeiculo.aspx.cs" Inherits="Stored_Procedures.WebFormCRUDVeiculo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater runat="server" ID="crudVeiculo">
                <ItemTemplate>
                    <div>teste</div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:ObjectDataSource runat="server">
                
            </asp:ObjectDataSource>
        </div>
    </form>
</body>
</html>
