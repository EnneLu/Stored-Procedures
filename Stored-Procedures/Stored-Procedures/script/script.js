$(document).ready(function () {
    $("#hide").hide();
    $("#nometext").val($("#nome").text());
    $("#datanascimentotext").val($("#data").text());
    $("#cpftext").val($("#cpf").text());
    $("#modelotext").val($("#modelo").text());
    $("#fabricantetext").val($("#fabricante").text());
    $("#ano_fabricacaotext").val($("#ano_fabricacao").text());
    $("#placatext").val($("#placa").text());
    $("#uftext").val($("#uf").text());
    $("#hide").click(function () {
        $("p").hide();
    });
    $("#show").click(function () {
        $("p").show();
    });
});