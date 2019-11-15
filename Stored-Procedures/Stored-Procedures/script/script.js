$(document).ready(function () {
    $("#hide").hide();
    $("#nometext").val($("#nome").text());
    $("#datanascimentotext").val($("#data").text());
    $("#cpftext").val($("#cpf").text());
    $("#hide").click(function () {
        $("p").hide();
    });
    $("#show").click(function () {
        $("p").show();
    });
});