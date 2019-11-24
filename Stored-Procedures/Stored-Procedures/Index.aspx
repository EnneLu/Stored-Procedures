<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Stored_Procedures.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="css/style.css"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="cardArea">
                <!--Card-->
                <div class="cardContainer">
                    <div class="mycard">
                        <div class="face face1">
                            <a href="WebFormCRUDCliente.aspx" class="conteudo">
                                <i class="material-icons bg">person_outline</i>
                                <h3>Cliente</h3>
                            </a>
                        </div>
                        <div class="face face2">
                            <div class="conteudo">
                                <p>Cadastro, visualização, exclusão e edição de clientes</p>
                                <a href="WebFormCRUDCliente.aspx" class="btn">Gerenciar</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--fim Card-->

                <!--Card-->
                <div class="cardContainer">
                    <div class="mycard">
                        <div class="face face1">
                            <a href="WebFormCRUDVeiculo.aspx" class="conteudo">
                                <i class="material-icons bg">airport_shuttle</i>
                                <h3>Veículo</h3>
                            </a>
                        </div>
                        <div class="face face2">
                            <div class="conteudo">
                                <p>Cadastro, visualização, exclusão e edição de veículos</p>
                                <a href="WebFormCRUDVeiculo.aspx" class="btn">Gerenciar</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--fim Card-->
            </div>
        </div>
    </form>
</body>
</html>
